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

const BIGINT64_MAX = 9223372036854775807n;
const BIGINT64_MIN = -9223372036854775807n - 1n;
const BIGINT64_NEAR_MAX = 9223372036854775806n;
const BIGINT64_NEAR_MIN = -9223372036854775807n;
const UINT64_MAX = 18446744073709551615n;
const UINT64_MIN_WRAP = -18446744073709551616n;
const UINT32_MASK = 4294967295n;
const SHIFT_LEFT_63 = 1n << 63n;
const SHIFT_LEFT_64 = 1n << 64n;

export default function BigInt64ArrayMap01Test(): void {
  describe('BigInt64ArrayMap01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0100
     * @tc.name testBigInt64ArrayMapOne001
     * @tc.desc Verify map accepts a zero-arity callback and returns a new array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let mapped = arr.map(() => 5n);
      expect(mapped[0]).assertEqual(5n);
      expect(mapped[1]).assertEqual(5n);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0200
     * @tc.name testBigInt64ArrayMapOne002
     * @tc.desc Verify map accepts a one-parameter callback and returns mapped
     * values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(11n);
      expect(mapped[1]).assertEqual(21n);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0300
     * @tc.name testBigInt64ArrayMapOne003
     * @tc.desc Verify map accepts a two-parameter callback with value and index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let mapped = arr.map((v, i) => v + BigInt(i));
      expect(mapped[0]).assertEqual(10n);
      expect(mapped[1]).assertEqual(21n);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0400
     * @tc.name testBigInt64ArrayMapOne004
     * @tc.desc Verify map accepts a three-parameter callback with array access.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let mapped = arr.map((v, i, a) => v + BigInt(a.length));
      expect(mapped[0]).assertEqual(12n);
      expect(mapped[1]).assertEqual(22n);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0500
     * @tc.name testBigInt64ArrayMapOne005
     * @tc.desc Verify map skips callback execution for an empty array and
     * returns an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let executed = false;
      let mapped = arr.map((v) => {
        executed = true;
        return v;
      });
      expect(executed).assertEqual(false);
      expect(mapped.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0600
     * @tc.name testBigInt64ArrayMapOne006
     * @tc.desc Verify map increments a single 0n element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0700
     * @tc.name testBigInt64ArrayMapOne007
     * @tc.desc Verify map increments a single 1n element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0800
     * @tc.name testBigInt64ArrayMapOne008
     * @tc.desc Verify map increments a single -1n element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0900
     * @tc.name testBigInt64ArrayMapOne009
     * @tc.desc Verify map reaches the maximum value from a near-maximum input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_NEAR_MAX]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_1000
     * @tc.name testBigInt64ArrayMapOne010
     * @tc.desc Verify map increments the minimum value boundary input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MIN]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(BIGINT64_NEAR_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_1200
     * @tc.name testBigInt64ArrayMapOne012
     * @tc.desc Verify map increments two different positive elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_1300
     * @tc.name testBigInt64ArrayMapOne013
     * @tc.desc Verify map increments two different negative elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(0n);
      expect(mapped[1]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_1400
     * @tc.name testBigInt64ArrayMapOne014
     * @tc.desc Verify map increments near-limit positive elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_NEAR_MAX, BIGINT64_NEAR_MAX]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(BIGINT64_MAX);
      expect(mapped[1]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_1800
     * @tc.name testBigInt64ArrayMapOne018
     * @tc.desc Verify map handles a longer element sequence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n, 400n, 500n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped.length).assertEqual(5);
      expect(mapped[4]).assertEqual(501n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_1900
     * @tc.name testBigInt64ArrayMapOne019
     * @tc.desc Verify map handles a large positive element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10000000000n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(10000000001n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_2000
     * @tc.name testBigInt64ArrayMapOne020
     * @tc.desc Verify map handles a large negative element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10000000000n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(-9999999999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_2200
     * @tc.name testBigInt64ArrayMapOne022
     * @tc.desc Verify map returns the constant 0n for every element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => 0n);
      expect(mapped[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_2300
     * @tc.name testBigInt64ArrayMapOne023
     * @tc.desc Verify map returns the constant 1n for every element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => 1n);
      expect(mapped[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_2400
     * @tc.name testBigInt64ArrayMapOne024
     * @tc.desc Verify map returns the constant -1n for every element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => -1n);
      expect(mapped[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_2500
     * @tc.name testBigInt64ArrayMapOne025
     * @tc.desc Verify map returns the maximum constant value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => BIGINT64_MAX);
      expect(mapped[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_2600
     * @tc.name testBigInt64ArrayMapOne026
     * @tc.desc Verify map returns the minimum constant value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => BIGINT64_MIN);
      expect(mapped[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_2900
     * @tc.name testBigInt64ArrayMapOne029
     * @tc.desc Verify map returns a small hexadecimal constant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => 10n);
      expect(mapped[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_3000
     * @tc.name testBigInt64ArrayMapOne030
     * @tc.desc Verify map returns a negative hexadecimal constant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => -10n);
      expect(mapped[0]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_5600
     * @tc.name testBigInt64ArrayMapOne056
     * @tc.desc Verify map preserves values when adding 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v + 0n);
      expect(mapped[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_5700
     * @tc.name testBigInt64ArrayMapOne057
     * @tc.desc Verify map offsets values by adding 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_5800
     * @tc.name testBigInt64ArrayMapOne058
     * @tc.desc Verify map offsets values by subtracting 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v - 1n);
      expect(mapped[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_5900
     * @tc.name testBigInt64ArrayMapOne059
     * @tc.desc Verify map collapses values to 0n by multiplying by 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v * 0n);
      expect(mapped[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_6100
     * @tc.name testBigInt64ArrayMapOne061
     * @tc.desc Verify map flips the sign by multiplying by -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v * -1n);
      expect(mapped[0]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_6400
     * @tc.name testBigInt64ArrayMapOne064
     * @tc.desc Verify map performs integer division with truncation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v / 2n);
      expect(mapped[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_6500
     * @tc.name testBigInt64ArrayMapOne065
     * @tc.desc Verify map computes modulo with a positive divisor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v % 3n);
      expect(mapped[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_6700
     * @tc.name testBigInt64ArrayMapOne067
     * @tc.desc Verify map squares each value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v ** 2n);
      expect(mapped[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_6900
     * @tc.name testBigInt64ArrayMapOne069
     * @tc.desc Verify map extracts the lowest bit with AND 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v & 1n);
      expect(mapped[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_7100
     * @tc.name testBigInt64ArrayMapOne071
     * @tc.desc Verify map changes the last bit with OR 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v | 1n);
      expect(mapped[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_7300
     * @tc.name testBigInt64ArrayMapOne073
     * @tc.desc Verify map flips the lowest bit with XOR 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v ^ 1n);
      expect(mapped[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_7500
     * @tc.name testBigInt64ArrayMapOne075
     * @tc.desc Verify map applies bitwise NOT to each value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => ~v);
      expect(mapped[0]).assertEqual(-11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_7600
     * @tc.name testBigInt64ArrayMapOne076
     * @tc.desc Verify map shifts each value left by one bit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v << 1n);
      expect(mapped[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_7800
     * @tc.name testBigInt64ArrayMapOne078
     * @tc.desc Verify map shifts each value right by one bit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v >> 1n);
      expect(mapped[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_8000
     * @tc.name testBigInt64ArrayMapOne080
     * @tc.desc Verify map adds a near-maximum offset without overflow.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v + 9223372036854775797n);
      expect(mapped[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_8100
     * @tc.name testBigInt64ArrayMapOne081
     * @tc.desc Verify map subtracts a near-limit value toward the minimum
     * boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v - 9223372036854775798n);
      expect(mapped[0]).assertEqual(-9223372036854775788n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_8200
     * @tc.name testBigInt64ArrayMapOne082
     * @tc.desc Verify map returns the callback index as BigInt.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => BigInt(index));
      expect(mapped[0]).assertEqual(0n);
      expect(mapped[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_8400
     * @tc.name testBigInt64ArrayMapOne084
     * @tc.desc Verify map returns callback index plus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => BigInt(index + 1));
      expect(mapped[0]).assertEqual(1n);
      expect(mapped[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_8500
     * @tc.name testBigInt64ArrayMapOne085
     * @tc.desc Verify map returns callback index minus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => BigInt(index - 1));
      expect(mapped[0]).assertEqual(-1n);
      expect(mapped[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_8700
     * @tc.name testBigInt64ArrayMapOne087
     * @tc.desc Verify map returns the source array length for each element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, i, a) => BigInt(a.length));
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_8900
     * @tc.name testBigInt64ArrayMapOne089
     * @tc.desc Verify map returns the first source element for every position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, i, a) => a[0]);
      expect(mapped[0]).assertEqual(100n);
      expect(mapped[1]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_9100
     * @tc.name testBigInt64ArrayMapOne091
     * @tc.desc Verify map combines each value with its callback index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => v + BigInt(index));
      expect(mapped[0]).assertEqual(100n);
      expect(mapped[1]).assertEqual(201n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_9300
     * @tc.name testBigInt64ArrayMapOne093
     * @tc.desc Verify map subtracts the callback index from each value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => v - BigInt(index));
      expect(mapped[0]).assertEqual(100n);
      expect(mapped[1]).assertEqual(199n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_9900
     * @tc.name testBigInt64ArrayMapOne099
     * @tc.desc Verify map shifts values left by the callback index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => v << BigInt(index));
      expect(mapped[0]).assertEqual(100n);
      expect(mapped[1]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_10100
     * @tc.name testBigInt64ArrayMapOne101
     * @tc.desc Verify map captures an external positive variable in the
     * callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let ext = 5n;
      let mapped = arr.map((v) => v + ext);
      expect(mapped[0]).assertEqual(6n);
      expect(mapped[1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_10200
     * @tc.name testBigInt64ArrayMapOne102
     * @tc.desc Verify map captures an external negative variable in the
     * callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let ext = -5n;
      let mapped = arr.map((v) => v + ext);
      expect(mapped[0]).assertEqual(-4n);
      expect(mapped[1]).assertEqual(-3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_10300
     * @tc.name testBigInt64ArrayMapOne103
     * @tc.desc Verify map uses an external constant multiplier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      const c = 10n;
      let mapped = arr.map((v) => v * c);
      expect(mapped[0]).assertEqual(10n);
      expect(mapped[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_10500
     * @tc.name testBigInt64ArrayMapOne105
     * @tc.desc Verify map updates external accumulated state during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sum = 0n;
      let mapped = arr.map((v) => {
        sum += v;
        return sum;
      });
      expect(mapped[0]).assertEqual(1n);
      expect(mapped[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_10600
     * @tc.name testBigInt64ArrayMapOne106
     * @tc.desc Verify map updates an external counter during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let counter = 0;
      let mapped = arr.map(() => {
        counter++;
        return BigInt(counter);
      });
      expect(mapped[0]).assertEqual(1n);
      expect(mapped[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_10700
     * @tc.name testBigInt64ArrayMapOne107
     * @tc.desc Verify map uses a greater-than branch in the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v) => v > 1n ? v : -v);
      expect(mapped[0]).assertEqual(-1n);
      expect(mapped[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_10900
     * @tc.name testBigInt64ArrayMapOne109
     * @tc.desc Verify map uses a strict-equality branch in the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v) => v === 1n ? 10n : 20n);
      expect(mapped[0]).assertEqual(10n);
      expect(mapped[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_11100
     * @tc.name testBigInt64ArrayMapOne111
     * @tc.desc Verify map branches on whether the callback index is zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v, index) => index === 0 ? v : 0n);
      expect(mapped[0]).assertEqual(1n);
      expect(mapped[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_11300
     * @tc.name testBigInt64ArrayMapOne113
     * @tc.desc Verify map branches on the full source array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v, i, a) => a.length === 2 ? v + 1n : v);
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_11400
     * @tc.name testBigInt64ArrayMapOne114
     * @tc.desc Verify map supports a nested inner map and returns its first
     * result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map(
        (v) => new BigInt64Array([v]).map((x) => x * 2n)[0]
      );
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_11600
     * @tc.name testBigInt64ArrayMapOne116
     * @tc.desc Verify map propagates a RangeError thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      try {
        arr.map(() => { throw new RangeError('Test'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_11700
     * @tc.name testBigInt64ArrayMapOne117
     * @tc.desc Verify map propagates a TypeError thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      try {
        arr.map(() => { throw new TypeError('Test'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_11800
     * @tc.name testBigInt64ArrayMapOne118
     * @tc.desc Verify map returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let mapped = arr.map((v) => v);
      expect(mapped instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_11900
     * @tc.name testBigInt64ArrayMapOne119
     * @tc.desc Verify map returns a new array instance instead of the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let mapped = arr.map((v) => v);
      expect(mapped !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_12000
     * @tc.name testBigInt64ArrayMapOne120
     * @tc.desc Verify map supports chained mapping and preserves the expected
     * length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let mapped = arr.map((v) => v).map((v) => v + 1n);
      expect(mapped[0]).assertEqual(2n);
      expect(mapped.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_12100
     * @tc.name testBigInt64ArrayMapOne121
     * @tc.desc Verify map does not mutate the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      arr.map((v) => v + 1n);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0100
     * @tc.name testBigInt64ArrayMapTwo001
     * @tc.desc Verify the mapped result has typeof object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(typeof res).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0200
     * @tc.name testBigInt64ArrayMapTwo002
     * @tc.desc Verify the mapped result constructor is BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(Class.of(res).getName().indexOf('BigInt64Array') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0300
     * @tc.name testBigInt64ArrayMapTwo003
     * @tc.desc Verify the mapped result is not a native Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(Array.isArray(res)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0400
     * @tc.name testBigInt64ArrayMapTwo004
     * @tc.desc Verify the mapped result buffer constructor is ArrayBuffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(Class.of(res.buffer).getName().indexOf('ArrayBuffer') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0500
     * @tc.name testBigInt64ArrayMapTwo005
     * @tc.desc Verify the mapped result keeps BYTES_PER_ELEMENT equal to 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(res.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0600
     * @tc.name testBigInt64ArrayMapTwo006
     * @tc.desc Verify mapping an empty array still returns a BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.map((v: bigint) => v + 1n);
        expect(Class.of(res).getName().indexOf('BigInt64Array') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_2800
     * @tc.name testBigInt64ArrayMapTwo028
     * @tc.desc Verify mapping -0n aligns with 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-0n]);
        let res = arr.map((val: bigint) => val + 0n);
        expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_2900
     * @tc.name testBigInt64ArrayMapTwo029
     * @tc.desc Verify adding 1n past int64 max wraps to int64 min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MAX + 1n);
        expect(res[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_3000
     * @tc.name testBigInt64ArrayMapTwo030
     * @tc.desc Verify adding 2n past int64 max wraps with the expected offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MAX + 2n);
        expect(res[0]).assertEqual(-BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_3200
     * @tc.name testBigInt64ArrayMapTwo032
     * @tc.desc Verify subtracting 1n past int64 min wraps to int64 max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MIN - 1n);
        expect(res[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_3300
     * @tc.name testBigInt64ArrayMapTwo033
     * @tc.desc Verify subtracting 2n past int64 min wraps with the expected offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MIN - 2n);
        expect(res[0]).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_3400
     * @tc.name testBigInt64ArrayMapTwo034
     * @tc.desc Verify mapping UINT64 max truncates to -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => UINT64_MAX);
        expect(res[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_3500
     * @tc.name testBigInt64ArrayMapTwo035
     * @tc.desc Verify mapping negative UINT64 overflow truncates to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => UINT64_MIN_WRAP);
        expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_3600
     * @tc.name testBigInt64ArrayMapTwo036
     * @tc.desc Verify mapping 1n shifted left by 64 truncates to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => SHIFT_LEFT_64);
        expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_3700
     * @tc.name testBigInt64ArrayMapTwo037
     * @tc.desc Verify mapping 1n shifted left by 63 becomes int64 min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => SHIFT_LEFT_63);
        expect(res[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_3900
     * @tc.name testBigInt64ArrayMapTwo039
     * @tc.desc Verify masking int64 min with 0xFFFFFFFFn yields 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => (BIGINT64_MIN) & UINT32_MASK);
        expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4000
     * @tc.name testBigInt64ArrayMapTwo040
     * @tc.desc Verify multiplying int64 max by 2n wraps to -2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MAX * 2n);
        expect(res[0]).assertEqual(-2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4100
     * @tc.name testBigInt64ArrayMapTwo041
     * @tc.desc Verify mapping an empty source keeps length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4200
     * @tc.name testBigInt64ArrayMapTwo042
     * @tc.desc Verify mapping an empty source keeps byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4300
     * @tc.name testBigInt64ArrayMapTwo043
     * @tc.desc Verify mapping one element produces byteLength 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n]);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4400
     * @tc.name testBigInt64ArrayMapTwo044
     * @tc.desc Verify mapping one element produces length 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n]);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4500
     * @tc.name testBigInt64ArrayMapTwo045
     * @tc.desc Verify mapping two elements produces length 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n, 8n]);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4600
     * @tc.name testBigInt64ArrayMapTwo046
     * @tc.desc Verify mapping two elements produces byteLength 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n, 8n]);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4700
     * @tc.name testBigInt64ArrayMapTwo047
     * @tc.desc Verify mapping ten elements produces length 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(
            [1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]
          );
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4800
     * @tc.name testBigInt64ArrayMapTwo048
     * @tc.desc Verify mapping ten elements produces byteLength 80.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(
            [1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]
          );
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_4900
     * @tc.name testBigInt64ArrayMapTwo049
     * @tc.desc Verify mapping an offset view returns a result with byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(24);
        let origin = new BigInt64Array(buffer, 8, 2);
        let res = origin.map((val: bigint) => val + 1n);
        expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5000
     * @tc.name testBigInt64ArrayMapTwo050
     * @tc.desc Verify mapping an offset view keeps the effective length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(32);
        let origin = new BigInt64Array(buffer, 16, 2);
        let res = origin.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5100
     * @tc.name testBigInt64ArrayMapTwo051
     * @tc.desc Verify mapping an offset view keeps the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(32);
        let origin = new BigInt64Array(buffer, 16, 2);
        let res = origin.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5200
     * @tc.name testBigInt64ArrayMapTwo052
     * @tc.desc Verify mapping a subarray produces a compact new buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let base = new BigInt64Array([10n, 20n, 30n, 40n]);
        let sub = base.subarray(1, 3);
        let res = sub.map((val: bigint) => val);
        expect(res.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5300
     * @tc.name testBigInt64ArrayMapTwo053
     * @tc.desc Verify writing the mapped result does not change the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([50n, 60n]);
        let res = arr.map((val: bigint) => val);
        res[0] = 999n;
        expect(arr[0]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5400
     * @tc.name testBigInt64ArrayMapTwo054
     * @tc.desc Verify writing the source array does not change the mapped result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([50n, 60n]);
        let res = arr.map((val: bigint) => val);
        arr[1] = 888n;
        expect(res[1]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5500
     * @tc.name testBigInt64ArrayMapTwo055
     * @tc.desc Verify map does not change the source length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let preLen = arr.length;
        arr.map((val: bigint) => val * 2n);
        expect(arr.length).assertEqual(preLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5600
     * @tc.name testBigInt64ArrayMapTwo056
     * @tc.desc Verify map does not change the source byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let preBL = arr.byteLength;
        arr.map((val: bigint) => val + 9n);
        expect(arr.byteLength).assertEqual(preBL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5700
     * @tc.name testBigInt64ArrayMapTwo057
     * @tc.desc Verify callback reads from the original array without mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([5n, 62n]);
        let res = arr.map((val: bigint, idx: int, obj: BigInt64Array) => obj[0] + val);
        expect(res[1]).assertEqual(67n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5800
     * @tc.name testBigInt64ArrayMapTwo058
     * @tc.desc Verify changing a later source element during map affects later iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        let res = arr.map((val: bigint, idx: int, obj: BigInt64Array) => {
      if (idx === 0) {
        obj[1] = 99n;
      }
      return val;
        });
        expect(res[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_5900
     * @tc.name testBigInt64ArrayMapTwo059
     * @tc.desc Verify results from separate map calls stay isolated from each other.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res1 = arr.map((v: bigint) => v);
        let res2 = arr.map((v: bigint) => v);
        res1[0] = 50n;
        expect(res2[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_6000
     * @tc.name testBigInt64ArrayMapTwo060
     * @tc.desc Verify changing an earlier source element later does not change prior mapped output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([30n, 40n]);
        let res = arr.map((val: bigint, idx: int, obj: BigInt64Array) => {
      if (idx === 1) obj[0] = 88n;
      return val;
        });
        expect(res[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_6100
     * @tc.name testBigInt64ArrayMapTwo061
     * @tc.desc Verify chaining map twice still returns a BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n]);
        let res = arr.map((v: bigint) => v + 5n).map((v: bigint) => v * 2n);
        expect(Class.of(res).getName().indexOf('BigInt64Array') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_6200
     * @tc.name testBigInt64ArrayMapTwo062
     * @tc.desc Verify chaining additive maps produces the expected final value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n]);
        let res = arr.map((v: bigint) => v + 5n).map((v: bigint) => v + 3n);
        expect(res[0]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_6300
     * @tc.name testBigInt64ArrayMapTwo063
     * @tc.desc Verify multiply-then-divide map chaining restores the original value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n]);
        let res = arr.map((v: bigint) => v * 2n).map((v: bigint) => v / 2n);
        expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_6600
     * @tc.name testBigInt64ArrayMapTwo066
     * @tc.desc Verify map output can be reduced to the expected sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let sum = arr.map((v: bigint) => v * 2n)
            .reduce((acc: bigint, curr: bigint) => acc + curr, 0n);
        expect(sum).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_6700
     * @tc.name testBigInt64ArrayMapTwo067
     * @tc.desc Verify mapped output can be subarray sliced with the expected value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        let sub = arr.map((v: bigint) => v + 1n).subarray(1, 3);
        expect(sub[0]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_6800
     * @tc.name testBigInt64ArrayMapTwo068
     * @tc.desc Verify mapped output works with every for boolean convergence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 0n, 0n]);
        let flag = arr.map((v: bigint) => v + 1n).every((v: bigint) => v === 1n);
        expect(flag).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_6900
     * @tc.name testBigInt64ArrayMapTwo069
     * @tc.desc Verify mapped output works with some for matching detection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let flag = arr.map((v: bigint) => v - 10n).some((v: bigint) => v === 0n);
        expect(flag).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_7000
     * @tc.name testBigInt64ArrayMapTwo070
     * @tc.desc Verify mapping an empty array twice still keeps length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.map((v: bigint) => v + 1n).map((v: bigint) => v + 1n);
        expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_7100
     * @tc.name testBigInt64ArrayMapTwo071
     * @tc.desc Verify mapped output works with indexOf for the expected position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        let pos = arr.map((v: bigint) => v + 2n).indexOf(22n);
        expect(pos).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_7200
     * @tc.name testBigInt64ArrayMapTwo072
     * @tc.desc Verify mapped output works with includes for expected membership.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let flag = arr.map((v: bigint) => v + 3n).includes(5n);
        expect(flag).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_7300
     * @tc.name testBigInt64ArrayMapTwo073
     * @tc.desc Verify chained overflow and compensation returns the original int64 max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([BIGINT64_MAX]);
        let res = arr.map((v: bigint) => v + 1n).map((v: bigint) => v - 1n);
        expect(res[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_7400
     * @tc.name testBigInt64ArrayMapTwo074
     * @tc.desc Verify chained index-aware mapping produces the expected value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let res = arr.map((v: bigint, i: int) => v + BigInt(i))
            .map((v: bigint, i: int) => v * BigInt(i));
        expect(res[1]).assertEqual(21n);
    });
  });
}
