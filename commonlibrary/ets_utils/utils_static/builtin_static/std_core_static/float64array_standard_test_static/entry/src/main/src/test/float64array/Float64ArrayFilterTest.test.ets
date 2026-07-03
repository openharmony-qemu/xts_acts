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

function isFloat64Array(val: Object): boolean {
  return val instanceof Float64Array;
}

export default function Float64ArrayFilterTest(): void {
  describe('Float64ArrayFilterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0010
     * @tc.name testFloat64ArrayFilter001
     * @tc.desc Verify filter with 1 parameter callback returns elements matching condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.filter((val: number) => val > 1.0);
      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0020
     * @tc.name testFloat64ArrayFilter002
     * @tc.desc Verify filter with 2 parameters extra argument is ignored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const result = arr.filter((val: number, idx: int, array: Float64Array) => val > 1.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0030
     * @tc.name testFloat64ArrayFilter003
     * @tc.desc Verify filter with callback always returning true keeps all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.filter((val: number) => true);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0040
     * @tc.name testFloat64ArrayFilter004
     * @tc.desc Verify filter with callback always returning false removes all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const result = arr.filter((val: number) => false);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0050
     * @tc.name testFloat64ArrayFilter005
     * @tc.desc Verify filter with callback returning constant true expression keeps all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.filter((val: number) => val > 0.0);
      const expectVal = fiveValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0060
     * @tc.name testFloat64ArrayFilter006
     * @tc.desc Verify filter with callback returning constant false expression removes all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const result = arr.filter((val: number) => val > 999.0);
      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0070
     * @tc.name testFloat64ArrayFilter007
     * @tc.desc Verify filter with callback returning arithmetic expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const result = arr.filter((val: number) => val * 2 > 3.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0080
     * @tc.name testFloat64ArrayFilter008
     * @tc.desc Verify filter with callback returning logical AND expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      const result = arr.filter((val: number) => val > 0.0 && val < 4.0);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0090
     * @tc.name testFloat64ArrayFilter009
     * @tc.desc Verify filter with callback returning logical OR expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      const result = arr.filter((val: number) => val < 2.0 || val > 3.0);
      const expectVal = fourValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0100
     * @tc.name testFloat64ArrayFilter010
     * @tc.desc Verify filter with callback returning negation expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.filter((val: number) => !(val === 2.0));
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0110
     * @tc.name testFloat64ArrayFilter011
     * @tc.desc Verify filter callback using val with greater-than threshold comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, -1, 0, oneValue, 2147483647]);
      const result = arr.filter((val: number) => val > 2.0);
      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0120
     * @tc.name testFloat64ArrayFilter012
     * @tc.desc Verify filter callback using val with less-than threshold comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fourValue: number = 4;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.filter((val: number) => val < 4.0);
      const expectVal = fourValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0130
     * @tc.name testFloat64ArrayFilter013
     * @tc.desc Verify filter callback using val to match equality with specific value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.5, pointOneTwoFive, 0.25, pointOneTwoFive, 0.0625);
      const result = arr.filter((val: number) => val === 2.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0140
     * @tc.name testFloat64ArrayFilter014
     * @tc.desc Verify filter callback using val with inequality check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const fiveValue: number = 5;
      const arr = new Float64Array([-32768, int8MaxValue, 0, int8MaxValue, 32767]);
      const result = arr.filter((val: number) => val !== 2.0);
      const expectVal = fiveValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0150
     * @tc.name testFloat64ArrayFilter015
     * @tc.desc Verify filter callback using val with greater-than-or-equal comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue, 1]);
      const result = arr.filter((val: number) => val >= 3.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0160
     * @tc.name testFloat64ArrayFilter016
     * @tc.desc Verify filter callback using val with less-than-or-equal comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      const result = arr.filter((val: number) => val <= 2.0);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0170
     * @tc.name testFloat64ArrayFilter017
     * @tc.desc Verify filter callback using val to check odd numbers via modulo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.filter((val: number) => val % 2.0 === 1.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0180
     * @tc.name testFloat64ArrayFilter018
     * @tc.desc Verify filter callback using val to check value within a range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-32768, -128, zeroValue, 127, 32767);
      const result = arr.filter((val: number) => val >= 5.0 && val <= 15.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0190
     * @tc.name testFloat64ArrayFilter019
     * @tc.desc Verify filter callback using index to keep even-indexed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([-2147483648, -1, 0, 1, 2147483647]);
      const result = arr.filter((val: number, index: int) => index % 2 === 0);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0200
     * @tc.name testFloat64ArrayFilter020
     * @tc.desc Verify filter callback using index to keep odd-indexed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.filter((val: number, index: int) => index % 2 === 1);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0210
     * @tc.name testFloat64ArrayFilter021
     * @tc.desc Verify filter callback using index to match specific index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.5, 1.5, pointTwoFive, 0.125);
      const result = arr.filter((val: number, index: int) => index === 2);
      expect(result.length).assertEqual(oneValue);
      const actVal1 = result.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal1).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0220
     * @tc.name testFloat64ArrayFilter022
     * @tc.desc Verify filter callback using index less than specific value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const result = arr.filter((val: number, index: int) => index < 3);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0230
     * @tc.name testFloat64ArrayFilter023
     * @tc.desc Verify filter callback using index to select first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const oneValue: number = 1;
      const arr = new Float64Array([int32MinValue, -1, 0]);
      const result = arr.filter((val: number, index: int) => index === 0);
      expect(result.length).assertEqual(oneValue);
      const actVal2 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal2).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0240
     * @tc.name testFloat64ArrayFilter024
     * @tc.desc Verify filter callback using index to select last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const oneValue: number = 1;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const result = arr.filter((val: number, index: int) => index === arr.length - 1);
      expect(result.length).assertEqual(oneValue);
      const actVal3 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal3).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0250
     * @tc.name testFloat64ArrayFilter025
     * @tc.desc Verify filter callback using index to select middle elements excluding first and last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.filter((val: number, index: int) => index > 0 && index < arr.length - 1);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0260
     * @tc.name testFloat64ArrayFilter026
     * @tc.desc Verify filter callback using array parameter to compare element with first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MinValue: number = -2147483648;
      const oneValue: number = 1;
      const arr = Float64Array.of(int32MinValue, -1, 0, oneValue, 2147483647);
      const result = arr.filter((val: number, index: int, array: Float64Array) => val === array.$_get(0));
      expect(result.length).assertEqual(oneValue);
      const actVal4 = result.$_get(0);
      const expectVal = int32MinValue;
      expect(actVal4).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0270
     * @tc.name testFloat64ArrayFilter027
     * @tc.desc Verify filter callback using array parameter to compare with first or last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.filter((val: number, index: int, array: Float64Array) => val === array.$_get(0) ||
        val === array.$_get(array.length - 1));
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0280
     * @tc.name testFloat64ArrayFilter028
     * @tc.desc Verify filter callback using array parameter to find the median element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointTwoFive: number = 0.25;
      const oneValue: number = 1;
      const arr = new Float64Array([0.5, 1.5, pointTwoFive, 0.125, 0.0625]);
      const midIdx: int = 2;
      const mid = arr.$_get(midIdx);
      const result = arr.filter((val: number, index: int, array: Float64Array) => val === mid);
      expect(result.length).assertEqual(oneValue);
      const actVal5 = result.$_get(0);
      const expectVal = pointTwoFive;
      expect(actVal5).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0290
     * @tc.name testFloat64ArrayFilter029
     * @tc.desc Verify filter callback using array parameter to check if value greater than average
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const threeValue: number = 3;
      const arr = Float64Array.of(-32768, -128, zeroValue, 127, 32767);
      const sum = arr.$_get(0) + arr.$_get(1) + arr.$_get(2) + arr.$_get(3) + arr.$_get(4);
      const avg = sum / 5.0;
      const result = arr.filter((val: number, index: int, array: Float64Array) => val > avg);
      expect(result.length).assertEqual(threeValue);
      const actVal6 = result.$_get(0);
      const expectVal = zeroValue;
      expect(actVal6).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0300
     * @tc.name testFloat64ArrayFilter030
     * @tc.desc Verify filter callback referencing an external variable as threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-2147483648, -1, 0, oneValue, 2147483647]);
      let threshold = 3.0;
      const result = arr.filter((val: number) => val > threshold);
      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0310
     * @tc.name testFloat64ArrayFilter031
     * @tc.desc Verify filter callback modifying an external counter variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const threeValue: number = 3;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      let count = 0;
      const result = arr.filter((val: number) => {
        count++;
        return val > 1.0;
      })

      expect(result.length).assertEqual(oneValue);
      const expectVal = threeValue;
      expect(count).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0320
     * @tc.name testFloat64ArrayFilter032
     * @tc.desc Verify filter callback accumulating sum in external variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const twoPointthreesevenfive: number = 2.375;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125]);
      let sum = 0.0;
      const result = arr.filter((val: number) => {
        sum += val;
        return val > 2.0;
      })

      expect(result.length).assertEqual(zeroValue);
      const expectVal = twoPointthreesevenfive;
      expect(sum).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0330
     * @tc.name testFloat64ArrayFilter033
     * @tc.desc Verify filter callback using external array to exclude specific values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fiveValue: number = 5;
      const arr = new Float64Array([-32768, -128, 0, 127, 32767]);
      const excluded: number[] = [2.0, 4.0];
      const result = arr.filter((val: number) => {
        for (let i = 0; i < excluded.length; i++) {
          if (val === excluded[i]) {
            return false;
          }
        }
        return true;
      })

      const expectVal = fiveValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0340
     * @tc.name testFloat64ArrayFilter034
     * @tc.desc Verify filter on empty array with callback always true returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      const result = arr.filter((val: number) => true);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0350
     * @tc.name testFloat64ArrayFilter035
     * @tc.desc Verify filter on empty array with callback always false returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      const result = arr.filter((val: number) => false);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0360
     * @tc.name testFloat64ArrayFilter036
     * @tc.desc Verify filter on empty array does not invoke the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array(0);
      let called = false;
      const result = arr.filter((val: number) => {
        called = true;
        return true;
      })

      expect(result.length).assertEqual(zeroValue);
      const expectVal = false;
      expect(called).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0370
     * @tc.name testFloat64ArrayFilter037
     * @tc.desc Verify filter on single-element array keeps the element when condition matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-2147483648);
      const result = arr.filter((val: number) => val > 0.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0380
     * @tc.name testFloat64ArrayFilter038
     * @tc.desc Verify filter on single-element array removes the element when condition fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1);
      const result = arr.filter((val: number) => val < 0.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0390
     * @tc.name testFloat64ArrayFilter039
     * @tc.desc Verify filter on single-element array with value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5]);
      const result = arr.filter((val: number) => val === 0.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0400
     * @tc.name testFloat64ArrayFilter040
     * @tc.desc Verify filter on single-element array with negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const oneValue: number = 1;
      const arr = Float64Array.of(int16MinValue);
      const result = arr.filter((val: number) => val < 0.0);
      expect(result.length).assertEqual(oneValue);
      const actVal7 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal7).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0410
     * @tc.name testFloat64ArrayFilter041
     * @tc.desc Verify filter with array containing Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const result = arr.filter((val: number) => val > 100.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0420
     * @tc.name testFloat64ArrayFilter042
     * @tc.desc Verify filter with array containing Number.MIN_VALUE tiny positive number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.filter((val: number) => val > 0.0);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0430
     * @tc.name testFloat64ArrayFilter043
     * @tc.desc Verify filter with array containing Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.filter((val: number) => val === Infinity);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0440
     * @tc.name testFloat64ArrayFilter044
     * @tc.desc Verify filter with array containing negative Infinity value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.filter((val: number) => val < 0.0);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0450
     * @tc.name testFloat64ArrayFilter045
     * @tc.desc Verify filter with array containing NaN where NaN equality check returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const result = arr.filter((val: number) => Number.isNaN(val));
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0460
     * @tc.name testFloat64ArrayFilter046
     * @tc.desc Verify filter with array containing NaN using Number.isNaN to detect it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const result = arr.filter((val: number) => {
        try {
          return Number.isNaN(val);
        } catch (e) {
          return false;
        }
      })

      expect(result.length).assertEqual(zeroValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0470
     * @tc.name testFloat64ArrayFilter047
     * @tc.desc Verify filter with array containing both negative zero and positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.filter((val: number) => val === 0.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0480
     * @tc.name testFloat64ArrayFilter048
     * @tc.desc Verify filter matching negative zero specifically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0]);
      const result = arr.filter((val: number) => val === -0.0);
      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0490
     * @tc.name testFloat64ArrayFilter049
     * @tc.desc Verify filter with array containing negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const arr = new Float64Array([-2147483648, -1, 0, 1]);
      const result = arr.filter((val: number) => val < 0.0);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0500
     * @tc.name testFloat64ArrayFilter050
     * @tc.desc Verify filter with array containing scientific notation literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, 9007199254740991, zeroValue);
      const result = arr.filter((val: number) => val > 1.0e+100);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0510
     * @tc.name testFloat64ArrayFilter051
     * @tc.desc Verify filter with mixed integer and floating-point values matching a specific value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.filter((val: number) => val === 3.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0520
     * @tc.name testFloat64ArrayFilter052
     * @tc.desc Verify filter with floating-point precision 0.1+0.2 does not equal 0.3 exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-32768, -128, zeroValue]);
      const result = arr.filter((val: number) => val === 0.3);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0530
     * @tc.name testFloat64ArrayFilter053
     * @tc.desc Verify filter with approximate floating-point comparison using Math.abs tolerance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([-2147483648, -1, zeroValue]);
      const result = arr.filter((val: number) => {
        const expected = 0.1 + 0.2;
        return Math.abs(val - expected) < 1e-15;
      })

      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0540
     * @tc.name testFloat64ArrayFilter054
     * @tc.desc Verify filter callback throws RangeError which propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      try {
        arr.filter((val: number) => {
          throw new RangeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0550
     * @tc.name testFloat64ArrayFilter055
     * @tc.desc Verify filter callback throws TypeError which propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.filter((val: number) => {
          throw new TypeError("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("TypeError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0560
     * @tc.name testFloat64ArrayFilter056
     * @tc.desc Verify filter callback throws Error which propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-32768, -128, 0]);
      try {
        arr.filter((val: number) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0570
     * @tc.name testFloat64ArrayFilter057
     * @tc.desc Verify filter callback throws error at first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      try {
        arr.filter((val: number, index: int) => {
          if (index === 0) {
            throw new Error("first");
          }
          return true;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0580
     * @tc.name testFloat64ArrayFilter058
     * @tc.desc Verify filter callback throws error at middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793);
      try {
        arr.filter((val: number, index: int) => {
          if (index === 2) {
            throw new Error("middle");
          }
          return true;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0590
     * @tc.name testFloat64ArrayFilter059
     * @tc.desc Verify filter callback throws error at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.filter((val: number, index: int) => {
          if (index === arr.length - 1) {
            throw new Error("last");
          }
          return true;
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0600
     * @tc.name testFloat64ArrayFilter060
     * @tc.desc Verify filter callback throws empty string which propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-32768, -128);
      try {
        arr.filter((val: number) => {
          throw new SyntaxError("empty");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("SyntaxError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0610
     * @tc.name testFloat64ArrayFilter061
     * @tc.desc Verify filter callback throws URIError which propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([-2147483648, -1]);
      try {
        arr.filter((val: number) => {
          throw new URIError("number");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("URIError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0620
     * @tc.name testFloat64ArrayFilter062
     * @tc.desc Verify filter callback throws EvalError which propagates to caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991]);
      try {
        arr.filter((val: number) => {
          throw new EvalError("object");
        })
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("EvalError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0630
     * @tc.name testFloat64ArrayFilter063
     * @tc.desc Verify filter callback throws ReferenceError during condition evaluation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      try {
        arr.filter((val: number) => {
          if (val >= 1.0) {
            throw new ReferenceError("computation");
          }
          return true;
        })
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("ReferenceError");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0640
     * @tc.name testFloat64ArrayFilter064
     * @tc.desc Verify filter result element values with greater-than condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.filter((val: number) => val > 3.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0650
     * @tc.name testFloat64ArrayFilter065
     * @tc.desc Verify filter result element values with less-than condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const threeValue: number = 3;
      const int8MinValue: number = -128;
      const arr = new Float64Array([int16MinValue, -128, 0, 127, 32767]);
      const result = arr.filter((val: number) => val < 3.0);
      expect(result.length).assertEqual(threeValue);
      const actVal8 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal8).assertEqual(expectVal);
      const actVal9 = result.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal9).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0660
     * @tc.name testFloat64ArrayFilter066
     * @tc.desc Verify filter preserves original element order in result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const int32MaxValue: number = 2147483647;
      const twoValue: number = 2;
      const arr = Float64Array.of(-2147483648, -1, 0, oneValue, int32MaxValue);
      const result = arr.filter((val: number) => val % 2.0 === 1.0);
      expect(result.length).assertEqual(twoValue);
      const actVal10 = result.$_get(0);
      const expectVal = oneValue;
      expect(actVal10).assertEqual(expectVal);
      const actVal11 = result.$_get(1);
      const expectVal2 = int32MaxValue;
      expect(actVal11).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0670
     * @tc.name testFloat64ArrayFilter067
     * @tc.desc Verify filter result with equality match on repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const piValue: number = 3.141592653589793;
      const zeroValue: number = 0;
      const arr = Float64Array.of(0.1, piValue, zeroValue, piValue, -1e-100);
      const result = arr.filter((val: number) => val === 2.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0680
     * @tc.name testFloat64ArrayFilter068
     * @tc.desc Verify filter result containing negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = new Float64Array([0.5, 1.5, 0.25, 0.125, 0.0625]);
      const result = arr.filter((val: number) => val < 0.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0690
     * @tc.name testFloat64ArrayFilter069
     * @tc.desc Verify filter result containing decimal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const oneValue: number = 1;
      const arr = new Float64Array([-32768, -128, 0, int8MaxValue]);
      const result = arr.filter((val: number) => val > 1.0);
      expect(result.length).assertEqual(oneValue);
      const actVal12 = result.$_get(0);
      const expectVal = int8MaxValue;
      expect(actVal12).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0700
     * @tc.name testFloat64ArrayFilter070
     * @tc.desc Verify filter result is not reference-equal to the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.filter((val: number) => val > 0.0);
      const expectVal = false;
      expect(result === arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0710
     * @tc.name testFloat64ArrayFilter071
     * @tc.desc Verify filter result is an independent object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([0.1, 9007199254740991, 0]);
      const result = arr.filter((val: number) => true);
      const expectVal = false;
      expect(result === arr).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0720
     * @tc.name testFloat64ArrayFilter072
     * @tc.desc Verify modifying filter result does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointFive: number = 0.5;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(pointFive, 1.5, 0.25);
      const result = arr.filter((val: number) => true);
      result.$_set(0, num999Pointzero);
      const actVal13 = arr.$_get(0);
      const expectVal = pointFive;
      expect(actVal13).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0730
     * @tc.name testFloat64ArrayFilter073
     * @tc.desc Verify modifying original array does not affect the filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const num999Pointzero: number = 999.0;
      const arr = Float64Array.of(int16MinValue, -128, 0);
      const result = arr.filter((val: number) => true);
      arr.$_set(0, num999Pointzero);
      const actVal14 = result.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal14).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0740
     * @tc.name testFloat64ArrayFilter074
     * @tc.desc Verify filter result has an independent buffer from original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float64Array.of(-2147483648, -1, 0);
      const result = arr.filter((val: number) => true);
      const expectVal = false;
      expect(result.buffer === arr.buffer).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0750
     * @tc.name testFloat64ArrayFilter075
     * @tc.desc Verify original array elements are unchanged after filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int16MinValue: number = -32768;
      const zeroValue: number = 0;
      const int8MinValue: number = -128;
      const arr = new Float64Array([int16MinValue, -128, zeroValue]);
      arr.filter((val: number) => val > 1.0);
      const actVal15 = arr.$_get(0);
      const expectVal = int16MinValue;
      expect(actVal15).assertEqual(expectVal);
      const actVal16 = arr.$_get(1);
      const expectVal2 = int8MinValue;
      expect(actVal16).assertEqual(expectVal2);
      const actVal17 = arr.$_get(2);
      const expectVal3 = zeroValue;
      expect(actVal17).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0760
     * @tc.name testFloat64ArrayFilter076
     * @tc.desc Verify callback throws error and original array is unchanged after catch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOne: number = 0.1;
      const threeValue: number = 3;
      const arr = new Float64Array([pointOne, 9007199254740991, 0]);
      try {
        arr.filter((val: number) => {
          throw new Error("test");
        })

      } catch (e) {
        expect(arr.length).assertEqual(threeValue);
        const actVal18 = arr.$_get(0);
        const expectVal = pointOne;
        expect(actVal18).assertEqual(expectVal);
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0770
     * @tc.name testFloat64ArrayFilter077
     * @tc.desc Verify filter on a large array of 1000 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const onePointZero: number = 1.0;
      const num499Value: number = 499;
      const arr = new Float64Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, i * onePointZero);
      }
      const result = arr.filter((val: number) => val > 500.0);
      const expectVal = num499Value;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0780
     * @tc.name testFloat64ArrayFilter078
     * @tc.desc Verify filter on array where all elements are the same matching value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const zeroValue: number = 0;
      const arr = new Float64Array([pointOneTwoFive, pointOneTwoFive, pointOneTwoFive, pointOneTwoFive]);
      const result = arr.filter((val: number) => val === 5.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0790
     * @tc.name testFloat64ArrayFilter079
     * @tc.desc Verify filter on array with all same elements using greater-than condition keeps all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8MaxValue: number = 127;
      const fourValue: number = 4;
      const arr = Float64Array.of(int8MaxValue, int8MaxValue, int8MaxValue, int8MaxValue);
      const result = arr.filter((val: number) => val > 3.0);
      const expectVal = fourValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0800
     * @tc.name testFloat64ArrayFilter080
     * @tc.desc Verify filter on array with alternating binary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int32MaxValue: number = 2147483647;
      const oneValue: number = 1;
      const twoValue: number = 2;
      const arr = Float64Array.of(int32MaxValue, oneValue, int32MaxValue, oneValue, int32MaxValue);
      const result = arr.filter((val: number) => val === 1.0);
      const expectVal = twoValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0810
     * @tc.name testFloat64ArrayFilter081
     * @tc.desc Verify filter on descending array preserves original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxSafeInteger: number = 9007199254740991;
      const piValue: number = 3.141592653589793;
      const twoValue: number = 2;
      const arr = new Float64Array([0.1, maxSafeInteger, 0, piValue, -1e-100]);
      const result = arr.filter((val: number) => val > 2.0);
      expect(result.length).assertEqual(twoValue);
      const actVal19 = result.$_get(0);
      const expectVal = maxSafeInteger;
      expect(actVal19).assertEqual(expectVal);
      const actVal20 = result.$_get(1);
      const expectVal2 = piValue;
      expect(actVal20).assertEqual(expectVal2);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0820
     * @tc.name testFloat64ArrayFilter082
     * @tc.desc Verify filter on arbitrary ordered array preserves relative order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const pointOneTwoFive: number = 0.125;
      const zeroValue: number = 0;
      const arr =
        new Float64Array([0.5, pointOneTwoFive, 0.25, pointOneTwoFive, 0.0625, zeroValue]);
      const result = arr.filter((val: number) => val >= 3.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0830
     * @tc.name testFloat64ArrayFilter083
     * @tc.desc Verify filter on array with duplicate values matching condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-32768, zeroValue, zeroValue, zeroValue, zeroValue, zeroValue);
      const result = arr.filter((val: number) => val === 3.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0840
     * @tc.name testFloat64ArrayFilter084
     * @tc.desc Verify chained filter calls filter the result further
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const arr = Float64Array.of(-2147483648, -1, zeroValue, 1, 2147483647);
      const result = arr.filter((val: number) => val > 1.0).filter((val: number) => val < 5.0);
      const expectVal = zeroValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0850
     * @tc.name testFloat64ArrayFilter085
     * @tc.desc Verify filter chained with instanceof check on result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const arr = Float64Array.of(0.1, 9007199254740991, 0, 3.141592653589793, -1e-100);
      const result = arr.filter((val: number) => val > 0.0);
      const expectVal = threeValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0860
     * @tc.name testFloat64ArrayFilter086
     * @tc.desc Verify filter callback calling Float64Array.of to create a doubled value and compare
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const oneValue: number = 1;
      const arr = new Float64Array([0.5, 1.5, 0.25]);
      const result = arr.filter((val: number) => {
        const doubled = Float64Array.of(val * 2.0);
        return doubled.$_get(0) > 2.0;
      })

      const expectVal = oneValue;
      expect(result.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0870
     * @tc.name testFloat64ArrayFilter087
     * @tc.desc Verify filter() returns empty array when filtering [-32768, -128, 0] with predicate val > 1 since no element exceeds threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = Float64Array.of(-32768, -128, zeroValue);
      const filtered = values.filter((val) => val > 1);
      const expectVal = zeroValue;
      expect(filtered.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0880
     * @tc.name testFloat64ArrayFilter088
     * @tc.desc Verify filter retains all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = Float64Array.of(0.1, 9007199254740991);
      const filtered = values.filter((val) => val > 0);
      const expectVal = twoValue;
      expect(filtered.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0890
     * @tc.name testFloat64ArrayFilter089
     * @tc.desc Verify filter on empty array returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array();
      const filtered = values.filter((val) => val > 0);
      const expectVal = zeroValue;
      expect(filtered.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0900
     * @tc.name testFloat64ArrayFilter090
     * @tc.desc Verify filter single element not matching condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = Float64Array.of(-32768);
      const filtered = values.filter((val) => val > 10);
      const expectVal = zeroValue;
      expect(filtered.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0910
     * @tc.name testFloat64ArrayFilter091
     * @tc.desc Verify filter() on elements [-2147483648, -1] with predicate val > 1 returns empty array since neither element satisfies condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const zeroValue: number = 0;
      const values = new Float64Array([-2147483648, -1]);
      const filtered = values.filter((val) => val > 1);
      const expectVal = zeroValue;
      expect(filtered.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0920
     * @tc.name testFloat64ArrayFilter092
     * @tc.desc Verify filter() propagates Error thrown from callback when filtering [0.5, 1.5] as confirmed by assertFail and catch block matching Error name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([0.5, 1.5]);
      try {
        values.filter((val) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0930
     * @tc.name testFloat64ArrayFilter093
     * @tc.desc Verify filter callback with incrementing index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const twoValue: number = 2;
      const values = new Float64Array([-32768, -128, 0]);
      const filtered = values.filter((val, index) => index < 2);
      const expectVal = twoValue;
      expect(filtered.length).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0940
     * @tc.name testFloat64ArrayFilter094
     * @tc.desc Verify filter((val) with [-2147483648, -1] exception handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Float64Array([-2147483648, -1]);
      try {
        values.filter((val) => {
          throw new Error("test");
        })

        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("Error");
      }
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0950
     * @tc.name testFloat64ArrayFilter095
     * @tc.desc Verify filter with hex literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const hexValueFF: number = 0xFF;
      const hexValue00: number = 0x00;
      const hexValueAA: number = 0xAA;
      const twoValue: number = 2;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = Float64Array.of(hexValueFF, hexValue00, hexValueAA);
      const f = arr.filter((v: number): boolean => v > 0x00);
      expect(f.length).assertEqual(twoValue);
      expect(f[0]).assertEqual(num255Value);
      expect(f[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0960
     * @tc.name testFloat64ArrayFilter096
     * @tc.desc Verify filter with binary literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const binaryValue11111111: number = 0b11111111;
      const binaryValue00000000: number = 0b00000000;
      const binaryValue10101010: number = 0b10101010;
      const twoValue: number = 2;
      const num255Value: number = 255;
      const num170Pointzero: number = 170.0;
      const arr = new Float64Array([binaryValue11111111, binaryValue00000000, binaryValue10101010]);
      const f = arr.filter((v: number): boolean => v > 0b00000000);
      expect(f.length).assertEqual(twoValue);
      expect(f[0]).assertEqual(num255Value);
      expect(f[1]).assertEqual(num170Pointzero);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0970
     * @tc.name testFloat64ArrayFilter097
     * @tc.desc Verify filter with Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nanValue: number = Double.NaN;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(nanValue, doubleMaxValue);
      const f = arr.filter((v: number): boolean => Number.isNaN(v));
      expect(f.length).assertEqual(1);
      const actVal21 = Number.isNaN(f[0]);
      const expectVal = true;
      expect(actVal21).assertEqual(expectVal);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0980
     * @tc.name testFloat64ArrayFilter098
     * @tc.desc Verify filter with Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const positiveInfinity: number = Double.POSITIVE_INFINITY;
      const negativeInfinity: number = Double.NEGATIVE_INFINITY;
      const arr = Float64Array.of(positiveInfinity, negativeInfinity);
      const f = arr.filter((v: number): boolean => v > 0.0);
      expect(f.length).assertEqual(1);
      expect(f[0]).assertEqual(positiveInfinity);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_0990
     * @tc.name testFloat64ArrayFilter099
     * @tc.desc Verify filter with Double.MIN_VALUE/MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const doubleMinValue: number = Double.MIN_VALUE;
      const doubleMaxValue: number = Double.MAX_VALUE;
      const arr = Float64Array.of(doubleMinValue, doubleMaxValue);
      const f = arr.filter((v: number): boolean => v > 0.0);
      expect(f.length).assertEqual(2);
      expect(f[0]).assertEqual(doubleMinValue);
      expect(f[1]).assertEqual(doubleMaxValue);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_1000
     * @tc.name testFloat64ArrayFilter100
     * @tc.desc Verify filter reads modified values when callback changes other elements in the array during first pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const threeValue: number = 3;
      const fourValue: number = 4;
      const fiveValue: number = 5;
      const num999Value: number = 999;
      const arr = new Float64Array([1, 2, threeValue, fourValue, fiveValue]);
      // First pass: at index 0, callback modifies index 2 from 3 to 999
      // Filter uses the modified value when it reaches index 2
      const result = arr.filter((val: number, index: int): boolean => {
        if (index === 0) {
          arr.$_set(2, num999Value);
        }
        return val > 3.0;
      })
      expect(result.length).assertEqual(threeValue);
      const actVal22 = result.$_get(0);
      const expectVal = num999Value;
      expect(actVal22).assertEqual(expectVal);
      const actVal23 = result.$_get(1);
      const expectVal2 = fourValue;
      expect(actVal23).assertEqual(expectVal2);
      const actVal24 = result.$_get(2);
      const expectVal3 = fiveValue;
      expect(actVal24).assertEqual(expectVal3);
    })

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT64ARRAY_FILTER_1010
     * @tc.name testFloat64ArrayFilter101
     * @tc.desc Verify filter returns a Float64Array instance, not a plain Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat64ArrayFilter101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1, 2, 3]);
      const result = arr.filter((val: number): boolean => val > 1.0);
      const actVal25 = isFloat64Array(result);
      const expectVal = true;
      expect(actVal25).assertEqual(expectVal);
    })

  })
}
