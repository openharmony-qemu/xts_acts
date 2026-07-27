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

export default function BigInt64ArraySubarray01Test(): void {
  describe('BigInt64ArraySubarray01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_0100
     * @tc.name testBigInt64ArraySubarrayOne001
     * @tc.desc Verify subarray() returns all elements with same values as the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray();
      expect(sub[0]).assertEqual(1n);
      expect(sub[1]).assertEqual(2n);
      expect(sub[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_0200
     * @tc.name testBigInt64ArraySubarrayOne002
     * @tc.desc Verify subarray() returns a view with the same length as the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray();
      expect(sub[0]).assertEqual(1n);
      expect(sub[3]).assertEqual(4n);
      expect(sub.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_0300
     * @tc.name testBigInt64ArraySubarrayOne003
     * @tc.desc Verify subarray(0) starts from the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let sub = arr.subarray(0);
      expect(sub[0]).assertEqual(5n);
      expect(sub[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_0400
     * @tc.name testBigInt64ArraySubarrayOne004
     * @tc.desc Verify subarray(1) starts from the second element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let sub = arr.subarray(1);
      expect(sub[0]).assertEqual(10n);
      expect(sub[1]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_0500
     * @tc.name testBigInt64ArraySubarrayOne005
     * @tc.desc Verify subarray(2) starts from the third element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 20n]);
      let sub = arr.subarray(2);
      expect(sub[0]).assertEqual(15n);
      expect(sub[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_0600
     * @tc.name testBigInt64ArraySubarrayOne006
     * @tc.desc Verify subarray(length) returns an empty subarray where OOB access throws RangeError when begin equals length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(3);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_0700
     * @tc.name testBigInt64ArraySubarrayOne007
     * @tc.desc Verify subarray(length-1) returns the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(2);
      expect(sub[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_0800
     * @tc.name testBigInt64ArraySubarrayOne008
     * @tc.desc Verify subarray(-1) returns only the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(-1);
      expect(sub[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_0900
     * @tc.name testBigInt64ArraySubarrayOne009
     * @tc.desc Verify subarray(-2) returns the last two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(-2);
      expect(sub[0]).assertEqual(30n);
      expect(sub[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1000
     * @tc.name testBigInt64ArraySubarrayOne010
     * @tc.desc Verify subarray(-length) returns all elements (begin clamped to 0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n, 21n]);
      let sub = arr.subarray(-3);
      expect(sub[0]).assertEqual(7n);
      expect(sub[2]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1100
     * @tc.name testBigInt64ArraySubarrayOne011
     * @tc.desc Verify subarray(0, 2) returns the first two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(0, 2);
      expect(sub[0]).assertEqual(1n);
      expect(sub[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1200
     * @tc.name testBigInt64ArraySubarrayOne012
     * @tc.desc Verify subarray(1, 3) returns the middle two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      expect(sub[0]).assertEqual(20n);
      expect(sub[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1300
     * @tc.name testBigInt64ArraySubarrayOne013
     * @tc.desc Verify subarray(0, length) returns all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let sub = arr.subarray(0, 3);
      expect(sub[0]).assertEqual(5n);
      expect(sub[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1400
     * @tc.name testBigInt64ArraySubarrayOne014
     * @tc.desc Verify subarray(1, length-1) returns the middle portion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 4);
      expect(sub[0]).assertEqual(2n);
      expect(sub[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1500
     * @tc.name testBigInt64ArraySubarrayOne015
     * @tc.desc Verify subarray(0, 1) returns only the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n]);
      let sub = arr.subarray(0, 1);
      expect(sub[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1600
     * @tc.name testBigInt64ArraySubarrayOne016
     * @tc.desc Verify subarray(length-1, length) returns the last element only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(3, 4);
      expect(sub[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1700
     * @tc.name testBigInt64ArraySubarrayOne017
     * @tc.desc Verify subarray(-1, length) returns the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(-1, 3);
      expect(sub[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1800
     * @tc.name testBigInt64ArraySubarrayOne018
     * @tc.desc Verify subarray(-2, length) returns the last two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(-2, 4);
      expect(sub[0]).assertEqual(30n);
      expect(sub[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_1900
     * @tc.name testBigInt64ArraySubarrayOne019
     * @tc.desc Verify subarray(-3, length) on 5-element array returns last three.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(-3, 5);
      expect(sub[0]).assertEqual(3n);
      expect(sub[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2000
     * @tc.name testBigInt64ArraySubarrayOne020
     * @tc.desc Verify subarray(-(length+1), length) negative beyond length clamps to 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-4, 3);
      expect(sub[2]).assertEqual(3n);
      expect(sub[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2100
     * @tc.name testBigInt64ArraySubarrayOne021
     * @tc.desc Verify subarray(0, 3) on a 5-element array returns exactly 3 elements from index 0 to 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(0, 3);
      expect(sub[0]).assertEqual(10n);
      expect(sub[1]).assertEqual(20n);
      expect(sub[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2200
     * @tc.name testBigInt64ArraySubarrayOne022
     * @tc.desc Verify subarray(-1, -1) same negative begin and end returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-1, -1);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2300
     * @tc.name testBigInt64ArraySubarrayOne023
     * @tc.desc Verify subarray(-2, -1) returns the second-to-last element only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(-2, -1);
      expect(sub[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2400
     * @tc.name testBigInt64ArraySubarrayOne024
     * @tc.desc Verify subarray(-3, length-1) negative begin, computed positive end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(-3, 4);
      expect(sub[0]).assertEqual(3n);
      expect(sub[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2500
     * @tc.name testBigInt64ArraySubarrayOne025
     * @tc.desc Verify subarray(0, -1) excludes the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(0, -1);
      expect(sub[0]).assertEqual(1n);
      expect(sub[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2600
     * @tc.name testBigInt64ArraySubarrayOne026
     * @tc.desc Verify subarray(1, -1) from index 1, excludes the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, -1);
      expect(sub[0]).assertEqual(20n);
      expect(sub[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2700
     * @tc.name testBigInt64ArraySubarrayOne027
     * @tc.desc Verify subarray(0, -2) excludes the last two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(0, -2);
      expect(sub[0]).assertEqual(1n);
      expect(sub[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2800
     * @tc.name testBigInt64ArraySubarrayOne028
     * @tc.desc Verify subarray(2, -1) from index 2, excludes the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(2, -1);
      expect(sub[0]).assertEqual(3n);
      expect(sub[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_2900
     * @tc.name testBigInt64ArraySubarrayOne029
     * @tc.desc Verify subarray(0, -(length-1)) end resolves to 1, returns first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(0, -2);
      expect(sub[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3000
     * @tc.name testBigInt64ArraySubarrayOne030
     * @tc.desc Verify subarray(1, -100) far negative end makes end < begin, returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1, -100);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3100
     * @tc.name testBigInt64ArraySubarrayOne031
     * @tc.desc Verify subarray(-3, -1) double negative returns two elements before last.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(-3, -1);
      expect(sub[0]).assertEqual(3n);
      expect(sub[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3200
     * @tc.name testBigInt64ArraySubarrayOne032
     * @tc.desc Verify subarray(3, 1) begin > end returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(3, 1);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3300
     * @tc.name testBigInt64ArraySubarrayOne033
     * @tc.desc Verify subarray(length, 0) begin at length returns empty regardless of end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(3, 0);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3400
     * @tc.name testBigInt64ArraySubarrayOne034
     * @tc.desc Verify subarray(-1, -2) negative begin > negative end returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-1, -2);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3500
     * @tc.name testBigInt64ArraySubarrayOne035
     * @tc.desc Verify subarray(2, 2) with begin equals end (start == end, complementary to start > end) returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(2, 2);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3600
     * @tc.name testBigInt64ArraySubarrayOne036
     * @tc.desc Verify subarray(10, 15) begin beyond length returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(10, 15);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3700
     * @tc.name testBigInt64ArraySubarrayOne037
     * @tc.desc Verify subarray(0, 100) end > length is clamped to length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 100);
      expect(sub[0]).assertEqual(1n);
      expect(sub[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3800
     * @tc.name testBigInt64ArraySubarrayOne038
     * @tc.desc Verify subarray(-10, -9) both far negative clamped to 0, returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-10, -9);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_3900
     * @tc.name testBigInt64ArraySubarrayOne039
     * @tc.desc Verify subarray(-1, 0) resolved begin=length-1 > end=0 returns empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-1, 0);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_4000
     * @tc.name testBigInt64ArraySubarrayOne040
     * @tc.desc Verify subarray(1, 10) end > length is clamped to length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1, 10);
      expect(sub[1]).assertEqual(3n);
      expect(sub[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_4100
     * @tc.name testBigInt64ArraySubarrayOne041
     * @tc.desc Verify subarray(0, 1) on a 5-element array returns only the first element as a single-element subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(0, 1);
      expect(sub[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_4200
     * @tc.name testBigInt64ArraySubarrayOne042
     * @tc.desc Verify subarray(2, 3) with both begin and end positive and within range returns a single-element subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(2, 3);
      expect(sub[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_4300
     * @tc.name testBigInt64ArraySubarrayOne043
     * @tc.desc Verify subarray with begin=2 returns elements from index 2 to end of array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(2);
      expect(sub[0]).assertEqual(3n);
      expect(sub[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_4400
     * @tc.name testBigInt64ArraySubarrayOne044
     * @tc.desc Verify subarray(1, arr.length - 1) uses expression for end, returning elements from index 1 to second-to-last.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, arr.length - 1);
      expect(sub[0]).assertEqual(20n);
      expect(sub[1]).assertEqual(30n);
      expect(sub[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_4500
     * @tc.name testBigInt64ArraySubarrayOne045
     * @tc.desc Verify subarray with begin=2, end=4 returns elements from index 2 to 3 inclusive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(2, 4);
      expect(sub[0]).assertEqual(3n);
      expect(sub[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_ONE_4600
     * @tc.name testBigInt64ArraySubarrayOne046
     * @tc.desc Verify single-element array subarray(0) returns the element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n]);
      let sub = arr.subarray(0);
      expect(sub[0]).assertEqual(99n);
    });

  });
}
