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
import Utils from './../Util.test';

function isF64Arr(obj: Object): boolean {
  return obj instanceof Float64Array;
}

export default function Float64ArraySlice2Test(): void {
  describe('Float64ArraySlice2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_0100
     * @tc.name testFloat64ArraySlice2001
     * @tc.desc Verify slice with begin=-2.5 truncated to -3 starts from third element from end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const threeValue: number = 3;
      const original = new Float64Array([0.5, 1.5, pointTwoFive, 0.125, 0.0625]);
      const result = original.slice(-3, 5);
      expect(result.length).assertEqual(threeValue);
      const actVal1 = result.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_0200
     * @tc.name testFloat64ArraySlice2002
     * @tc.desc Verify slice with begin=1e2 scientific notation equals 100 out of bounds returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const original = new Float64Array([-32768, -128, zeroValue]);
      const result = original.slice(100, 101);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_0300
     * @tc.name testFloat64ArraySlice2003
     * @tc.desc Verify slice with end=-2.5 truncated to -3 excludes last three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const original = new Float64Array([-2147483648, negativeOne, 0, 1, 2147483647]);
      const result = original.slice(0, -3);
      expect(result.length).assertEqual(twoValue);
      const actVal2 = result.$_get(1);
      const expectVal = negativeOne;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_0400
     * @tc.name testFloat64ArraySlice2004
     * @tc.desc Verify slice with begin=-4 end=3 mixed negative and positive signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const original = new Float64Array([0.1, maxSafeInteger, zeroValue, 3.141592653589793, -1e-100]);
      const result = original.slice(-4, 3);
      expect(result.length).assertEqual(twoValue);
      const actVal3 = result.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal3).assertEqual(expectVal);
      const actVal4 = result.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal4).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_0500
     * @tc.name testFloat64ArraySlice2005
     * @tc.desc Verify Slice2 full copy of three-element array returns complete range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const original = new Float64Array([pointOne, 9007199254740991, zeroValue]);
      const result = original.slice(0, 3);
      expect(result.length).assertEqual(threeValue);
      const actVal5 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal5).assertEqual(expectVal);
      const actVal6 = result.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal6).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_0600
     * @tc.name testFloat64ArraySlice2006
     * @tc.desc Verify slice(-2,-1) on three-element array returns the middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const original = new Float64Array([-32768, int8MinValue, 0]);
      const result = original.slice(-2, -1);
      expect(result.length).assertEqual(oneValue);
      const actVal7 = result.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal7).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_0700
     * @tc.name testFloat64ArraySlice2007
     * @tc.desc Verify slice(1,3) on four-element array returns the two middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const original = new Float64Array([-2147483648, negativeOne, zeroValue, 1]);
      const result = original.slice(1, 3);
      expect(result.length).assertEqual(twoValue);
      const actVal8 = result.$_get(0);
      const expectVal = negativeOne;
      expect(actVal8).assertEqual(expectVal);
      const actVal9 = result.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal9).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_0800
     * @tc.name testFloat64ArraySlice2008
     * @tc.desc Verify slice copy is an independent object reference not equal to original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Float64Array([0.1, 9007199254740991, 0]);
      const result = original.slice();
      const expectVal = false;
      expect(result === original).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_0900
     * @tc.name testFloat64ArraySlice2009
     * @tc.desc Verify slice copy length property is independent from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const threeValue: number = 3;
      const original = new Float64Array([0.5, 1.5, 0.25]);
      const result = original.slice(0, 1);
      expect(result.length).assertEqual(oneValue);
      expect(original.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1000
     * @tc.name testFloat64ArraySlice2010
     * @tc.desc Verify slice copy byteLength is computed independently from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const thirtytwoValue: number = 32;
      const original = new Float64Array([-32768, -128, 0, 127]);
      const result = original.slice(1, 3);
      expect(result.byteLength).assertEqual(sixteenValue);
      expect(original.byteLength).assertEqual(thirtytwoValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1100
     * @tc.name testFloat64ArraySlice2011
     * @tc.desc Verify slice copy BYTES_PER_ELEMENT is the same as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sixteenValue: number = 16;
      const original = Float64Array.of(-2147483648, -1, 0);
      const result = original.slice(0, 2);
      const expectVal = sixteenValue;
      expect(result.byteLength).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1200
     * @tc.name testFloat64ArraySlice2012
     * @tc.desc Verify slicing a slice copy returns a smaller copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const twoValue: number = 2;
      const original = new Float64Array([0.1, maxSafeInteger, zeroValue, 3.141592653589793, -1e-100]);
      const firstSlice = original.slice(1, 4);
      const secondSlice = firstSlice.slice(0, 2);
      expect(secondSlice.length).assertEqual(twoValue);
      const actVal10 = secondSlice.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal10).assertEqual(expectVal);
      const actVal11 = secondSlice.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal11).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1300
     * @tc.name testFloat64ArraySlice2013
     * @tc.desc Verify modifying slice copy elements does not affect original array at corresponding positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const num999Pointzero: number = 999.0;
      const num888Pointzero: number = 888.0;
      const original = new Float64Array([0.5, onePointFive, pointTwoFive, 0.125, 0.0625]);
      const result = original.slice(1, 3);
      result.$_set(0, num999Pointzero);
      result.$_set(1, num888Pointzero);
      const actVal12 = original.$_get(1);
      const expectVal = onePointFive;
      expect(actVal12).assertEqual(expectVal);
      const actVal13 = original.$_get(2);
      const expectVal2 = pointTwoFive;
      expect(actVal13).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1400
     * @tc.name testFloat64ArraySlice2014
     * @tc.desc Verify Slice2 begin -4 includes four trailing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MinValue: number = -128;
      const int16MaxValue: number = 32767;
      const fourValue: number = 4;
      const original = new Float64Array([-32768, int8MinValue, 0, 127, int16MaxValue]);
      const result = original.slice(-4, 5);
      expect(result.length).assertEqual(fourValue);
      const actVal14 = result.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal14).assertEqual(expectVal);
      const actVal15 = result.$_get(3);
      const expectVal2 = int16MaxValue;
      expect(actVal15).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1500
     * @tc.name testFloat64ArraySlice2015
     * @tc.desc Verify slice begin=-3 on int32 boundary array returns trailing three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const int32MaxValue: number = 2147483647;
      const threeValue: number = 3;
      const original = new Float64Array([-2147483648, -1, zeroValue, 1, int32MaxValue]);
      const result = original.slice(-3, 5);
      expect(result.length).assertEqual(threeValue);
      const actVal16 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal16).assertEqual(expectVal);
      const actVal17 = result.$_get(2);
      const expectVal2 = int32MaxValue;
      expect(actVal17).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1600
     * @tc.name testFloat64ArraySlice2016
     * @tc.desc Verify Slice2 end -4 keeps only leading prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const oneValue: number = 1;
      const original = new Float64Array([pointOne, 9007199254740991, 0, 3.141592653589793, -1e-100]);
      const result = original.slice(0, -4);
      expect(result.length).assertEqual(oneValue);
      const actVal18 = result.$_get(0);
      const expectVal = pointOne;
      expect(actVal18).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1700
     * @tc.name testFloat64ArraySlice2017
     * @tc.desc Verify Slice2 negative begin and end select leading trio
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const original = new Float64Array([int16MinValue, -128, zeroValue, 127, 32767]);
      const result = original.slice(-5, -2);
      expect(result.length).assertEqual(threeValue);
      const actVal19 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal19).assertEqual(expectVal);
      const actVal20 = result.$_get(2);
      const expectVal2 = zeroValue;
      expect(actVal20).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1800
     * @tc.name testFloat64ArraySlice2018
     * @tc.desc Verify slice with begin=0 end=length+100 clamped to length returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const fourValue: number = 4;
      const original = new Float64Array([-32768, -128, 0, int8MaxValue]);
      const result = original.slice(0, 104);
      expect(result.length).assertEqual(fourValue);
      const actVal21 = result.$_get(3);
      const expectVal = int8MaxValue;
      expect(actVal21).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_1900
     * @tc.name testFloat64ArraySlice2019
     * @tc.desc Verify slice with begin=100 end=100 where both are out of bounds returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const original = new Float64Array([-32768, -128, zeroValue]);
      const result = original.slice(100, 100);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2000
     * @tc.name testFloat64ArraySlice2020
     * @tc.desc Verify Slice2 fully negative out-of-bounds range returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const original = Float64Array.of(-2147483648, -1, zeroValue);
      const result = original.slice(-100, -100);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2100
     * @tc.name testFloat64ArraySlice2021
     * @tc.desc Verify slice does not throw for any out-of-bounds combination of parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const original = new Float64Array([-32768, -128, 0]);
      try {
        const r1 = original.slice(-1000, -500);
        const r2 = original.slice(1000, 2000);
        const r3 = original.slice(-100, 100);
        const r4 = original.slice(5, 2);
        expect(r1.length + r2.length + r3.length + r4.length).assertEqual(threeValue);
      } catch (e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2200
     * @tc.name testFloat64ArraySlice2022
     * @tc.desc Verify slice does not throw when non-integer parameters are used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const twoValue: number = 2;
      const original = new Float64Array([-2147483648, negativeOne, 0, 1, 2147483647]);
      try {
        const result = original.slice(1, 3);
        expect(result.length).assertEqual(twoValue);
        const actVal22 = result.$_get(0);
        const expectVal = negativeOne;
        expect(actVal22).assertEqual(expectVal);
      } catch (e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2300
     * @tc.name testFloat64ArraySlice2023
     * @tc.desc Verify slice does not throw when very large numeric values are passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const original = Float64Array.of(0.1, 9007199254740991, zeroValue);
      try {
        const result = original.slice(2147483647, 2147483647);
        expect(result.length).assertEqual(zeroValue);
      } catch (e) {
        expect().assertFail();
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2400
     * @tc.name testFloat64ArraySlice2024
     * @tc.desc Verify slice with begin=1.7976931348623157e+308 out of bounds returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const original = new Float64Array([0.5, 1.5, 0.25]);
      const result = original.slice(2147483647, 2147483647);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2500
     * @tc.name testFloat64ArraySlice2025
     * @tc.desc Verify slice with begin=1.7976931348623158e+308 overflow boundary out of bounds returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const original = new Float64Array([-32768, -128, zeroValue]);
      const result = original.slice(2147483647, 2147483646);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2600
     * @tc.name testFloat64ArraySlice2026
     * @tc.desc Verify slice with end=2147483647 INT_MAX clamped to length returns all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const original = Float64Array.of(-2147483648, -1, zeroValue);
      const result = original.slice(0, 2147483647);
      expect(result.length).assertEqual(threeValue);
      const actVal23 = result.$_get(2);
      const expectVal = zeroValue;
      expect(actVal23).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2700
     * @tc.name testFloat64ArraySlice2027
     * @tc.desc Verify slice with end=-2147483648 INT_MIN clamped to 0 returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const original = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const result = original.slice(0, -2147483647);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2800
     * @tc.name testFloat64ArraySlice2028
     * @tc.desc Verify slice with end=0o7 octal literal equal to 7 out of bounds clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointZeroSixTwoFive: number = 0.0625;
      const fiveValue: number = 5;
      const original = Float64Array.of(0.5, 1.5, 0.25, 0.125, pointZeroSixTwoFive);
      const result = original.slice(0, 0o7);
      expect(result.length).assertEqual(fiveValue);
      const actVal24 = result.$_get(4);
      const expectVal = pointZeroSixTwoFive;
      expect(actVal24).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_2900
     * @tc.name testFloat64ArraySlice2029
     * @tc.desc Verify slice with array containing positive zero and negative zero elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const int8MinValue: number = -128;
      const oneValue: number = 1;
      const original = new Float64Array([zeroValue, int8MinValue, zeroValue]);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal25 = result.$_get(0);
      const expectVal = int8MinValue;
      expect(actVal25).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3000
     * @tc.name testFloat64ArraySlice2030
     * @tc.desc Verify slice with array containing alternating positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const int32MaxValue: number = 2147483647;
      const fourValue: number = 4;
      const original = Float64Array.of(-2147483648, negativeOne, zeroValue, 1, int32MaxValue, zeroValue);
      const result = original.slice(1, 5);
      expect(result.length).assertEqual(fourValue);
      const actVal26 = result.$_get(0);
      const expectVal = negativeOne;
      expect(actVal26).assertEqual(expectVal);
      const actVal27 = result.$_get(3);
      const expectVal2 = int32MaxValue;
      expect(actVal27).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3100
     * @tc.name testFloat64ArraySlice2031
     * @tc.desc Verify slice with array containing an ascending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const tinyNegativeValue: number = -1e-100;
      const threeValue: number = 3;
      const original = new Float64Array([0.1, 9007199254740991, zeroValue, 3.141592653589793, tinyNegativeValue, zeroValue]);
      const result = original.slice(2, 5);
      expect(result.length).assertEqual(threeValue);
      const actVal28 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal28).assertEqual(expectVal);
      const actVal29 = result.$_get(2);
      const expectVal2 = tinyNegativeValue;
      expect(actVal29).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3200
     * @tc.name testFloat64ArraySlice2032
     * @tc.desc Verify slice with array containing a descending sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointFive: number = 1.5;
      const pointOneTwoFive: number = 0.125;
      const threeValue: number = 3;
      const original = new Float64Array([0.5, onePointFive, 0.25, pointOneTwoFive, 0.0625]);
      const result = original.slice(1, 4);
      expect(result.length).assertEqual(threeValue);
      const actVal30 = result.$_get(0);
      const expectVal = onePointFive;
      expect(actVal30).assertEqual(expectVal);
      const actVal31 = result.$_get(2);
      const expectVal2 = pointOneTwoFive;
      expect(actVal31).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3300
     * @tc.name testFloat64ArraySlice2033
     * @tc.desc Verify slice with array containing mixed precision values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const piValue: number = 3.141592653589793;
      const threeValue: number = 3;
      const original = new Float64Array([0.1, maxSafeInteger, 0, piValue, -1e-100]);
      const result = original.slice(1, 4);
      expect(result.length).assertEqual(threeValue);
      const actVal32 = result.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal32).assertEqual(expectVal);
      const actVal33 = result.$_get(2);
      const expectVal2 = piValue;
      expect(actVal33).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3400
     * @tc.name testFloat64ArraySlice2034
     * @tc.desc Verify slice copy byteOffset is 0 and independent from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const buffer = new ArrayBuffer(40);
      const original = new Float64Array(buffer, 0, 5);
      const result = original.slice(2, 4);
      expect(result.byteOffset).assertEqual(zeroValue);
      expect(original.byteOffset).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3500
     * @tc.name testFloat64ArraySlice2035
     * @tc.desc Verify slice return value elements are of numeric type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const original = Float64Array.of(-2147483648, negativeOne, zeroValue, 1, 2147483647);
      const result = original.slice(1, 3);
      const actVal34 = result.$_get(0);
      const expectVal = negativeOne;
      expect(actVal34).assertEqual(expectVal);
      const actVal35 = result.$_get(1);
      const expectVal2 = zeroValue;
      expect(actVal35).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3600
     * @tc.name testFloat64ArraySlice2036
     * @tc.desc Verify slice(1, 2) over int16 array returns non-NaN int8 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const original = new Float64Array([-32768, -128, 0]);
      const result = original.slice(1, 2);
      expect(result.length).assertEqual(oneValue);
      const actVal36 = Number.isNaN(result.$_get(0));
      const expectVal = false;
      expect(actVal36).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3700
     * @tc.name testFloat64ArraySlice2037
     * @tc.desc Verify slice over int32 boundary array preserves six-element result without special values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const sixValue: number = 6;
      const original = Float64Array.of(-2147483648, negativeOne, zeroValue, oneValue, int32MaxValue, zeroValue);
      const result = original.slice(0, 6);
      expect(result.length).assertEqual(sixValue);
      const actVal37 = result.$_get(0) === Infinity;
      const expectVal = false;
      expect(actVal37).assertEqual(expectVal);
      const actVal38 = result.$_get(1);
      const expectVal2 = negativeOne;
      expect(actVal38).assertEqual(expectVal2);
      const actVal39 = Number.isNaN(result.$_get(2));
      const expectVal3 = false;
      expect(actVal39).assertEqual(expectVal3);
      const actVal40 = result.$_get(3);
      const expectVal4 = oneValue;
      expect(actVal40).assertEqual(expectVal4);
      const actVal41 = result.$_get(4);
      const expectVal5 = int32MaxValue;
      expect(actVal41).assertEqual(expectVal5);
      const actVal42 = result.$_get(5);
      const expectVal6 = zeroValue;
      expect(actVal42).assertEqual(expectVal6);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3800
     * @tc.name testFloat64ArraySlice2038
     * @tc.desc Verify slice with hex literal as end parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fivePointZero: number = 5.0;
      const fiveValue: number = 5;
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, fivePointZero);
      const s = arr.slice(0, 0x5);
      expect(s.length).assertEqual(fiveValue);
      expect(s[4]).assertEqual(fivePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_3900
     * @tc.name testFloat64ArraySlice2039
     * @tc.desc Verify slice with octal literal as begin parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const twoValue: number = 2;
      const arr = new Float64Array([1.0, twoPointZero, 3.0, 4.0, 5.0]);
      const s = arr.slice(0o1, 3);
      expect(s.length).assertEqual(twoValue);
      expect(s[0]).assertEqual(twoPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_4000
     * @tc.name testFloat64ArraySlice2040
     * @tc.desc Verify slice with binary literal as end parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourPointZero: number = 4.0;
      const fourValue: number = 4;
      const arr = new Float64Array([1.0, 2.0, 3.0, fourPointZero, 5.0]);
      const s = arr.slice(0, 0b100);
      expect(s.length).assertEqual(fourValue);
      expect(s[3]).assertEqual(fourPointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_4100
     * @tc.name testFloat64ArraySlice2041
     * @tc.desc Verify slice with 0x0 as begin parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoValue: number = 2;
      const arr = new Float64Array([onePointZero, 2.0, 3.0, 4.0, 5.0]);
      const s = arr.slice(0x0, 2);
      expect(s.length).assertEqual(twoValue);
      expect(s[0]).assertEqual(onePointZero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_4200
     * @tc.name testFloat64ArraySlice2042
     * @tc.desc Verify slice returns Float64Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const s = arr.slice(2, 5);
      const actVal43 = isF64Arr(s);
      const expectVal = true;
      expect(actVal43).assertEqual(expectVal);
      expect(s.length).assertEqual(threeValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_4300
     * @tc.name testFloat64ArraySlice2043
     * @tc.desc Verify slice with hex MAX_VALUE as begin parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([1.0, 2.0, 3.0]);
      const s = arr.slice(0x7FFFFFFF, 3);
      const expectVal = zeroValue;
      expect(s.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_4400
     * @tc.name testFloat64ArraySlice2044
     * @tc.desc Verify slice with binary literal as begin parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const s = arr.slice(0b1010, 5);
      const expectVal = zeroValue;
      expect(s.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_SLICE_2_4500
     * @tc.name testFloat64ArraySlice2045
     * @tc.desc Verify slice with MIN_VALUE as begin parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArraySlice2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = Float64Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const s = arr.slice(-2147483648, 5);
      const expectVal = fiveValue;
      expect(s.length).assertEqual(expectVal);
    })

  })
}
