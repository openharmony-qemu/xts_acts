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

export default function BigInt64ArrayValues01Test(): void {
  describe('BigInt64ArrayValues01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_0100
     * @tc.name testBigInt64ArrayValuesOne001
     * @tc.desc Verify values iterates a single-element array and reports done after.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(42n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_0200
     * @tc.name testBigInt64ArrayValuesOne002
     * @tc.desc Verify values iterates a two-element array in insertion order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(10n);
      expect(iter.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_0300
     * @tc.name testBigInt64ArrayValuesOne003
     * @tc.desc Verify values iterates a three-element array with all elements correct.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(100n);
      expect(iter.next().value).assertEqual(200n);
      expect(iter.next().value).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_0400
     * @tc.name testBigInt64ArrayValuesOne004
     * @tc.desc Verify values iterates a five-element array with correct count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let iter = arr.values();
      let count = 0;
      let res = iter.next();
      while (!res.done) {
        count++;
        res = iter.next();
      }
      expect(count).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_0500
     * @tc.name testBigInt64ArrayValuesOne005
     * @tc.desc Verify values().next().value returns the first element for a non-empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = new BigInt64Array([42n]).values().next().value;
      expect(val).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_0600
     * @tc.name testBigInt64ArrayValuesOne006
     * @tc.desc Verify values().next().done is false for a non-empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let done = new BigInt64Array([7n]).values().next().done;
      expect(done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_0700
     * @tc.name testBigInt64ArrayValuesOne007
     * @tc.desc Verify values iterates 0n correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_0800
     * @tc.name testBigInt64ArrayValuesOne008
     * @tc.desc Verify values iterates MAX boundary value correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_0900
     * @tc.name testBigInt64ArrayValuesOne009
     * @tc.desc Verify values iterates MIN boundary value correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1000
     * @tc.name testBigInt64ArrayValuesOne010
     * @tc.desc Verify values iterates Number.MAX_SAFE_INTEGER as bigint correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9007199254740991n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1100
     * @tc.name testBigInt64ArrayValuesOne011
     * @tc.desc Verify values iterates an array with MAX, MIN, and 0n in insertion order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(9223372036854775807n);
      expect(iter.next().value).assertEqual(-9223372036854775808n);
      expect(iter.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1200
     * @tc.name testBigInt64ArrayValuesOne012
     * @tc.desc Verify values iterates an all-zero array returning 0n three times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(0n);
      expect(iter.next().value).assertEqual(0n);
      expect(iter.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1300
     * @tc.name testBigInt64ArrayValuesOne013
     * @tc.desc Verify values iterates an alternating positive-negative array in correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n, 3n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(1n);
      expect(iter.next().value).assertEqual(-1n);
      expect(iter.next().value).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1400
     * @tc.name testBigInt64ArrayValuesOne014
     * @tc.desc Verify values iterates a mixed-sign array with negative first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, 0n, 5n, -10n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(-5n);
      expect(iter.next().value).assertEqual(0n);
      expect(iter.next().value).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1500
     * @tc.name testBigInt64ArrayValuesOne015
     * @tc.desc Verify values iterates an array of all negative values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n, -4n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(-1n);
      expect(iter.next().value).assertEqual(-2n);
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1600
     * @tc.name testBigInt64ArrayValuesOne016
     * @tc.desc Verify values iterates an array with large positive power-of-two values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 256n, 65536n, 4294967296n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(1n);
      expect(iter.next().value).assertEqual(256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1700
     * @tc.name testBigInt64ArrayValuesOne017
     * @tc.desc Verify exhausting one iterator does not affect another from the same array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      let iter1 = arr.values();
      let iter2 = arr.values();
      iter1.next();
      iter1.next();
      expect(iter2.next().value).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1800
     * @tc.name testBigInt64ArrayValuesOne018
     * @tc.desc Verify creating a new iterator after consuming the first value gets a fresh start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let iter1 = arr.values();
      iter1.next();
      let iter2 = arr.values();
      expect(iter2.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_1900
     * @tc.name testBigInt64ArrayValuesOne019
     * @tc.desc Verify three independent iterators all start with the correct first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n, 84n]);
      let iter1 = arr.values();
      let iter2 = arr.values();
      let iter3 = arr.values();
      expect(iter1.next().value).assertEqual(42n);
      expect(iter2.next().value).assertEqual(42n);
      expect(iter3.next().value).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2000
     * @tc.name testBigInt64ArrayValuesOne020
     * @tc.desc Verify two iterators stepped alternately keep separate positions and values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let iter1 = arr.values();
      let iter2 = arr.values();
      iter1.next();
      let v1 = iter1.next().value;
      let v2 = iter2.next().value;
      expect(v1).assertEqual(20n);
      expect(v2).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2100
     * @tc.name testBigInt64ArrayValuesOne021
     * @tc.desc Verify two iterators from different arrays are independent of each other.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n]);
      let arr2 = new BigInt64Array([2n]);
      let iter1 = arr1.values();
      let iter2 = arr2.values();
      iter1.next();
      expect(iter2.next().value).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2200
     * @tc.name testBigInt64ArrayValuesOne022
     * @tc.desc Verify repeated next().value returns undefined consistently on exhausted iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.values();
      iter.next();
      expect(iter.next().value).assertUndefined();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2300
     * @tc.name testBigInt64ArrayValuesOne023
     * @tc.desc Verify done reported after exhausting all elements of a 5-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let iter = arr.values();
      for (let i = 0; i < 5; i++) {
        iter.next();
      }
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2400
     * @tc.name testBigInt64ArrayValuesOne024
     * @tc.desc Verify exhausted empty iterator value is undefined on first next().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.values();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2500
     * @tc.name testBigInt64ArrayValuesOne025
     * @tc.desc Verify values on BigInt64Array.of() iterates correctly for a single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(99n);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2600
     * @tc.name testBigInt64ArrayValuesOne026
     * @tc.desc Verify values on BigInt64Array.from() iterates all three elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([10n, 20n, 30n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(10n);
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2700
     * @tc.name testBigInt64ArrayValuesOne027
     * @tc.desc Verify values on a length-constructed array returns 0n for all default elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(0n);
      expect(iter.next().value).assertEqual(0n);
      expect(iter.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2800
     * @tc.name testBigInt64ArrayValuesOne028
     * @tc.desc Verify values on array created by copying another BigInt64Array iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([5n, 6n, 7n]);
      let arr = new BigInt64Array(src);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(5n);
      expect(iter.next().value).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_2900
     * @tc.name testBigInt64ArrayValuesOne029
     * @tc.desc Verify values on array created from an ArrayBuffer iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      arr[0] = 10n;
      arr[1] = 20n;
      let iter = arr.values();
      expect(iter.next().value).assertEqual(10n);
      expect(iter.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3000
     * @tc.name testBigInt64ArrayValuesOne030
     * @tc.desc Verify values on BigInt64Array.from() with a mapping function yields mapped values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([1n, 2n, 3n], (x: bigint) => x * 10n);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(10n);
      expect(iter.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3100
     * @tc.name testBigInt64ArrayValuesOne031
     * @tc.desc Verify iterator reflects a write to an unread element before it is iterated.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let iter = arr.values();
      arr[0] = 99n;
      expect(iter.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3200
     * @tc.name testBigInt64ArrayValuesOne032
     * @tc.desc Verify iterator reflects a write to a future element after advancing once.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter = arr.values();
      iter.next();
      arr[1] = 99n;
      expect(iter.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3300
     * @tc.name testBigInt64ArrayValuesOne033
     * @tc.desc Verify iterator returns the last written value after multiple updates to an unread element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.values();
      arr[1] = 3n;
      arr[1] = 4n;
      iter.next();
      expect(iter.next().value).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3400
     * @tc.name testBigInt64ArrayValuesOne034
     * @tc.desc Verify iterator reflects MAX written to an element before iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let iter = arr.values();
      arr[0] = 9223372036854775807n;
      expect(iter.next().value).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3500
     * @tc.name testBigInt64ArrayValuesOne035
     * @tc.desc Verify iterator reflects MIN written to an element before iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let iter = arr.values();
      arr[0] = -9223372036854775808n;
      expect(iter.next().value).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3600
     * @tc.name testBigInt64ArrayValuesOne036
     * @tc.desc Verify mutation of a later element during iteration is reflected in the later read.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let iter = arr.values();
      iter.next();
      arr[2] = 99n;
      iter.next();
      expect(iter.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3700
     * @tc.name testBigInt64ArrayValuesOne037
     * @tc.desc Verify iterator on a 30-element array reflects mutation of a far future element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(30);
      for (let i = 0; i < 30; i++) {
        arr[i] = BigInt(i);
      }
      let iter = arr.values();
      arr[25] = 999n;
      for (let i = 0; i < 25; i++) {
        iter.next();
      }
      expect(iter.next().value).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3800
     * @tc.name testBigInt64ArrayValuesOne038
     * @tc.desc Verify a while loop with values() on an empty array runs zero times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter = arr.values();
      let count = 0;
      let res = iter.next();
      while (!res.done) {
        count++;
        res = iter.next();
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_3900
     * @tc.name testBigInt64ArrayValuesOne039
     * @tc.desc Verify a partially consumed iterator in a while loop yields only remaining items.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let iter = arr.values();
      iter.next();
      let count = 0;
      let res = iter.next();
      while (!res.done) {
        count++;
        res = iter.next();
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4000
     * @tc.name testBigInt64ArrayValuesOne040
     * @tc.desc Verify while loop over 30-element array counts all 30 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(30);
      for (let i = 0; i < 30; i++) {
        orig[i] = BigInt(i);
      }
      let iter = orig.values();
      let count = 0;
      let res = iter.next();
      while (!res.done) {
        count++;
        res = iter.next();
      }
      expect(count).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4100
     * @tc.name testBigInt64ArrayValuesOne041
     * @tc.desc Verify for-of loop over 30-element array yields the correct last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(30);
      for (let i = 0; i < 30; i++) {
        orig[i] = BigInt(i);
      }
      let last = 0n;
      for (let v of orig.values()) {
        last = v;
      }
      expect(last).assertEqual(29n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4200
     * @tc.name testBigInt64ArrayValuesOne042
     * @tc.desc Verify for-of with break mid-iteration on BigInt64Array stops iterating correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let count = 0;
      for (let val of arr) {
        count++;
        if (count === 3) break;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4300
     * @tc.name testBigInt64ArrayValuesOne043
     * @tc.desc Verify for-of directly on an empty BigInt64Array runs zero times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let count = 0;
      for (let val of arr) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4400
     * @tc.name testBigInt64ArrayValuesOne044
     * @tc.desc Verify for-of over values() preserves MAX boundary value during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = 0n;
      for (let val of arr.values()) {
        res = val;
      }
      expect(res).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4500
     * @tc.name testBigInt64ArrayValuesOne045
     * @tc.desc Verify for-of over values() preserves MIN boundary value during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      let res = 0n;
      for (let val of arr.values()) {
        res = val;
      }
      expect(res).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4600
     * @tc.name testBigInt64ArrayValuesOne046
     * @tc.desc Verify values iterates a 50-element zero-filled array reporting correct count and zeroes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      let iter = arr.values();
      let count = 0;
      let allZero = true;
      let res = iter.next();
      while (!res.done) {
        if (res.value !== 0n) { allZero = false; }
        count++;
        res = iter.next();
      }
      expect(count).assertEqual(50);
      expect(allZero).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4700
     * @tc.name testBigInt64ArrayValuesOne047
     * @tc.desc Verify values on a 20-element programmatic array iterates all values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      for (let i = 0; i < 20; i++) {
        arr[i] = BigInt(i);
      }
      let index = 0;
      for (let v of arr.values()) {
        expect(v).assertEqual(BigInt(index));
        index++;
      }
      expect(index).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4800
     * @tc.name testBigInt64ArrayValuesOne048
     * @tc.desc Verify values on a 30-element array returns the correct middle element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let orig = new BigInt64Array(30);
      for (let i = 0; i < 30; i++) {
        orig[i] = BigInt(i);
      }
      let iter = orig.values();
      for (let i = 0; i < 15; i++) {
        iter.next();
      }
      expect(iter.next().value).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_4900
     * @tc.name testBigInt64ArrayValuesOne049
     * @tc.desc Verify values on array with all MAX values iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n, 9223372036854775807n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(9223372036854775807n);
      expect(iter.next().value).assertEqual(9223372036854775807n);
      expect(iter.next().value).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_5000
     * @tc.name testBigInt64ArrayValuesOne050
     * @tc.desc Verify values on array with all MIN values iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n, -9223372036854775808n]);
      let iter = arr.values();
      expect(iter.next().value).assertEqual(-9223372036854775808n);
      expect(iter.next().value).assertEqual(-9223372036854775808n);
      expect(iter.next().value).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_5100
     * @tc.name testBigInt64ArrayValuesOne051
     * @tc.desc Verify values on array with sequential index-equals-value pattern iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      for (let i = 0; i < 5; i++) {
        arr[i] = BigInt(i);
      }
      let iter = arr.values();
      expect(iter.next().value).assertEqual(0n);
      expect(iter.next().value).assertEqual(1n);
      expect(iter.next().value).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_5200
     * @tc.name testBigInt64ArrayValuesOne052
     * @tc.desc Verify values on array with 100-element descending pattern yields correct first and last.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(99 - i);
      }
      let iter = arr.values();
      expect(iter.next().value).assertEqual(99n);
      for (let i = 0; i < 98; i++) {
        iter.next();
      }
      expect(iter.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_ONE_5300
     * @tc.name testBigInt64ArrayValuesOne053
     * @tc.desc Verify chained values().next().value returns the correct first element of a 3-element of() array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = BigInt64Array.of(7n, 14n, 21n).values().next().value;
      expect(val).assertEqual(7n);
    });

  });
}
