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
  afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level,
  Size, TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function BigInt64ArrayFindLastIndex01Test(): void {
  describe('BigInt64ArrayFindLastIndex01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_0100
     * @tc.name testBigInt64ArrayFindLastIndexOne0100
     * @tc.desc Verify findLastIndex returns -1 for an empty BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 1n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_0200
     * @tc.name testBigInt64ArrayFindLastIndexOne0200
     * @tc.desc Verify findLastIndex returns 0 when the only element matches the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 1n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_0300
     * @tc.name testBigInt64ArrayFindLastIndexOne0300
     * @tc.desc Verify findLastIndex returns -1 when the only element does not match the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 2n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_0400
     * @tc.name testBigInt64ArrayFindLastIndexOne0400
     * @tc.desc Verify findLastIndex returns the last index in a two-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 2n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_0500
     * @tc.name testBigInt64ArrayFindLastIndexOne0500
     * @tc.desc Verify findLastIndex returns the first index when only the head element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 1n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_0600
     * @tc.name testBigInt64ArrayFindLastIndexOne0600
     * @tc.desc Verify findLastIndex returns the greatest matching index for duplicate elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 1n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_0700
     * @tc.name testBigInt64ArrayFindLastIndexOne0700
     * @tc.desc Verify findLastIndex returns the tail index in a multi-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 3n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_0800
     * @tc.name testBigInt64ArrayFindLastIndexOne0800
     * @tc.desc Verify findLastIndex returns the middle index when only the middle element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 2n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_0900
     * @tc.name testBigInt64ArrayFindLastIndexOne0900
     * @tc.desc Verify findLastIndex returns the last repeated occurrence in a mixed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 2n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1000
     * @tc.name testBigInt64ArrayFindLastIndexOne1000
     * @tc.desc Verify findLastIndex returns the final index when all elements are the same.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 5n, 5n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 5n);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1100
     * @tc.name testBigInt64ArrayFindLastIndexOne1100
     * @tc.desc Verify findLastIndex returns the last element greater than the threshold.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v > 2n);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1200
     * @tc.name testBigInt64ArrayFindLastIndexOne1200
     * @tc.desc Verify findLastIndex returns the last element lower than the threshold.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 4n, 3n, 2n, 1n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v < 4n);
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1300
     * @tc.name testBigInt64ArrayFindLastIndexOne1300
     * @tc.desc Verify findLastIndex returns the last positive element in alternating signs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n, -2n, 2n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v > 0n);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1400
     * @tc.name testBigInt64ArrayFindLastIndexOne1400
     * @tc.desc Verify findLastIndex returns the last negative element in alternating signs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 1n, -2n, 2n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v < 0n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1500
     * @tc.name testBigInt64ArrayFindLastIndexOne1500
     * @tc.desc Verify findLastIndex returns -1 when no non-zero element exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v !== 0n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1600
     * @tc.name testBigInt64ArrayFindLastIndexOne1600
     * @tc.desc Verify findLastIndex returns the last index in a larger sequential array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 10n);
      expect(idx).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1700
     * @tc.name testBigInt64ArrayFindLastIndexOne1700
     * @tc.desc Verify findLastIndex returns -1 when no element in a larger array matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v > 10n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1800
     * @tc.name testBigInt64ArrayFindLastIndexOne1800
     * @tc.desc Verify findLastIndex returns the last even element in the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v % 2n === 0n);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_1900
     * @tc.name testBigInt64ArrayFindLastIndexOne1900
     * @tc.desc Verify findLastIndex returns the last odd element in the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 6n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v % 2n !== 0n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2000
     * @tc.name testBigInt64ArrayFindLastIndexOne2000
     * @tc.desc Verify findLastIndex can match a specific leading index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint, i: int): boolean => i === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2100
     * @tc.name testBigInt64ArrayFindLastIndexOne2100
     * @tc.desc Verify findLastIndex can match a specific trailing index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint, i: int): boolean => i === 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2200
     * @tc.name testBigInt64ArrayFindLastIndexOne2200
     * @tc.desc Verify findLastIndex supports combined value and index conditions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 2n, 2n]);
      let idx = arr.findLastIndex((v: bigint, i: int): boolean => v === 2n && i === 1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2300
     * @tc.name testBigInt64ArrayFindLastIndexOne2300
     * @tc.desc Verify findLastIndex returns -1 when combined value and index conditions fail.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 2n, 2n]);
      let idx = arr.findLastIndex((v: bigint, i: int): boolean => v === 3n && i === 1);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2400
     * @tc.name testBigInt64ArrayFindLastIndexOne2400
     * @tc.desc Verify findLastIndex can read the current array element inside the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => a[i] === 2n
      );
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2500
     * @tc.name testBigInt64ArrayFindLastIndexOne2500
     * @tc.desc Verify findLastIndex can use the current array length inside the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => a.length === 3
      );
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2600
     * @tc.name testBigInt64ArrayFindLastIndexOne2600
     * @tc.desc Verify findLastIndex returns -1 for a callback that checks an impossible length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => a.length === 0
      );
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2700
     * @tc.name testBigInt64ArrayFindLastIndexOne2700
     * @tc.desc Verify findLastIndex returns the last index for an always-true predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === v);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2800
     * @tc.name testBigInt64ArrayFindLastIndexOne2800
     * @tc.desc Verify findLastIndex returns -1 for an always-false predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v !== v);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_2900
     * @tc.name testBigInt64ArrayFindLastIndexOne2900
     * @tc.desc Verify findLastIndex returns the last matching index in the second half.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n, 2n, 2n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 2n);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3000
     * @tc.name testBigInt64ArrayFindLastIndexOne3000
     * @tc.desc Verify findLastIndex returns the last matching index in the first half.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 1n, 2n, 2n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 1n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3100
     * @tc.name testBigInt64ArrayFindLastIndexOne3100
     * @tc.desc Verify findLastIndex supports multiplication-based predicate checks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v * v === 9n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3200
     * @tc.name testBigInt64ArrayFindLastIndexOne3200
     * @tc.desc Verify findLastIndex supports addition-based predicate checks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v + 1n === 3n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3300
     * @tc.name testBigInt64ArrayFindLastIndexOne3300
     * @tc.desc Verify findLastIndex supports subtraction-based predicate checks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v - 1n === 0n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3400
     * @tc.name testBigInt64ArrayFindLastIndexOne3400
     * @tc.desc Verify findLastIndex supports division-based predicate checks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v / 2n === 2n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3500
     * @tc.name testBigInt64ArrayFindLastIndexOne3500
     * @tc.desc Verify findLastIndex returns the final repeated large value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 100n, 100n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v > 50n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3600
     * @tc.name testBigInt64ArrayFindLastIndexOne3600
     * @tc.desc Verify findLastIndex returns the final repeated negative value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, -100n, -100n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v < -50n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3700
     * @tc.name testBigInt64ArrayFindLastIndexOne3700
     * @tc.desc Verify findLastIndex matches values equal to their indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n]);
      let idx = arr.findLastIndex((v: bigint, i: int): boolean => v === BigInt(i));
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3800
     * @tc.name testBigInt64ArrayFindLastIndexOne3800
     * @tc.desc Verify findLastIndex returns -1 when no value equals its index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findLastIndex((v: bigint, i: int): boolean => v === BigInt(i));
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_3900
     * @tc.name testBigInt64ArrayFindLastIndexOne3900
     * @tc.desc Verify findLastIndex returns 0 for a single zero element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let idx = arr.findLastIndex((v: bigint): boolean => v === 0n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_ONE_4000
     * @tc.name testBigInt64ArrayFindLastIndexOne4000
     * @tc.desc Verify findLastIndex returns an int result for a matching element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexOne4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res: int = arr.findLastIndex((v: bigint): boolean => v === 1n);
      expect(res).assertEqual(0);
    });
  });
}
