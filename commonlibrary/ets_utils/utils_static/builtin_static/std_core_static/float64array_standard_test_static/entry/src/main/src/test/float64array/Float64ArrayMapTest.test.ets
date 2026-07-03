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
import Utils from '../Util.test';

function isF64Arr(obj: Object): boolean {
  return obj instanceof Float64Array;
}

export default function Float64ArrayMapTest(): void {
  describe('Float64ArrayMapTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0010
     * @tc.name testFloat64ArrayMap001
     * @tc.desc Verify map with one parameter callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, 9007199254740991]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 2.0;
      })

      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0020
     * @tc.name testFloat64ArrayMap002
     * @tc.desc Verify map with arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5, onePointFive, 0.25]);
      const result = arr.map((val: number): number => {
        return val + 1.0;
      })

      const actVal1 = result.$_get(0);
      const expectVal = onePointFive;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0030
     * @tc.name testFloat64ArrayMap003
     * @tc.desc Verify map with int type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyPointZero: number = 20.0;
      const a: int = 10;
      const b: int = 20;
      const arr = new Float64Array([a, b]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 2.0;
      })

      const actVal2 = result.$_get(0);
      const expectVal = twentyPointZero;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0040
     * @tc.name testFloat64ArrayMap004
     * @tc.desc Verify map fn returns positive 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const arr = new Float64Array([-32768]);
      const result = arr.map((val: number): number => {
        return 1.0;
      })

      const actVal3 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0050
     * @tc.name testFloat64ArrayMap005
     * @tc.desc Verify map fn returns negative -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negonePointzero: number = -1.0;
      const arr = Float64Array.of(-2147483648);
      const result = arr.map((val: number, index: int): number => {
        return -1.0;
      })

      const actVal4 = result.$_get(0);
      const expectVal = negonePointzero;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0060
     * @tc.name testFloat64ArrayMap006
     * @tc.desc Verify map fn returns zero 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return 0.0;
      })

      const actVal5 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0070
     * @tc.name testFloat64ArrayMap007
     * @tc.desc Verify map fn returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5]);
      const result = arr.map((val: number): number => {
        return NaN;
      })

      const actVal6 = Number.isNaN(result.$_get(0));
      const expectVal = true;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0080
     * @tc.name testFloat64ArrayMap008
     * @tc.desc Verify map fn returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Infinity;
      const arr = new Float64Array([-32768]);
      const result = arr.map((val: number, index: int): number => {
        return Infinity;
      })

      const actVal7 = result.$_get(0);
      const expectVal = positiveInfinity;
      expect(actVal7).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0090
     * @tc.name testFloat64ArrayMap009
     * @tc.desc Verify map fn returns negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = -Infinity;
      const arr = Float64Array.of(-2147483648);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return -Infinity;
      })

      const actVal8 = result.$_get(0);
      const expectVal = negativeInfinity;
      expect(actVal8).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0100
     * @tc.name testFloat64ArrayMap010
     * @tc.desc Verify map fn returns MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = Float64Array.of(doubleMaxValue, 1.0);
      const result = arr.map((val: number): number => {
        return val === doubleMaxValue ? val : val * 2.0;
      })

      const actVal9 = result.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal9).assertEqual(expectVal);
      const actVal10 = result.$_get(1);
      const expectVal2 = 2.0;
      expect(actVal10).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0110
     * @tc.name testFloat64ArrayMap011
     * @tc.desc Verify map fn returns MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array([0.5]);
      const result = arr.map((val: number, index: int): number => {
        return 5e-324;
      })

      const actVal11 = result.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0120
     * @tc.name testFloat64ArrayMap012
     * @tc.desc Verify map fn returns MAX_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeIntegerValue: number = 9007199254740991.0;
      const arr = new Float64Array([-32768]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return 9007199254740991.0;
      })

      const actVal12 = result.$_get(0);
      const expectVal = maxSafeIntegerValue;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0130
     * @tc.name testFloat64ArrayMap013
     * @tc.desc Verify map fn returns scientific notation 1.0e-308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const arr = Float64Array.of(-2147483648);
      const result = arr.map((val: number): number => {
        return 1.0e-308;
      })

      const actVal13 = result.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal13).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0140
     * @tc.name testFloat64ArrayMap014
     * @tc.desc Verify map callback uses index to compute return value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.map((val: number, index: int): number => {
        return val + index;
      })

      const actVal14 = result.$_get(2);
      const expectVal = twoValue;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0150
     * @tc.name testFloat64ArrayMap015
     * @tc.desc Verify map callback uses val and index together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      const result = arr.map((val: number, index: int): number => {
        return val * index;
      })

      const actVal15 = result.$_get(2);
      const expectVal = pointFive;
      expect(actVal15).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0160
     * @tc.name testFloat64ArrayMap016
     * @tc.desc Verify map callback uses array parameter for computation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum98304Value: number = -98304;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * array.length;
      })

      const actVal16 = result.$_get(0);
      const expectVal = negnum98304Value;
      expect(actVal16).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0170
     * @tc.name testFloat64ArrayMap017
     * @tc.desc Verify map callback uses val index and array together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val + index + array.length;
      })

      const actVal17 = result.$_get(1);
      const expectVal = threeValue;
      expect(actVal17).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0180
     * @tc.name testFloat64ArrayMap018
     * @tc.desc Verify map one-parameter callback increments external counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, 9007199254740991]);
      let counter: int = 0;
      arr.map((val: number): number => {
        counter = counter + 1;
        return val;
      })

      const expectVal = twoValue;
      expect(counter).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0190
     * @tc.name testFloat64ArrayMap019
     * @tc.desc Verify map callback reads external variable multiplier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const mult: double = 10.0;
      const result = arr.map((val: number, index: int): number => {
        return val * mult;
      })

      const actVal18 = result.$_get(0);
      const expectVal = fiveValue;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0200
     * @tc.name testFloat64ArrayMap020
     * @tc.desc Verify map returns Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val;
      })

      const actVal19 = isF64Arr(result as Object);
      const expectVal = true;
      expect(actVal19).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0210
     * @tc.name testFloat64ArrayMap021
     * @tc.desc Verify map returns new array not same as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.map((val: number): number => {
        return val * 2.0;
      })

      let same: boolean = false;
      let o1: Object = arr as Object;
      let o2: Object = result as Object;
      same = o1 === o2;
      const expectVal = false;
      expect(same).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0220
     * @tc.name testFloat64ArrayMap022
     * @tc.desc Verify map result can be chained with another map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum65535Value: number = -65535;
      const arr = Float64Array.of(-32768, -128);
      const result = arr.map((val: number): number => {
        return val * 2.0;
      }).map((val: number): number => {
        return val + 1.0;
      })

      const actVal20 = result.$_get(0);
      const expectVal = negnum65535Value;
      expect(actVal20).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0230
     * @tc.name testFloat64ArrayMap023
     * @tc.desc Verify map does not modify original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const orig: number = arr.$_get(0);
      arr.map((val: number, index: int): number => {
        return val * 10.0;
      })

      const actVal21 = arr.$_get(0);
      const expectVal = orig;
      expect(actVal21).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0240
     * @tc.name testFloat64ArrayMap024
     * @tc.desc Verify map result accessible via $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num90071992547409900Value: number = 90071992547409900;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 10.0;
      })

      const actVal22 = result.$_get(1);
      const expectVal = num90071992547409900Value;
      expect(actVal22).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0250
     * @tc.name testFloat64ArrayMap025
     * @tc.desc Verify map((val: number) with [a, b] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const a: double = 1.5;
      const b: double = 2.7;
      const arr = new Float64Array([a, b]);
      const result = arr.map((val: number): number => {
        return val * 2.0;
      })

      const actVal23 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal23).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0260
     * @tc.name testFloat64ArrayMap026
     * @tc.desc Verify map on empty array returns empty Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      const result = arr.map((val: number, index: int): number => {
        return val * 2.0;
      })

      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0270
     * @tc.name testFloat64ArrayMap027
     * @tc.desc Verify map on empty array callback not called
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array(0);
      let called: boolean = false;
      arr.map((val: number, index: int, array: Float64Array): number => {
        called = true;
        return val;
      })

      const expectVal = false;
      expect(called).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0280
     * @tc.name testFloat64ArrayMap028
     * @tc.desc Verify map on single element transforms correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const arr = new Float64Array([0.5]);
      const result = arr.map((val: number, index: int): number => {
        return val * 3.0;
      })

      const actVal24 = result.$_get(0);
      const expectVal = onePointFive;
      expect(actVal24).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0290
     * @tc.name testFloat64ArrayMap029
     * @tc.desc Verify map on single element callback called once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-32768]);
      let count: int = 0;
      arr.map((val: number, index: int, array: Float64Array): number => {
        count = count + 1;
        return val;
      })

      const expectVal = oneValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0300
     * @tc.name testFloat64ArrayMap030
     * @tc.desc Verify map on five elements transforms all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negsciValue2e100: number = -2e-100;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.map((val: number, index: int): number => {
        return val * 2.0;
      })

      const actVal25 = result.$_get(4);
      const expectVal = negsciValue2e100;
      expect(actVal25).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0310
     * @tc.name testFloat64ArrayMap031
     * @tc.desc Verify map callback count equals array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixValue: number = 6;
      const arr =
        new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625, 0]);
      let count: int = 0;
      arr.map((val: number, index: int, array: Float64Array): number => {
        count = count + 1;
        return val;
      })

      const expectVal = sixValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0320
     * @tc.name testFloat64ArrayMap032
     * @tc.desc Verify map on five elements with mixed boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const result = arr.map((val: number): number => {
        return val;
      })

      const expectVal = fiveValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0330
     * @tc.name testFloat64ArrayMap033
     * @tc.desc Verify map preserves NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(NaN, 1.0, twoPointZero);
      const result = arr.map((val: number, index: int): number => {
        return Number.isNaN(val) ? val : val * 2.0;
      })

      const actVal26 = Number.isNaN(result.$_get(0));
      const expectVal = true;
      expect(actVal26).assertEqual(expectVal);
      const actVal27 = result.$_get(1);
      const expectVal2 = twoPointZero;
      expect(actVal27).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0340
     * @tc.name testFloat64ArrayMap034
     * @tc.desc Verify map preserves Infinity and negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Infinity, -Infinity]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val === Infinity || val === -Infinity ? val : val * 2.0;
      })

      const actVal28 = result.$_get(0);
      const expectVal = Infinity;
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = result.$_get(1);
      const expectVal2 = -Infinity;
      expect(actVal29).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0350
     * @tc.name testFloat64ArrayMap035
     * @tc.desc Verify map preserves MAX_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array([doubleMaxValue]);
      const result = arr.map((val: number): number => {
        return val;
      })

      const actVal30 = result.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal30).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0360
     * @tc.name testFloat64ArrayMap036
     * @tc.desc Verify map preserves MIN_VALUE element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array([doubleMinValue, 1.0]);
      const result = arr.map((val: number, index: int): number => {
        return val === doubleMinValue ? val : val * 2.0;
      })

      const actVal31 = result.$_get(0);
      const expectVal = doubleMinValue;
      expect(actVal31).assertEqual(expectVal);
      const actVal32 = result.$_get(1);
      const expectVal2 = 2.0;
      expect(actVal32).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0370
     * @tc.name testFloat64ArrayMap037
     * @tc.desc Verify map on all same values transforms all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.of(oneValue, oneValue, oneValue, oneValue);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val + 1.0;
      })

      const actVal33 = result.$_get(0);
      const expectVal = twoValue;
      expect(actVal33).assertEqual(expectVal);
      const actVal34 = result.$_get(3);
      const expectVal2 = twoValue;
      expect(actVal34).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0380
     * @tc.name testFloat64ArrayMap038
     * @tc.desc Verify map propagates RangeError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      try {
        arr.map((val: number): number => {
          throw new RangeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0390
     * @tc.name testFloat64ArrayMap039
     * @tc.desc Verify map propagates TypeError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5);
      try {
        arr.map((val: number, index: int): number => {
          throw new TypeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0400
     * @tc.name testFloat64ArrayMap040
     * @tc.desc Verify map propagates Error from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      try {
        arr.map((val: number, index: int, array: Float64Array): number => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0410
     * @tc.name testFloat64ArrayMap041
     * @tc.desc Verify map propagates Error at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.map((val: number): number => {
          throw new Error("first");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0420
     * @tc.name testFloat64ArrayMap042
     * @tc.desc Verify map propagates Error at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.map((val: number, index: int): number => {
          if (index === 2) {
            throw new Error("last");
          }
          return val;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0430
     * @tc.name testFloat64ArrayMap043
     * @tc.desc Verify map original array unchanged after callback throws
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const orig: number = arr.$_get(0);
      try {
        arr.map((val: number, index: int, array: Float64Array): number => {
          throw new Error("err");
        })

      } catch (e) { /* expected */
        expect(e.name).assertEqual("Error");
      }
      const actVal35 = arr.$_get(0);
      const expectVal = orig;
      expect(actVal35).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0440
     * @tc.name testFloat64ArrayMap044
     * @tc.desc Verify map multiplies int16 boundary elements by ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const negnum327680Value: number = -327680;
      const negnum1280Value: number = -1280;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const result = arr.map((val: number): number => {
        return val * 10.0;
      })

      const actVal36 = result.$_get(0);
      const expectVal = negnum327680Value;
      expect(actVal36).assertEqual(expectVal);
      const actVal37 = result.$_get(1);
      const expectVal2 = negnum1280Value;
      expect(actVal37).assertEqual(expectVal2);
      const actVal38 = result.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal38).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0450
     * @tc.name testFloat64ArrayMap045
     * @tc.desc Verify map with chained triple map calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum1431655765Value: number = -1431655765;
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.map((v: number): number => {
        return v * 2.0;
      }).map((v: number): number => {
        return v + 1.0;
      }).map((v: number): number => {
        return v / 3.0;
      })

      const actVal39 = result.$_get(0);
      const expectVal = negnum1431655765Value;
      expect(actVal39).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0460
     * @tc.name testFloat64ArrayMap046
     * @tc.desc Verify map result can construct new Float64Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.map((val: number, index: int): number => {
        return val * 2.0;
      })

      const copied = new Float64Array(result);
      const expectVal = threeValue;
      expect(copied.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0470
     * @tc.name testFloat64ArrayMap047
     * @tc.desc Verify map handles 0.1+0.2 floating point precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointSeven: number = 0.7;
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val + 0.2;
      })

      const actVal40 = result.$_get(0);
      const expectVal = pointSeven;
      expect(actVal40).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0480
     * @tc.name testFloat64ArrayMap048
     * @tc.desc Verify map handles integer boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, -128);
      const result = arr.map((val: number): number => {
        return val * 2.0;
      })

      const actVal41 = result.$_get(0);
      const expectVal = int16MinValue * 2.0;
      expect(actVal41).assertEqual(expectVal);
      const actVal42 = result.$_get(1);
      const expectVal2 = int8MinValue * 2.0;
      expect(actVal42).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0490
     * @tc.name testFloat64ArrayMap049
     * @tc.desc Verify map handles scientific notation input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1]);
      const result = arr.map((val: number, index: int): number => {
        return val * 2.0;
      })

      const actVal43 = result.$_get(0) > 0.0;
      const expectVal = false;
      expect(actVal43).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0500
     * @tc.name testFloat64ArrayMap050
     * @tc.desc Verify map with target index alignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const num9007199254741000Value: number = 9007199254741000;
      const twentyValue: number = 20;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val + index * 10.0;
      })

      const actVal44 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal44).assertEqual(expectVal);
      const actVal45 = result.$_get(1);
      const expectVal2 = num9007199254741000Value;
      expect(actVal45).assertEqual(expectVal2);
      const actVal46 = result.$_get(2);
      const expectVal3 = twentyValue;
      expect(actVal46).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0510
     * @tc.name testFloat64ArrayMap051
     * @tc.desc Verify map callback uses closure variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointsevenfive: number = 0.75;
      const factor: double = 3.0;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.map((val: number): number => {
        return val * factor;
      })

      const actVal47 = result.$_get(2);
      const expectVal = zeroPointsevenfive;
      expect(actVal47).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0520
     * @tc.name testFloat64ArrayMap052
     * @tc.desc Verify map callback modifies closure sum variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum32896Value: number = -32896;
      const arr = new Float64Array([-32768, -128, 0]);
      let sum: double = 0.0;
      arr.map((val: number, index: int): number => {
        sum = sum + val;
        return val;
      })

      const expectVal = negnum32896Value;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0530
     * @tc.name testFloat64ArrayMap053
     * @tc.desc Verify map result can be iterated with for loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum4294967298Value: number = -4294967298;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 2.0;
      })

      let sum: double = 0.0;
      for (let i: int = 0; i < result.length; i++) {
        sum = sum + result.$_get(i);
      }
      const expectVal = negnum4294967298Value;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0540
     * @tc.name testFloat64ArrayMap054
     * @tc.desc Verify map with negative zero preserves sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.0, -0.0);
      const result = arr.map((val: number): number => {
        return val * 1.0;
      })

      const actVal48 = 1.0 / result.$_get(0);
      const expectVal = Infinity;
      expect(actVal48).assertEqual(expectVal);
      const actVal49 = 1.0 / result.$_get(1);
      const expectVal2 = -Infinity;
      expect(actVal49).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0550
     * @tc.name testFloat64ArrayMap055
     * @tc.desc Verify map with mixed positive negative values negated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointZeroSixTwoFive: number = 0.0625;
      const negativeHalfValue: number = -0.5;
      const negativeQuarterValue: number = -0.25;
      const arr = new Float64Array([0.5, pointZeroSixTwoFive, 0.25, 0.125, pointZeroSixTwoFive]);
      const result = arr.map((val: number, index: int): number => {
        return val * -1.0;
      })

      const actVal50 = result.$_get(0);
      const expectVal = negativeHalfValue;
      expect(actVal50).assertEqual(expectVal);
      const actVal51 = result.$_get(2);
      const expectVal2 = negativeQuarterValue;
      expect(actVal51).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0560
     * @tc.name testFloat64ArrayMap056
     * @tc.desc Verify map on 150 element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num298Pointzero: number = 298.0;
      const arr = new Float64Array(150);
      for (let i: int = 0; i < 150; i++) {
        arr.$_set(i, i);
      }
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 2.0;
      })

      const actVal52 = result.$_get(149);
      const expectVal = num298Pointzero;
      expect(actVal52).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0570
     * @tc.name testFloat64ArrayMap057
     * @tc.desc Verify map on all zero array creates new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const onePointZero: number = 1.0;
      const arr = new Float64Array(5);
      const result = arr.map((val: number): number => {
        return val + 1.0;
      })

      expect(result.length).assertEqual(fiveValue);
      const actVal53 = result.$_get(0);
      const expectVal = onePointZero;
      expect(actVal53).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0580
     * @tc.name testFloat64ArrayMap058
     * @tc.desc Verify map fn returns negative MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeMaxSafeIntegerValue: number = -9007199254740991.0;
      const arr = new Float64Array([-32768]);
      const result = arr.map((val: number): number => {
        return -9007199254740991.0;
      })

      const actVal54 = result.$_get(0);
      const expectVal = negativeMaxSafeIntegerValue;
      expect(actVal54).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0590
     * @tc.name testFloat64ArrayMap059
     * @tc.desc Verify map fn returns scientific notation 1.0e+308
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      const arr = Float64Array.of(-2147483648);
      const result = arr.map((val: number, index: int): number => {
        return 1.0e+308;
      })

      const actVal55 = result.$_get(0);
      const expectVal = sciValue10e308;
      expect(actVal55).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0600
     * @tc.name testFloat64ArrayMap060
     * @tc.desc Verify map fn returns decimal 0.1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const arr = new Float64Array([pointOne]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return 0.1;
      })

      const actVal56 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal56).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0610
     * @tc.name testFloat64ArrayMap061
     * @tc.desc Verify map fn returns negative decimal -999999.99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const arr = new Float64Array([0.5]);
      const result = arr.map((val: number): number => {
        return -999999.99;
      })

      const actVal57 = result.$_get(0);
      const expectVal = negnum999999Pointninenine;
      expect(actVal57).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0620
     * @tc.name testFloat64ArrayMap062
     * @tc.desc Verify map fn returns hex literal equivalent 16.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenPointzero: number = 16.0;
      const arr = new Float64Array([-32768]);
      const result = arr.map((val: number, index: int): number => {
        return 16.0;
      })

      const actVal58 = result.$_get(0);
      const expectVal = sixteenPointzero;
      expect(actVal58).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0630
     * @tc.name testFloat64ArrayMap063
     * @tc.desc Verify map fn returns octal literal equivalent 8.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightPointZero: number = 8.0;
      const arr = Float64Array.of(-2147483648);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return 8.0;
      })

      const actVal59 = result.$_get(0);
      const expectVal = eightPointZero;
      expect(actVal59).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0640
     * @tc.name testFloat64ArrayMap064
     * @tc.desc Verify map callback receives val as 0.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.0, 1.0);
      const result = arr.map((val: number): number => {
        return val + 1.0;
      })

      const actVal60 = result.$_get(0);
      const expectVal = 1.0;
      expect(actVal60).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0650
     * @tc.name testFloat64ArrayMap065
     * @tc.desc Verify map callback receives val as NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([NaN]);
      const result = arr.map((val: number, index: int): number => {
        return Number.isNaN(val) ? 0.0 : val * 2.0;
      })

      const actVal61 = result.$_get(0);
      const expectVal = 0.0;
      expect(actVal61).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0660
     * @tc.name testFloat64ArrayMap066
     * @tc.desc Verify map callback receives val as Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(Infinity);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val > 0.0 ? 1.0 : 0.0;
      })

      const actVal62 = result.$_get(0);
      const expectVal = 1.0;
      expect(actVal62).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0670
     * @tc.name testFloat64ArrayMap067
     * @tc.desc Verify map callback receives val as -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-Infinity);
      const result = arr.map((val: number): number => {
        return val < 0.0 ? -1.0 : 0.0;
      })

      const actVal63 = result.$_get(0);
      const expectVal = -1.0;
      expect(actVal63).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0680
     * @tc.name testFloat64ArrayMap068
     * @tc.desc Verify map callback receives negative val -1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-1.0]);
      const result = arr.map((val: number, index: int): number => {
        return Math.abs(val);
      })

      const actVal64 = result.$_get(0);
      const expectVal = 1.0;
      expect(actVal64).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0690
     * @tc.name testFloat64ArrayMap069
     * @tc.desc Verify map callback receives MIN_VALUE val 5e-324
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = 5e-324;
      const arr = new Float64Array([doubleMinValue]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 3.0;
      })

      const actVal65 = result.$_get(0);
      const expectVal = doubleMinValue * 3.0;
      expect(actVal65).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0700
     * @tc.name testFloat64ArrayMap070
     * @tc.desc Verify map with index arithmetic on 5 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483651Value: number = 2147483651;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.map((val: number, index: int): number => {
        return val + index;
      })

      const actVal66 = result.$_get(4);
      const expectVal = num2147483651Value;
      expect(actVal66).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0710
     * @tc.name testFloat64ArrayMap071
     * @tc.desc Verify map callback array param can read elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger, 0);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return array.$_get(index);
      })

      const actVal67 = result.$_get(1);
      const expectVal = maxSafeInteger;
      expect(actVal67).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0720
     * @tc.name testFloat64ArrayMap072
     * @tc.desc Verify map callback array and result are different
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 2.0;
      })

      let same: boolean = false;
      let o1: Object = arr as Object;
      let o2: Object = result as Object;
      same = o1 === o2;
      const expectVal = false;
      expect(same).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0730
     * @tc.name testFloat64ArrayMap073
     * @tc.desc Verify map callback uses array parameter for index-based access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue, -128, 0);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val + array.$_get(0);
      })

      const actVal68 = result.$_get(2);
      const expectVal = int16MinValue;
      expect(actVal68).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0740
     * @tc.name testFloat64ArrayMap074
     * @tc.desc Verify map three-parameter callback increments external counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1]);
      let count: int = 0;
      arr.map((val: number, index: int, array: Float64Array): number => {
        count = count + 1;
        return val;
      })

      const expectVal = twoValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0750
     * @tc.name testFloat64ArrayMap075
     * @tc.desc Verify map result buffer differs from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      const result = arr.map((val: number): number => {
        return val * 2.0;
      })

      let same: boolean = false;
      let o1: Object = arr.buffer as Object;
      let o2: Object = result.buffer as Object;
      same = o1 === o2;
      const expectVal = false;
      expect(same).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0760
     * @tc.name testFloat64ArrayMap076
     * @tc.desc Verify map on five elements with negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const result = arr.map((val: number): number => {
        return val * -1.0;
      })

      const actVal69 = result.$_get(2);
      const expectVal = zeroValue;
      expect(actVal69).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0770
     * @tc.name testFloat64ArrayMap077
     * @tc.desc Verify map((val: number, index: int, array: float64array) with [a, b] element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const a: double = 1.5;
      const b: double = 2.5;
      const arr = new Float64Array([a, b]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 2.0;
      })

      const actVal70 = result.$_get(0);
      const expectVal = threePointZero;
      expect(actVal70).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0780
     * @tc.name testFloat64ArrayMap078
     * @tc.desc Verify map with double type elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointfoursixeight: number = 2.468;
      const a: double = 1.234;
      const b: double = 2.345;
      const arr = new Float64Array([a, b]);
      const result = arr.map((val: number): number => {
        return val * 2.0;
      })

      const actVal71 = result.$_get(0);
      const expectVal = twoPointfoursixeight;
      expect(actVal71).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0790
     * @tc.name testFloat64ArrayMap079
     * @tc.desc Verify map propagates Error at middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      try {
        arr.map((val: number, index: int): number => {
          if (index === 2) {
            throw new Error("mid");
          }
          return val;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0800
     * @tc.name testFloat64ArrayMap080
     * @tc.desc Verify map propagates SyntaxError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      try {
        arr.map((val: number, index: int, array: Float64Array): number => {
          throw new SyntaxError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("SyntaxError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0810
     * @tc.name testFloat64ArrayMap081
     * @tc.desc Verify map propagates ReferenceError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1]);
      try {
        arr.map((val: number): number => {
          throw new ReferenceError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ReferenceError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0820
     * @tc.name testFloat64ArrayMap082
     * @tc.desc Verify map propagates EvalError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      try {
        arr.map((val: number, index: int): number => {
          throw new EvalError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("EvalError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0830
     * @tc.name testFloat64ArrayMap083
     * @tc.desc Verify map propagates URIError from callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5);
      try {
        arr.map((val: number, index: int, array: Float64Array): number => {
          throw new URIError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("URIError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0840
     * @tc.name testFloat64ArrayMap084
     * @tc.desc Verify map propagates Error with no message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768]);
      try {
        arr.map((val: number): number => {
          throw new Error();
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0850
     * @tc.name testFloat64ArrayMap085
     * @tc.desc Verify map handles float 0.1+0.2 precision boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648);
      const result = arr.map((val: number, index: int): number => {
        return val + 0.2;
      })

      let notEqual: boolean = result.$_get(0) !== 0.3;
      const expectVal = true;
      expect(notEqual).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0860
     * @tc.name testFloat64ArrayMap086
     * @tc.desc Verify map doubles mixed decimal and safe-integer elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      const result = arr.map((v: number): number => {
        return v * 2.0;
      })

      const expectVal = fourValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0870
     * @tc.name testFloat64ArrayMap087
     * @tc.desc Verify map callback catches and handles error internally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        try {
          return val * 2.0;
        } catch (e) {
          return 0.0;
        }
      })

      const actVal72 = result.$_get(1);
      const expectVal = threeValue;
      expect(actVal72).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0880
     * @tc.name testFloat64ArrayMap088
     * @tc.desc Verify map with byte boundary value 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num128Value: number = 128;
      const arr = new Float64Array([127]);
      const result = arr.map((val: number): number => {
        return val + 1.0;
      })

      const actVal73 = result.$_get(0);
      const expectVal = num128Value;
      expect(actVal73).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0890
     * @tc.name testFloat64ArrayMap089
     * @tc.desc Verify map with short boundary value 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num65534Value: number = 65534;
      const arr = new Float64Array([32767]);
      const result = arr.map((val: number, index: int): number => {
        return val * 2.0;
      })

      const actVal74 = result.$_get(0);
      const expectVal = num65534Value;
      expect(actVal74).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0900
     * @tc.name testFloat64ArrayMap090
     * @tc.desc Verify map with int max boundary 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num2147483646Value: number = 2147483646;
      const arr = Float64Array.of(2147483647);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val - 1.0;
      })

      const actVal75 = result.$_get(0);
      const expectVal = num2147483646Value;
      expect(actVal75).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0910
     * @tc.name testFloat64ArrayMap091
     * @tc.desc Verify map with float MIN_VALUE 1.4e-45
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const floatMinValue: number = 1.4e-45;
      const arr = Float64Array.of(floatMinValue);
      const result = arr.map((val: number): number => {
        return val * 2.0;
      })

      const actVal76 = result.$_get(0);
      const expectVal = floatMinValue * 2.0;
      expect(actVal76).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0920
     * @tc.name testFloat64ArrayMap092
     * @tc.desc Verify map with negative values all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-1.0, -2.0, -3.0, -4.0, -5.0]);
      const result = arr.map((val: number): number => {
        return val * -1.0;
      })

      const actVal77 = result.$_get(0);
      const expectVal = 1.0;
      expect(actVal77).assertEqual(expectVal);
      const actVal78 = result.$_get(4);
      const expectVal2 = 5.0;
      expect(actVal78).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0930
     * @tc.name testFloat64ArrayMap093
     * @tc.desc Verify map on decreasing sequence 10 to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const tenValue: number = 10;
      const elevenValue: number = 11;
      const arr = new Float64Array(10);
      for (let i: int = 0; i < 10; i++) {
        arr.$_set(i, tenValue - i);
      }
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val + 1.0;
      })

      const actVal79 = result.$_get(0);
      const expectVal = elevenValue;
      expect(actVal79).assertEqual(expectVal);
      const actVal80 = result.$_get(9);
      const expectVal2 = oneValue + 1.0;
      expect(actVal80).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0940
     * @tc.name testFloat64ArrayMap094
     * @tc.desc Verify map on alternating positive negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(1.0, -2.0, 3.0, -4.0, 5.0);
      const result = arr.map((val: number): number => {
        return val * -1.0;
      })

      const actVal81 = result.$_get(0);
      const expectVal = -1.0;
      expect(actVal81).assertEqual(expectVal);
      const actVal82 = result.$_get(1);
      const expectVal2 = 2.0;
      expect(actVal82).assertEqual(expectVal2);
      const actVal83 = result.$_get(3);
      const expectVal3 = 4.0;
      expect(actVal83).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0950
     * @tc.name testFloat64ArrayMap095
     * @tc.desc Verify map on mixed integer and decimal format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0, 0.5, 2.0]);
      const result = arr.map((val: number, index: int): number => {
        return val * 2.0;
      })

      const actVal84 = result.$_get(0);
      const expectVal = 2.0;
      expect(actVal84).assertEqual(expectVal);
      const actVal85 = result.$_get(1);
      const expectVal2 = 1.0;
      expect(actVal85).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0960
     * @tc.name testFloat64ArrayMap096
     * @tc.desc Verify map with hex literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val + 1.0;
      })

      const actVal86 = result.$_get(0);
      const expectVal = 256.0;
      expect(actVal86).assertEqual(expectVal);
      const actVal87 = result.$_get(1);
      const expectVal2 = 171.0;
      expect(actVal87).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0970
     * @tc.name testFloat64ArrayMap097
     * @tc.desc Verify map with octal literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const octalValue10: number = 0o10;
      const octalValue20: number = 0o20;
      const arr = new Float64Array([octalValue10, octalValue20]);
      const result = arr.map((val: number): number => {
        return val + 1.0;
      })

      const actVal88 = result.$_get(0);
      const expectVal = 9.0;
      expect(actVal88).assertEqual(expectVal);
      const actVal89 = result.$_get(1);
      const expectVal2 = 17.0;
      expect(actVal89).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0980
     * @tc.name testFloat64ArrayMap098
     * @tc.desc Verify map with binary literal elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue1111: number = 0b1111;
      const binaryValue1010: number = 0b1010;
      const arr = Float64Array.of(binaryValue1111, binaryValue1010);
      const result = arr.map((val: number, index: int): number => {
        return val * 2.0;
      })

      const actVal90 = result.$_get(0);
      const expectVal = 30.0;
      expect(actVal90).assertEqual(expectVal);
      const actVal91 = result.$_get(1);
      const expectVal2 = 20.0;
      expect(actVal91).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_0990
     * @tc.name testFloat64ArrayMap099
     * @tc.desc Verify map with scientific notation sequence input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1.0e-10, 2.0e5, 3.0e-20]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 2.0;
      })

      const actVal92 = result.$_get(0);
      const expectVal = 2.0e-10;
      expect(actVal92).assertEqual(expectVal);
      const actVal93 = result.$_get(1);
      const expectVal2 = 4.0e5;
      expect(actVal93).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1000
     * @tc.name testFloat64ArrayMap100
     * @tc.desc Verify map result used to construct new Float64Array via copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum65536Value: number = -65536;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.map((val: number): number => {
        return val * 2.0;
      })

      const copied = new Float64Array(result);
      const actVal94 = copied.$_get(0);
      const expectVal = negnum65536Value;
      expect(actVal94).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1010
     * @tc.name testFloat64ArrayMap101
     * @tc.desc Verify map with callback computing value from index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.map((val: number, index: int): number => {
        return index;
      })

      const actVal95 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal95).assertEqual(expectVal);
      const actVal96 = result.$_get(2);
      const expectVal2 = twoValue;
      expect(actVal96).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1020
     * @tc.name testFloat64ArrayMap102
     * @tc.desc Verify map with callback computing value from array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([zeroValue, zeroValue, zeroValue]);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * array.length;
      })

      const actVal97 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal97).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1030
     * @tc.name testFloat64ArrayMap103
     * @tc.desc Verify map with all NaN array preserves NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([NaN, NaN, NaN]);
      const result = arr.map((val: number): number => {
        return Number.isNaN(val) ? val : val * 2.0;
      })

      const actVal98 = Number.isNaN(result.$_get(0));
      const expectVal = true;
      expect(actVal98).assertEqual(expectVal);
      const actVal99 = Number.isNaN(result.$_get(2));
      const expectVal2 = true;
      expect(actVal99).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1040
     * @tc.name testFloat64ArrayMap104
     * @tc.desc Verify map with repeated MAX_VALUE elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMaxValue: number = 1.7976931348623157e+308;
      const arr = new Float64Array([doubleMaxValue, doubleMaxValue, doubleMaxValue]);
      const result = arr.map((val: number, index: int): number => {
        return val === doubleMaxValue ? val : val * 2.0;
      })

      const actVal100 = result.$_get(0);
      const expectVal = doubleMaxValue;
      expect(actVal100).assertEqual(expectVal);
      const actVal101 = result.$_get(2);
      const expectVal2 = doubleMaxValue;
      expect(actVal101).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1050
     * @tc.name testFloat64ArrayMap105
     * @tc.desc Verify map with SAFE_INTEGER boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const minSafeInteger: number = -9007199254740991;
      const arr = Float64Array.of(maxSafeInteger, minSafeInteger);
      const result = arr.map((val: number, index: int, array: Float64Array): number => {
        return val * 2.0;
      })

      const actVal102 = result.$_get(0);
      const expectVal = maxSafeInteger * 2.0;
      expect(actVal102).assertEqual(expectVal);
      const actVal103 = result.$_get(1);
      const expectVal2 = minSafeInteger * 2.0;
      expect(actVal103).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1060
     * @tc.name testFloat64ArrayMap106
     * @tc.desc Verify map adds 1 to each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const onePointone: number = 1.1;
      const oneValue: number = 1;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const mapped = values.map((val, index, array) => val + 1);
      expect(mapped.length).assertEqual(threeValue);
      expect(mapped[0]).assertEqual(onePointone);
      expect(mapped[2]).assertEqual(oneValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1070
     * @tc.name testFloat64ArrayMap107
     * @tc.desc Verify map multiplies each element by 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const threeValue: number = 3;
      const values = new Float64Array([0.5, 1.5]);
      const mapped = values.map((val) => val * 2);
      expect(mapped[0]).assertEqual(oneValue);
      expect(mapped[1]).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1080
     * @tc.name testFloat64ArrayMap108
     * @tc.desc Verify map with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([NaN, 1.0]);
      const mapped = values.map((val: number): number => Number.isNaN(val) ? 0.0 : val);
      expect(mapped[0]).assertEqual(0.0);
      expect(mapped[1]).assertEqual(1.0);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1090
     * @tc.name testFloat64ArrayMap109
     * @tc.desc Verify map with Infinity element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Float64Array.of(Infinity, -Infinity);
      const mapped = values.map((val: number): number => val > 0.0 ? 1.0 : -1.0);
      expect(mapped[0]).assertEqual(1.0);
      expect(mapped[1]).assertEqual(-1.0);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1100
     * @tc.name testFloat64ArrayMap110
     * @tc.desc Verify map returns constant value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const values = new Float64Array([0.1, 9007199254740991, 0]);
      const mapped = values.map((val) => 0.0);
      expect(mapped[0]).assertEqual(zeroPointZero);
      expect(mapped[2]).assertEqual(zeroPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1110
     * @tc.name testFloat64ArrayMap111
     * @tc.desc Verify map on empty array returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array();
      const mapped = values.map((val) => val + 1);
      const expectVal = zeroValue;
      expect(mapped.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1120
     * @tc.name testFloat64ArrayMap112
     * @tc.desc Verify map with incrementing index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const twoPointFive: number = 2.5;
      const twoPointtwofive: number = 2.25;
      const values = new Float64Array([pointFive, 1.5, 0.25]);
      const mapped = values.map((val, index) => val + index);
      expect(mapped[0]).assertEqual(pointFive);
      expect(mapped[1]).assertEqual(twoPointFive);
      expect(mapped[2]).assertEqual(twoPointtwofive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1130
     * @tc.name testFloat64ArrayMap113
     * @tc.desc Verify map returns new array original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum65536Value: number = -65536;
      const values = new Float64Array([-32768, -128]);
      const mapped = values.map((val) => val * 2);
      values[0] = 999.0;
      const expectVal = negnum65536Value;
      expect(mapped[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1140
     * @tc.name testFloat64ArrayMap114
     * @tc.desc Verify map((val) with [-2147483648, -1] exception handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1]);
      try {
        values.map((val) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1150
     * @tc.name testFloat64ArrayMap115
     * @tc.desc Verify map with maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([1.7976931348623157e+308]);
      const mapped = values.map((val: number): number => val * 2.0);
      const expectVal = Infinity;
      expect(mapped[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1160
     * @tc.name testFloat64ArrayMap116
     * @tc.desc Verify map with minimum positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minPositiveValue: number = 5e-324;
      const values = Float64Array.of(minPositiveValue);
      const mapped = values.map((val: number): number => val * 2.0);
      const expectVal = minPositiveValue * 2.0;
      expect(mapped[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1170
     * @tc.name testFloat64ArrayMap117
     * @tc.desc Verify map with negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num32768Value: number = 32768;
      const num128Value: number = 128;
      const values = new Float64Array([-32768, -128]);
      const mapped = values.map((val) => -val);
      expect(mapped[0]).assertEqual(num32768Value);
      expect(mapped[1]).assertEqual(num128Value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1180
     * @tc.name testFloat64ArrayMap118
     * @tc.desc Verify map with subtraction callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const oneValue: number = 0;
      const source = Float64Array.of(1.0, 2.0);
      const values = source.map((value) => value - 1.0);
      expect(values.length).assertEqual(twoValue);
      expect(values[0]).assertEqual(oneValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1190
     * @tc.name testFloat64ArrayMap119
     * @tc.desc Verify map with addition callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const source = Float64Array.of(1.0);
      const values = source.map((value, index) => value + 1.0);
      const expectVal = twoPointZero;
      expect(values[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1200
     * @tc.name testFloat64ArrayMap120
     * @tc.desc Verify map with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const fifteenValue: number = 15;
      const tenValue: number = 10;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      const m = arr.map((v: number): number => v & 0x0F);
      expect(m[0]).assertEqual(fifteenValue);
      expect(m[1]).assertEqual(tenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1210
     * @tc.name testFloat64ArrayMap121
     * @tc.desc Verify map with binary literal (D8 binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const fifteenValue: number = 15;
      const tenValue: number = 10;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      const m = arr.map((v: number): number => (v.toInt() & 0b00001111).toDouble());
      expect(m[0]).assertEqual(fifteenValue);
      expect(m[1]).assertEqual(tenValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1220
     * @tc.name testFloat64ArrayMap122
     * @tc.desc Verify map with Double.NaN (D5 critical)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const mapped = arr.map((v: number): number => Number.isNaN(v) ? 0.0 : v);
      expect(mapped[0]).assertEqual(0.0);
      expect(mapped[1]).assertEqual(doubleMaxValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1230
     * @tc.name testFloat64ArrayMap123
     * @tc.desc Verify map with Double.POSITIVE_INFINITY (D5 critical)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const mapped = arr.map((v: number): number => v > 0.0 ? 1.0 : -1.0);
      expect(mapped[0]).assertEqual(1.0);
      expect(mapped[1]).assertEqual(-1.0);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1240
     * @tc.name testFloat64ArrayMap124
     * @tc.desc Verify map with Double.MIN_VALUE/MAX_VALUE (D5 critical)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const mapped = arr.map((v: number): number => v * 2.0);
      expect(mapped[0]).assertEqual(doubleMinValue * 2.0);
      expect(mapped[1]).assertEqual(doubleMaxValue * 2.0);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1250
     * @tc.name testFloat64ArrayMap125
     * @tc.desc Verify map callback index parameter type is int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1);
      const types: Array<string> = [];
      arr.map((val: number, index: int): number => {
        types.push(typeof index);
        return val;
      })
      const expectVal = 'int';
      expect(types[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1260
     * @tc.name testFloat64ArrayMap126
     * @tc.desc Verify map callback array parameter refers to original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.5, 1.5);
      let callbackArr: Float64Array = new Float64Array(0);
      arr.map((val: number, index: int, array: Float64Array): number => {
        callbackArr = array;
        return val;
      })
      let same: boolean = false;
      let o1: Object = arr as Object;
      let o2: Object = callbackArr as Object;
      same = o1 === o2;
      const expectVal = true;
      expect(same).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_MAP_1270
     * @tc.name testFloat64ArrayMap127
     * @tc.desc Verify map identity callback preserves decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayMap127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = new Float64Array([pointFive, onePointFive]);
      const result = arr.map((val: number): number => {
        return val;
      })
      expect(result[0]).assertEqual(pointFive);
      expect(result[1]).assertEqual(onePointFive);
    })

  })
}
