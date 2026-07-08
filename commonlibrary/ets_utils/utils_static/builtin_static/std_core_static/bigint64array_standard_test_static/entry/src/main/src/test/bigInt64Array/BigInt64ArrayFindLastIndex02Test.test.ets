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

export default function BigInt64ArrayFindLastIndex02Test(): void {
  describe('BigInt64ArrayFindLastIndex02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_0100
     * @tc.name testBigInt64ArrayFindLastIndexTwo0100
     * @tc.desc Verify findLastIndex precisely matches the maximum signed 64-bit BigInt value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 9223372036854775807n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_0200
     * @tc.name testBigInt64ArrayFindLastIndexTwo0200
     * @tc.desc Verify findLastIndex precisely matches the minimum signed 64-bit BigInt value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === -9223372036854775807n - 1n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_0300
     * @tc.name testBigInt64ArrayFindLastIndexTwo0300
     * @tc.desc Verify findLastIndex locates the positive value when searching values greater than zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v > 0n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_0400
     * @tc.name testBigInt64ArrayFindLastIndexTwo0400
     * @tc.desc Verify findLastIndex locates the negative minimum when searching values below zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n, 0n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v < 0n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_0500
     * @tc.name testBigInt64ArrayFindLastIndexTwo0500
     * @tc.desc Verify findLastIndex finds the positive extreme in an alternating extremes array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v > 0n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_0600
     * @tc.name testBigInt64ArrayFindLastIndexTwo0600
     * @tc.desc Verify findLastIndex finds the negative extreme in an alternating extremes array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775807n - 1n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v < 0n
      );
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_0700
     * @tc.name testBigInt64ArrayFindLastIndexTwo0700
     * @tc.desc Verify findLastIndex matches the second-largest value next to the maximum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 9223372036854775807n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 9223372036854775806n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_0800
     * @tc.name testBigInt64ArrayFindLastIndexTwo0800
     * @tc.desc Verify findLastIndex matches the second-smallest value next to the minimum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -9223372036854775807n - 1n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === -9223372036854775807n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_0900
     * @tc.name testBigInt64ArrayFindLastIndexTwo0900
     * @tc.desc Verify findLastIndex matches a large power-of-ten BigInt value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n ** 18n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 1000000000000000000n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1000
     * @tc.name testBigInt64ArrayFindLastIndexTwo1000
     * @tc.desc Verify findLastIndex matches the maximum odd value using bitwise and.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v & 1n) === 1n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1100
     * @tc.name testBigInt64ArrayFindLastIndexTwo1100
     * @tc.desc Verify findLastIndex matches the negative minimum even value using bitwise and.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v & 1n) === 0n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1200
     * @tc.name testBigInt64ArrayFindLastIndexTwo1200
     * @tc.desc Verify findLastIndex matches a value using bitwise or.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([15n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v | 0n) === 15n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1300
     * @tc.name testBigInt64ArrayFindLastIndexTwo1300
     * @tc.desc Verify findLastIndex matches a value using bitwise xor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v ^ 15n) === 5n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1400
     * @tc.name testBigInt64ArrayFindLastIndexTwo1400
     * @tc.desc Verify findLastIndex matches the maximum value produced by arithmetic.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n + 1n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 9223372036854775807n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1500
     * @tc.name testBigInt64ArrayFindLastIndexTwo1500
     * @tc.desc Verify findLastIndex matches the maximum value created from a hexadecimal string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BigInt('0x7FFFFFFFFFFFFFFF')]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 9223372036854775807n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1600
     * @tc.name testBigInt64ArrayFindLastIndexTwo1600
     * @tc.desc Verify findLastIndex matches an octal value created from a string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BigInt('0o77')]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 63n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1700
     * @tc.name testBigInt64ArrayFindLastIndexTwo1700
     * @tc.desc Verify findLastIndex matches a binary value created from a string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BigInt('0b11')]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => v === 3n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1800
     * @tc.name testBigInt64ArrayFindLastIndexTwo1800
     * @tc.desc Verify findLastIndex matches a value using right shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n, 8n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v >> 1n) === 2n
      );
      expect(index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_1900
     * @tc.name testBigInt64ArrayFindLastIndexTwo1900
     * @tc.desc Verify findLastIndex matches a value using left shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([4n, 8n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => (v << 1n) === 16n
      );
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_2000
     * @tc.name testBigInt64ArrayFindLastIndexTwo2000
     * @tc.desc Verify findLastIndex matches a value using bitwise not.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, -1n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => ~v === 0n
      );
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_INDEX_TWO_2100
     * @tc.name testBigInt64ArrayFindLastIndexTwo2100
     * @tc.desc Verify findLastIndex matches a value by negating a negative BigInt.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastIndexTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let index = arr.findLastIndex(
        (v: bigint, i: int, a: BigInt64Array): boolean => -v === 2n
      );
      expect(index).assertEqual(1);
    });
  });
}
