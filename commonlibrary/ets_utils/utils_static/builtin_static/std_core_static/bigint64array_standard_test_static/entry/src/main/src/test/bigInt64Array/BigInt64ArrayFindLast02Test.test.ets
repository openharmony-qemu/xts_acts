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

export default function BigInt64ArrayFindLast02Test(): void {
  describe('BigInt64ArrayFindLast02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_0100
     * @tc.name testBigInt64ArrayFindLastTwo0100
     * @tc.desc Verify findLast returns a bigint type for a matched positive element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.findLast((v: bigint) => v === 20n);
      expect(typeof res).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_0200
     * @tc.name testBigInt64ArrayFindLastTwo0200
     * @tc.desc Verify findLast returns a bigint type for a matched zero element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 10n, 20n]);
      let res = arr.findLast((v: bigint) => v === 0n);
      expect(typeof res).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_0300
     * @tc.name testBigInt64ArrayFindLastTwo0300
     * @tc.desc Verify findLast returns a bigint type for the maximum boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.findLast((v: bigint) => v === 9223372036854775807n);
      expect(typeof res).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_0400
     * @tc.name testBigInt64ArrayFindLastTwo0400
     * @tc.desc Verify findLast returns a bigint type for the minimum boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n - 1n]);
      let res = arr.findLast((v: bigint) => v === -9223372036854775807n - 1n);
      expect(typeof res).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_0500
     * @tc.name testBigInt64ArrayFindLastTwo0500
     * @tc.desc Verify findLast returns an undefined type for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let res = arr.findLast((v: bigint) => true);
      expect(typeof res).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_0600
     * @tc.name testBigInt64ArrayFindLastTwo0600
     * @tc.desc Verify findLast returns an undefined type for an unmatched populated array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.findLast((v: bigint) => v === 4n);
      expect(typeof res).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_0700
     * @tc.name testBigInt64ArrayFindLastTwo0700
     * @tc.desc Verify findLast returns the matched positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let res = arr.findLast((v: bigint) => v === 10n);
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_0800
     * @tc.name testBigInt64ArrayFindLastTwo0800
     * @tc.desc Verify findLast returns the matched negative value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, -10n, -15n]);
      let res = arr.findLast((v: bigint) => v === -10n);
      expect(res).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_0900
     * @tc.name testBigInt64ArrayFindLastTwo0900
     * @tc.desc Verify findLast returns the matched zero value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 0n, -1n]);
      let res = arr.findLast((v: bigint) => v === 0n);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1000
     * @tc.name testBigInt64ArrayFindLastTwo1000
     * @tc.desc Verify findLast returns the maximum boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 9223372036854775807n, 2n]);
      let res = arr.findLast((v: bigint) => v > 100n);
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1100
     * @tc.name testBigInt64ArrayFindLastTwo1100
     * @tc.desc Verify findLast returns the minimum boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -9223372036854775807n - 1n, 2n]);
      let res = arr.findLast((v: bigint) => v < -100n);
      expect(res).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1200
     * @tc.name testBigInt64ArrayFindLastTwo1200
     * @tc.desc Verify findLast returns the last matching duplicate value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 10n, 30n]);
      let res = arr.findLast((v: bigint, i: int) => v === 10n && i > 1);
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1300
     * @tc.name testBigInt64ArrayFindLastTwo1300
     * @tc.desc Verify findLast returns the decimal form of a hexadecimal literal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([31n, 47n]);
      let res = arr.findLast((v: bigint) => v === 47n);
      expect(res).assertEqual(47n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1400
     * @tc.name testBigInt64ArrayFindLastTwo1400
     * @tc.desc Verify findLast returns the last value greater than the threshold.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 8n, 3n, 4n]);
      let res = arr.findLast((v: bigint) => v > 5n);
      expect(res).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1500
     * @tc.name testBigInt64ArrayFindLastTwo1500
     * @tc.desc Verify findLast returns the last value less than the threshold.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -8n, -3n, -4n]);
      let res = arr.findLast((v: bigint) => v < -5n);
      expect(res).assertEqual(-8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1600
     * @tc.name testBigInt64ArrayFindLastTwo1600
     * @tc.desc Verify findLast returns the first element when index zero matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([77n, 88n, 99n]);
      let res = arr.findLast((v: bigint, i: int) => i === 0);
      expect(res).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1700
     * @tc.name testBigInt64ArrayFindLastTwo1700
     * @tc.desc Verify findLast returns the middle element when index one matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([77n, 88n, 99n]);
      let res = arr.findLast((v: bigint, i: int) => i === 1);
      expect(res).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1800
     * @tc.name testBigInt64ArrayFindLastTwo1800
     * @tc.desc Verify findLast returns the tail element when index two matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([77n, 88n, 99n]);
      let res = arr.findLast((v: bigint, i: int) => i === 2);
      expect(res).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_1900
     * @tc.name testBigInt64ArrayFindLastTwo1900
     * @tc.desc Verify findLast returns undefined for values above the upper bound.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.findLast((v: bigint) => v > 9223372036854775807n);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2000
     * @tc.name testBigInt64ArrayFindLastTwo2000
     * @tc.desc Verify findLast returns undefined for values below the lower bound.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, -20n]);
      let res = arr.findLast((v: bigint) => v < -9223372036854775807n - 1n);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2100
     * @tc.name testBigInt64ArrayFindLastTwo2100
     * @tc.desc Verify findLast returns the value for a single matching element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([55n]);
      let res = arr.findLast((v: bigint) => v === 55n);
      expect(res).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2200
     * @tc.name testBigInt64ArrayFindLastTwo2200
     * @tc.desc Verify findLast returns undefined for a single unmatched element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([55n]);
      let res = arr.findLast((v: bigint) => v === 66n);
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2300
     * @tc.name testBigInt64ArrayFindLastTwo2300
     * @tc.desc Verify findLast returns the last element that matches the modulus rule.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([13n, 14n, 15n, 16n, 20n, 25n, 28n, 30n]);
      let res = arr.findLast((v: bigint) => v % 10n === 0n);
      expect(res).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2400
     * @tc.name testBigInt64ArrayFindLastTwo2400
     * @tc.desc Verify findLast returns the expected value in a normal reverse search.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n]);
      let res = arr.findLast((v: bigint) => v === 2n);
      expect(res).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2500
     * @tc.name testBigInt64ArrayFindLastTwo2500
     * @tc.desc Verify findLast matches a value taken from another typed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new BigInt64Array([40n, 50n]);
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res = arr.findLast((v: bigint) => v === source[1]);
      expect(res).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2600
     * @tc.name testBigInt64ArrayFindLastTwo2600
     * @tc.desc Verify findLast preserves byteOffset for an offset view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let arr = new BigInt64Array(buffer, 8, 2);
      arr.findLast((v: bigint) => v === 0n);
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2700
     * @tc.name testBigInt64ArrayFindLastTwo2700
     * @tc.desc Verify findLast preserves the identity of the backing buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer);
      arr.findLast((v: bigint) => true);
      expect(arr.buffer).assertEqual(buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2800
     * @tc.name testBigInt64ArrayFindLastTwo2800
     * @tc.desc Verify findLast passes the original context length to the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n, 7n]);
      arr.findLast((v: bigint, i: int, ctx: BigInt64Array) => {
        expect(ctx.length).assertEqual(3);
        return false;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_2900
     * @tc.name testBigInt64ArrayFindLastTwo2900
     * @tc.desc Verify findLast passes the original tail element to the predicate context.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n, 7n]);
      arr.findLast((v: bigint, i: int, ctx: BigInt64Array) => {
        expect(ctx[2]).assertEqual(7n);
        return false;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3000
     * @tc.name testBigInt64ArrayFindLastTwo3000
     * @tc.desc Verify buffer-backed values stay intact after findLast runs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr = new BigInt64Array(buffer);
      arr[0] = 88n;
      arr[1] = 99n;
      arr.findLast((v: bigint) => v === 88n);
      expect(arr[0]).assertEqual(88n);
      expect(arr[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3100
     * @tc.name testBigInt64ArrayFindLastTwo3100
     * @tc.desc Verify findLast searches only within the subarray range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      let res = sub.findLast((v: bigint) => true);
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3200
     * @tc.name testBigInt64ArrayFindLastTwo3200
     * @tc.desc Verify findLast preserves subarray length after the search.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      sub.findLast((v: bigint) => v === 2n);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3300
     * @tc.name testBigInt64ArrayFindLastTwo3300
     * @tc.desc Verify findLast returns the matched value from a subarray view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      let res = sub.findLast((v: bigint) => v === 20n);
      expect(res).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3400
     * @tc.name testBigInt64ArrayFindLastTwo3400
     * @tc.desc Verify findLast observes shared-buffer updates across sibling views.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr1 = new BigInt64Array(buffer);
      let arr2 = new BigInt64Array(buffer);
      arr1[0] = 5n;
      arr2[0] = 10n;
      let res = arr1.findLast((v: bigint) => v === 10n);
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3500
     * @tc.name testBigInt64ArrayFindLastTwo3500
     * @tc.desc Verify findLast observes earlier mutations during reverse traversal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.findLast((v: bigint, i: int) => {
        if (i === 2) arr[1] = 99n;
        return v === 99n;
      });
      expect(res).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3600
     * @tc.name testBigInt64ArrayFindLastTwo3600
     * @tc.desc Verify findLast ignores mutation of the currently evaluated value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.findLast((v: bigint, i: int) => {
        arr[i] = 99n;
        return v === 99n;
      });
      expect(res).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3700
     * @tc.name testBigInt64ArrayFindLastTwo3700
     * @tc.desc Verify predicate context keeps stable byteOffset and buffer references.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer, 8, 2);
      arr.findLast((v: bigint, i: int, ctx: BigInt64Array) => {
        expect(ctx.byteOffset).assertEqual(8);
        expect(ctx.buffer).assertEqual(buffer);
        return false;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3800
     * @tc.name testBigInt64ArrayFindLastTwo3800
     * @tc.desc Verify findLast visits every element when the predicate is always false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let count = 0;
      arr.findLast((v: bigint) => {
        count++;
        return false;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_3900
     * @tc.name testBigInt64ArrayFindLastTwo3900
     * @tc.desc Verify findLast stops after the first reverse hit when always true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let count = 0;
      arr.findLast((v: bigint) => {
        count++;
        return true;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4000
     * @tc.name testBigInt64ArrayFindLastTwo4000
     * @tc.desc Verify findLast stops after the second reverse visit when index one matches.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let count = 0;
      arr.findLast((v: bigint, i: int) => {
        count++;
        return i === 1;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4100
     * @tc.name testBigInt64ArrayFindLastTwo4100
     * @tc.desc Verify findLast returns the last negative value in a mixed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, -5n, 10n, -10n]);
      let res = arr.findLast((v: bigint) => v < 0n);
      expect(res).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4200
     * @tc.name testBigInt64ArrayFindLastTwo4200
     * @tc.desc Verify findLast returns the last positive value in a mixed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, -5n, 10n, -10n]);
      let res = arr.findLast((v: bigint) => v > 0n);
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4300
     * @tc.name testBigInt64ArrayFindLastTwo4300
     * @tc.desc Verify findLast returns the maximum boundary via arithmetic matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 9223372036854775807n]);
      let res = arr.findLast((v: bigint) => v - 1n > 0n);
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4400
     * @tc.name testBigInt64ArrayFindLastTwo4400
     * @tc.desc Verify findLast returns the minimum boundary via arithmetic matching.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, -9223372036854775807n - 1n]);
      let res = arr.findLast((v: bigint) => v + 1n < 0n);
      expect(res).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4500
     * @tc.name testBigInt64ArrayFindLastTwo4500
     * @tc.desc Verify findLast matches a value captured from a closure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = 42n;
      let arr = new BigInt64Array([10n, 42n, 20n]);
      let res = arr.findLast((v: bigint) => v === target);
      expect(res).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4600
     * @tc.name testBigInt64ArrayFindLastTwo4600
     * @tc.desc Verify findLast starts reverse traversal from the tail index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let firstEvaluatedIndex = -1;
      arr.findLast((v: bigint, i: int) => {
        if (firstEvaluatedIndex === -1) {
          firstEvaluatedIndex = i;
        }
        return false;
      });
      expect(firstEvaluatedIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4700
     * @tc.name testBigInt64ArrayFindLastTwo4700
     * @tc.desc Verify findLast supports nested calls across different arrays.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n]);
      let arr2 = new BigInt64Array([3n, 4n]);
      let res = arr1.findLast((v: bigint) => {
        let subRes = arr2.findLast((sv: bigint) => sv === 4n);
        return subRes === 4n && v === 2n;
      });
      expect(res).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4800
     * @tc.name testBigInt64ArrayFindLastTwo4800
     * @tc.desc Verify findLast supports nested calls on the same array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n, 9n]);
      let res = arr.findLast((v: bigint) => {
        return arr.findLast((sv: bigint) => sv === 9n) === 9n && v === 8n;
      });
      expect(res).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIND_LAST_TWO_4900
     * @tc.name testBigInt64ArrayFindLastTwo4900
     * @tc.desc Verify findLast propagates the thrown error message from the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFindLastTwo4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let error: Error | null = null;
      try {
        arr.findLast((v: bigint) => {
        if (v === 2n) throw new Error('Abort');
        return false;
        });
        expect().assertFail();
      } catch (e) {
        error = e as Error;
      }
      expect(error !== null).assertTrue();
      if (error !== null) {
        expect(error.message).assertEqual('Abort');
      }
    });
  });
}
