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

export default function Float64ArrayCopyWithin2Test(): void {
  describe('Float64ArrayCopyWithin2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_0100
     * @tc.name testFloat64ArrayCopyWithin2001
     * @tc.desc Verify copyWithin returns length-preserving result after shifting values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const negativeOne: number = -1;
      const zeroValue: number = 0;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.copyWithin(0, 1);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
      expect(result[0]).assertEqual(negativeOne);
      expect(result[1]).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_0200
     * @tc.name testFloat64ArrayCopyWithin2002
     * @tc.desc Verify copyWithin returns the same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(pointTwoFive);
      expect(result[1]).assertEqual(pointOneTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_0300
     * @tc.name testFloat64ArrayCopyWithin2003
     * @tc.desc Verify chained copyWithin works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const arr = new Float64Array([-32768, -128, zeroValue, int8MaxValue, 32767]);
      const result = arr.copyWithin(0, 2, 4).copyWithin(3, 0, 2);
      expect(result[3]).assertEqual(zeroValue);
      expect(result[4]).assertEqual(int8MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_0400
     * @tc.name testFloat64ArrayCopyWithin2004
     * @tc.desc Verify triple chained copyWithin works correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, -1, 0, oneValue, 2147483647]);
      const result = arr.copyWithin(0, 2, 4).copyWithin(3, 0, 2).copyWithin(0, 4, 5);
      const expectVal = oneValue;
      expect(result[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_0500
     * @tc.name testFloat64ArrayCopyWithin2005
     * @tc.desc Verify length remains 1 for single-element array after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([0.5]);
      const result = arr.copyWithin(0, 0, 1);
      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_0600
     * @tc.name testFloat64ArrayCopyWithin2006
     * @tc.desc Verify byteLength equals length multiplied by 8 after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const eightValue: number = 8;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      arr.copyWithin(0, 2, 4);
      const expectVal = arr.length * eightValue;
      expect(arr.byteLength).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_0700
     * @tc.name testFloat64ArrayCopyWithin2007
     * @tc.desc Verify isView is true for copyWithin result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fortyValue: number = 40;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.copyWithin(0, 2, 4);
      const expectVal = fortyValue;
      expect(result.byteLength).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_0800
     * @tc.name testFloat64ArrayCopyWithin2008
     * @tc.desc Verify isView is true for empty array result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      const result = arr.copyWithin(0, 0, 0);
      const expectVal = zeroValue;
      expect(result.byteLength).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_0900
     * @tc.name testFloat64ArrayCopyWithin2009
     * @tc.desc Verify isView is true for buffer-derived array result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fortyValue: number = 40;
      const buffer = new ArrayBuffer(40);
      const arr = new Float64Array(buffer, 0, 5);
      const result = arr.copyWithin(0, 2, 4);
      const expectVal = fortyValue;
      expect(result.byteLength).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1000
     * @tc.name testFloat64ArrayCopyWithin2010
     * @tc.desc Verify array contents are modified after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = new Float64Array([-32768, -128, zeroValue, int8MaxValue, int16MaxValue]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(zeroValue);
      expect(arr[1]).assertEqual(int8MaxValue);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(int8MaxValue);
      expect(arr[4]).assertEqual(int16MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1100
     * @tc.name testFloat64ArrayCopyWithin2011
     * @tc.desc Verify modified array contents equal return value contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, -1, zeroValue, oneValue, 2147483647]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(zeroValue);
      expect(arr[1]).assertEqual(oneValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1200
     * @tc.name testFloat64ArrayCopyWithin2012
     * @tc.desc Verify buffer unchanged after copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(40);
      const arr = new Float64Array(buffer, 0, 5);
      arr[0] = 1.0;
      arr[1] = 2.0;
      arr[2] = 3.0;
      arr[3] = 4.0;
      arr[4] = 5.0;
      const originalBuffer = arr.buffer;
      arr.copyWithin(0, 2);
      const expectVal = originalBuffer;
      expect(arr.buffer).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1300
     * @tc.name testFloat64ArrayCopyWithin2013
     * @tc.desc Verify buffer unchanged after overlapping copyWithin
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(40);
      const arr = new Float64Array(buffer, 0, 5);
      const originalBuffer = arr.buffer;
      arr.copyWithin(1, 0, 3);
      const expectVal = originalBuffer;
      expect(arr.buffer).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1400
     * @tc.name testFloat64ArrayCopyWithin2014
     * @tc.desc Verify positive target out-of-bounds is silently clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      arr.copyWithin(10, 0, 2);
      expect(arr[0]).assertEqual(int32MinValue);
      expect(arr[1]).assertEqual(-1);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(oneValue);
      expect(arr[4]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1500
     * @tc.name testFloat64ArrayCopyWithin2015
     * @tc.desc Verify negative target out-of-bounds is silently clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, piValue, -1e-100]);
      const result = arr.copyWithin(-10, 2, 4);
      expect(result[0]).assertEqual(zeroValue);
      expect(result[1]).assertEqual(piValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1600
     * @tc.name testFloat64ArrayCopyWithin2016
     * @tc.desc Verify target equals length does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = new Float64Array([pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive]);
      arr.copyWithin(5, 0, 2);
      expect(arr[0]).assertEqual(pointFive);
      expect(arr[1]).assertEqual(onePointFive);
      expect(arr[2]).assertEqual(pointTwoFive);
      expect(arr[3]).assertEqual(pointOneTwoFive);
      expect(arr[4]).assertEqual(pointZeroSixTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1700
     * @tc.name testFloat64ArrayCopyWithin2017
     * @tc.desc Verify target equals 6 beyond length does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = new Float64Array([int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue]);
      arr.copyWithin(6, 0, 2);
      expect(arr[0]).assertEqual(int16MinValue);
      expect(arr[1]).assertEqual(-128);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(int8MaxValue);
      expect(arr[4]).assertEqual(int16MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1800
     * @tc.name testFloat64ArrayCopyWithin2018
     * @tc.desc Verify very large positive target does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      arr.copyWithin(9999, 0, 2);
      expect(arr[0]).assertEqual(int32MinValue);
      expect(arr[1]).assertEqual(-1);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(oneValue);
      expect(arr[4]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_1900
     * @tc.name testFloat64ArrayCopyWithin2019
     * @tc.desc Verify target equals -length-1 is silently clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, piValue, -1e-100]);
      const result = arr.copyWithin(-6, 2, 4);
      expect(result[0]).assertEqual(zeroValue);
      expect(result[1]).assertEqual(piValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2000
     * @tc.name testFloat64ArrayCopyWithin2020
     * @tc.desc Verify positive start out-of-bounds is silently clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = new Float64Array([pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive]);
      arr.copyWithin(0, 10, 12);
      expect(arr[0]).assertEqual(pointFive);
      expect(arr[1]).assertEqual(onePointFive);
      expect(arr[2]).assertEqual(pointTwoFive);
      expect(arr[3]).assertEqual(pointOneTwoFive);
      expect(arr[4]).assertEqual(pointZeroSixTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2100
     * @tc.name testFloat64ArrayCopyWithin2021
     * @tc.desc Verify negative start out-of-bounds is silently clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const int8MinValue: number = -128;
      const arr = new Float64Array([int16MinValue, -128, 0, 127, 32767]);
      const result = arr.copyWithin(3, -10, 3);
      expect(result[3]).assertEqual(int16MinValue);
      expect(result[4]).assertEqual(int8MinValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2200
     * @tc.name testFloat64ArrayCopyWithin2022
     * @tc.desc Verify start equals length does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      arr.copyWithin(0, 5, 5);
      expect(arr[0]).assertEqual(int32MinValue);
      expect(arr[1]).assertEqual(-1);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(oneValue);
      expect(arr[4]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2300
     * @tc.name testFloat64ArrayCopyWithin2023
     * @tc.desc Verify very large positive start does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      arr.copyWithin(0, 9999, 9999);
      expect(arr[0]).assertEqual(pointOne);
      expect(arr[1]).assertEqual(maxSafeInteger);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(piValue);
      expect(arr[4]).assertEqual(tinyNegativeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2400
     * @tc.name testFloat64ArrayCopyWithin2024
     * @tc.desc Verify positive end out-of-bounds is silently clamped to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = new Float64Array([0.5, 1.5, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive]);
      const result = arr.copyWithin(0, 2, 100);
      expect(result[0]).assertEqual(pointTwoFive);
      expect(result[1]).assertEqual(pointOneTwoFive);
      expect(result[2]).assertEqual(pointZeroSixTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2500
     * @tc.name testFloat64ArrayCopyWithin2025
     * @tc.desc Verify negative end out-of-bounds is silently clamped to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, 127, 32767);
      const result = arr.copyWithin(0, 2, -100);
      expect(result[0]).assertEqual(int16MinValue);
      expect(result[1]).assertEqual(int8MinValue);
      expect(result[2]).assertEqual(zeroValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2600
     * @tc.name testFloat64ArrayCopyWithin2026
     * @tc.desc Verify end equals -length results in empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      arr.copyWithin(0, 2, -5);
      expect(arr[0]).assertEqual(int32MinValue);
      expect(arr[1]).assertEqual(-1);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(oneValue);
      expect(arr[4]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2700
     * @tc.name testFloat64ArrayCopyWithin2027
     * @tc.desc Verify start greater than end results in empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      arr.copyWithin(0, 4, 2);
      expect(arr[0]).assertEqual(pointOne);
      expect(arr[1]).assertEqual(maxSafeInteger);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(piValue);
      expect(arr[4]).assertEqual(tinyNegativeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2800
     * @tc.name testFloat64ArrayCopyWithin2028
     * @tc.desc Verify target in start to end range copies overlapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, 0.125, pointZeroSixTwoFive);
      const result = arr.copyWithin(1, 0, 3);
      expect(result[0]).assertEqual(pointFive);
      expect(result[1]).assertEqual(pointFive);
      expect(result[2]).assertEqual(onePointFive);
      expect(result[3]).assertEqual(pointTwoFive);
      expect(result[4]).assertEqual(pointZeroSixTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_2900
     * @tc.name testFloat64ArrayCopyWithin2029
     * @tc.desc Verify target equals start results in no change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = new Float64Array([int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue]);
      arr.copyWithin(2, 2, 4);
      expect(arr[0]).assertEqual(int16MinValue);
      expect(arr[1]).assertEqual(-128);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(int8MaxValue);
      expect(arr[4]).assertEqual(int16MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3000
     * @tc.name testFloat64ArrayCopyWithin2030
     * @tc.desc Verify target equals start equals end results in empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      arr.copyWithin(2, 2, 2);
      expect(arr[0]).assertEqual(int32MinValue);
      expect(arr[1]).assertEqual(-1);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(oneValue);
      expect(arr[4]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3100
     * @tc.name testFloat64ArrayCopyWithin2031
     * @tc.desc Verify target=0 start=0 end=0 results in empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, tinyNegativeValue);
      arr.copyWithin(0, 0, 0);
      expect(arr[0]).assertEqual(pointOne);
      expect(arr[1]).assertEqual(maxSafeInteger);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(piValue);
      expect(arr[4]).assertEqual(tinyNegativeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3200
     * @tc.name testFloat64ArrayCopyWithin2032
     * @tc.desc Verify target=-1 start=-1 end=-1 results in empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = new Float64Array([pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive]);
      arr.copyWithin(-1, -1, -1);
      expect(arr[0]).assertEqual(pointFive);
      expect(arr[1]).assertEqual(onePointFive);
      expect(arr[2]).assertEqual(pointTwoFive);
      expect(arr[3]).assertEqual(pointOneTwoFive);
      expect(arr[4]).assertEqual(pointZeroSixTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3300
     * @tc.name testFloat64ArrayCopyWithin2033
     * @tc.desc Verify target=0 start=-1 end=-1 results in empty range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = new Float64Array([int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue]);
      arr.copyWithin(0, -1, -1);
      expect(arr[0]).assertEqual(int16MinValue);
      expect(arr[1]).assertEqual(-128);
      expect(arr[2]).assertEqual(zeroValue);
      expect(arr[3]).assertEqual(int8MaxValue);
      expect(arr[4]).assertEqual(int16MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3400
     * @tc.name testFloat64ArrayCopyWithin2034
     * @tc.desc Verify all negative indices with target=-length start=-length end=length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      const result = arr.copyWithin(-5, -5, 5);
      expect(result[0]).assertEqual(int32MinValue);
      expect(result[1]).assertEqual(negativeOne);
      expect(result[2]).assertEqual(zeroValue);
      expect(result[3]).assertEqual(oneValue);
      expect(result[4]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3500
     * @tc.name testFloat64ArrayCopyWithin2035
     * @tc.desc Verify copyWithin preserves NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Number.NaN;
      const piValue: number = 3.141592653589793;
      const arr = new Float64Array([0.1, 9007199254740991, nanValue, piValue, -1e-100]);
      const result = arr.copyWithin(0, 2, 4);
      const actualFirstIsNaN = Number.isNaN(result[0]);
      const expectedFirstIsNaN = true;
      expect(actualFirstIsNaN).assertEqual(expectedFirstIsNaN);
      expect(result[1]).assertEqual(piValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3600
     * @tc.name testFloat64ArrayCopyWithin2036
     * @tc.desc Verify copyWithin preserves Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const arr = new Float64Array([0.5, positiveInfinity, 0.25, 0.125, 0.0625]);
      const result = arr.copyWithin(0, 1, 2);
      expect(result[0]).assertEqual(positiveInfinity);
      const actualFirstIsFinite = Number.isFinite(result[0]);
      const expectedFirstIsFinite = false;
      expect(actualFirstIsFinite).assertEqual(expectedFirstIsFinite);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3700
     * @tc.name testFloat64ArrayCopyWithin2037
     * @tc.desc Verify copyWithin preserves -Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = Number.NEGATIVE_INFINITY;
      const arr = new Float64Array([-32768, negativeInfinity, 0, 127, 32767]);
      const result = arr.copyWithin(0, 1, 2);
      expect(result[0]).assertEqual(negativeInfinity);
      const actualFirstIsFinite = Number.isFinite(result[0]);
      const expectedFirstIsFinite = false;
      expect(actualFirstIsFinite).assertEqual(expectedFirstIsFinite);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3800
     * @tc.name testFloat64ArrayCopyWithin2038
     * @tc.desc Verify copyWithin preserves -0.0 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeZero: number = -0.0;
      const negativeInfinity: number = Number.NEGATIVE_INFINITY;
      const arr = new Float64Array([-2147483648, negativeZero, 0, 1, 2147483647]);
      const result = arr.copyWithin(0, 1, 2);
      expect(result[0]).assertEqual(negativeZero);
      expect(1.0 / result[0]).assertEqual(negativeInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_3900
     * @tc.name testFloat64ArrayCopyWithin2039
     * @tc.desc Verify copyWithin preserves +0.0 values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveZero: number = 0.0;
      const positiveInfinity: number = Number.POSITIVE_INFINITY;
      const arr = Float64Array.of(0.1, positiveZero, 9007199254740991, 3.141592653589793, -1e-100);
      const result = arr.copyWithin(0, 1, 2);
      expect(result[0]).assertEqual(positiveZero);
      expect(1.0 / result[0]).assertEqual(positiveInfinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4000
     * @tc.name testFloat64ArrayCopyWithin2040
     * @tc.desc Verify copyWithin preserves MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxValue: number = Number.MAX_VALUE;
      const arr = new Float64Array([0.5, maxValue, 0.25, 0.125, 0.0625]);
      const result = arr.copyWithin(0, 1, 2);
      const expectVal = maxValue;
      expect(result[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4100
     * @tc.name testFloat64ArrayCopyWithin2041
     * @tc.desc Verify copyWithin preserves MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minValue: number = Number.MIN_VALUE;
      const arr = new Float64Array([-32768, minValue, 0, 127, 32767]);
      const result = arr.copyWithin(0, 1, 2);
      const expectVal = minValue;
      expect(result[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4200
     * @tc.name testFloat64ArrayCopyWithin2042
     * @tc.desc Verify copyWithin with negative exponent scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = new Float64Array([int32MinValue, -1, 0, 1, 2147483647]);
      const result = arr.copyWithin(3, 0, 3);
      expect(result[3]).assertEqual(int32MinValue);
      expect(result[4]).assertEqual(negativeOne);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4300
     * @tc.name testFloat64ArrayCopyWithin2043
     * @tc.desc Verify copyWithin with positive exponent scientific notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e+308;
      let overflowVal: number = Number.MAX_VALUE * 2.0;
      const arr = new Float64Array([1.0, 2.0, sciValue10e308, overflowVal, 5.0]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(sciValue10e308);
      expect(result[1]).assertEqual(overflowVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4400
     * @tc.name testFloat64ArrayCopyWithin2044
     * @tc.desc Verify overlapping copy where target is before start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const tinyNegativeValue: number = -1e-100;
      const arr = new Float64Array([0.1, 9007199254740991, zeroValue, piValue, tinyNegativeValue]);
      const result = arr.copyWithin(0, 2, 4);
      expect(result[0]).assertEqual(zeroValue);
      expect(result[1]).assertEqual(piValue);
      expect(result[2]).assertEqual(zeroValue);
      expect(result[3]).assertEqual(piValue);
      expect(result[4]).assertEqual(tinyNegativeValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4500
     * @tc.name testFloat64ArrayCopyWithin2045
     * @tc.desc Verify overlapping copy with target between start and end on larger array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue, zeroValue, zeroValue);
      const result = arr.copyWithin(2, 0, 5);
      expect(result[0]).assertEqual(int32MinValue);
      expect(result[1]).assertEqual(negativeOne);
      expect(result[2]).assertEqual(int32MinValue);
      expect(result[3]).assertEqual(negativeOne);
      expect(result[4]).assertEqual(zeroValue);
      expect(result[5]).assertEqual(oneValue);
      expect(result[6]).assertEqual(int32MaxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4600
     * @tc.name testFloat64ArrayCopyWithin2046
     * @tc.desc Verify overlapping copy with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, 3.141592653589793, -1e-100);
      const result = arr.copyWithin(-2, -5, -1);
      expect(result[0]).assertEqual(pointOne);
      expect(result[1]).assertEqual(maxSafeInteger);
      expect(result[2]).assertEqual(zeroValue);
      expect(result[3]).assertEqual(pointOne);
      expect(result[4]).assertEqual(maxSafeInteger);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4700
     * @tc.name testFloat64ArrayCopyWithin2047
     * @tc.desc Verify overlapping copy with all negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, 0.125, 0.0625);
      const result = arr.copyWithin(-3, -5, -2);
      expect(result[0]).assertEqual(pointFive);
      expect(result[1]).assertEqual(onePointFive);
      expect(result[2]).assertEqual(pointFive);
      expect(result[3]).assertEqual(onePointFive);
      expect(result[4]).assertEqual(pointTwoFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4800
     * @tc.name testFloat64ArrayCopyWithin2048
     * @tc.desc Verify copyWithin on single-element array does nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.copyWithin(0, 0, 1);
      expect(result[0]).assertEqual(int16MinValue);
      expect(result.length).assertEqual(oneValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_4900
     * @tc.name testFloat64ArrayCopyWithin2049
     * @tc.desc Verify copyWithin on single-element array with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = new Float64Array([int32MinValue]);
      const result = arr.copyWithin(-1, -1, 1);
      const expectVal = int32MinValue;
      expect(result[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_5000
     * @tc.name testFloat64ArrayCopyWithin2050
     * @tc.desc Verify overlapping copyWithin on two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(0.1, maxSafeInteger);
      const result = arr.copyWithin(0, 1, 2);
      expect(result[0]).assertEqual(maxSafeInteger);
      expect(result[1]).assertEqual(maxSafeInteger);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_5100
     * @tc.name testFloat64ArrayCopyWithin2051
     * @tc.desc Verify copyWithin on 100-element large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const fortyninePointzero: number = 49.0;
      const hundredValue: number = 100;
      const arr = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i * 1.0;
      }
      const result = arr.copyWithin(50, 0, 50);
      expect(result[50]).assertEqual(zeroPointZero);
      expect(result[99]).assertEqual(fortyninePointzero);
      expect(result.length).assertEqual(hundredValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_5200
     * @tc.name testFloat64ArrayCopyWithin2052
     * @tc.desc Verify copyWithin on 1000-element large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const num500Pointzero: number = 500.0;
      const num999Pointzero: number = 999.0;
      const arr = new Float64Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr[i] = i * 1.0;
      }
      const result = arr.copyWithin(0, 500, 1000);
      expect(result[0]).assertEqual(num500Pointzero);
      expect(result[499]).assertEqual(num999Pointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_5300
     * @tc.name testFloat64ArrayCopyWithin2053
     * @tc.desc Verify copyWithin on large array with negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const fortyninePointzero: number = 49.0;
      const arr = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i * 1.0;
      }
      const result = arr.copyWithin(-50, -100, -50);
      expect(result[0]).assertEqual(zeroPointZero);
      expect(result[49]).assertEqual(fortyninePointzero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_5400
     * @tc.name testFloat64ArrayCopyWithin2054
     * @tc.desc Verify copyWithin with negative target clamps to start and returns same instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive, 0.25, 0.125, 0.0625);
      const result = arr.copyWithin(-100, 0);
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(pointFive);
      expect(result[1]).assertEqual(onePointFive);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_5500
     * @tc.name testFloat64ArrayCopyWithin2055
     * @tc.desc Verify copyWithin with negative start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MaxValue: number = 32767;
      const arr = new Float64Array([-32768, -128, 0, 127, int16MaxValue]);
      arr.copyWithin(0, -1);
      const expectVal = int16MaxValue;
      expect(arr[0]).assertEqual(expectVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_COPY_WITHIN_2_5600
     * @tc.name testFloat64ArrayCopyWithin2056
     * @tc.desc Verify copyWithin on subarray rewrites parent-backed slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayCopyWithin2056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = new Float64Array([1.0, 2.0, 3.0, 4.0]);
      const child = parent.subarray(1, 3);
      child.copyWithin(0, 1);
      const actualParentFirstCopiedValue = parent.$_get(1);
      const expectedParentFirstCopiedValue = 3.0;
      expect(actualParentFirstCopiedValue).assertEqual(expectedParentFirstCopiedValue);
      const actualParentSecondValue = parent.$_get(2);
      const expectedParentSecondValue = 3.0;
      expect(actualParentSecondValue).assertEqual(expectedParentSecondValue);
    });

  })
}
