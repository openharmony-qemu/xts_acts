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

export default function BigInt64ArrayFindIndex01Test(): void {
  describe('BigInt64ArrayFindIndex01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_0100
     * @tc.name testBigInt64ArrayFindIndexOne0100
     * @tc.desc Verify findIndex returns -1 for an empty BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v === 1n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_0200
     * @tc.name testBigInt64ArrayFindIndexOne0200
     * @tc.desc Verify findIndex returns 0 for the only maximum positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 9223372036854775807n
      );
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_0300
     * @tc.name testBigInt64ArrayFindIndexOne0300
     * @tc.desc Verify findIndex returns -1 when the only maximum positive value does not match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v !== 9223372036854775807n
      );
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_0400
     * @tc.name testBigInt64ArrayFindIndexOne0400
     * @tc.desc Verify findIndex returns 0 for the only minimum negative value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === -9223372036854775807n - 1n
      );
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_0500
     * @tc.name testBigInt64ArrayFindIndexOne0500
     * @tc.desc Verify findIndex returns -1 when the only minimum negative value does not match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v !== -9223372036854775807n - 1n
      );
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_0600
     * @tc.name testBigInt64ArrayFindIndexOne0600
     * @tc.desc Verify findIndex returns 0 when the only element is zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v === 0n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_0700
     * @tc.name testBigInt64ArrayFindIndexOne0700
     * @tc.desc Verify findIndex returns -1 when zero does not satisfy the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v !== 0n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_0800
     * @tc.name testBigInt64ArrayFindIndexOne0800
     * @tc.desc Verify findIndex returns 0 when the only element is 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v === 1n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_0900
     * @tc.name testBigInt64ArrayFindIndexOne0900
     * @tc.desc Verify findIndex returns -1 when 1n does not satisfy the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v !== 1n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1000
     * @tc.name testBigInt64ArrayFindIndexOne1000
     * @tc.desc Verify findIndex returns 0 when the only element is -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v === -1n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1100
     * @tc.name testBigInt64ArrayFindIndexOne1100
     * @tc.desc Verify findIndex returns -1 when -1n does not satisfy the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v !== -1n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1200
     * @tc.name testBigInt64ArrayFindIndexOne1200
     * @tc.desc Verify findIndex returns index 0 when the predicate matches by index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let idx = arr.findIndex((v: bigint, idx: int, a: BigInt64Array): boolean => idx === 0);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1300
     * @tc.name testBigInt64ArrayFindIndexOne1300
     * @tc.desc Verify findIndex returns index 1 when the predicate matches by index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let idx = arr.findIndex((v: bigint, idx: int, a: BigInt64Array): boolean => idx === 1);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1400
     * @tc.name testBigInt64ArrayFindIndexOne1400
     * @tc.desc Verify findIndex returns index 2 when the predicate matches by index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let idx = arr.findIndex((v: bigint, idx: int, a: BigInt64Array): boolean => idx === 2);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1500
     * @tc.name testBigInt64ArrayFindIndexOne1500
     * @tc.desc Verify findIndex can match by reading values from the callback array parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => a[i] === 2n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1600
     * @tc.name testBigInt64ArrayFindIndexOne1600
     * @tc.desc Verify the callback array parameter references the original array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let isSame = false;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => {
        if (a === arr) {
          isSame = true;
        }
        return false;
      });
      expect(isSame).assertTrue();
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1700
     * @tc.name testBigInt64ArrayFindIndexOne1700
     * @tc.desc Verify findIndex returns the first index when the predicate always returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => true);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1800
     * @tc.name testBigInt64ArrayFindIndexOne1800
     * @tc.desc Verify findIndex returns -1 when the predicate always returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => false);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_1900
     * @tc.name testBigInt64ArrayFindIndexOne1900
     * @tc.desc Verify findIndex returns the first duplicate match at the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 5n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v === 5n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_2000
     * @tc.name testBigInt64ArrayFindIndexOne2000
     * @tc.desc Verify findIndex returns the first duplicate match in the middle of the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 5n, 5n, 2n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v === 5n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_ONE_2100
     * @tc.name testBigInt64ArrayFindIndexOne2100
     * @tc.desc Verify findIndex returns 0 for a leading 0xFFFFn value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexOne2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([65535n, 2n, 3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v === 65535n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_2200
     * @tc.name testBigInt64ArrayFindIndexFour2200
     * @tc.desc Verify findIndex locates the value one less than the maximum positive bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 9223372036854775806n
      );
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_2300
     * @tc.name testBigInt64ArrayFindIndexFour2300
     * @tc.desc Verify findIndex returns minus one when the value one less than max positive does not match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v !== 9223372036854775806n
      );
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_2400
     * @tc.name testBigInt64ArrayFindIndexFour2400
     * @tc.desc Verify findIndex locates the value one greater than the minimum negative bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === -9223372036854775807n
      );
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_2500
     * @tc.name testBigInt64ArrayFindIndexFour2500
     * @tc.desc Verify findIndex returns minus one when the value above minimum negative does not match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v !== -9223372036854775807n
      );
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_2600
     * @tc.name testBigInt64ArrayFindIndexFour2600
     * @tc.desc Verify findIndex locates a large positive bigint value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000000000000000000n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 1000000000000000000n
      );
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_2700
     * @tc.name testBigInt64ArrayFindIndexFour2700
     * @tc.desc Verify findIndex locates a large negative bigint value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1000000000000000000n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === -1000000000000000000n
      );
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_2800
     * @tc.name testBigInt64ArrayFindIndexFour2800
     * @tc.desc Verify findIndex locates the default initialized zero value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v === 0n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_2900
     * @tc.name testBigInt64ArrayFindIndexFour2900
     * @tc.desc Verify findIndex locates the first remaining zero after partial assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 1n;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => v === 0n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_3000
     * @tc.name testBigInt64ArrayFindIndexFour3000
     * @tc.desc Verify findIndex does not evaluate indexes beyond the array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => {
        if (i >= a.length) {
          return true;
        }
        return false;
      });
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_3100
     * @tc.name testBigInt64ArrayFindIndexFour3100
     * @tc.desc Verify findIndex locates the last valid index using the array length boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => i === a.length - 1
      );
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_3200
     * @tc.name testBigInt64ArrayFindIndexFour3200
     * @tc.desc Verify findIndex locates a value through unary negation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array): boolean => -v === 2n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_3300
     * @tc.name testBigInt64ArrayFindIndexFour3300
     * @tc.desc Verify findIndex locates a value through right shift evaluation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 8n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v >> 1n) === 2n
      );
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_3400
     * @tc.name testBigInt64ArrayFindIndexFour3400
     * @tc.desc Verify findIndex locates the first even value through bitwise and.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v & 1n) === 0n
      );
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_3500
     * @tc.name testBigInt64ArrayFindIndexFour3500
     * @tc.desc Verify findIndex locates a value through bitwise or.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 4n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v | 1n) === 5n
      );
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_FOUR_3600
     * @tc.name testBigInt64ArrayFindIndexFour3600
     * @tc.desc Verify findIndex locates a value through bitwise xor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexFour3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v ^ 1n) === 2n
      );
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_3700
     * @tc.name testBigInt64ArrayFindIndexThree3700
     * @tc.desc Verify findIndex propagates a RangeError thrown by the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      try {
        arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
          throw new RangeError('range error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_3800
     * @tc.name testBigInt64ArrayFindIndexThree3800
     * @tc.desc Verify findIndex sees a later element updated to 10n during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        if (i === 0) {
          a[1] = 10n;
        }
        return v === 10n;
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_3900
     * @tc.name testBigInt64ArrayFindIndexThree3900
     * @tc.desc Verify findIndex sees a later element updated to 0n during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        if (i === 0) {
          a[1] = 0n;
        }
        return v === 0n;
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4000
     * @tc.name testBigInt64ArrayFindIndexThree4000
     * @tc.desc Verify findIndex sees a later element updated to -1n during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        if (i === 0) {
          a[1] = -1n;
        }
        return v === -1n;
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4100
     * @tc.name testBigInt64ArrayFindIndexThree4100
     * @tc.desc Verify changing an already visited element does not change traversal order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        if (i === 1) {
          a[0] = 10n;
        }
        return i === 2;
      });
      expect(idx).assertEqual(2);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4200
     * @tc.name testBigInt64ArrayFindIndexThree4200
     * @tc.desc Verify nested findIndex returns the outer index when the inner call finds a match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n]);
      let arr2 = new BigInt64Array([3n, 4n]);
      let idx = arr1.findIndex((v1: bigint, i1: int, a1: BigInt64Array) => {
        let innerIdx = arr2.findIndex((v2: bigint, i2: int, a2: BigInt64Array) => v2 === 4n);
        return innerIdx === 1;
      });
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4300
     * @tc.name testBigInt64ArrayFindIndexThree4300
     * @tc.desc Verify nested findIndex returns the second outer index when the inner call misses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n]);
      let arr2 = new BigInt64Array([3n, 4n]);
      let idx = arr1.findIndex((v1: bigint, i1: int, a1: BigInt64Array) => {
        let innerIdx = arr2.findIndex((v2: bigint, i2: int, a2: BigInt64Array) => v2 === 5n);
        return innerIdx === -1 && i1 === 1;
      });
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4400
     * @tc.name testBigInt64ArrayFindIndexThree4400
     * @tc.desc Verify findIndex locates 99n at index 99 in a 100-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[99] = 99n;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 99n);
      expect(idx).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4500
     * @tc.name testBigInt64ArrayFindIndexThree4500
     * @tc.desc Verify findIndex returns -1 when a 100-element array does not contain 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 1n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4600
     * @tc.name testBigInt64ArrayFindIndexThree4600
     * @tc.desc Verify findIndex returns a number type when it finds a matching element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 1n);
      expect(typeof idx).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4700
     * @tc.name testBigInt64ArrayFindIndexThree4700
     * @tc.desc Verify findIndex returns a number type when no element matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 0n);
      expect(typeof idx).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4800
     * @tc.name testBigInt64ArrayFindIndexThree4800
     * @tc.desc Verify findIndex does not mutate the array when the predicate is read-only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 4n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_4900
     * @tc.name testBigInt64ArrayFindIndexThree4900
     * @tc.desc Verify findIndex returns the first even value index in the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 5n, 2n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v % 2n === 0n);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5000
     * @tc.name testBigInt64ArrayFindIndexThree5000
     * @tc.desc Verify findIndex returns the first odd value index in the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n, 1n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v % 2n !== 0n);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5100
     * @tc.name testBigInt64ArrayFindIndexThree5100
     * @tc.desc Verify findIndex finds the negative value -2n in a negative-valued array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === -2n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5200
     * @tc.name testBigInt64ArrayFindIndexThree5200
     * @tc.desc Verify findIndex returns -1 when searching for non-zero in an all-zero array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v !== 0n);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5300
     * @tc.name testBigInt64ArrayFindIndexThree5300
     * @tc.desc Verify findIndex returns the first index when searching for zero in an all-zero array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 0n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5400
     * @tc.name testBigInt64ArrayFindIndexThree5400
     * @tc.desc Verify shared-buffer views observe each other's updates during findIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr1 = new BigInt64Array(buffer, 0, 2);
      let arr2 = new BigInt64Array(buffer, 0, 2);
      arr1[1] = 99n;
      let idx = arr2.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 99n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5500
     * @tc.name testBigInt64ArrayFindIndexThree5500
     * @tc.desc Verify findIndex reflects the updated result after modifying the array contents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx1 = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 4n);
      expect(idx1).assertEqual(-1);
      arr[2] = 4n;
      let idx2 = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 4n);
      expect(idx2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5600
     * @tc.name testBigInt64ArrayFindIndexThree5600
     * @tc.desc Verify findIndex can match the last element by comparing the current index with length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => i === a.length - 1);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5700
     * @tc.name testBigInt64ArrayFindIndexThree5700
     * @tc.desc Verify findIndex supports combined greater-than and less-than conditions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v > 5n && v < 15n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5800
     * @tc.name testBigInt64ArrayFindIndexThree5800
     * @tc.desc Verify findIndex can combine the element value and index in one predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 1n, 3n, 4n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 1n && i > 0);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_THREE_5900
     * @tc.name testBigInt64ArrayFindIndexThree5900
     * @tc.desc Verify findIndex can use an external target variable in the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexThree5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let target = 2n;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === target);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6000
     * @tc.name testBigInt64ArrayFindIndexTwo6000
     * @tc.desc Verify findIndex locates trailing hexadecimal value 0xFFFFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 65535n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 65535n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6100
     * @tc.name testBigInt64ArrayFindIndexTwo6100
     * @tc.desc Verify findIndex locates hexadecimal value 0xFFFFFFFFn at index zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4294967295n, 2n, 3n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 4294967295n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6200
     * @tc.name testBigInt64ArrayFindIndexTwo6200
     * @tc.desc Verify findIndex locates trailing hexadecimal value 0xFFFFFFFFn.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 4294967295n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 4294967295n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6300
     * @tc.name testBigInt64ArrayFindIndexTwo6300
     * @tc.desc Verify findIndex locates binary value 0b1n in a multi-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 1n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6400
     * @tc.name testBigInt64ArrayFindIndexTwo6400
     * @tc.desc Verify findIndex locates result of expression 1n plus 2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n + 2n]);
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => v === 3n);
      expect(idx).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6500
     * @tc.name testBigInt64ArrayFindIndexTwo6500
     * @tc.desc Verify findIndex stops after matching index one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let count = 0;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        count++;
        return i === 1;
      });
      expect(count).assertEqual(2);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6600
     * @tc.name testBigInt64ArrayFindIndexTwo6600
     * @tc.desc Verify findIndex stops after matching index two.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let count = 0;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        count++;
        return i === 2;
      });
      expect(count).assertEqual(3);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6700
     * @tc.name testBigInt64ArrayFindIndexTwo6700
     * @tc.desc Verify findIndex stops after matching index ten.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let count = 0;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        count++;
        return i === 10;
      });
      expect(count).assertEqual(11);
      expect(idx).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6800
     * @tc.name testBigInt64ArrayFindIndexTwo6800
     * @tc.desc Verify findIndex iterates zero elements for an empty typed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let count = 0;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        count++;
        return false;
      });
      expect(count).assertEqual(0);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_6900
     * @tc.name testBigInt64ArrayFindIndexTwo6900
     * @tc.desc Verify findIndex iterates one element when length is one and no match exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      let count = 0;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        count++;
        return false;
      });
      expect(count).assertEqual(1);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_7000
     * @tc.name testBigInt64ArrayFindIndexTwo7000
     * @tc.desc Verify findIndex iterates all five elements when no match exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let count = 0;
      let idx = arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
        count++;
        return false;
      });
      expect(count).assertEqual(5);
      expect(idx).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_7100
     * @tc.name testBigInt64ArrayFindIndexTwo7100
     * @tc.desc Verify findIndex propagates Error thrown by predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      try {
        arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
          throw new Error('test');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.message).assertEqual('test');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_INDEX_TWO_7200
     * @tc.name testBigInt64ArrayFindIndexTwo7200
     * @tc.desc Verify findIndex propagates TypeError thrown by predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindIndexTwo7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      try {
        arr.findIndex((v: bigint, i: int, a: BigInt64Array) => {
          throw new TypeError('type error');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });
  });
}
