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

export default function float64ArrayReverseTest(): void {
  describe('Float64ArrayReverseTest', (): void => {
    beforeAll((): void => {
    })

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30)
    })

    afterEach((): void => {
    })

    afterAll((): void => {
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0010
     * @tc.name testFloat64ArrayReverse001
     * @tc.desc Verify reverse method called with no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      arr.reverse();
      const expectVal = zeroValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0020
     * @tc.name testFloat64ArrayReverse002
     * @tc.desc Verify reverse return value type reference check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const oneValue: number = 1;
      const arr = Float64Array.of(pointFive);
      const result = arr.reverse();
      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0030
     * @tc.name testFloat64ArrayReverse003
     * @tc.desc Verify empty array reverse returns itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const result = arr.reverse();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0040
     * @tc.name testFloat64ArrayReverse004
     * @tc.desc Verify single element array value unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue);
      arr.reverse();
      const expectVal = int16MinValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0050
     * @tc.name testFloat64ArrayReverse005
     * @tc.desc Verify single element array reverse returns itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue);
      const result = arr.reverse();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0060
     * @tc.name testFloat64ArrayReverse006
     * @tc.desc Verify two-element array reverse swaps positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1);
      arr.reverse();
      const expectVal = negativeOne;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0070
     * @tc.name testFloat64ArrayReverse007
     * @tc.desc Verify two-element array reverse second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      arr.reverse();
      const expectVal = pointOne;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0080
     * @tc.name testFloat64ArrayReverse008
     * @tc.desc Verify two-element array reverse returns self reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      const result = arr.reverse();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0090
     * @tc.name testFloat64ArrayReverse009
     * @tc.desc Verify two-element array element sum unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue, -1);
      const sumBefore = arr[0] + arr[1];
      arr.reverse();
      const expectVal = sumBefore;
      expect(arr[0] + arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0100
     * @tc.name testFloat64ArrayReverse010
     * @tc.desc Verify three-element array reverse swaps first and last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr.reverse();
      const expectVal = zeroValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0110
     * @tc.name testFloat64ArrayReverse011
     * @tc.desc Verify three-element array reverse middle unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.reverse();
      const expectVal = onePointFive;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0120
     * @tc.name testFloat64ArrayReverse012
     * @tc.desc Verify three-element array reverse last becomes first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      arr.reverse();
      const expectVal = int16MinValue;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0130
     * @tc.name testFloat64ArrayReverse013
     * @tc.desc Verify three-element array reverse returns this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      const actVal1 = arr.reverse();
      const expectVal = arr;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0140
     * @tc.name testFloat64ArrayReverse014
     * @tc.desc Verify five-element array fully reversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive);
      arr.reverse();
      const expectVal = pointZeroSixTwoFive;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0150
     * @tc.name testFloat64ArrayReverse015
     * @tc.desc Verify five-element array last element after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MaxValue: number = 127;
      const int16MaxValue: number = 32767;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue, int8MaxValue, int16MaxValue);
      arr.reverse();
      const expectVal = int16MinValue;
      expect(arr[4]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0160
     * @tc.name testFloat64ArrayReverse016
     * @tc.desc Verify five-element array middle element after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue, int32MaxValue);
      arr.reverse();
      const expectVal = zeroValue;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0170
     * @tc.name testFloat64ArrayReverse017
     * @tc.desc Verify ten-element array first element after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr =
        Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue, -1e-100, zeroValue, zeroValue, zeroValue,
          zeroValue, zeroValue);
      arr.reverse();
      const expectVal = zeroValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0180
     * @tc.name testFloat64ArrayReverse018
     * @tc.desc Verify ten-element array last element after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const pointZeroSixTwoFive: number = 0.0625;
      const zeroValue: number = 0;
      const arr =
        Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive, pointZeroSixTwoFive, zeroValue,
          zeroValue, zeroValue, zeroValue, zeroValue);
      arr.reverse();
      const expectVal = pointFive;
      expect(arr[9]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0190
     * @tc.name testFloat64ArrayReverse019
     * @tc.desc Verify 100-element array reverse first element check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue99: number = 99.0;
      const arr = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      arr.reverse();
      const expectVal = fillValue99;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0200
     * @tc.name testFloat64ArrayReverse020
     * @tc.desc Verify 100-element array reverse last element check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = i;
      }
      arr.reverse();
      const expectVal = zeroPointZero;
      expect(arr[99]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0210
     * @tc.name testFloat64ArrayReverse021
     * @tc.desc Verify negative-value array reverse first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      arr.reverse();
      const expectVal = zeroValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0220
     * @tc.name testFloat64ArrayReverse022
     * @tc.desc Verify negative-value array reverse last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      arr.reverse();
      const expectVal = int32MinValue;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0230
     * @tc.name testFloat64ArrayReverse023
     * @tc.desc Verify mixed positive-negative array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const piValue: number = 3.141592653589793;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue, piValue);
      arr.reverse();
      const expectVal = piValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0240
     * @tc.name testFloat64ArrayReverse024
     * @tc.desc Verify mixed positive-negative array reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const pointOneTwoFive: number = 0.125;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive, pointOneTwoFive);
      arr.reverse();
      const expectVal = pointFive;
      expect(arr[3]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0250
     * @tc.name testFloat64ArrayReverse025
     * @tc.desc Verify all-zero array remains all-zero after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      arr.reverse();
      const expectVal = zeroValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0260
     * @tc.name testFloat64ArrayReverse026
     * @tc.desc Verify positive-negative zero mixed reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(zeroValue, maxSafeInteger, zeroValue);
      arr.reverse();
      const expectVal = zeroValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0270
     * @tc.name testFloat64ArrayReverse027
     * @tc.desc Verify positive-negative zero mixed reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointTwoFive, onePointFive, pointTwoFive);
      arr.reverse();
      const expectVal = pointTwoFive;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0280
     * @tc.name testFloat64ArrayReverse028
     * @tc.desc Verify positive Infinity array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const arr = Float64Array.of(onePointZero, twoPointZero, positiveInfinity);
      arr.reverse();
      const expectVal = positiveInfinity;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0290
     * @tc.name testFloat64ArrayReverse029
     * @tc.desc Verify positive Infinity array reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const arr = Float64Array.of(onePointZero, twoPointZero, positiveInfinity);
      arr.reverse();
      const expectVal = onePointZero;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0300
     * @tc.name testFloat64ArrayReverse030
     * @tc.desc Verify negative Infinity array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(negativeInfinity, onePointZero, twoPointZero);
      arr.reverse();
      const expectVal = twoPointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0310
     * @tc.name testFloat64ArrayReverse031
     * @tc.desc Verify negative Infinity array reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(negativeInfinity, onePointZero, twoPointZero);
      arr.reverse();
      const expectVal = negativeInfinity;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0320
     * @tc.name testFloat64ArrayReverse032
     * @tc.desc Verify positive-negative Infinity mixed reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const zeroPointZero: number = 0.0;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, zeroPointZero, negativeInfinity);
      arr.reverse();
      const expectVal = negativeInfinity;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0330
     * @tc.name testFloat64ArrayReverse033
     * @tc.desc Verify positive-negative Infinity mixed reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const zeroPointZero: number = 0.0;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, zeroPointZero, negativeInfinity);
      arr.reverse();
      const expectVal = positiveInfinity;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0340
     * @tc.name testFloat64ArrayReverse034
     * @tc.desc Verify NaN array reverse first element becomes NaN at end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(nanValue, onePointZero, twoPointZero);
      arr.reverse();
      const actVal2 = Number.isNaN(arr[2]);
      const expectVal = true;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0350
     * @tc.name testFloat64ArrayReverse035
     * @tc.desc Verify NaN array reverse last element becomes NaN at start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const nanValue: number = Double.NaN;
      const arr = Float64Array.of(onePointZero, twoPointZero, nanValue);
      arr.reverse();
      const actVal3 = Number.isNaN(arr[0]);
      const expectVal = true;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0360
     * @tc.name testFloat64ArrayReverse036
     * @tc.desc Verify NaN position changes after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const nanValue: number = Double.NaN;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(onePointZero, nanValue, threePointZero);
      arr.reverse();
      const actVal4 = Number.isNaN(arr[1]);
      const expectVal = true;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0370
     * @tc.name testFloat64ArrayReverse037
     * @tc.desc Verify all-NaN array remains all-NaN after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const arr = Float64Array.of(nanValue, nanValue, nanValue);
      arr.reverse();
      const actVal5 = Number.isNaN(arr[0]);
      const expectVal = true;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0380
     * @tc.name testFloat64ArrayReverse038
     * @tc.desc Verify MAX_VALUE array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const numberMaxValue: number = Number.MAX_VALUE;
      const arr = Float64Array.of(onePointZero, numberMaxValue);
      arr.reverse();
      const expectVal = numberMaxValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0390
     * @tc.name testFloat64ArrayReverse039
     * @tc.desc Verify MAX_VALUE array reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const numberMaxValue: number = Number.MAX_VALUE;
      const arr = Float64Array.of(onePointZero, numberMaxValue);
      arr.reverse();
      const expectVal = onePointZero;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0400
     * @tc.name testFloat64ArrayReverse040
     * @tc.desc Verify MIN_VALUE array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMinValue: number = Number.MIN_VALUE;
      const onePointZero: number = 1.0;
      const twoPointZero: number = 2.0;
      const arr = Float64Array.of(numberMinValue, onePointZero, twoPointZero);
      arr.reverse();
      const expectVal = numberMinValue;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0410
     * @tc.name testFloat64ArrayReverse041
     * @tc.desc Verify MAX_VALUE MIN_VALUE mixed reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const zeroPointZero: number = 0.0;
      const numberMinValue: number = Number.MIN_VALUE;
      const arr = Float64Array.of(numberMaxValue, zeroPointZero, numberMinValue);
      arr.reverse();
      const expectVal = numberMinValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0420
     * @tc.name testFloat64ArrayReverse042
     * @tc.desc Verify MAX_VALUE MIN_VALUE mixed reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const zeroPointZero: number = 0.0;
      const numberMinValue: number = Number.MIN_VALUE;
      const arr = Float64Array.of(numberMaxValue, zeroPointZero, numberMinValue);
      arr.reverse();
      const expectVal = numberMaxValue;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0430
     * @tc.name testFloat64ArrayReverse043
     * @tc.desc Verify scientific notation array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const sciValue10e3082: number = 1.0e+308;
      const arr = Float64Array.of(sciValue10e308, sciValue10e3082);
      arr.reverse();
      const expectVal = sciValue10e3082;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0440
     * @tc.name testFloat64ArrayReverse044
     * @tc.desc Verify scientific notation array reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e308: number = 1.0e-308;
      const sciValue10e3082: number = 1.0e+308;
      const arr = Float64Array.of(sciValue10e308, sciValue10e3082);
      arr.reverse();
      const expectVal = sciValue10e308;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0450
     * @tc.name testFloat64ArrayReverse045
     * @tc.desc Verify multiple scientific notation array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e100: number = 1.0e-100;
      const sciValue20e50: number = 2.0e-50;
      const sciValue30e50: number = 3.0e+50;
      const sciValue40e100: number = 4.0e+100;
      const arr = Float64Array.of(sciValue10e100, sciValue20e50, sciValue30e50, sciValue40e100);
      arr.reverse();
      const expectVal = sciValue40e100;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0460
     * @tc.name testFloat64ArrayReverse046
     * @tc.desc Verify multiple scientific notation array reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sciValue10e100: number = 1.0e-100;
      const sciValue20e50: number = 2.0e-50;
      const sciValue30e50: number = 3.0e+50;
      const sciValue40e100: number = 4.0e+100;
      const arr = Float64Array.of(sciValue10e100, sciValue20e50, sciValue30e50, sciValue40e100);
      arr.reverse();
      const expectVal = sciValue10e100;
      expect(arr[3]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0470
     * @tc.name testFloat64ArrayReverse047
     * @tc.desc Verify decimal array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const pointThree: number = 0.3;
      const arr = Float64Array.of(pointOne, pointTwo, pointThree);
      arr.reverse();
      const expectVal = pointThree;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0480
     * @tc.name testFloat64ArrayReverse048
     * @tc.desc Verify decimal array reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const pointThree: number = 0.3;
      const arr = Float64Array.of(pointOne, pointTwo, pointThree);
      arr.reverse();
      const expectVal = pointOne;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0490
     * @tc.name testFloat64ArrayReverse049
     * @tc.desc Verify 0.1+0.2 precision boundary reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const pointTwo: number = 0.2;
      const precisionSumValue: number =
        0.30000000000000004;
      const arr = Float64Array.of(pointOne, pointTwo,
        precisionSumValue);
      arr.reverse();
      const expectVal = precisionSumValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0500
     * @tc.name testFloat64ArrayReverse050
     * @tc.desc Verify multi-digit decimal array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstDecimalValue: number = 1.123456;
      const secondDecimalValue: number = 2.654321;
      const threePointZero: number = 3.0;
      const arr = Float64Array.of(firstDecimalValue, secondDecimalValue, threePointZero);
      arr.reverse();
      const expectVal = threePointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0510
     * @tc.name testFloat64ArrayReverse051
     * @tc.desc Verify INT_MAX array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      arr.reverse();
      const expectVal = maxSafeInteger;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0520
     * @tc.name testFloat64ArrayReverse052
     * @tc.desc Verify INT_MIN array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const arr = Float64Array.of(pointFive, onePointFive);
      arr.reverse();
      const expectVal = pointFive;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0530
     * @tc.name testFloat64ArrayReverse053
     * @tc.desc Verify MAX_SAFE_INTEGER boundary reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = Number.MAX_SAFE_INTEGER;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(maxSafeInteger, onePointZero);
      arr.reverse();
      const expectVal = onePointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0540
     * @tc.name testFloat64ArrayReverse054
     * @tc.desc Verify MIN_SAFE_INTEGER boundary reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minSafeInteger: number = Number.MIN_SAFE_INTEGER;
      const arr = Float64Array.of(minSafeInteger, -1.0);
      arr.reverse();
      const expectVal = minSafeInteger;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0550
     * @tc.name testFloat64ArrayReverse055
     * @tc.desc Verify all-same elements reverse last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(zeroValue, zeroValue, zeroValue);
      arr.reverse();
      const expectVal = zeroValue;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0560
     * @tc.name testFloat64ArrayReverse056
     * @tc.desc Verify all-zero preallocated array unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const arr = new Float64Array(5);
      arr.reverse();
      const expectVal = zeroPointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0570
     * @tc.name testFloat64ArrayReverse057
     * @tc.desc Verify all-NaN elements unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const arr = Float64Array.of(nanValue, nanValue, nanValue, nanValue);
      arr.reverse();
      const actVal6 = Number.isNaN(arr[0]);
      const expectVal = true;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0580
     * @tc.name testFloat64ArrayReverse058
     * @tc.desc Verify original array elements reversed in-place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MinValue: number = -128;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      arr.reverse();
      expect(arr[0]).assertEqual(zeroValue);
      expect(arr[1]).assertEqual(int8MinValue);
      expect(arr[2]).assertEqual(int16MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0590
     * @tc.name testFloat64ArrayReverse059
     * @tc.desc Verify original array reference unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue, -1);
      const idBefore = arr;
      arr.reverse();
      const expectVal = idBefore;
      expect(arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0600
     * @tc.name testFloat64ArrayReverse060
     * @tc.desc Verify reverse return value strictly equals arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const result = arr.reverse();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0610
     * @tc.name testFloat64ArrayReverse061
     * @tc.desc Verify reverse return value same reference as arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const arr = Float64Array.of(pointFive);
      const actVal7 = arr.reverse();
      const expectVal = arr;
      expect(actVal7).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0620
     * @tc.name testFloat64ArrayReverse062
     * @tc.desc Verify empty array reverse returns self
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array();
      const actVal8 = arr.reverse();
      const expectVal = arr;
      expect(actVal8).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0630
     * @tc.name testFloat64ArrayReverse063
     * @tc.desc Verify reverse return value supports chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.reverse().reverse();
      const expectVal = int16MinValue;
      expect(result[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0640
     * @tc.name testFloat64ArrayReverse064
     * @tc.desc Verify reverse multiple chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue);
      arr.reverse().reverse().reverse();
      const expectVal = oneValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0650
     * @tc.name testFloat64ArrayReverse065
     * @tc.desc Verify reverse return value used for assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const arr = Float64Array.of(pointOne, maxSafeInteger);
      const assigned = arr.reverse();
      const expectVal = arr;
      expect(assigned).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0660
     * @tc.name testFloat64ArrayReverse066
     * @tc.desc Verify child view reverse affects parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      parent[0] = 1.0;
      parent[1] = 2.0;
      parent[2] = 3.0;
      const child = new Float64Array(buf, 8, 2);
      child.reverse();
      const expectVal = threePointZero;
      expect(parent[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0670
     * @tc.name testFloat64ArrayReverse067
     * @tc.desc Verify child view reverse affects parent array read
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      parent[0] = 1.0;
      parent[1] = 2.0;
      parent[2] = 3.0;
      const child = new Float64Array(buf, 8, 2);
      child.reverse();
      const expectVal = twoPointZero;
      expect(parent[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0680
     * @tc.name testFloat64ArrayReverse068
     * @tc.desc Verify parent array reverse affects child view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoPointZero: number = 2.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      parent[0] = 1.0;
      parent[1] = 2.0;
      parent[2] = 3.0;
      const child = new Float64Array(buf, 8, 2);
      parent.reverse();
      const expectVal = twoPointZero;
      expect(child[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0690
     * @tc.name testFloat64ArrayReverse069
     * @tc.desc Verify parent array reverse affects child view last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const buf = new ArrayBuffer(24);
      const parent = new Float64Array(buf, 0, 3);
      parent[0] = 1.0;
      parent[1] = 2.0;
      parent[2] = 3.0;
      const child = new Float64Array(buf, 8, 2);
      parent.reverse();
      const expectVal = onePointZero;
      expect(child[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0700
     * @tc.name testFloat64ArrayReverse070
     * @tc.desc Verify isView unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue, -1);
      arr.reverse();
      const actVal9 = ArrayBuffer.isView(arr);
      const expectVal = true;
      expect(actVal9).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0710
     * @tc.name testFloat64ArrayReverse071
     * @tc.desc Verify reverse after constructing from FixedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const fa: FixedArray<number> = [1.0, 2.0, 3.0];
      const arr = new Float64Array(fa);
      arr.reverse();
      const expectVal = threePointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0720
     * @tc.name testFloat64ArrayReverse072
     * @tc.desc Verify reverse after constructing from Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const a: Array<number> = [1.0, 2.0, 3.0, 4.0];
      const arr = new Float64Array(a);
      arr.reverse();
      const expectVal = onePointZero;
      expect(arr[3]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0730
     * @tc.name testFloat64ArrayReverse073
     * @tc.desc Verify reverse after constructing from Iterable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const iter: Iterable<Number> = [1.0, 2.0, 3.0];
      const arr = new Float64Array(iter);
      arr.reverse();
      const expectVal = threePointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0740
     * @tc.name testFloat64ArrayReverse074
     * @tc.desc Verify reverse after constructing from Float64Array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const src = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      const arr = new Float64Array(src);
      arr.reverse();
      expect(arr[0]).assertEqual(zeroValue);
      expect(src[0]).assertEqual(pointOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0750
     * @tc.name testFloat64ArrayReverse075
     * @tc.desc Verify reverse after constructing from ArrayBuffer with offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threePointZero: number = 3.0;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 0, 3);
      arr[0] = 1.0;
      arr[1] = 2.0;
      arr[2] = 3.0;
      arr.reverse();
      const expectVal = threePointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0760
     * @tc.name testFloat64ArrayReverse076
     * @tc.desc Verify reverse after constructing from ArrayBuffer with length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const buf = new ArrayBuffer(24);
      const arr = new Float64Array(buf, 0, 3);
      arr[0] = 1.0;
      arr[1] = 2.0;
      arr[2] = 3.0;
      arr.reverse();
      const expectVal = onePointZero;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0770
     * @tc.name testFloat64ArrayReverse077
     * @tc.desc Verify length=1 array reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fillValue42: number = 42.0;
      const arr = new Float64Array(1);
      arr[0] = 42.0;
      arr.reverse();
      const expectVal = fillValue42;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0780
     * @tc.name testFloat64ArrayReverse078
     * @tc.desc Verify NaN Infinity 0 mixed reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const zeroPointZero: number = 0.0;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(nanValue, positiveInfinity, zeroPointZero, negativeInfinity);
      arr.reverse();
      const expectVal = negativeInfinity;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0790
     * @tc.name testFloat64ArrayReverse079
     * @tc.desc Verify NaN Infinity 0 mixed reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const zeroPointZero: number = 0.0;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(nanValue, positiveInfinity, zeroPointZero, negativeInfinity);
      arr.reverse();
      const actVal10 = Number.isNaN(arr[3]);
      const expectVal = true;
      expect(actVal10).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0800
     * @tc.name testFloat64ArrayReverse080
     * @tc.desc Verify MAX_VALUE MIN_VALUE NaN mixed reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const numberMinValue: number = Number.MIN_VALUE;
      const nanValue: number = NaN;
      const arr = Float64Array.of(numberMaxValue, numberMinValue, nanValue);
      arr.reverse();
      const actVal11 = Number.isNaN(arr[0]);
      const expectVal = true;
      expect(actVal11).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0810
     * @tc.name testFloat64ArrayReverse081
     * @tc.desc Verify MAX_VALUE MIN_VALUE NaN mixed reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberMaxValue: number = Number.MAX_VALUE;
      const numberMinValue: number = Number.MIN_VALUE;
      const nanValue: number = NaN;
      const arr = Float64Array.of(numberMaxValue, numberMinValue, nanValue);
      arr.reverse();
      const expectVal = numberMaxValue;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0820
     * @tc.name testFloat64ArrayReverse082
     * @tc.desc Verify all boundary values mixed reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const nanValue: number = Double.NaN;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(zeroPointZero, -0.0, positiveInfinity, negativeInfinity, nanValue, onePointZero);
      arr.reverse();
      const expectVal = onePointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0830
     * @tc.name testFloat64ArrayReverse083
     * @tc.desc Verify all boundary values mixed reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroPointZero: number = 0.0;
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const nanValue: number = Double.NaN;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(zeroPointZero, -0.0, positiveInfinity, negativeInfinity, nanValue, onePointZero);
      arr.reverse();
      const expectVal = zeroPointZero;
      expect(arr[5]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0840
     * @tc.name testFloat64ArrayReverse084
     * @tc.desc Verify min positive number reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(doubleMinValue, onePointZero);
      arr.reverse();
      const expectVal = onePointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0850
     * @tc.name testFloat64ArrayReverse085
     * @tc.desc Verify min positive number reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const onePointZero: number = 1.0;
      const arr = Float64Array.of(doubleMinValue, onePointZero);
      arr.reverse();
      const expectVal = doubleMinValue;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0860
     * @tc.name testFloat64ArrayReverse086
     * @tc.desc Verify max number reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(onePointZero, doubleMaxValue);
      arr.reverse();
      const expectVal = doubleMaxValue;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0870
     * @tc.name testFloat64ArrayReverse087
     * @tc.desc Verify overflow boundary value reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(onePointZero, doubleMaxValue);
      arr.reverse();
      const expectVal = onePointZero;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0880
     * @tc.name testFloat64ArrayReverse088
     * @tc.desc Verify negative large number reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const zeroPointZero: number = 0.0;
      const num999999Pointninenine: number = 999999.99;
      const arr = Float64Array.of(negnum999999Pointninenine, zeroPointZero, num999999Pointninenine);
      arr.reverse();
      const expectVal = num999999Pointninenine;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0890
     * @tc.name testFloat64ArrayReverse089
     * @tc.desc Verify negative large number reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const negnum999999Pointninenine: number = -999999.99;
      const zeroPointZero: number = 0.0;
      const num999999Pointninenine: number = 999999.99;
      const arr = Float64Array.of(negnum999999Pointninenine, zeroPointZero, num999999Pointninenine);
      arr.reverse();
      const expectVal = negnum999999Pointninenine;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0900
     * @tc.name testFloat64ArrayReverse090
     * @tc.desc Verify hex literal array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const hexValue20: number = 0x20;
      const hexValue30: number = 0x30;
      const fortyeightPointzero: number = 48.0;
      const arr = Float64Array.of(hexValue10, hexValue20, hexValue30);
      arr.reverse();
      const expectVal = fortyeightPointzero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0910
     * @tc.name testFloat64ArrayReverse091
     * @tc.desc Verify hex literal array reverse last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValue10: number = 0x10;
      const hexValue20: number = 0x20;
      const hexValue30: number = 0x30;
      const sixteenPointzero: number = 16.0;
      const arr = Float64Array.of(hexValue10, hexValue20, hexValue30);
      arr.reverse();
      const expectVal = sixteenPointzero;
      expect(arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0920
     * @tc.name testFloat64ArrayReverse092
     * @tc.desc Verify octal literal array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twentyfourPointzero: number = 24.0;
      const arr = Float64Array.of(0o10, 0o20, 0o30);
      arr.reverse();
      const expectVal = twentyfourPointzero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0930
     * @tc.name testFloat64ArrayReverse093
     * @tc.desc Verify binary literal array reverse first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue10: number = 0b10;
      const binaryValue100: number = 0b100;
      const binaryValue1000: number = 0b1000;
      const eightPointZero: number = 8.0;
      const arr = Float64Array.of(binaryValue10, binaryValue100, binaryValue1000);
      arr.reverse();
      const expectVal = eightPointZero;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0940
     * @tc.name testFloat64ArrayReverse094
     * @tc.desc Verify reverse return value buffer property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const twoValue: number = 2;
      const arr = Float64Array.of(int16MinValue, -128);
      const result = arr.reverse();
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0950
     * @tc.name testFloat64ArrayReverse095
     * @tc.desc Verify last original element moves to first after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr.reverse();
      expect(arr[0]).assertEqual(zeroValue);
      expect(arr[2]).assertEqual(pointOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0960
     * @tc.name testFloat64ArrayReverse096
     * @tc.desc Verify sum-equivalent values after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negnum32896Value: number = -32896;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      arr.reverse();
      const expectVal = negnum32896Value;
      expect(arr[0] + arr[1] + arr[2]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0970
     * @tc.name testFloat64ArrayReverse097
     * @tc.desc Verify non-positive values after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      arr.reverse();
      expect(arr[0]).assertEqual(zeroValue);
      expect(arr[1]).assertEqual(-1);
      expect(arr[2]).assertEqual(int32MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0980
     * @tc.name testFloat64ArrayReverse098
     * @tc.desc Verify fractional order after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.reverse();
      expect(arr[0]).assertEqual(pointTwoFive);
      expect(arr[1]).assertEqual(onePointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_0990
     * @tc.name testFloat64ArrayReverse099
     * @tc.desc Verify integer order after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      arr.reverse();
      expect(arr[0]).assertEqual(zeroValue);
      expect(arr[2]).assertEqual(int16MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1000
     * @tc.name testFloat64ArrayReverse100
     * @tc.desc Verify negative integer order after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue);
      arr.reverse();
      expect(arr[0]).assertEqual(zeroValue);
      expect(arr[2]).assertEqual(int32MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1010
     * @tc.name testFloat64ArrayReverse101
     * @tc.desc Verify large value position after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      arr.reverse();
      const expectVal = maxSafeInteger;
      expect(arr[1]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1020
     * @tc.name testFloat64ArrayReverse102
     * @tc.desc Verify fractional output after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.reverse();
      expect(arr[0]).assertEqual(pointTwoFive);
      expect(arr[1]).assertEqual(onePointFive);
      expect(arr[2]).assertEqual(pointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1030
     * @tc.name testFloat64ArrayReverse103
     * @tc.desc Verify two integer elements after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const arr = Float64Array.of(int16MinValue, -128);
      arr.reverse();
      expect(arr[0]).assertEqual(-128);
      expect(arr[1]).assertEqual(int16MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1040
     * @tc.name testFloat64ArrayReverse104
     * @tc.desc Verify min integer pair after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int32MinValue, -1);
      arr.reverse();
      expect(arr[0]).assertEqual(-1);
      expect(arr[1]).assertEqual(int32MinValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1050
     * @tc.name testFloat64ArrayReverse105
     * @tc.desc Verify reverse modifies original array in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const result = arr.reverse();
      const expectVal = arr;
      expect(result).assertEqual(expectVal);
      expect(arr[0]).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1060
     * @tc.name testFloat64ArrayReverse106
     * @tc.desc Verify reverse preserves fractional sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const twoPointtwofive: number = 2.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.reverse();
      const total = arr[0] + arr[1] + arr[2];
      const expectVal = twoPointtwofive;
      expect(total).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1070
     * @tc.name testFloat64ArrayReverse107
     * @tc.desc Verify reverse preserves integer sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const negnum32896Value: number = -32896;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      arr.reverse();
      const total = arr[0] + arr[1] + arr[2];
      const expectVal = negnum32896Value;
      expect(total).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1080
     * @tc.name testFloat64ArrayReverse108
     * @tc.desc Verify reverse order before copied-equivalent operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1, zeroValue, oneValue);
      arr.reverse();
      expect(arr[0]).assertEqual(oneValue);
      expect(arr[2]).assertEqual(negativeOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1090
     * @tc.name testFloat64ArrayReverse109
     * @tc.desc Verify reverse order with fractional values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const pointTwoFive: number = 0.25;
      const arr = Float64Array.of(pointFive, onePointFive, pointTwoFive);
      arr.reverse();
      expect(arr[0]).assertEqual(pointTwoFive);
      expect(arr[2]).assertEqual(pointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1100
     * @tc.name testFloat64ArrayReverse110
     * @tc.desc Verify first index value after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const zeroValue: number = 0;
      const arr = Float64Array.of(pointFive, onePointFive);
      arr.reverse();
      const expectVal = onePointFive;
      expect(arr[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1110
     * @tc.name testFloat64ArrayReverse111
     * @tc.desc Verify default iterator traversal after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const arr = Float64Array.of(int32MinValue, -1);
      arr.reverse();
      let firstVal = 0.0;
      for (const v of arr) {
        firstVal = v;
        break;
      }
      const expectVal = negativeOne;
      expect(firstVal).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1120
     * @tc.name testFloat64ArrayReverse112
     * @tc.desc Verify reverse three element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const zeroValue: number = 0;
      const values = Float64Array.of(pointOne, maxSafeInteger, zeroValue);
      values.reverse();
      expect(values[0]).assertEqual(zeroValue);
      expect(values[1]).assertEqual(maxSafeInteger);
      expect(values[2]).assertEqual(pointOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1130
     * @tc.name testFloat64ArrayReverse113
     * @tc.desc Verify reverse two element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const values = Float64Array.of(pointFive, onePointFive);
      values.reverse();
      expect(values[0]).assertEqual(onePointFive);
      expect(values[1]).assertEqual(pointFive);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1140
     * @tc.name testFloat64ArrayReverse114
     * @tc.desc Verify reverse single element array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const values = Float64Array.of(int16MinValue);
      values.reverse();
      const expectVal = int16MinValue;
      expect(values[0]).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1150
     * @tc.name testFloat64ArrayReverse115
     * @tc.desc Verify reverse array containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const negativeOne: number = -1;
      const values = Float64Array.of(int32MinValue, -1);
      values.reverse();
      expect(values[0]).assertEqual(negativeOne);
      const actVal12 = Number.isNaN(values[1]);
      const expectVal = false;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1160
     * @tc.name testFloat64ArrayReverse116
     * @tc.desc Verify reverse array containing Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const maxSafeInteger: number = 9007199254740991;
      const values = Float64Array.of(pointOne, maxSafeInteger);
      values.reverse();
      expect(values[0]).assertEqual(maxSafeInteger);
      expect(values[1]).assertEqual(pointOne);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1170
     * @tc.name testFloat64ArrayReverse117
     * @tc.desc Verify reverse returns current array (chainable this)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const onePointFive: number = 1.5;
      const values = Float64Array.of(pointFive, onePointFive);
      const result = values.reverse();
      const expectVal = values;
      expect(result).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1180
     * @tc.name testFloat64ArrayReverse118
     * @tc.desc Verify reverse result reversed flag (D7 two-way)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int32MinValue: number = -2147483648;
      const arr = Float64Array.of(int16MinValue, -128, zeroValue);
      const reversed = Float64Array.of(int32MinValue, -1, zeroValue);
      arr.reverse();
      expect(arr[0] === reversed[0] && arr[1] === reversed[1] && arr[2] === reversed[2]).assertEqual(false);
      expect(arr[0] === 1.0).assertEqual(false);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1190
     * @tc.name testFloat64ArrayReverse119
     * @tc.desc Verify reverse with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValueAA: number = 0xAA;
      const num170Pointzero: number = 170.0;
      const num255Value: number = 255;
      const arr = Float64Array.of(hexValueFF, hexValueAA);
      arr.reverse();
      expect(arr[0]).assertEqual(num170Pointzero);
      expect(arr[1]).assertEqual(num255Value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1200
     * @tc.name testFloat64ArrayReverse120
     * @tc.desc Verify reverse with binary literal (D8 binary)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue10101010: number = 0b10101010;
      const num170Pointzero: number = 170.0;
      const num255Value: number = 255;
      const arr = Float64Array.of(binaryValue11111111, binaryValue10101010);
      arr.reverse();
      expect(arr[0]).assertEqual(num170Pointzero);
      expect(arr[1]).assertEqual(num255Value);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1210
     * @tc.name testFloat64ArrayReverse121
     * @tc.desc Verify reverse with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      arr.reverse();
      const actVal13 = Number.isNaN(arr[1]);
      const expectVal = true;
      expect(actVal13).assertEqual(expectVal);
      expect(arr[0]).assertEqual(doubleMaxValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1220
     * @tc.name testFloat64ArrayReverse122
     * @tc.desc Verify reverse with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      arr.reverse();
      expect(arr[0]).assertEqual(negativeInfinity);
      expect(arr[1]).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_REVERSE_1230
     * @tc.name testFloat64ArrayReverse123
     * @tc.desc Verify reverse with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayReverse123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      arr.reverse();
      expect(arr[0]).assertEqual(doubleMaxValue);
      expect(arr[1]).assertEqual(doubleMinValue);
    })

  })
}
