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
import Utils from '../Util.test';

const BIGINT64_MAX = 9223372036854775807n;
const BIGINT64_MIN = -9223372036854775808n;

export default function BigInt64ArrayReduceRight02Test(): void {
  describe('BigInt64ArrayReduceRight02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0010
     * @tc.name testBigInt64ArrayReduceRightTwo001
     * @tc.desc Verify reduceRight returns 0n for a single-element array with 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n]);
      let count = 0;
      let res = array.reduceRight((p, c) => { count++; return p + c; });
      expect(res).assertEqual(0n);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0020
     * @tc.name testBigInt64ArrayReduceRightTwo002
     * @tc.desc Verify reduceRight returns 1n for a single-element array with 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n]);
      let count = 0;
      let res = array.reduceRight((p, c) => { count++; return p + c; });
      expect(res).assertEqual(1n);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0030
     * @tc.name testBigInt64ArrayReduceRightTwo003
     * @tc.desc Verify reduceRight returns -1n for a single-element array with -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0040
     * @tc.name testBigInt64ArrayReduceRightTwo004
     * @tc.desc Verify reduceRight returns the maximum boundary bigint for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0050
     * @tc.name testBigInt64ArrayReduceRightTwo005
     * @tc.desc Verify reduceRight returns the minimum boundary bigint for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0060
     * @tc.name testBigInt64ArrayReduceRightTwo006
     * @tc.desc Verify reduceRight returns a large positive bigint from a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([123456789n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(123456789n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0070
     * @tc.name testBigInt64ArrayReduceRightTwo007
     * @tc.desc Verify reduceRight returns a large negative bigint from a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-123456789n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-123456789n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0080
     * @tc.name testBigInt64ArrayReduceRightTwo008
     * @tc.desc Verify reduceRight subtracts two positive bigints from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0090
     * @tc.name testBigInt64ArrayReduceRightTwo009
     * @tc.desc Verify reduceRight subtracts two negative bigints from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, -2n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0100
     * @tc.name testBigInt64ArrayReduceRightTwo010
     * @tc.desc Verify reduceRight subtracts two maximum bigints and returns zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0110
     * @tc.name testBigInt64ArrayReduceRightTwo011
     * @tc.desc Verify reduceRight subtracts two minimum bigints and returns zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0120
     * @tc.name testBigInt64ArrayReduceRightTwo012
     * @tc.desc Verify reduceRight handles subtraction when zero is the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, 1n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0130
     * @tc.name testBigInt64ArrayReduceRightTwo013
     * @tc.desc Verify reduceRight handles subtraction with a leading zero and a negative bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, -1n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0140
     * @tc.name testBigInt64ArrayReduceRightTwo014
     * @tc.desc Verify reduceRight handles subtraction when zero is the last element after a positive
     * bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 0n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0150
     * @tc.name testBigInt64ArrayReduceRightTwo015
     * @tc.desc Verify reduceRight handles subtraction when zero is the last element after a negative
     * bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, 0n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0160
     * @tc.name testBigInt64ArrayReduceRightTwo016
     * @tc.desc Verify reduceRight performs standard reverse subtraction on two values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 5n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0170
     * @tc.name testBigInt64ArrayReduceRightTwo017
     * @tc.desc Verify reduceRight subtracts hex-initialized bigints correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([175n, 1n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-174n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0180
     * @tc.name testBigInt64ArrayReduceRightTwo018
     * @tc.desc Verify reduceRight sums three elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0190
     * @tc.name testBigInt64ArrayReduceRightTwo019
     * @tc.desc Verify reduceRight subtracts three elements in reverse order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 20n, 30n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0200
     * @tc.name testBigInt64ArrayReduceRightTwo020
     * @tc.desc Verify reduceRight multiplies three elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 3n, 4n]);
      let res = array.reduceRight((p, c) => p * c);
      expect(res).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0210
     * @tc.name testBigInt64ArrayReduceRightTwo021
     * @tc.desc Verify reduceRight sums three negative elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, -2n, -3n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0220
     * @tc.name testBigInt64ArrayReduceRightTwo022
     * @tc.desc Verify reduceRight multiplies alternating signed elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, 1n, -1n, 1n]);
      let res = array.reduceRight((p, c) => p * c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0230
     * @tc.name testBigInt64ArrayReduceRightTwo023
     * @tc.desc Verify reduceRight returns zero when multiplication includes zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, 1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p * c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0240
     * @tc.name testBigInt64ArrayReduceRightTwo024
     * @tc.desc Verify reduceRight sums five identical elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 1n, 1n, 1n, 1n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0250
     * @tc.name testBigInt64ArrayReduceRightTwo025
     * @tc.desc Verify reduceRight applies bitwise XOR across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 4n, 8n, 16n]);
      let res = array.reduceRight((p, c) => p ^ c);
      expect(res).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0260
     * @tc.name testBigInt64ArrayReduceRightTwo026
     * @tc.desc Verify reduceRight applies bitwise OR across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([3n, 6n, 12n]);
      let res = array.reduceRight((p, c) => p | c);
      expect(res).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0270
     * @tc.name testBigInt64ArrayReduceRightTwo027
     * @tc.desc Verify reduceRight applies bitwise AND across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([7n, 14n, 28n]);
      let res = array.reduceRight((p, c) => p & c);
      expect(res).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0280
     * @tc.name testBigInt64ArrayReduceRightTwo028
     * @tc.desc Verify reduceRight applies left shift operations across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = array.reduceRight((p, c) => p << c);
      expect(res).assertEqual(256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0290
     * @tc.name testBigInt64ArrayReduceRightTwo029
     * @tc.desc Verify reduceRight applies right shift operations across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([4n, 3n, 2n, 16n]);
      let res = array.reduceRight((p, c) => p >> c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0300
     * @tc.name testBigInt64ArrayReduceRightTwo030
     * @tc.desc Verify reduceRight applies exponentiation with small values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p ** c);
      expect(res).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0310
     * @tc.name testBigInt64ArrayReduceRightTwo031
     * @tc.desc Verify reduceRight produces a larger exponentiation result correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 3n, 2n]);
      let res = array.reduceRight((p, c) => p ** c);
      expect(res).assertEqual(64n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0320
     * @tc.name testBigInt64ArrayReduceRightTwo032
     * @tc.desc Verify reduceRight applies integer division with truncation for bigint values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 5n, 100n]);
      let res = array.reduceRight((p, c) => p / c);
      expect(res).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0330
     * @tc.name testBigInt64ArrayReduceRightTwo033
     * @tc.desc Verify reduceRight applies modulo operations across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p % c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0340
     * @tc.name testBigInt64ArrayReduceRightTwo034
     * @tc.desc Verify reduceRight applies bitwise AND on a small range of values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p & c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0350
     * @tc.name testBigInt64ArrayReduceRightTwo035
     * @tc.desc Verify reduceRight applies bitwise XOR on a small range of values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p ^ c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0360
     * @tc.name testBigInt64ArrayReduceRightTwo036
     * @tc.desc Verify reduceRight supports callbacks that subtract previousValue from currentValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([11n, 22n, 33n]);
      let res = array.reduceRight((p, c) => c - p);
      expect(res).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0370
     * @tc.name testBigInt64ArrayReduceRightTwo037
     * @tc.desc Verify reduceRight allows the callback to return the array length as a bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 20n, 30n]);
      let res = array.reduceRight((p, c, i, a) => BigInt(a.length));
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0380
     * @tc.name testBigInt64ArrayReduceRightTwo038
     * @tc.desc Verify reduceRight returns previousValue when the callback always returns previousValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p);
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0390
     * @tc.name testBigInt64ArrayReduceRightTwo039
     * @tc.desc Verify reduceRight returns currentValue when the callback always returns currentValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0400
     * @tc.name testBigInt64ArrayReduceRightTwo040
     * @tc.desc Verify reduceRight returns a constant bigint when the callback always returns 99n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => 99n);
      expect(res).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0410
     * @tc.name testBigInt64ArrayReduceRightTwo041
     * @tc.desc Verify reduceRight returns the maximum bigint literal when the callback always does so.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => BIGINT64_MAX);
      expect(res).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0420
     * @tc.name testBigInt64ArrayReduceRightTwo042
     * @tc.desc Verify reduceRight returns the minimum bigint literal when the callback always does so.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => BIGINT64_MIN);
      expect(res).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0430
     * @tc.name testBigInt64ArrayReduceRightTwo043
     * @tc.desc Verify reduceRight reports currentIndex 0 on the final callback invocation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let lastIndex = -1;
      array.reduceRight((p, c, i) => { lastIndex = i; return p + c; });
      expect(lastIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0440
     * @tc.name testBigInt64ArrayReduceRightTwo044
     * @tc.desc Verify reduceRight invokes the callback from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let idxSeq: Array<number> = [];
      array.reduceRight((p, c, i) => { idxSeq.push(i); return p + c; });
      expect(idxSeq[0]).assertEqual(1);
      expect(idxSeq[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0450
     * @tc.name testBigInt64ArrayReduceRightTwo045
     * @tc.desc Verify reduceRight allows the callback to return a specific element from the source
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([5n, 6n]);
      let res = array.reduceRight((p, c, i, a) => a[0]);
      expect(res).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0460
     * @tc.name testBigInt64ArrayReduceRightTwo046
     * @tc.desc Verify reduceRight allows the callback to derive the result from currentIndex values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i) => BigInt(i));
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0470
     * @tc.name testBigInt64ArrayReduceRightTwo047
     * @tc.desc Verify reduceRight passes the original array as the fourth callback argument.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let isSame = false;
      array.reduceRight((p, c, i, a) => { isSame = (a === array); return p; });
      expect(isSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0480
     * @tc.name testBigInt64ArrayReduceRightTwo048
     * @tc.desc Verify reduceRight throws TypeError on an empty array without initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array(0);
      try {
        array.reduceRight((p, c) => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0490
     * @tc.name testBigInt64ArrayReduceRightTwo049
     * @tc.desc Verify reduceRight propagates a direct Error thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n]);
      try {
        array.reduceRight((p, c) => { throw new Error('msg'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('msg');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0500
     * @tc.name testBigInt64ArrayReduceRightTwo050
     * @tc.desc Verify reduceRight propagates RangeError when the callback throws based on currentValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      try {
        array.reduceRight((p, c) => {
          if (c === 2n) throw new RangeError('re');
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0510
     * @tc.name testBigInt64ArrayReduceRightTwo051
     * @tc.desc Verify reduceRight propagates TypeError when the callback throws based on currentIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      try {
        array.reduceRight((p, c, i) => {
          if (i === 0) throw new TypeError('te');
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0520
     * @tc.name testBigInt64ArrayReduceRightTwo052
     * @tc.desc Verify reduceRight stops on the second iteration when the callback throws early.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 20n, 30n]);
      let callCount = 0;
      try {
        array.reduceRight((p, c) => {
          callCount++;
          if (c === 10n) throw new Error('early');
          return p;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(callCount).assertEqual(2);
        expect(e.message).assertEqual('early');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0530
     * @tc.name testBigInt64ArrayReduceRightTwo053
     * @tc.desc Verify reduceRight can observe mutated values before a later callback throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      try {
        array.reduceRight((p, c, i, a) => {
          a[0] = 99n;
          if (c === 99n) throw new Error('mutation');
          return p;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('mutation');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0540
     * @tc.name testBigInt64ArrayReduceRightTwo054
     * @tc.desc Verify reduceRight propagates an error thrown at a specific index in a longer array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]);
      try {
        array.reduceRight((p, c, i) => {
          if (i === 1) throw new Error('idx1');
          return p;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('idx1');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0550
     * @tc.name testBigInt64ArrayReduceRightTwo055
     * @tc.desc Verify reduceRight errors can be captured by an outer catch block.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n]);
      try {
        array.reduceRight((p, c) => { throw new Error('catchme'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0560
     * @tc.name testBigInt64ArrayReduceRightTwo056
     * @tc.desc Verify reduceRight adds the maximum bigint and zero correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, 0n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0570
     * @tc.name testBigInt64ArrayReduceRightTwo057
     * @tc.desc Verify reduceRight adds the maximum bigint and one correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, 1n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0580
     * @tc.name testBigInt64ArrayReduceRightTwo058
     * @tc.desc Verify reduceRight adds the minimum bigint and zero correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, 0n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0590
     * @tc.name testBigInt64ArrayReduceRightTwo059
     * @tc.desc Verify reduceRight adds the minimum bigint and negative one correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, -1n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-9223372036854775809n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0600
     * @tc.name testBigInt64ArrayReduceRightTwo060
     * @tc.desc Verify reduceRight adds two maximum bigint values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0610
     * @tc.name testBigInt64ArrayReduceRightTwo061
     * @tc.desc Verify reduceRight adds two minimum bigint values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-18446744073709551616n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0620
     * @tc.name testBigInt64ArrayReduceRightTwo062
     * @tc.desc Verify reduceRight adds the maximum bigint and its negated counterpart correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, -BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0630
     * @tc.name testBigInt64ArrayReduceRightTwo063
     * @tc.desc Verify reduceRight adds the maximum and minimum bigint values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0640
     * @tc.name testBigInt64ArrayReduceRightTwo064
     * @tc.desc Verify reduceRight adds minimum and maximum bigint values correctly when their positions
     * are swapped.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0650
     * @tc.name testBigInt64ArrayReduceRightTwo065
     * @tc.desc Verify reduceRight adds negative one and the maximum bigint correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0660
     * @tc.name testBigInt64ArrayReduceRightTwo066
     * @tc.desc Verify reduceRight adds one and the minimum bigint correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0670
     * @tc.name testBigInt64ArrayReduceRightTwo067
     * @tc.desc Verify reduceRight sums an all-zero array correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, 0n, 0n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0680
     * @tc.name testBigInt64ArrayReduceRightTwo068
     * @tc.desc Verify reduceRight treats negative zero values as zero in addition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-0n, -0n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0690
     * @tc.name testBigInt64ArrayReduceRightTwo069
     * @tc.desc Verify reduceRight handles subtraction with zero values in a mixed-position array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, 1n, 0n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0700
     * @tc.name testBigInt64ArrayReduceRightTwo070
     * @tc.desc Verify reduceRight handles reverse subtraction for an array of all -1n values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, -1n, -1n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0710
     * @tc.name testBigInt64ArrayReduceRightTwo071
     * @tc.desc Verify reduceRight observes mutations to an unvisited earlier index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a[0] = 99n;
        return p + c;
      });
      expect(res).assertEqual(104n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0720
     * @tc.name testBigInt64ArrayReduceRightTwo072
     * @tc.desc Verify reduceRight ignores mutations to the element already chosen as the starting
     * accumulator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a[2] = 99n;
        return p;
      });
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0730
     * @tc.name testBigInt64ArrayReduceRightTwo073
     * @tc.desc Verify reduceRight observes a middle-element mutation in a four-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 2) a[1] = 10n;
        return p + c;
      });
      expect(res).assertEqual(18n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0740
     * @tc.name testBigInt64ArrayReduceRightTwo074
     * @tc.desc Verify reduceRight continues with the updated contents after reverse is called during
     * iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a.reverse();
        return p + c;
      });
      expect(res).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0750
     * @tc.name testBigInt64ArrayReduceRightTwo075
     * @tc.desc Verify reduceRight uses updated values after fill(0n) changes the remaining elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 2) a.fill(0n);
        return p + c;
      });
      expect(res).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0760
     * @tc.name testBigInt64ArrayReduceRightTwo076
     * @tc.desc Verify reduceRight handles fill(0n) when the mutation happens closer to the start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a.fill(0n);
        return p + c;
      });
      expect(res).assertEqual(90n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0770
     * @tc.name testBigInt64ArrayReduceRightTwo077
     * @tc.desc Verify reduceRight observes mutation of the first unread element to the maximum bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a[0] = BIGINT64_MAX;
        return p + c;
      });
      expect(res).assertEqual(9223372036854775812n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0780
     * @tc.name testBigInt64ArrayReduceRightTwo078
     * @tc.desc Verify reduceRight observes mutation of an unvisited element to the minimum bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a[0] = BIGINT64_MIN;
        return p + c;
      });
      expect(res).assertEqual(-9223372036854775803n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0790
     * @tc.name testBigInt64ArrayReduceRightTwo079
     * @tc.desc Verify reduceRight supports nested reduceRight calls inside the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.reduceRight((p, c) => p + arr.reduceRight((p2, c2) => p2 + c2));
      expect(res).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0800
     * @tc.name testBigInt64ArrayReduceRightTwo080
     * @tc.desc Verify reduceRight can modify an external counter during callback execution.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let array = new BigInt64Array([1n, 2n, 3n]);
      array.reduceRight((p, c) => { count++; return p + c; });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0810
     * @tc.name testBigInt64ArrayReduceRightTwo081
     * @tc.desc Verify reduceRight works on a subarray that contains the first two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]).subarray(0, 2);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0820
     * @tc.name testBigInt64ArrayReduceRightTwo082
     * @tc.desc Verify reduceRight performs subtraction correctly on a non-zero-start subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]).subarray(1, 3);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0830
     * @tc.name testBigInt64ArrayReduceRightTwo083
     * @tc.desc Verify reduceRight reads values correctly from a buffer-backed BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let array = new BigInt64Array(buf);
      array[0] = 1n; array[1] = 2n; array[2] = 3n;
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0840
     * @tc.name testBigInt64ArrayReduceRightTwo084
     * @tc.desc Verify reduceRight works on a sliced array that keeps the trailing elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]).slice(1);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0850
     * @tc.name testBigInt64ArrayReduceRightTwo085
     * @tc.desc Verify reduceRight works on a subarray created with a negative start index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]).subarray(-2);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0860
     * @tc.name testBigInt64ArrayReduceRightTwo086
     * @tc.desc Verify reduceRight sums ten sequential elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0870
     * @tc.name testBigInt64ArrayReduceRightTwo087
     * @tc.desc Verify reduceRight performs reverse subtraction across a ten-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-35n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0880
     * @tc.name testBigInt64ArrayReduceRightTwo088
     * @tc.desc Verify reduceRight sums one hundred elements filled with 1n correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array(100);
      array.fill(1n);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0890
     * @tc.name testBigInt64ArrayReduceRightTwo089
     * @tc.desc Verify reduceRight sums one hundred elements filled with -1n correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array(100);
      array.fill(-1n);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0900
     * @tc.name testBigInt64ArrayReduceRightTwo090
     * @tc.desc Verify reduceRight handles reverse subtraction on an array with alternating signs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) array[i] = i % 2 === 0 ? 1n : -1n;
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0910
     * @tc.name testBigInt64ArrayReduceRightTwo091
     * @tc.desc Verify reduceRight returns a bigint result type for a bigint callback result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n]);
      let res = array.reduceRight((p, c) => p);
      expect(typeof res).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0920
     * @tc.name testBigInt64ArrayReduceRightTwo092
     * @tc.desc Verify reduceRight returns the expected value when the callback keeps previousValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([9n, 8n]);
      let res = array.reduceRight((p, c) => p);
      expect(res).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0930
     * @tc.name testBigInt64ArrayReduceRightTwo093
     * @tc.desc Verify reduceRight supports a callback that computes previousValue minus currentValue
     * plus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 4n, 8n]);
      let res = array.reduceRight((p, c) => p - c + 1n);
      expect(res).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0940
     * @tc.name testBigInt64ArrayReduceRightTwo094
     * @tc.desc Verify reduceRight supports a callback that multiplies and subtracts one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 3n, 4n]);
      let res = array.reduceRight((p, c) => p * c - 1n);
      expect(res).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0950
     * @tc.name testBigInt64ArrayReduceRightTwo095
     * @tc.desc Verify reduceRight handles alternating maximum and minimum bigint values in addition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0960
     * @tc.name testBigInt64ArrayReduceRightTwo096
     * @tc.desc Verify reduceRight handles alternating maximum and minimum bigint values in subtraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0970
     * @tc.name testBigInt64ArrayReduceRightTwo097
     * @tc.desc Verify reduceRight subtracts three maximum bigint values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MAX, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0980
     * @tc.name testBigInt64ArrayReduceRightTwo098
     * @tc.desc Verify reduceRight applies exponentiation correctly to three 1n elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 1n, 1n]);
      let res = array.reduceRight((p, c) => p ** c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0990
     * @tc.name testBigInt64ArrayReduceRightTwo099
     * @tc.desc Verify reduceRight applies exponentiation correctly when an exponent becomes 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 0n, 3n]);
      let res = array.reduceRight((p, c) => p ** c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1000
     * @tc.name testBigInt64ArrayReduceRightTwo100
     * @tc.desc Verify reduceRight updates an external bigint variable with the latest accumulator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 1n, 3n]);
      let temp = 0n;
      array.reduceRight((p, c) => { temp = p; return p + c; });
      expect(temp).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1010
     * @tc.name testBigInt64ArrayReduceRightTwo101
     * @tc.desc Verify reduceRight reduces multiple bit masks with bitwise AND to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 4n, 8n, 16n]);
      let res = array.reduceRight((p, c) => p & c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1020
     * @tc.name testBigInt64ArrayReduceRightTwo102
     * @tc.desc Verify reduceRight reduces multiple bit masks with bitwise OR to the merged state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 4n, 8n, 16n]);
      let res = array.reduceRight((p, c) => p | c);
      expect(res).assertEqual(31n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1030
     * @tc.name testBigInt64ArrayReduceRightTwo103
     * @tc.desc Verify reduceRight tracks accumulator values through right-to-left iteration without initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]);
      let accTrace: Array<BigInt> = [];
      array.reduceRight((p, c) => {
        accTrace.push(p);
        return p + c;
      });
      expect(accTrace[0]).assertEqual(4n);
      expect(accTrace[1]).assertEqual(7n);
      expect(accTrace[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1040
     * @tc.name testBigInt64ArrayReduceRightTwo104
     * @tc.desc Verify modifying an already-visited element does not affect the right-to-left result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 0) {
          a[3] = 99n;
        }
        return p + c;
      });
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1050
     * @tc.name testBigInt64ArrayReduceRightTwo105
     * @tc.desc Verify reduceRight handles triple MAX addition overflow without initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MAX, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(27670116110564327421n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1060
     * @tc.name testBigInt64ArrayReduceRightTwo106
     * @tc.desc Verify reduceRight preserves original array element values after reduction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let originalValues: Array<BigInt> = [];
      for (let i = 0; i < array.length; i++) {
        originalValues.push(array[i]);
      }
      array.reduceRight((p, c) => p + c);
      for (let i = 0; i < array.length; i++) {
        expect(array[i]).assertEqual(originalValues[i]);
      }
    });
  });
}
