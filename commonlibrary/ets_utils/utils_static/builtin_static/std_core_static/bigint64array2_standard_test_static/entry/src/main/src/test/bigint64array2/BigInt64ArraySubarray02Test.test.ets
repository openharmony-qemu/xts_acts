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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function BigInt64ArraySubarray02Test(): void {
  describe('BigInt64ArraySubarray02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_0100
     * @tc.name testBigInt64ArraySubarrayTwo001
     * @tc.desc Verify subarray().buffer is the same reference as source.buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray();
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_0200
     * @tc.name testBigInt64ArraySubarrayTwo002
     * @tc.desc Verify subarray(1).buffer is the same as source.buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_0300
     * @tc.name testBigInt64ArraySubarrayTwo003
     * @tc.desc Verify subarray(1, 3).buffer is the same as source.buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_0400
     * @tc.name testBigInt64ArraySubarrayTwo004
     * @tc.desc Verify two subarrays from same source share the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub1 = arr.subarray(0, 2);
      let sub2 = arr.subarray(2, 4);
      expect(sub1.buffer).assertEqual(sub2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_0500
     * @tc.name testBigInt64ArraySubarrayTwo005
     * @tc.desc Verify subarray of subarray shares buffer with the original source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(0, 2);
      expect(sub2.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_0600
     * @tc.name testBigInt64ArraySubarrayTwo006
     * @tc.desc Verify subarray on offset-view source shares the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      let sub = arr.subarray(0, 2);
      expect(sub.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_0700
     * @tc.name testBigInt64ArraySubarrayTwo007
     * @tc.desc Verify modifying subarray[0] changes source at the corresponding index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 2);
      sub[0] = 99n;
      expect(arr[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_0800
     * @tc.name testBigInt64ArraySubarrayTwo008
     * @tc.desc Verify modifying subarray[0] after subarray(1, 3) changes source arr[1].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1, 3);
      sub[0] = 88n;
      expect(arr[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_0900
     * @tc.name testBigInt64ArraySubarrayTwo009
     * @tc.desc Verify modifying the last element of a subarray changes source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(2, 4);
      sub[1] = 77n;
      expect(arr[3]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1000
     * @tc.name testBigInt64ArraySubarrayTwo010
     * @tc.desc Verify modifying subarray after subarray(-1) changes the source last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-1);
      sub[0] = 55n;
      expect(arr[2]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1100
     * @tc.name testBigInt64ArraySubarrayTwo011
     * @tc.desc Verify modifying subarray to MAX value reflects in source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sub = arr.subarray(0, 2);
      sub[1] = 9223372036854775807n;
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1200
     * @tc.name testBigInt64ArraySubarrayTwo012
     * @tc.desc Verify modifying subarray to MIN value reflects in source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sub = arr.subarray(0, 2);
      sub[0] = -9223372036854775808n;
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1300
     * @tc.name testBigInt64ArraySubarrayTwo013
     * @tc.desc Verify modifying all elements of subarray changes all corresponding source elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray();
      sub[0] = 10n;
      sub[1] = 20n;
      sub[2] = 30n;
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1400
     * @tc.name testBigInt64ArraySubarrayTwo014
     * @tc.desc Verify modifying subarray to 0n reflects in source element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let sub = arr.subarray(1, 2);
      sub[0] = 0n;
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1500
     * @tc.name testBigInt64ArraySubarrayTwo015
     * @tc.desc Verify modifying source[0] changes subarray starting from 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 2);
      arr[0] = 99n;
      expect(sub[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1600
     * @tc.name testBigInt64ArraySubarrayTwo016
     * @tc.desc Verify modifying source[1] changes subarray(1, 3) element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1, 3);
      arr[1] = 77n;
      expect(sub[0]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1700
     * @tc.name testBigInt64ArraySubarrayTwo017
     * @tc.desc Verify modifying source last element changes subarray(-1).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-1);
      arr[2] = 55n;
      expect(sub[0]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1800
     * @tc.name testBigInt64ArraySubarrayTwo018
     * @tc.desc Verify modifying source after subarray creation is visible in subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(1, 3);
      arr[1] = 999n;
      expect(sub[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_1900
     * @tc.name testBigInt64ArraySubarrayTwo019
     * @tc.desc Verify modifying source to MAX value is visible in subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sub = arr.subarray();
      arr[1] = 9223372036854775807n;
      expect(sub[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2000
     * @tc.name testBigInt64ArraySubarrayTwo020
     * @tc.desc Verify modifying source to MIN value is visible in subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sub = arr.subarray();
      arr[0] = -9223372036854775808n;
      expect(sub[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2100
     * @tc.name testBigInt64ArraySubarrayTwo021
     * @tc.desc Verify subarray() (no arguments) on a zero-offset source returns byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray();
      expect(sub.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2200
     * @tc.name testBigInt64ArraySubarrayTwo022
     * @tc.desc Verify subarray(1).byteOffset equals 8 (one element offset).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1);
      expect(sub.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2300
     * @tc.name testBigInt64ArraySubarrayTwo023
     * @tc.desc Verify subarray(2).byteOffset equals 16 (two elements offset).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(2);
      expect(sub.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2400
     * @tc.name testBigInt64ArraySubarrayTwo024
     * @tc.desc Verify subarray(-1).byteOffset equals (length-1)*8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-1);
      expect(sub.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2500
     * @tc.name testBigInt64ArraySubarrayTwo025
     * @tc.desc Verify subarray(1, 3).byteOffset equals 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      expect(sub.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2600
     * @tc.name testBigInt64ArraySubarrayTwo026
     * @tc.desc Verify subarray(0, 2) (explicit begin=0) on a zero-offset source returns byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 2);
      expect(sub.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2700
     * @tc.name testBigInt64ArraySubarrayTwo027
     * @tc.desc Verify subarray of subarray byteOffset accumulates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(1, 3);
      expect(sub2.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2800
     * @tc.name testBigInt64ArraySubarrayTwo028
     * @tc.desc Verify subarray on non-zero byteOffset source inherits additional offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 16, 3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      let sub = arr.subarray(1);
      expect(sub.byteOffset).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_2900
     * @tc.name testBigInt64ArraySubarrayTwo029
     * @tc.desc Verify subarray().byteLength equals source.byteLength when no params.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray();
      expect(sub.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3000
     * @tc.name testBigInt64ArraySubarrayTwo030
     * @tc.desc Verify subarray(1).byteLength equals (length-1)*8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1);
      expect(sub.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3100
     * @tc.name testBigInt64ArraySubarrayTwo031
     * @tc.desc Verify subarray(1, 3).byteLength equals 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      expect(sub.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3200
     * @tc.name testBigInt64ArraySubarrayTwo032
     * @tc.desc Verify subarray(-1).byteLength equals 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-1);
      expect(sub.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3300
     * @tc.name testBigInt64ArraySubarrayTwo033
     * @tc.desc Verify subarray(-2).byteLength equals 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(-2);
      expect(sub.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3400
     * @tc.name testBigInt64ArraySubarrayTwo034
     * @tc.desc Verify subarray of subarray byteLength is correct for the final range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(0, 2);
      expect(sub2.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3500
     * @tc.name testBigInt64ArraySubarrayTwo035
     * @tc.desc Verify Int8Array write to source buffer at subarray position is visible in subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sub = arr.subarray(1, 2);
      let i8 = new Int8Array(arr.buffer);
      i8[8] = 99;
      expect(sub[0]).assertEqual(99n)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3600
     * @tc.name testBigInt64ArraySubarrayTwo036
     * @tc.desc Verify Uint8Array byte modification to source buffer reflects in subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([256n]);
      let sub = arr.subarray();
      let u8 = new Uint8Array(arr.buffer);
      u8[0] = 1;
      u8[1] = 0;
      expect(sub[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3700
     * @tc.name testBigInt64ArraySubarrayTwo037
     * @tc.desc Verify DataView BigInt64 write to source buffer at subarray position is visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let sub = arr.subarray(0, 2);
      let view = new DataView(arr.buffer);
      view.setBigInt64(8, 999n, true);
      expect(sub[1]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3800
     * @tc.name testBigInt64ArraySubarrayTwo038
     * @tc.desc Verify DataView getBigInt64 can read subarray element through subarray buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let sub = arr.subarray(1, 2);
      let view = new DataView(sub.buffer);
      let val = view.getBigInt64(sub.byteOffset, true);
      expect(val).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_3900
     * @tc.name testBigInt64ArraySubarrayTwo039
     * @tc.desc Verify Int16Array modification overlaps with subarray BigInt64 range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let sub = arr.subarray();
      let i16 = new Int16Array(arr.buffer);
      i16[0] = 100;
      expect(sub[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4000
     * @tc.name testBigInt64ArraySubarrayTwo040
     * @tc.desc Verify Uint32Array modification overlaps with subarray range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000n, 2000n]);
      let sub = arr.subarray();
      let u32 = new Uint32Array(arr.buffer);
      u32[0] = 55555;
      expect(sub[0]).assertEqual(55555n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4100
     * @tc.name testBigInt64ArraySubarrayTwo041
     * @tc.desc Verify another BigInt64Array on same buffer and subarray share changes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 0, 3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      let sub = arr.subarray(1, 3);
      let other = new BigInt64Array(buf, 8, 2);
      other[0] = 88n;
      expect(sub[0]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4200
     * @tc.name testBigInt64ArraySubarrayTwo042
     * @tc.desc Verify modifying subarray through DataView changes source through shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      let sub = arr.subarray();
      let view = new DataView(sub.buffer);
      view.setBigInt64(sub.byteOffset, 777n, true);
      expect(arr[0]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4300
     * @tc.name testBigInt64ArraySubarrayTwo043
     * @tc.desc Verify Uint8Array write through subarray byteOffset changes source correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1, 3);
      let u8 = new Uint8Array(sub.buffer);
      u8[sub.byteOffset] = 55;
      expect(arr[1]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4400
     * @tc.name testBigInt64ArraySubarrayTwo044
     * @tc.desc Verify Int8Array partial byte modification at subarray start affects its BigInt64 value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let sub = arr.subarray();
      let i8 = new Int8Array(arr.buffer);
      i8[0] = 1;
      expect(sub[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4500
     * @tc.name testBigInt64ArraySubarrayTwo045
     * @tc.desc Verify two different typed views on shared buffer, subarray stays consistent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let sub = arr.subarray(0, 1);
      let i32 = new Int32Array(arr.buffer);
      i32[0] = 999;
      let view = new DataView(arr.buffer);
      let lo = view.getInt32(0, true);
      expect(lo).assertEqual(999);
      expect(sub[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4600
     * @tc.name testBigInt64ArraySubarrayTwo046
     * @tc.desc Verify multiple subarrays on same buffer all reflect the same underlying data change.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let subA = arr.subarray(0, 2);
      let subB = arr.subarray(2, 4);
      arr[0] = 99n;
      arr[3] = 88n;
      expect(subA[0]).assertEqual(99n);
      expect(subB[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4700
     * @tc.name testBigInt64ArraySubarrayTwo047
     * @tc.desc Verify two non-overlapping subarrays read correct independent ranges.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub1 = arr.subarray(0, 2);
      let sub2 = arr.subarray(2, 4);
      expect(sub1[0]).assertEqual(1n);
      expect(sub2[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4800
     * @tc.name testBigInt64ArraySubarrayTwo048
     * @tc.desc Verify two overlapping subarrays share changes in the overlap region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub1 = arr.subarray(0, 3);
      let sub2 = arr.subarray(2, 4);
      sub1[2] = 99n;
      expect(sub2[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_4900
     * @tc.name testBigInt64ArraySubarrayTwo049
     * @tc.desc Verify modifying one subarray affects an overlapping subarray via shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let subA = arr.subarray(0, 2);
      let subB = arr.subarray(1, 3);
      subA[1] = 55n;
      expect(subB[0]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5000
     * @tc.name testBigInt64ArraySubarrayTwo050
     * @tc.desc Verify non-overlapping subarray modifications do not affect each other.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub1 = arr.subarray(0, 2);
      let sub2 = arr.subarray(2, 4);
      sub1[0] = 99n;
      expect(sub2[0]).assertEqual(30n);
      expect(sub2[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5100
     * @tc.name testBigInt64ArraySubarrayTwo051
     * @tc.desc Verify three subarrays from same source read their distinct ranges correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let subA = arr.subarray(0, 2);
      let subB = arr.subarray(2, 4);
      let subC = arr.subarray(4, 6);
      expect(subA[1]).assertEqual(2n);
      expect(subB[0]).assertEqual(3n);
      expect(subC[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5200
     * @tc.name testBigInt64ArraySubarrayTwo052
     * @tc.desc Verify adjacent subarrays share the same buffer and boundary is respected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let left = arr.subarray(0, 2);
      let right = arr.subarray(2, 4);
      left[1] = 99n;
      expect(right[1]).assertEqual(4n);
      expect(arr[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5300
     * @tc.name testBigInt64ArraySubarrayTwo053
     * @tc.desc Verify subarray after fill on source reflects the filled values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.fill(100n);
      let sub = arr.subarray(0, 2);
      expect(sub[0]).assertEqual(100n);
      expect(sub[1]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5400
     * @tc.name testBigInt64ArraySubarrayTwo054
     * @tc.desc Verify subarray captures source value changes between multiple operations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let sub = arr.subarray(1, 3);
      arr[1] = 5n;
      expect(sub[0]).assertEqual(5n);
      arr[2] = 10n;
      expect(sub[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5500
     * @tc.name testBigInt64ArraySubarrayTwo055
     * @tc.desc Verify subarray combined with copyWithin: copyWithin on subarray modifies parent buffer in subarray range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 5);
      sub.copyWithin(0, 2);
      expect(arr[1]).assertEqual(40n);
      expect(arr[2]).assertEqual(50n);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5600
     * @tc.name testBigInt64ArraySubarrayTwo056
     * @tc.desc Verify subarray combined with slice: slice of subarray returns independent BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      let sliced = sub.slice(0, 2);
      expect(sliced[0]).assertEqual(20n);
      expect(sliced[1]).assertEqual(30n);
      arr[1] = 99n;
      expect(sliced[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5700
     * @tc.name testBigInt64ArraySubarrayTwo057
     * @tc.desc Verify subarray combined with some: some() predicate correctly tests subarray elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(2, 5);
      let hasEven = sub.some((v: bigint): boolean => v % 2n === 0n);
      expect(hasEven).assertTrue();
      let hasLarge = sub.some((v: bigint): boolean => v > 10n);
      expect(hasLarge).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5800
     * @tc.name testBigInt64ArraySubarrayTwo058
     * @tc.desc Verify subarray combined with sort: sort on subarray reorders parent elements within subarray range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 8n, 1n, 6n]);
      let sub = arr.subarray(1, 4);
      sub.sort();
      expect(sub[0]).assertEqual(1n);
      expect(sub[1]).assertEqual(3n);
      expect(sub[2]).assertEqual(8n);
      expect(arr[1]).assertEqual(1n);
      expect(arr[0]).assertEqual(5n);
      expect(arr[4]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_5900
     * @tc.name testBigInt64ArraySubarrayTwo059
     * @tc.desc Verify subarray combined with toLocaleString: formats only subarray elements with locale.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000n, 2000n, 3000n, 4000n]);
      let sub = arr.subarray(1, 3);
      let result = sub.toLocaleString();
      expect(typeof result).assertEqual('string');
      expect(result.indexOf('2') >= 0).assertTrue();
      expect(result.indexOf('3') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6000
     * @tc.name testBigInt64ArraySubarrayTwo060
     * @tc.desc Verify subarray combined with toReversed: toReversed on subarray returns independent reversed copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      let rev = sub.toReversed();
      expect(rev[0]).assertEqual(40n);
      expect(rev[1]).assertEqual(30n);
      expect(rev[2]).assertEqual(20n);
      arr[1] = 99n;
      expect(rev[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6100
     * @tc.name testBigInt64ArraySubarrayTwo061
     * @tc.desc Verify subarray combined with toSorted: toSorted on subarray returns sorted copy scoped to subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 5n, 1n, 4n, 2n]);
      let sub = arr.subarray(0, 3);
      let sorted = sub.toSorted();
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[1]).assertEqual(3n);
      expect(sorted[2]).assertEqual(5n);
      expect(arr[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6200
     * @tc.name testBigInt64ArraySubarrayTwo062
     * @tc.desc Verify subarray combined with toString: toString on subarray returns comma-separated elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(2, 5);
      let str = sub.toString();
      expect(str).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6300
     * @tc.name testBigInt64ArraySubarrayTwo063
     * @tc.desc Verify subarray combined with valueOf: valueOf returns subarray itself, write-through to parent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      let val = sub.valueOf();
      expect(val).assertEqual(sub);
      val[0] = 99n;
      expect(arr[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6400
     * @tc.name testBigInt64ArraySubarrayTwo064
     * @tc.desc Verify subarray combined with values: values() iterator yields only subarray elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
      expect(iter.next().value).assertEqual(40n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6500
     * @tc.name testBigInt64ArraySubarrayTwo065
     * @tc.desc Verify subarray combined with with: with() on subarray creates independent copy with modified element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      let modified = sub.with(0, 99n);
      expect(modified[0]).assertEqual(99n);
      expect(modified[1]).assertEqual(30n);
      expect(modified[2]).assertEqual(40n);
      expect(sub[0]).assertEqual(20n);
      expect(arr[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6600
     * @tc.name testBigInt64ArraySubarrayTwo066
     * @tc.desc Verify subarray combined with forEach: forEach iterates correct subarray-scoped elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 4);
      let sum: bigint = 0n;
      let count = 0;
      sub.forEach((v: bigint): void => { sum += v; count++; });
      expect(sum).assertEqual(9n);
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6700
     * @tc.name testBigInt64ArraySubarrayTwo067
     * @tc.desc Verify subarray combined with map+filter chain: map then filter on subarray produces correct result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(0, 4);
      let res = sub.map((v: bigint) => v * 2n).filter((v: bigint) => v > 4n);
      expect(res[0]).assertEqual(6n);
      expect(res[1]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6800
     * @tc.name testBigInt64ArraySubarrayTwo068
     * @tc.desc Verify subarray combined with reduce: reduce correctly accumulates subarray-scoped elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(2, 5);
      let result = sub.reduce((acc: bigint, v: bigint) => acc * v, 1n);
      expect(result).assertEqual(60000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_TWO_6900
     * @tc.name testBigInt64ArraySubarrayTwo069
     * @tc.desc Verify subarray combined with every+includes: every and includes check only subarray elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 2n, 4n, 6n, 1n]);
      let sub = arr.subarray(0, 4);
      let allEven = sub.every((v: bigint): boolean => v % 2n === 0n);
      expect(allEven).assertTrue();
      expect(sub.includes(1n)).assertFalse();
      expect(arr.includes(1n)).assertTrue();
    });

  });
}
