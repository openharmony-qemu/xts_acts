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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0010
     * @tc.name testBigInt64ArrayMapOne0010
     * @tc.desc Verify map accepts a zero-arity callback and returns a new array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let mapped = arr.map(() => 5n);
      expect(mapped[0]).assertEqual(5n);
      expect(mapped[1]).assertEqual(5n);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0020
     * @tc.name testBigInt64ArrayMapOne0020
     * @tc.desc Verify map accepts a one-parameter callback and returns mapped
     * values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(11n);
      expect(mapped[1]).assertEqual(21n);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0030
     * @tc.name testBigInt64ArrayMapOne0030
     * @tc.desc Verify map accepts a two-parameter callback with value and index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let mapped = arr.map((v, i) => v + BigInt(i));
      expect(mapped[0]).assertEqual(10n);
      expect(mapped[1]).assertEqual(21n);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0040
     * @tc.name testBigInt64ArrayMapOne0040
     * @tc.desc Verify map accepts a three-parameter callback with array access.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let mapped = arr.map((v, i, a) => v + BigInt(a.length));
      expect(mapped[0]).assertEqual(12n);
      expect(mapped[1]).assertEqual(22n);
      expect(mapped.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0050
     * @tc.name testBigInt64ArrayMapOne0050
     * @tc.desc Verify map skips callback execution for an empty array and
     * returns an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0060
     * @tc.name testBigInt64ArrayMapOne0060
     * @tc.desc Verify map increments a single 0n element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0070
     * @tc.name testBigInt64ArrayMapOne0070
     * @tc.desc Verify map increments a single 1n element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0080
     * @tc.name testBigInt64ArrayMapOne0080
     * @tc.desc Verify map increments a single -1n element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0090
     * @tc.name testBigInt64ArrayMapOne0090
     * @tc.desc Verify map reaches the maximum value from a near-maximum input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_NEAR_MAX]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0100
     * @tc.name testBigInt64ArrayMapOne0100
     * @tc.desc Verify map increments the minimum value boundary input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_MIN]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(BIGINT64_NEAR_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0110
     * @tc.name testBigInt64ArrayMapOne0110
     * @tc.desc Verify map increments two different positive elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0120
     * @tc.name testBigInt64ArrayMapOne0120
     * @tc.desc Verify map increments two different negative elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(0n);
      expect(mapped[1]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0130
     * @tc.name testBigInt64ArrayMapOne0130
     * @tc.desc Verify map increments near-limit positive elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_NEAR_MAX, BIGINT64_NEAR_MAX]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(BIGINT64_MAX);
      expect(mapped[1]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0140
     * @tc.name testBigInt64ArrayMapOne0140
     * @tc.desc Verify map handles a longer element sequence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n, 400n, 500n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped.length).assertEqual(5);
      expect(mapped[4]).assertEqual(501n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0150
     * @tc.name testBigInt64ArrayMapOne0150
     * @tc.desc Verify map handles a large positive element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10000000000n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(10000000001n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0160
     * @tc.name testBigInt64ArrayMapOne0160
     * @tc.desc Verify map handles a large negative element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10000000000n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(-9999999999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0170
     * @tc.name testBigInt64ArrayMapOne0170
     * @tc.desc Verify map returns the constant 0n for every element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => 0n);
      expect(mapped[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0180
     * @tc.name testBigInt64ArrayMapOne0180
     * @tc.desc Verify map returns the constant 1n for every element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => 1n);
      expect(mapped[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0190
     * @tc.name testBigInt64ArrayMapOne0190
     * @tc.desc Verify map returns the constant -1n for every element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => -1n);
      expect(mapped[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0200
     * @tc.name testBigInt64ArrayMapOne0200
     * @tc.desc Verify map returns the maximum constant value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => BIGINT64_MAX);
      expect(mapped[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0210
     * @tc.name testBigInt64ArrayMapOne0210
     * @tc.desc Verify map returns the minimum constant value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => BIGINT64_MIN);
      expect(mapped[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0220
     * @tc.name testBigInt64ArrayMapOne0220
     * @tc.desc Verify map returns a small hexadecimal constant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => 10n);
      expect(mapped[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0230
     * @tc.name testBigInt64ArrayMapOne0230
     * @tc.desc Verify map returns a negative hexadecimal constant.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map(() => -10n);
      expect(mapped[0]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0240
     * @tc.name testBigInt64ArrayMapOne0240
     * @tc.desc Verify map preserves values when adding 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v + 0n);
      expect(mapped[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0250
     * @tc.name testBigInt64ArrayMapOne0250
     * @tc.desc Verify map offsets values by adding 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v + 1n);
      expect(mapped[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0260
     * @tc.name testBigInt64ArrayMapOne0260
     * @tc.desc Verify map offsets values by subtracting 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v - 1n);
      expect(mapped[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0270
     * @tc.name testBigInt64ArrayMapOne0270
     * @tc.desc Verify map collapses values to 0n by multiplying by 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v * 0n);
      expect(mapped[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0280
     * @tc.name testBigInt64ArrayMapOne0280
     * @tc.desc Verify map flips the sign by multiplying by -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v * -1n);
      expect(mapped[0]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0290
     * @tc.name testBigInt64ArrayMapOne0290
     * @tc.desc Verify map performs integer division with truncation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v / 2n);
      expect(mapped[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0300
     * @tc.name testBigInt64ArrayMapOne0300
     * @tc.desc Verify map computes modulo with a positive divisor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v % 3n);
      expect(mapped[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0310
     * @tc.name testBigInt64ArrayMapOne0310
     * @tc.desc Verify map squares each value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v ** 2n);
      expect(mapped[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0320
     * @tc.name testBigInt64ArrayMapOne0320
     * @tc.desc Verify map extracts the lowest bit with AND 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v & 1n);
      expect(mapped[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0330
     * @tc.name testBigInt64ArrayMapOne0330
     * @tc.desc Verify map changes the last bit with OR 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v | 1n);
      expect(mapped[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0340
     * @tc.name testBigInt64ArrayMapOne0340
     * @tc.desc Verify map flips the lowest bit with XOR 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v ^ 1n);
      expect(mapped[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0350
     * @tc.name testBigInt64ArrayMapOne0350
     * @tc.desc Verify map applies bitwise NOT to each value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => ~v);
      expect(mapped[0]).assertEqual(-11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0360
     * @tc.name testBigInt64ArrayMapOne0360
     * @tc.desc Verify map shifts each value left by one bit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v << 1n);
      expect(mapped[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0370
     * @tc.name testBigInt64ArrayMapOne0370
     * @tc.desc Verify map shifts each value right by one bit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v >> 1n);
      expect(mapped[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0380
     * @tc.name testBigInt64ArrayMapOne0380
     * @tc.desc Verify map adds a near-maximum offset without overflow.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v + 9223372036854775797n);
      expect(mapped[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0390
     * @tc.name testBigInt64ArrayMapOne0390
     * @tc.desc Verify map subtracts a near-limit value toward the minimum
     * boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let mapped = arr.map((v) => v - 9223372036854775798n);
      expect(mapped[0]).assertEqual(-9223372036854775788n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0400
     * @tc.name testBigInt64ArrayMapOne0400
     * @tc.desc Verify map returns the callback index as BigInt.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => BigInt(index));
      expect(mapped[0]).assertEqual(0n);
      expect(mapped[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0410
     * @tc.name testBigInt64ArrayMapOne0410
     * @tc.desc Verify map returns callback index plus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => BigInt(index + 1));
      expect(mapped[0]).assertEqual(1n);
      expect(mapped[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0420
     * @tc.name testBigInt64ArrayMapOne0420
     * @tc.desc Verify map returns callback index minus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => BigInt(index - 1));
      expect(mapped[0]).assertEqual(-1n);
      expect(mapped[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0430
     * @tc.name testBigInt64ArrayMapOne0430
     * @tc.desc Verify map returns the source array length for each element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, i, a) => BigInt(a.length));
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0440
     * @tc.name testBigInt64ArrayMapOne0440
     * @tc.desc Verify map returns the first source element for every position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, i, a) => a[0]);
      expect(mapped[0]).assertEqual(100n);
      expect(mapped[1]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0450
     * @tc.name testBigInt64ArrayMapOne0450
     * @tc.desc Verify map combines each value with its callback index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => v + BigInt(index));
      expect(mapped[0]).assertEqual(100n);
      expect(mapped[1]).assertEqual(201n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0460
     * @tc.name testBigInt64ArrayMapOne0460
     * @tc.desc Verify map subtracts the callback index from each value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => v - BigInt(index));
      expect(mapped[0]).assertEqual(100n);
      expect(mapped[1]).assertEqual(199n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0470
     * @tc.name testBigInt64ArrayMapOne0470
     * @tc.desc Verify map shifts values left by the callback index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let mapped = arr.map((v, index) => v << BigInt(index));
      expect(mapped[0]).assertEqual(100n);
      expect(mapped[1]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0480
     * @tc.name testBigInt64ArrayMapOne0480
     * @tc.desc Verify map captures an external positive variable in the
     * callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let ext = 5n;
      let mapped = arr.map((v) => v + ext);
      expect(mapped[0]).assertEqual(6n);
      expect(mapped[1]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0490
     * @tc.name testBigInt64ArrayMapOne0490
     * @tc.desc Verify map captures an external negative variable in the
     * callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let ext = -5n;
      let mapped = arr.map((v) => v + ext);
      expect(mapped[0]).assertEqual(-4n);
      expect(mapped[1]).assertEqual(-3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0500
     * @tc.name testBigInt64ArrayMapOne0500
     * @tc.desc Verify map uses an external constant multiplier.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      const c = 10n;
      let mapped = arr.map((v) => v * c);
      expect(mapped[0]).assertEqual(10n);
      expect(mapped[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0510
     * @tc.name testBigInt64ArrayMapOne0510
     * @tc.desc Verify map updates external accumulated state during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0520
     * @tc.name testBigInt64ArrayMapOne0520
     * @tc.desc Verify map updates an external counter during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0530
     * @tc.name testBigInt64ArrayMapOne0530
     * @tc.desc Verify map uses a greater-than branch in the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v) => v > 1n ? v : -v);
      expect(mapped[0]).assertEqual(-1n);
      expect(mapped[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0540
     * @tc.name testBigInt64ArrayMapOne0540
     * @tc.desc Verify map uses a strict-equality branch in the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v) => v === 1n ? 10n : 20n);
      expect(mapped[0]).assertEqual(10n);
      expect(mapped[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0550
     * @tc.name testBigInt64ArrayMapOne0550
     * @tc.desc Verify map branches on whether the callback index is zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v, index) => index === 0 ? v : 0n);
      expect(mapped[0]).assertEqual(1n);
      expect(mapped[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0560
     * @tc.name testBigInt64ArrayMapOne0560
     * @tc.desc Verify map branches on the full source array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map((v, i, a) => a.length === 2 ? v + 1n : v);
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0570
     * @tc.name testBigInt64ArrayMapOne0570
     * @tc.desc Verify map supports a nested inner map and returns its first
     * result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let mapped = arr.map(
        (v) => new BigInt64Array([v]).map((x) => x * 2n)[0]
      );
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0580
     * @tc.name testBigInt64ArrayMapOne0580
     * @tc.desc Verify map propagates a RangeError thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      try {
        arr.map(() => { throw new RangeError('Test'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0590
     * @tc.name testBigInt64ArrayMapOne0590
     * @tc.desc Verify map propagates a TypeError thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      try {
        arr.map(() => { throw new TypeError('Test'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0600
     * @tc.name testBigInt64ArrayMapOne0600
     * @tc.desc Verify map returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let mapped = arr.map((v) => v);
      expect(mapped instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0610
     * @tc.name testBigInt64ArrayMapOne0610
     * @tc.desc Verify map returns a new array instance instead of the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let mapped = arr.map((v) => v);
      expect(mapped !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0620
     * @tc.name testBigInt64ArrayMapOne0620
     * @tc.desc Verify map supports chained mapping and preserves the expected
     * length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let mapped = arr.map((v) => v).map((v) => v + 1n);
      expect(mapped[0]).assertEqual(2n);
      expect(mapped.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_ONE_0630
     * @tc.name testBigInt64ArrayMapOne0630
     * @tc.desc Verify map does not mutate the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapOne0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      arr.map((v) => v + 1n);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0640
     * @tc.name testBigInt64ArrayMapTwo0640
     * @tc.desc Verify the mapped result has typeof object.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(typeof res).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0650
     * @tc.name testBigInt64ArrayMapTwo0650
     * @tc.desc Verify the mapped result constructor is BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(Class.of(res).getName().indexOf('BigInt64Array') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0660
     * @tc.name testBigInt64ArrayMapTwo0660
     * @tc.desc Verify the mapped result is not a native Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(Array.isArray(res)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0670
     * @tc.name testBigInt64ArrayMapTwo0670
     * @tc.desc Verify the mapped result buffer constructor is ArrayBuffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(Class.of(res.buffer).getName().indexOf('ArrayBuffer') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0680
     * @tc.name testBigInt64ArrayMapTwo0680
     * @tc.desc Verify the mapped result keeps BYTES_PER_ELEMENT equal to 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let res = arr.map((v: bigint) => v);
        expect(res.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0690
     * @tc.name testBigInt64ArrayMapTwo0690
     * @tc.desc Verify mapping an empty array still returns a BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.map((v: bigint) => v + 1n);
        expect(Class.of(res).getName().indexOf('BigInt64Array') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0700
     * @tc.name testBigInt64ArrayMapTwo0700
     * @tc.desc Verify mapping -0n aligns with 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([-0n]);
        let res = arr.map((val: bigint) => val + 0n);
        expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0710
     * @tc.name testBigInt64ArrayMapTwo0710
     * @tc.desc Verify adding 1n past int64 max wraps to int64 min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MAX + 1n);
        expect(res[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0720
     * @tc.name testBigInt64ArrayMapTwo0720
     * @tc.desc Verify adding 2n past int64 max wraps with the expected offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MAX + 2n);
        expect(res[0]).assertEqual(-BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0730
     * @tc.name testBigInt64ArrayMapTwo0730
     * @tc.desc Verify subtracting 1n past int64 min wraps to int64 max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MIN - 1n);
        expect(res[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0740
     * @tc.name testBigInt64ArrayMapTwo0740
     * @tc.desc Verify subtracting 2n past int64 min wraps with the expected offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MIN - 2n);
        expect(res[0]).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0750
     * @tc.name testBigInt64ArrayMapTwo0750
     * @tc.desc Verify mapping UINT64 max truncates to -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => UINT64_MAX);
        expect(res[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0760
     * @tc.name testBigInt64ArrayMapTwo0760
     * @tc.desc Verify mapping negative UINT64 overflow truncates to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => UINT64_MIN_WRAP);
        expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0770
     * @tc.name testBigInt64ArrayMapTwo0770
     * @tc.desc Verify mapping 1n shifted left by 64 truncates to 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => SHIFT_LEFT_64);
        expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0780
     * @tc.name testBigInt64ArrayMapTwo0780
     * @tc.desc Verify mapping 1n shifted left by 63 becomes int64 min.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => SHIFT_LEFT_63);
        expect(res[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0790
     * @tc.name testBigInt64ArrayMapTwo0790
     * @tc.desc Verify masking int64 min with 0xFFFFFFFFn yields 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => (BIGINT64_MIN) & UINT32_MASK);
        expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0800
     * @tc.name testBigInt64ArrayMapTwo0800
     * @tc.desc Verify multiplying int64 max by 2n wraps to -2n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n]);
        let res = arr.map((val: bigint) => BIGINT64_MAX * 2n);
        expect(res[0]).assertEqual(-2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0810
     * @tc.name testBigInt64ArrayMapTwo0810
     * @tc.desc Verify mapping an empty source keeps length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0820
     * @tc.name testBigInt64ArrayMapTwo0820
     * @tc.desc Verify mapping an empty source keeps byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(0);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0830
     * @tc.name testBigInt64ArrayMapTwo0830
     * @tc.desc Verify mapping one element produces byteLength 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n]);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0840
     * @tc.name testBigInt64ArrayMapTwo0840
     * @tc.desc Verify mapping one element produces length 1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n]);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0850
     * @tc.name testBigInt64ArrayMapTwo0850
     * @tc.desc Verify mapping two elements produces length 2.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n, 8n]);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0860
     * @tc.name testBigInt64ArrayMapTwo0860
     * @tc.desc Verify mapping two elements produces byteLength 16.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([7n, 8n]);
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0870
     * @tc.name testBigInt64ArrayMapTwo0870
     * @tc.desc Verify mapping ten elements produces length 10.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(
            [1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]
          );
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0880
     * @tc.name testBigInt64ArrayMapTwo0880
     * @tc.desc Verify mapping ten elements produces byteLength 80.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array(
            [1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]
          );
        let res = arr.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0890
     * @tc.name testBigInt64ArrayMapTwo0890
     * @tc.desc Verify mapping an offset view returns a result with byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(24);
        let origin = new BigInt64Array(buffer, 8, 2);
        let res = origin.map((val: bigint) => val + 1n);
        expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0900
     * @tc.name testBigInt64ArrayMapTwo0900
     * @tc.desc Verify mapping an offset view keeps the effective length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(32);
        let origin = new BigInt64Array(buffer, 16, 2);
        let res = origin.map((val: bigint) => val + 1n);
        expect(res.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0910
     * @tc.name testBigInt64ArrayMapTwo0910
     * @tc.desc Verify mapping an offset view keeps the expected byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let buffer = new ArrayBuffer(32);
        let origin = new BigInt64Array(buffer, 16, 2);
        let res = origin.map((val: bigint) => val + 1n);
        expect(res.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0920
     * @tc.name testBigInt64ArrayMapTwo0920
     * @tc.desc Verify mapping a subarray produces a compact new buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let base = new BigInt64Array([10n, 20n, 30n, 40n]);
        let sub = base.subarray(1, 3);
        let res = sub.map((val: bigint) => val);
        expect(res.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0930
     * @tc.name testBigInt64ArrayMapTwo0930
     * @tc.desc Verify writing the mapped result does not change the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([50n, 60n]);
        let res = arr.map((val: bigint) => val);
        res[0] = 999n;
        expect(arr[0]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0940
     * @tc.name testBigInt64ArrayMapTwo0940
     * @tc.desc Verify writing the source array does not change the mapped result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([50n, 60n]);
        let res = arr.map((val: bigint) => val);
        arr[1] = 888n;
        expect(res[1]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0950
     * @tc.name testBigInt64ArrayMapTwo0950
     * @tc.desc Verify map does not change the source length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let preLen = arr.length;
        arr.map((val: bigint) => val * 2n);
        expect(arr.length).assertEqual(preLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0960
     * @tc.name testBigInt64ArrayMapTwo0960
     * @tc.desc Verify map does not change the source byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let preBL = arr.byteLength;
        arr.map((val: bigint) => val + 9n);
        expect(arr.byteLength).assertEqual(preBL);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0970
     * @tc.name testBigInt64ArrayMapTwo0970
     * @tc.desc Verify callback reads from the original array without mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([5n, 62n]);
        let res = arr.map((val: bigint, idx: int, obj: BigInt64Array) => obj[0] + val);
        expect(res[1]).assertEqual(67n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0980
     * @tc.name testBigInt64ArrayMapTwo0980
     * @tc.desc Verify changing a later source element during map affects later iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_0990
     * @tc.name testBigInt64ArrayMapTwo0990
     * @tc.desc Verify results from separate map calls stay isolated from each other.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let res1 = arr.map((v: bigint) => v);
        let res2 = arr.map((v: bigint) => v);
        res1[0] = 50n;
        expect(res2[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1000
     * @tc.name testBigInt64ArrayMapTwo1000
     * @tc.desc Verify changing an earlier source element later does not change prior mapped output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([30n, 40n]);
        let res = arr.map((val: bigint, idx: int, obj: BigInt64Array) => {
      if (idx === 1) obj[0] = 88n;
      return val;
        });
        expect(res[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1010
     * @tc.name testBigInt64ArrayMapTwo1010
     * @tc.desc Verify chaining map twice still returns a BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 1n]);
        let res = arr.map((v: bigint) => v + 5n).map((v: bigint) => v * 2n);
        expect(Class.of(res).getName().indexOf('BigInt64Array') >= 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1020
     * @tc.name testBigInt64ArrayMapTwo1020
     * @tc.desc Verify chaining additive maps produces the expected final value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n]);
        let res = arr.map((v: bigint) => v + 5n).map((v: bigint) => v + 3n);
        expect(res[0]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1030
     * @tc.name testBigInt64ArrayMapTwo1030
     * @tc.desc Verify multiply-then-divide map chaining restores the original value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n]);
        let res = arr.map((v: bigint) => v * 2n).map((v: bigint) => v / 2n);
        expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1040
     * @tc.name testBigInt64ArrayMapTwo1040
     * @tc.desc Verify map output can be reduced to the expected sum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n, 3n]);
        let sum = arr.map((v: bigint) => v * 2n)
            .reduce((acc: bigint, curr: bigint) => acc + curr, 0n);
        expect(sum).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1050
     * @tc.name testBigInt64ArrayMapTwo1050
     * @tc.desc Verify mapped output can be subarray sliced with the expected value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        let sub = arr.map((v: bigint) => v + 1n).subarray(1, 3);
        expect(sub[0]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1060
     * @tc.name testBigInt64ArrayMapTwo1060
     * @tc.desc Verify mapped output works with every for boolean convergence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([0n, 0n, 0n]);
        let flag = arr.map((v: bigint) => v + 1n).every((v: bigint) => v === 1n);
        expect(flag).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1070
     * @tc.name testBigInt64ArrayMapTwo1070
     * @tc.desc Verify mapped output works with some for matching detection.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let flag = arr.map((v: bigint) => v - 10n).some((v: bigint) => v === 0n);
        expect(flag).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1080
     * @tc.name testBigInt64ArrayMapTwo1080
     * @tc.desc Verify mapping an empty array twice still keeps length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([]);
        let res = arr.map((v: bigint) => v + 1n).map((v: bigint) => v + 1n);
        expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1090
     * @tc.name testBigInt64ArrayMapTwo1090
     * @tc.desc Verify mapped output works with indexOf for the expected position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n, 30n]);
        let pos = arr.map((v: bigint) => v + 2n).indexOf(22n);
        expect(pos).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1100
     * @tc.name testBigInt64ArrayMapTwo1100
     * @tc.desc Verify mapped output works with includes for expected membership.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([1n, 2n]);
        let flag = arr.map((v: bigint) => v + 3n).includes(5n);
        expect(flag).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1110
     * @tc.name testBigInt64ArrayMapTwo1110
     * @tc.desc Verify chained overflow and compensation returns the original int64 max.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([BIGINT64_MAX]);
        let res = arr.map((v: bigint) => v + 1n).map((v: bigint) => v - 1n);
        expect(res[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_MAP_TWO_1120
     * @tc.name testBigInt64ArrayMapTwo1120
     * @tc.desc Verify chained index-aware mapping produces the expected value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayMapTwo1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        let arr = new BigInt64Array([10n, 20n]);
        let res = arr.map((v: bigint, i: int) => v + BigInt(i))
            .map((v: bigint, i: int) => v * BigInt(i));
        expect(res[1]).assertEqual(21n);
    });
  });
}
