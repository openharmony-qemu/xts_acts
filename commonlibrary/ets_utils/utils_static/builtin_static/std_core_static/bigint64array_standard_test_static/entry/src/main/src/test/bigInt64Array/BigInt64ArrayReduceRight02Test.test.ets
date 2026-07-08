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
     * @tc.name testBigInt64ArrayReduceRightTwo0010
     * @tc.desc Verify reduceRight returns 0n for a single-element array with 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n]);
      let count = 0;
      let res = array.reduceRight((p, c) => { count++; return p + c; });
      expect(res).assertEqual(0n);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0020
     * @tc.name testBigInt64ArrayReduceRightTwo0020
     * @tc.desc Verify reduceRight returns 1n for a single-element array with 1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n]);
      let count = 0;
      let res = array.reduceRight((p, c) => { count++; return p + c; });
      expect(res).assertEqual(1n);
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0030
     * @tc.name testBigInt64ArrayReduceRightTwo0030
     * @tc.desc Verify reduceRight returns -1n for a single-element array with -1n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0040
     * @tc.name testBigInt64ArrayReduceRightTwo0040
     * @tc.desc Verify reduceRight returns the maximum boundary bigint for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0050
     * @tc.name testBigInt64ArrayReduceRightTwo0050
     * @tc.desc Verify reduceRight returns the minimum boundary bigint for a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0060
     * @tc.name testBigInt64ArrayReduceRightTwo0060
     * @tc.desc Verify reduceRight returns a large positive bigint from a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([123456789n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(123456789n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0070
     * @tc.name testBigInt64ArrayReduceRightTwo0070
     * @tc.desc Verify reduceRight returns a large negative bigint from a single-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-123456789n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-123456789n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0080
     * @tc.name testBigInt64ArrayReduceRightTwo0080
     * @tc.desc Verify reduceRight subtracts two positive bigints from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0090
     * @tc.name testBigInt64ArrayReduceRightTwo0090
     * @tc.desc Verify reduceRight subtracts two negative bigints from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, -2n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0100
     * @tc.name testBigInt64ArrayReduceRightTwo0100
     * @tc.desc Verify reduceRight subtracts two maximum bigints and returns zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0110
     * @tc.name testBigInt64ArrayReduceRightTwo0110
     * @tc.desc Verify reduceRight subtracts two minimum bigints and returns zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0120
     * @tc.name testBigInt64ArrayReduceRightTwo0120
     * @tc.desc Verify reduceRight handles subtraction when zero is the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, 1n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0130
     * @tc.name testBigInt64ArrayReduceRightTwo0130
     * @tc.desc Verify reduceRight handles subtraction with a leading zero and a negative bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, -1n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0140
     * @tc.name testBigInt64ArrayReduceRightTwo0140
     * @tc.desc Verify reduceRight handles subtraction when zero is the last element after a positive
     * bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 0n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0150
     * @tc.name testBigInt64ArrayReduceRightTwo0150
     * @tc.desc Verify reduceRight handles subtraction when zero is the last element after a negative
     * bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, 0n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0160
     * @tc.name testBigInt64ArrayReduceRightTwo0160
     * @tc.desc Verify reduceRight performs standard reverse subtraction on two values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 5n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0170
     * @tc.name testBigInt64ArrayReduceRightTwo0170
     * @tc.desc Verify reduceRight subtracts hex-initialized bigints correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([175n, 1n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-174n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0180
     * @tc.name testBigInt64ArrayReduceRightTwo0180
     * @tc.desc Verify reduceRight sums three elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0190
     * @tc.name testBigInt64ArrayReduceRightTwo0190
     * @tc.desc Verify reduceRight subtracts three elements in reverse order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 20n, 30n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0200
     * @tc.name testBigInt64ArrayReduceRightTwo0200
     * @tc.desc Verify reduceRight multiplies three elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 3n, 4n]);
      let res = array.reduceRight((p, c) => p * c);
      expect(res).assertEqual(24n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0210
     * @tc.name testBigInt64ArrayReduceRightTwo0210
     * @tc.desc Verify reduceRight sums three negative elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, -2n, -3n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0220
     * @tc.name testBigInt64ArrayReduceRightTwo0220
     * @tc.desc Verify reduceRight multiplies alternating signed elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, 1n, -1n, 1n]);
      let res = array.reduceRight((p, c) => p * c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0230
     * @tc.name testBigInt64ArrayReduceRightTwo0230
     * @tc.desc Verify reduceRight returns zero when multiplication includes zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, 1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p * c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0240
     * @tc.name testBigInt64ArrayReduceRightTwo0240
     * @tc.desc Verify reduceRight sums five identical elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 1n, 1n, 1n, 1n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0250
     * @tc.name testBigInt64ArrayReduceRightTwo0250
     * @tc.desc Verify reduceRight applies bitwise XOR across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 4n, 8n, 16n]);
      let res = array.reduceRight((p, c) => p ^ c);
      expect(res).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0260
     * @tc.name testBigInt64ArrayReduceRightTwo0260
     * @tc.desc Verify reduceRight applies bitwise OR across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([3n, 6n, 12n]);
      let res = array.reduceRight((p, c) => p | c);
      expect(res).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0270
     * @tc.name testBigInt64ArrayReduceRightTwo0270
     * @tc.desc Verify reduceRight applies bitwise AND across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([7n, 14n, 28n]);
      let res = array.reduceRight((p, c) => p & c);
      expect(res).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0280
     * @tc.name testBigInt64ArrayReduceRightTwo0280
     * @tc.desc Verify reduceRight applies left shift operations across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = array.reduceRight((p, c) => p << c);
      expect(res).assertEqual(256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0290
     * @tc.name testBigInt64ArrayReduceRightTwo0290
     * @tc.desc Verify reduceRight applies right shift operations across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([4n, 3n, 2n, 16n]);
      let res = array.reduceRight((p, c) => p >> c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0300
     * @tc.name testBigInt64ArrayReduceRightTwo0300
     * @tc.desc Verify reduceRight applies exponentiation with small values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p ** c);
      expect(res).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0310
     * @tc.name testBigInt64ArrayReduceRightTwo0310
     * @tc.desc Verify reduceRight produces a larger exponentiation result correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 3n, 2n]);
      let res = array.reduceRight((p, c) => p ** c);
      expect(res).assertEqual(64n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0320
     * @tc.name testBigInt64ArrayReduceRightTwo0320
     * @tc.desc Verify reduceRight applies integer division with truncation for bigint values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 5n, 100n]);
      let res = array.reduceRight((p, c) => p / c);
      expect(res).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0330
     * @tc.name testBigInt64ArrayReduceRightTwo0330
     * @tc.desc Verify reduceRight applies modulo operations across multiple elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p % c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0340
     * @tc.name testBigInt64ArrayReduceRightTwo0340
     * @tc.desc Verify reduceRight applies bitwise AND on a small range of values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p & c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0350
     * @tc.name testBigInt64ArrayReduceRightTwo0350
     * @tc.desc Verify reduceRight applies bitwise XOR on a small range of values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p ^ c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0360
     * @tc.name testBigInt64ArrayReduceRightTwo0360
     * @tc.desc Verify reduceRight supports callbacks that subtract previousValue from currentValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([11n, 22n, 33n]);
      let res = array.reduceRight((p, c) => c - p);
      expect(res).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0370
     * @tc.name testBigInt64ArrayReduceRightTwo0370
     * @tc.desc Verify reduceRight allows the callback to return the array length as a bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 20n, 30n]);
      let res = array.reduceRight((p, c, i, a) => BigInt(a.length));
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0380
     * @tc.name testBigInt64ArrayReduceRightTwo0380
     * @tc.desc Verify reduceRight returns previousValue when the callback always returns previousValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => p);
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0390
     * @tc.name testBigInt64ArrayReduceRightTwo0390
     * @tc.desc Verify reduceRight returns currentValue when the callback always returns currentValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0400
     * @tc.name testBigInt64ArrayReduceRightTwo0400
     * @tc.desc Verify reduceRight returns a constant bigint when the callback always returns 99n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => 99n);
      expect(res).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0410
     * @tc.name testBigInt64ArrayReduceRightTwo0410
     * @tc.desc Verify reduceRight returns the maximum bigint literal when the callback always does so.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => BIGINT64_MAX);
      expect(res).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0420
     * @tc.name testBigInt64ArrayReduceRightTwo0420
     * @tc.desc Verify reduceRight returns the minimum bigint literal when the callback always does so.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c) => BIGINT64_MIN);
      expect(res).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0430
     * @tc.name testBigInt64ArrayReduceRightTwo0430
     * @tc.desc Verify reduceRight reports currentIndex 0 on the final callback invocation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let lastIndex = -1;
      array.reduceRight((p, c, i) => { lastIndex = i; return p + c; });
      expect(lastIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0440
     * @tc.name testBigInt64ArrayReduceRightTwo0440
     * @tc.desc Verify reduceRight invokes the callback from right to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let idxSeq: Array<number> = [];
      array.reduceRight((p, c, i) => { idxSeq.push(i); return p + c; });
      expect(idxSeq[0]).assertEqual(1);
      expect(idxSeq[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0450
     * @tc.name testBigInt64ArrayReduceRightTwo0450
     * @tc.desc Verify reduceRight allows the callback to return a specific element from the source
     * array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([5n, 6n]);
      let res = array.reduceRight((p, c, i, a) => a[0]);
      expect(res).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0460
     * @tc.name testBigInt64ArrayReduceRightTwo0460
     * @tc.desc Verify reduceRight allows the callback to derive the result from currentIndex values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i) => BigInt(i));
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0470
     * @tc.name testBigInt64ArrayReduceRightTwo0470
     * @tc.desc Verify reduceRight passes the original array as the fourth callback argument.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let isSame = false;
      array.reduceRight((p, c, i, a) => { isSame = (a === array); return p; });
      expect(isSame).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0480
     * @tc.name testBigInt64ArrayReduceRightTwo0480
     * @tc.desc Verify reduceRight throws TypeError on an empty array without initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo0490
     * @tc.desc Verify reduceRight propagates a direct Error thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo0500
     * @tc.desc Verify reduceRight propagates RangeError when the callback throws based on currentValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo0510
     * @tc.desc Verify reduceRight propagates TypeError when the callback throws based on currentIndex.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo0520
     * @tc.desc Verify reduceRight stops on the second iteration when the callback throws early.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo0530
     * @tc.desc Verify reduceRight can observe mutated values before a later callback throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo0540
     * @tc.desc Verify reduceRight propagates an error thrown at a specific index in a longer array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo0550
     * @tc.desc Verify reduceRight errors can be captured by an outer catch block.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo0560
     * @tc.desc Verify reduceRight adds the maximum bigint and zero correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, 0n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0570
     * @tc.name testBigInt64ArrayReduceRightTwo0570
     * @tc.desc Verify reduceRight adds the maximum bigint and one correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, 1n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0580
     * @tc.name testBigInt64ArrayReduceRightTwo0580
     * @tc.desc Verify reduceRight adds the minimum bigint and zero correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, 0n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0590
     * @tc.name testBigInt64ArrayReduceRightTwo0590
     * @tc.desc Verify reduceRight adds the minimum bigint and negative one correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, -1n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-9223372036854775809n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0600
     * @tc.name testBigInt64ArrayReduceRightTwo0600
     * @tc.desc Verify reduceRight adds two maximum bigint values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(18446744073709551614n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0610
     * @tc.name testBigInt64ArrayReduceRightTwo0610
     * @tc.desc Verify reduceRight adds two minimum bigint values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-18446744073709551616n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0620
     * @tc.name testBigInt64ArrayReduceRightTwo0620
     * @tc.desc Verify reduceRight adds the maximum bigint and its negated counterpart correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, -BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0630
     * @tc.name testBigInt64ArrayReduceRightTwo0630
     * @tc.desc Verify reduceRight adds the maximum and minimum bigint values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0640
     * @tc.name testBigInt64ArrayReduceRightTwo0640
     * @tc.desc Verify reduceRight adds minimum and maximum bigint values correctly when their positions
     * are swapped.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MIN, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0650
     * @tc.name testBigInt64ArrayReduceRightTwo0650
     * @tc.desc Verify reduceRight adds negative one and the maximum bigint correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0660
     * @tc.name testBigInt64ArrayReduceRightTwo0660
     * @tc.desc Verify reduceRight adds one and the minimum bigint correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, BIGINT64_MIN]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0670
     * @tc.name testBigInt64ArrayReduceRightTwo0670
     * @tc.desc Verify reduceRight sums an all-zero array correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, 0n, 0n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0680
     * @tc.name testBigInt64ArrayReduceRightTwo0680
     * @tc.desc Verify reduceRight treats negative zero values as zero in addition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-0n, -0n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0690
     * @tc.name testBigInt64ArrayReduceRightTwo0690
     * @tc.desc Verify reduceRight handles subtraction with zero values in a mixed-position array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([0n, 1n, 0n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0700
     * @tc.name testBigInt64ArrayReduceRightTwo0700
     * @tc.desc Verify reduceRight handles reverse subtraction for an array of all -1n values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([-1n, -1n, -1n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0710
     * @tc.name testBigInt64ArrayReduceRightTwo0710
     * @tc.desc Verify reduceRight observes mutations to an unvisited earlier index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a[0] = 99n;
        return p + c;
      });
      expect(res).assertEqual(104n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0720
     * @tc.name testBigInt64ArrayReduceRightTwo0720
     * @tc.desc Verify reduceRight ignores mutations to the element already chosen as the starting
     * accumulator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a[2] = 99n;
        return p;
      });
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0730
     * @tc.name testBigInt64ArrayReduceRightTwo0730
     * @tc.desc Verify reduceRight observes a middle-element mutation in a four-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 2) a[1] = 10n;
        return p + c;
      });
      expect(res).assertEqual(18n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0740
     * @tc.name testBigInt64ArrayReduceRightTwo0740
     * @tc.desc Verify reduceRight continues with the updated contents after reverse is called during
     * iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a.reverse();
        return p + c;
      });
      expect(res).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0750
     * @tc.name testBigInt64ArrayReduceRightTwo0750
     * @tc.desc Verify reduceRight uses updated values after fill(0n) changes the remaining elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 2) a.fill(0n);
        return p + c;
      });
      expect(res).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0760
     * @tc.name testBigInt64ArrayReduceRightTwo0760
     * @tc.desc Verify reduceRight handles fill(0n) when the mutation happens closer to the start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a.fill(0n);
        return p + c;
      });
      expect(res).assertEqual(90n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0770
     * @tc.name testBigInt64ArrayReduceRightTwo0770
     * @tc.desc Verify reduceRight observes mutation of the first unread element to the maximum bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a[0] = BIGINT64_MAX;
        return p + c;
      });
      expect(res).assertEqual(9223372036854775812n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0780
     * @tc.name testBigInt64ArrayReduceRightTwo0780
     * @tc.desc Verify reduceRight observes mutation of an unvisited element to the minimum bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n]);
      let res = array.reduceRight((p, c, i, a) => {
        if (i === 1) a[0] = BIGINT64_MIN;
        return p + c;
      });
      expect(res).assertEqual(-9223372036854775803n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0790
     * @tc.name testBigInt64ArrayReduceRightTwo0790
     * @tc.desc Verify reduceRight supports nested reduceRight calls inside the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.reduceRight((p, c) => p + arr.reduceRight((p2, c2) => p2 + c2));
      expect(res).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0800
     * @tc.name testBigInt64ArrayReduceRightTwo0800
     * @tc.desc Verify reduceRight can modify an external counter during callback execution.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let array = new BigInt64Array([1n, 2n, 3n]);
      array.reduceRight((p, c) => { count++; return p + c; });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0810
     * @tc.name testBigInt64ArrayReduceRightTwo0810
     * @tc.desc Verify reduceRight works on a subarray that contains the first two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]).subarray(0, 2);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0820
     * @tc.name testBigInt64ArrayReduceRightTwo0820
     * @tc.desc Verify reduceRight performs subtraction correctly on a non-zero-start subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]).subarray(1, 3);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0830
     * @tc.name testBigInt64ArrayReduceRightTwo0830
     * @tc.desc Verify reduceRight reads values correctly from a buffer-backed BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let array = new BigInt64Array(buf);
      array[0] = 1n; array[1] = 2n; array[2] = 3n;
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0840
     * @tc.name testBigInt64ArrayReduceRightTwo0840
     * @tc.desc Verify reduceRight works on a sliced array that keeps the trailing elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]).slice(1);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0850
     * @tc.name testBigInt64ArrayReduceRightTwo0850
     * @tc.desc Verify reduceRight works on a subarray created with a negative start index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n]).subarray(-2);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0860
     * @tc.name testBigInt64ArrayReduceRightTwo0860
     * @tc.desc Verify reduceRight sums ten sequential elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0870
     * @tc.name testBigInt64ArrayReduceRightTwo0870
     * @tc.desc Verify reduceRight performs reverse subtraction across a ten-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n, 10n]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-35n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0880
     * @tc.name testBigInt64ArrayReduceRightTwo0880
     * @tc.desc Verify reduceRight sums one hundred elements filled with 1n correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array(100);
      array.fill(1n);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0890
     * @tc.name testBigInt64ArrayReduceRightTwo0890
     * @tc.desc Verify reduceRight sums one hundred elements filled with -1n correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array(100);
      array.fill(-1n);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0900
     * @tc.name testBigInt64ArrayReduceRightTwo0900
     * @tc.desc Verify reduceRight handles reverse subtraction on an array with alternating signs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) array[i] = i % 2 === 0 ? 1n : -1n;
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0910
     * @tc.name testBigInt64ArrayReduceRightTwo0910
     * @tc.desc Verify reduceRight returns a bigint result type for a bigint callback result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n]);
      let res = array.reduceRight((p, c) => p);
      expect(typeof res).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0920
     * @tc.name testBigInt64ArrayReduceRightTwo0920
     * @tc.desc Verify reduceRight returns the expected value when the callback keeps previousValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([9n, 8n]);
      let res = array.reduceRight((p, c) => p);
      expect(res).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0930
     * @tc.name testBigInt64ArrayReduceRightTwo0930
     * @tc.desc Verify reduceRight supports a callback that computes previousValue minus currentValue
     * plus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 4n, 8n]);
      let res = array.reduceRight((p, c) => p - c + 1n);
      expect(res).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0940
     * @tc.name testBigInt64ArrayReduceRightTwo0940
     * @tc.desc Verify reduceRight supports a callback that multiplies and subtracts one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 3n, 4n]);
      let res = array.reduceRight((p, c) => p * c - 1n);
      expect(res).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0950
     * @tc.name testBigInt64ArrayReduceRightTwo0950
     * @tc.desc Verify reduceRight handles alternating maximum and minimum bigint values in addition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0960
     * @tc.name testBigInt64ArrayReduceRightTwo0960
     * @tc.desc Verify reduceRight handles alternating maximum and minimum bigint values in subtraction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MIN, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0970
     * @tc.name testBigInt64ArrayReduceRightTwo0970
     * @tc.desc Verify reduceRight subtracts three maximum bigint values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MAX, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p - c);
      expect(res).assertEqual(-BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0980
     * @tc.name testBigInt64ArrayReduceRightTwo0980
     * @tc.desc Verify reduceRight applies exponentiation correctly to three 1n elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 1n, 1n]);
      let res = array.reduceRight((p, c) => p ** c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_0990
     * @tc.name testBigInt64ArrayReduceRightTwo0990
     * @tc.desc Verify reduceRight applies exponentiation correctly when an exponent becomes 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 0n, 3n]);
      let res = array.reduceRight((p, c) => p ** c);
      expect(res).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1000
     * @tc.name testBigInt64ArrayReduceRightTwo1000
     * @tc.desc Verify reduceRight updates an external bigint variable with the latest accumulator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([2n, 1n, 3n]);
      let temp = 0n;
      array.reduceRight((p, c) => { temp = p; return p + c; });
      expect(temp).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1010
     * @tc.name testBigInt64ArrayReduceRightTwo1010
     * @tc.desc Verify reduceRight reduces multiple bit masks with bitwise AND to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 4n, 8n, 16n]);
      let res = array.reduceRight((p, c) => p & c);
      expect(res).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1020
     * @tc.name testBigInt64ArrayReduceRightTwo1020
     * @tc.desc Verify reduceRight reduces multiple bit masks with bitwise OR to the merged state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([1n, 2n, 4n, 8n, 16n]);
      let res = array.reduceRight((p, c) => p | c);
      expect(res).assertEqual(31n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1030
     * @tc.name testBigInt64ArrayReduceRightTwo1030
     * @tc.desc Verify reduceRight tracks accumulator values through right-to-left iteration without initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo1040
     * @tc.desc Verify modifying an already-visited element does not affect the right-to-left result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArrayReduceRightTwo1050
     * @tc.desc Verify reduceRight handles triple MAX addition overflow without initialValue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let array = new BigInt64Array([BIGINT64_MAX, BIGINT64_MAX, BIGINT64_MAX]);
      let res = array.reduceRight((p, c) => p + c);
      expect(res).assertEqual(27670116110564327421n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REDUCE_RIGHT_TWO_1060
     * @tc.name testBigInt64ArrayReduceRightTwo1060
     * @tc.desc Verify reduceRight preserves original array element values after reduction.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReduceRightTwo1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
