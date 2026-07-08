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

export default function BigInt64Array03Test(): void {
  describe('BigInt64Array03Test', (): void => {
    beforeAll((): void => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {
    });

    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0010
     * @tc.name testBigInt64ArrayThree0010
     * @tc.desc Verify at returns undefined for a one-element array when index -2
     * is below the left boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.at(-2)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0020
     * @tc.name testBigInt64ArrayThree0020
     * @tc.desc Verify at returns undefined for a two-element array when index -3
     * is below the left boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      expect(arr.at(-3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0030
     * @tc.name testBigInt64ArrayThree0030
     * @tc.desc Verify at returns undefined when a very large negative index
     * exceeds the left boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.at(-9999999)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0040
     * @tc.name testBigInt64ArrayThree0040
     * @tc.desc Verify at returns undefined for a one-element array when index 1
     * exceeds the right boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.at(1)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0050
     * @tc.name testBigInt64ArrayThree0050
     * @tc.desc Verify at returns undefined for a one-element array when index 2 is
     * out of range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.at(2)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0060
     * @tc.name testBigInt64ArrayThree0060
     * @tc.desc Verify at returns undefined when a very large positive index
     * exceeds the right boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.at(9999999)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0070
     * @tc.name testBigInt64ArrayThree0070
     * @tc.desc Verify at returns undefined when index -1 is used on an empty
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.at(-1)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0080
     * @tc.name testBigInt64ArrayThree0080
     * @tc.desc Verify at returns undefined when index 0 is used on an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.at(0)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0090
     * @tc.name testBigInt64ArrayThree0090
     * @tc.desc Verify at returns undefined when Number.MAX_SAFE_INTEGER is used as
     * the index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.at(2147483647)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0100
     * @tc.name testBigInt64ArrayThree0100
     * @tc.desc Verify at returns undefined when Number.MIN_SAFE_INTEGER is used as
     * the index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.at(-2147483648)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0110
     * @tc.name testBigInt64ArrayThree0110
     * @tc.desc Verify subarray clamps start -2 to the left boundary for a one-
     * element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let sub = arr.subarray(-2);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0120
     * @tc.name testBigInt64ArrayThree0120
     * @tc.desc Verify subarray clamps a very large negative start to index zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n]);
      let sub = arr.subarray(-9999999);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0130
     * @tc.name testBigInt64ArrayThree0130
     * @tc.desc Verify subarray returns an empty view when start equals length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n]);
      let sub = arr.subarray(1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0140
     * @tc.name testBigInt64ArrayThree0140
     * @tc.desc Verify subarray returns an empty view when start is greater than
     * length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n]);
      let sub = arr.subarray(2);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0150
     * @tc.name testBigInt64ArrayThree0150
     * @tc.desc Verify subarray returns an empty view when start is a very large
     * positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let sub = arr.subarray(9999999);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0160
     * @tc.name testBigInt64ArrayThree0160
     * @tc.desc Verify subarray returns an empty view when end -2 is left of the
     * start boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([6n]);
      let sub = arr.subarray(0, -2);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0170
     * @tc.name testBigInt64ArrayThree0170
     * @tc.desc Verify subarray returns an empty view when end is a very large
     * negative value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n]);
      let sub = arr.subarray(0, -9999999);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0180
     * @tc.name testBigInt64ArrayThree0180
     * @tc.desc Verify subarray on an empty array stays empty after boundary
     * clipping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let sub = arr.subarray(0, 1);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0190
     * @tc.name testBigInt64ArrayThree0190
     * @tc.desc Verify subarray returns an empty view when both bounds are
     * Number.MAX_SAFE_INTEGER.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n]);
      let sub = arr.subarray(2147483647, 2147483647);
      expect(sub.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0200
     * @tc.name testBigInt64ArrayThree0200
     * @tc.desc Verify subarray clamps Number.MIN_SAFE_INTEGER start to the left
     * boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let sub = arr.subarray(-2147483648);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0210
     * @tc.name testBigInt64ArrayThree0210
     * @tc.desc Verify slice clamps start -2 to the left boundary for a one-element
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let s = arr.slice(-2);
      expect(s.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0220
     * @tc.name testBigInt64ArrayThree0220
     * @tc.desc Verify slice clamps a very large negative start to the left
     * boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n]);
      let s = arr.slice(-888888);
      expect(s.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0230
     * @tc.name testBigInt64ArrayThree0230
     * @tc.desc Verify slice returns an empty copy when start equals length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n]);
      let s = arr.slice(1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0240
     * @tc.name testBigInt64ArrayThree0240
     * @tc.desc Verify slice returns an empty copy when start is greater than
     * length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n]);
      let s = arr.slice(2);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0250
     * @tc.name testBigInt64ArrayThree0250
     * @tc.desc Verify slice returns an empty copy when start is a very large
     * positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let s = arr.slice(888888);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0260
     * @tc.name testBigInt64ArrayThree0260
     * @tc.desc Verify slice returns an empty copy when end -2 is left of the start
     * boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([6n]);
      let s = arr.slice(0, -2);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0270
     * @tc.name testBigInt64ArrayThree0270
     * @tc.desc Verify slice returns an empty copy when end is a very large
     * negative value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n]);
      let s = arr.slice(0, -888888);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0280
     * @tc.name testBigInt64ArrayThree0280
     * @tc.desc Verify slice returns an empty copy when both bounds are
     * Number.MIN_SAFE_INTEGER.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n]);
      let s = arr.slice(-2147483648, -2147483648);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0290
     * @tc.name testBigInt64ArrayThree0290
     * @tc.desc Verify slice returns an empty copy when start is
     * Number.MAX_SAFE_INTEGER.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n]);
      let s = arr.slice(2147483647);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0300
     * @tc.name testBigInt64ArrayThree0300
     * @tc.desc Verify slice on an empty array stays empty after out-of-range
     * clipping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let s = arr.slice(0, 1);
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0310
     * @tc.name testBigInt64ArrayThree0310
     * @tc.desc Verify assignment at index -1 is ignored for a one-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      arr[-1] = 5n;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0320
     * @tc.name testBigInt64ArrayThree0320
     * @tc.desc Verify assignment at index -2 is ignored for a one-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n]);
      arr[-2] = 5n;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0330
     * @tc.name testBigInt64ArrayThree0330
     * @tc.desc Verify assignment at a very large negative index is ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n]);
      arr[-9999] = 5n;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0340
     * @tc.name testBigInt64ArrayThree0340
     * @tc.desc Verify assignment at index 1 is ignored when it exceeds a one-
     * element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n]);
      arr[1] = 5n;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0350
     * @tc.name testBigInt64ArrayThree0350
     * @tc.desc Verify assignment at index 2 is ignored when it is out of range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      arr[2] = 5n;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0360
     * @tc.name testBigInt64ArrayThree0360
     * @tc.desc Verify assignment at a very large positive index is ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([6n]);
      arr[9999] = 5n;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0370
     * @tc.name testBigInt64ArrayThree0370
     * @tc.desc Verify assignment at index -1 does not grow an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr[-1] = 5n;
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0380
     * @tc.name testBigInt64ArrayThree0380
     * @tc.desc Verify assignment at index 0 does not grow an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      arr[0] = 5n;
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0390
     * @tc.name testBigInt64ArrayThree0390
     * @tc.desc Verify assignment at Number.MAX_SAFE_INTEGER is ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n]);
      arr[2147483647] = 5n;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0400
     * @tc.name testBigInt64ArrayThree0400
     * @tc.desc Verify assignment at Number.MIN_SAFE_INTEGER is ignored.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n]);
      arr[-2147483648] = 5n;
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0410
     * @tc.name testBigInt64ArrayThree0410
     * @tc.desc Verify with throws RangeError when index -2 is below a one-element
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(-2, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0420
     * @tc.name testBigInt64ArrayThree0420
     * @tc.desc Verify with throws RangeError when index -3 is below a two-element
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(-3, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0430
     * @tc.name testBigInt64ArrayThree0430
     * @tc.desc Verify with throws RangeError for a very large negative index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(-9999, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0440
     * @tc.name testBigInt64ArrayThree0440
     * @tc.desc Verify with throws RangeError when index 1 exceeds a one-element
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(1, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0450
     * @tc.name testBigInt64ArrayThree0450
     * @tc.desc Verify with throws RangeError when index 2 is out of range for a
     * one-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(2, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0460
     * @tc.name testBigInt64ArrayThree0460
     * @tc.desc Verify with throws RangeError for a very large positive index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(9999, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0470
     * @tc.name testBigInt64ArrayThree0470
     * @tc.desc Verify with throws RangeError when index -1 is used on an empty
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(-1, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0480
     * @tc.name testBigInt64ArrayThree0480
     * @tc.desc Verify with throws RangeError when index 0 is used on an empty
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(0, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0490
     * @tc.name testBigInt64ArrayThree0490
     * @tc.desc Verify with throws RangeError when Number.MAX_SAFE_INTEGER is used
     * as the index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(2147483647, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0500
     * @tc.name testBigInt64ArrayThree0500
     * @tc.desc Verify with throws RangeError when Number.MIN_SAFE_INTEGER is used
     * as the index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([6n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.with(-2147483648, 5n);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0510
     * @tc.name testBigInt64ArrayThree0510
     * @tc.desc Verify copyWithin clamps destination -2 to the left boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      arr.copyWithin(-2, 1);
      expect(arr[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0520
     * @tc.name testBigInt64ArrayThree0520
     * @tc.desc Verify copyWithin does nothing when the source start is greater
     * than length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 4n]);
      arr.copyWithin(0, 5);
      expect(arr[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0530
     * @tc.name testBigInt64ArrayThree0530
     * @tc.desc Verify copyWithin clamps a very large negative destination to the
     * left boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n]);
      arr.copyWithin(-10000, 1);
      expect(arr[0]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0540
     * @tc.name testBigInt64ArrayThree0540
     * @tc.desc Verify copyWithin ignores an oversized end without throwing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n]);
      arr.copyWithin(0, 0, 10000);
      expect(arr[0]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0550
     * @tc.name testBigInt64ArrayThree0550
     * @tc.desc Verify set throws RangeError when the source would overrun the
     * target array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.set([3n, 4n], 1);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0560
     * @tc.name testBigInt64ArrayThree0560
     * @tc.desc Verify set throws RangeError when the offset is negative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.set([2n], -1);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0570
     * @tc.name testBigInt64ArrayThree0570
     * @tc.desc Verify set throws IndexOutOfBoundsError when the offset is
     * Number.MAX_SAFE_INTEGER.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.set([2n], 2147483647);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("IndexOutOfBoundsError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0580
     * @tc.name testBigInt64ArrayThree0580
     * @tc.desc Verify set throws RangeError when writing one element into an empty
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.set([1n], 0);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0590
     * @tc.name testBigInt64ArrayThree0590
     * @tc.desc Verify set throws TypeError when the source contains undefined
     * instead of bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorName = "";
      try {
        let source = [undefined] as Object;
        arr.set(source as Array<BigInt>, 0);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0600
     * @tc.name testBigInt64ArrayThree0600
     * @tc.desc Verify fill does nothing when start is equal to length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      arr.fill(3n, 2);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0610
     * @tc.name testBigInt64ArrayThree0610
     * @tc.desc Verify reduce throws TypeError on an empty array without an initial
     * value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.reduce((acc, val) => acc + val);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0620
     * @tc.name testBigInt64ArrayThree0620
     * @tc.desc Verify reduceRight throws TypeError on an empty array without an
     * initial value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let hasCaught = false;
      let errorName = "";
      try {
        arr.reduceRight((acc, val) => acc + val);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0630
     * @tc.name testBigInt64ArrayThree0630
     * @tc.desc Verify some returns false for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.some((v) => v === 1n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0640
     * @tc.name testBigInt64ArrayThree0640
     * @tc.desc Verify every returns true for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.every((v) => v === 1n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0650
     * @tc.name testBigInt64ArrayThree0650
     * @tc.desc Verify find returns undefined for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.find((v) => v === 1n)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0660
     * @tc.name testBigInt64ArrayThree0660
     * @tc.desc Verify findIndex returns -1 for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.findIndex((v) => v === 1n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0670
     * @tc.name testBigInt64ArrayThree0670
     * @tc.desc Verify findLast returns undefined for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.findLast((v) => v === 1n)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0680
     * @tc.name testBigInt64ArrayThree0680
     * @tc.desc Verify findLastIndex returns -1 for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.findLastIndex((v) => v === 1n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0690
     * @tc.name testBigInt64ArrayThree0690
     * @tc.desc Verify includes returns false for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.includes(1n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0700
     * @tc.name testBigInt64ArrayThree0700
     * @tc.desc Verify indexOf returns -1 for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      expect(arr.indexOf(1n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0710
     * @tc.name testBigInt64ArrayThree0710
     * @tc.desc Verify find returns undefined when a single-element array does not
     * match the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.find((v) => v === 2n)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0720
     * @tc.name testBigInt64ArrayThree0720
     * @tc.desc Verify findIndex returns -1 when all elements fail the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.findIndex((v) => v === 2n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0730
     * @tc.name testBigInt64ArrayThree0730
     * @tc.desc Verify indexOf returns the first index when all elements are equal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n]);
      expect(arr.indexOf(5n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0740
     * @tc.name testBigInt64ArrayThree0740
     * @tc.desc Verify lastIndexOf returns the last index when all elements are
     * equal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n]);
      expect(arr.lastIndexOf(5n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0750
     * @tc.name testBigInt64ArrayThree0750
     * @tc.desc Verify includes returns false when the searched value is absent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n]);
      expect(arr.includes(6n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0760
     * @tc.name testBigInt64ArrayThree0760
     * @tc.desc Verify every returns false when one element differs from the
     * expected value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 6n]);
      expect(arr.every((v) => v === 5n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0770
     * @tc.name testBigInt64ArrayThree0770
     * @tc.desc Verify some returns true when a different element is present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 6n]);
      expect(arr.some((v) => v === 6n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0780
     * @tc.name testBigInt64ArrayThree0780
     * @tc.desc Verify reduce returns the only element when no initial value is
     * provided.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n]);
      expect(arr.reduce((acc, v) => acc + v)).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0790
     * @tc.name testBigInt64ArrayThree0790
     * @tc.desc Verify reduceRight returns the only element when no initial value
     * is provided.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n]);
      expect(arr.reduceRight((acc, v) => acc + v)).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0800
     * @tc.name testBigInt64ArrayThree0800
     * @tc.desc Verify filter returns a new array with all matching equal elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 7n]);
      let res = arr.filter((v) => v === 7n);
      expect(res.length).assertEqual(2);
      expect(res === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0810
     * @tc.name testBigInt64ArrayThree0810
     * @tc.desc Verify map rethrows the callback error to the caller.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.map(() => { throw new Error("M1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("M1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0820
     * @tc.name testBigInt64ArrayThree0820
     * @tc.desc Verify filter rethrows the callback error to the caller.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.filter(() => { throw new Error("F1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("F1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0830
     * @tc.name testBigInt64ArrayThree0830
     * @tc.desc Verify forEach rethrows the callback error to the caller.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.forEach(() => { throw new Error("E1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("E1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0840
     * @tc.name testBigInt64ArrayThree0840
     * @tc.desc Verify reduce rethrows the callback error to the caller.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n, 5n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.reduce(() => { throw new Error("R1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("R1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0850
     * @tc.name testBigInt64ArrayThree0850
     * @tc.desc Verify reduceRight rethrows the callback error to the caller.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([6n, 7n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.reduceRight(() => { throw new Error("R2"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("R2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0860
     * @tc.name testBigInt64ArrayThree0860
     * @tc.desc Verify some rethrows the callback error raised on the second
     * element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.some((v) => { if (v === 2n) throw new Error("S1"); return false; });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("S1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0870
     * @tc.name testBigInt64ArrayThree0870
     * @tc.desc Verify every rethrows the callback error raised on the first
     * element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.every(() => { throw new Error("V1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("V1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0880
     * @tc.name testBigInt64ArrayThree0880
     * @tc.desc Verify find rethrows the callback error to stop the search.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.find(() => { throw new Error("FD1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("FD1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0890
     * @tc.name testBigInt64ArrayThree0890
     * @tc.desc Verify findIndex rethrows the callback error to stop the search.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.findIndex(() => { throw new Error("FI1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("FI1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0900
     * @tc.name testBigInt64ArrayThree0900
     * @tc.desc Verify sort rethrows the comparator error to the caller.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.sort(() => { throw new Error("SO1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("SO1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0910
     * @tc.name testBigInt64ArrayThree0910
     * @tc.desc Verify findLast rethrows the callback error during reverse search.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.findLast(() => { throw new Error("FL1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("FL1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0920
     * @tc.name testBigInt64ArrayThree0920
     * @tc.desc Verify findLastIndex rethrows the callback error during reverse
     * search.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.findLastIndex(() => { throw new Error("FLI1"); });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("FLI1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0930
     * @tc.name testBigInt64ArrayThree0930
     * @tc.desc Verify find rethrows a callback error raised in the middle of a
     * larger array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.find((v) => { if (v === 2n) throw new Error("FD2"); return false; });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("FD2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0940
     * @tc.name testBigInt64ArrayThree0940
     * @tc.desc Verify findIndex rethrows a callback error raised in the middle of
     * a larger array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 8n, 7n]);
      let hasCaught = false;
      let errorMessage = "";
      try {
        arr.findIndex((v) => { if (v === 8n) throw new Error("FI2"); return false; });
      } catch (e) {
        hasCaught = true;
        errorMessage = (e as Error).message;
      }
      expect(hasCaught).assertTrue();
      expect(errorMessage).assertEqual("FI2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0950
     * @tc.name testBigInt64ArrayThree0950
     * @tc.desc Verify sort throws TypeError when compareFn is not a function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let hasCaught = false;
      let errorName = "";
      try {
        let badComparator: Object = "not-a-func";
        arr.sort(badComparator as (a: BigInt, b: BigInt) => int);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0960
     * @tc.name testBigInt64ArrayThree0960
     * @tc.desc Verify forEach throws TypeError when callbackFn is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorName = "";
      try {
        let badCallback: Object | undefined = undefined;
        arr.forEach(badCallback as (value: BigInt, index: int, array: BigInt64Array) => void);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0970
     * @tc.name testBigInt64ArrayThree0970
     * @tc.desc Verify map throws TypeError when callbackFn is null.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorName = "";
      try {
        let badCallback: Object | null = null;
        arr.map(badCallback as (value: BigInt, index: int, array: BigInt64Array) => BigInt);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0980
     * @tc.name testBigInt64ArrayThree0980
     * @tc.desc Verify filter throws TypeError when callbackFn is not a function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let hasCaught = false;
      let errorName = "";
      try {
        let badCallback: Object = 123;
        arr.filter(badCallback as (value: BigInt, index: int, array: BigInt64Array) => boolean);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_0990
     * @tc.name testBigInt64ArrayThree0990
     * @tc.desc Verify reduce throws TypeError when callbackFn is not a function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let hasCaught = false;
      let errorName = "";
      try {
        let badCallback: Object = {};
        arr.reduce(
        badCallback as (previousValue: BigInt, currentValue: BigInt, currentIndex: int,
        array: BigInt64Array) => BigInt
      );
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1000
     * @tc.name testBigInt64ArrayThree1000
     * @tc.desc Verify reduceRight throws TypeError when callbackFn is not a
     * function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let hasCaught = false;
      let errorName = "";
      try {
        let badCallback: Object = {};
        arr.reduceRight(
        badCallback as (previousValue: BigInt, currentValue: BigInt, currentIndex: int,
        array: BigInt64Array) => BigInt
      );
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("TypeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1010
     * @tc.name testBigInt64ArrayThree1010
     * @tc.desc Verify writing the maximum signed BigInt64 value preserves that
     * value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 9223372036854775807n;
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1020
     * @tc.name testBigInt64ArrayThree1020
     * @tc.desc Verify writing the minimum signed BigInt64 value preserves that
     * value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -9223372036854775808n;
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1030
     * @tc.name testBigInt64ArrayThree1030
     * @tc.desc Verify writing one above the signed maximum wraps to the minimum
     * value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 9223372036854775808n;
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1040
     * @tc.name testBigInt64ArrayThree1040
     * @tc.desc Verify writing one below the signed minimum wraps to the maximum
     * value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -9223372036854775809n;
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1050
     * @tc.name testBigInt64ArrayThree1050
     * @tc.desc Verify writing two-to-sixty-four minus one wraps to -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 18446744073709551615n;
      expect(arr[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1060
     * @tc.name testBigInt64ArrayThree1060
     * @tc.desc Verify writing an exact two-to-sixty-four multiple wraps to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 18446744073709551616n;
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1070
     * @tc.name testBigInt64ArrayThree1070
     * @tc.desc Verify writing negative two-to-sixty-four plus one wraps to 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -18446744073709551615n;
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1080
     * @tc.name testBigInt64ArrayThree1080
     * @tc.desc Verify writing negative two-to-sixty-four wraps to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -18446744073709551616n;
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1090
     * @tc.name testBigInt64ArrayThree1090
     * @tc.desc Verify BigInt64Array.of truncates an overflowing initial value
     * during creation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(9223372036854775808n);
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1100
     * @tc.name testBigInt64ArrayThree1100
     * @tc.desc Verify fill truncates an overflowing bigint value across the whole
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      arr.fill(9223372036854775808n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1110
     * @tc.name testBigInt64ArrayThree1110
     * @tc.desc Verify the constructor throws RangeError when byteOffset is not
     * aligned to eight bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let hasCaught = false;
      let errorName = "";
      try {
        let arr = new BigInt64Array(buf, 1);
        expect(arr.length).assertEqual(0);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1120
     * @tc.name testBigInt64ArrayThree1120
     * @tc.desc Verify the constructor throws RangeError when byteOffset is
     * negative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let hasCaught = false;
      let errorName = "";
      try {
        let arr = new BigInt64Array(buf, -8);
        expect(arr.length).assertEqual(0);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1130
     * @tc.name testBigInt64ArrayThree1130
     * @tc.desc Verify the constructor throws RangeError when offset plus length
     * exceeds buffer capacity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let hasCaught = false;
      let errorName = "";
      try {
        let arr = new BigInt64Array(buf, 8, 2);
        expect(arr.length).assertEqual(0);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1140
     * @tc.name testBigInt64ArrayThree1140
     * @tc.desc Verify the constructor throws RangeError when length is negative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let hasCaught = false;
      let errorName = "";
      try {
        let arr = new BigInt64Array(buf, 0, -1);
        expect(arr.length).assertEqual(0);
      } catch (e) {
        hasCaught = true;
        errorName = (e as Error).name;
      }
      expect(hasCaught).assertTrue();
      expect(errorName).assertEqual("RangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1150
     * @tc.name testBigInt64ArrayThree1150
     * @tc.desc Verify subarray shares the underlying buffer when the child view is
     * updated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sub = arr.subarray(1);
      sub[0] = 99n;
      expect(arr[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1160
     * @tc.name testBigInt64ArrayThree1160
     * @tc.desc Verify subarray reflects changes written through the original
     * parent view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let sub = arr.subarray(0, 1);
      arr[0] = 55n;
      expect(sub[0]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1170
     * @tc.name testBigInt64ArrayThree1170
     * @tc.desc Verify separate buffer views do not affect each other when they
     * target different indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v1 = new BigInt64Array(buf, 0, 1);
      let v2 = new BigInt64Array(buf, 8, 1);
      v1[0] = 5n;
      expect(v2[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1180
     * @tc.name testBigInt64ArrayThree1180
     * @tc.desc Verify an Int8Array write changes the shared BigInt64Array view
     * data.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let i8 = new Int8Array(buf);
      let arr = new BigInt64Array(buf);
      i8[0] = -1;
      expect(arr[0] !== 0n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1190
     * @tc.name testBigInt64ArrayThree1190
     * @tc.desc Verify copyWithin preserves overlapping source values in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.copyWithin(1, 0, 2);
      expect(arr[1]).assertEqual(1n);
      expect(arr[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_THREE_1200
     * @tc.name testBigInt64ArrayThree1200
     * @tc.desc Verify the constructor allows a byteOffset exactly at the end of
     * the buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayThree1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 16);
      expect(arr.length).assertEqual(0);
    });

  });
}
