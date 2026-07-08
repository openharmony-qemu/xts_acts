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
import Utils from '../Util.test';

export default function BigInt64ArrayReverse01Test(): void {
  describe('BigInt64ArrayReverse01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0010
     * @tc.name testBigInt64ArrayReverseOne001
     * @tc.desc Verify reverse succeeds with no arguments for an empty BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.reverse();
      expect(res.length).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0020
     * @tc.name testBigInt64ArrayReverseOne002
     * @tc.desc Verify reverse with no arguments reverses a 1-element BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      arr.reverse();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0030
     * @tc.name testBigInt64ArrayReverseOne003
     * @tc.desc Verify reverse with no arguments reverses a 2-element BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n]);
      arr.reverse();
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0040
     * @tc.name testBigInt64ArrayReverseOne004
     * @tc.desc Verify reverse with no arguments reverses a 3-element BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n]);
      arr.reverse();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(1n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0050
     * @tc.name testBigInt64ArrayReverseOne005
     * @tc.desc Verify reverse swaps elements when the array includes the maximum signed 64-bit value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 1n]);
      arr.reverse();
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0060
     * @tc.name testBigInt64ArrayReverseOne006
     * @tc.desc Verify reverse swaps elements when the array includes the minimum signed 64-bit value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -1n]);
      arr.reverse();
      expect(arr[0]).assertEqual(-1n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0070
     * @tc.name testBigInt64ArrayReverseOne007
     * @tc.desc Verify reverse swaps elements when the array contains zero values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n]);
      arr.reverse();
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0080
     * @tc.name testBigInt64ArrayReverseOne008
     * @tc.desc Verify reverse returns the same reference and reflects subsequent mutations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reverse();
      expect(result).assertEqual(arr);
      expect(result[0]).assertEqual(3n);
      result[0] = 99n;
      expect(arr[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0090
     * @tc.name testBigInt64ArrayReverseOne009
     * @tc.desc Verify chaining reverse twice restores the original element order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let result = arr.reverse().reverse();
      expect(result[0]).assertEqual(100n);
      expect(result[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0100
     * @tc.name testBigInt64ArrayReverseOne010
     * @tc.desc Verify reverse preserves truncation for negative overflow boundary value -1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775809n, 1n]);
      arr.reverse();
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0110
     * @tc.name testBigInt64ArrayReverseOne011
     * @tc.desc Verify reverse preserves truncation for positive overflow boundary value +1.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775808n, -1n]);
      arr.reverse();
      expect(arr[0]).assertEqual(-1n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0120
     * @tc.name testBigInt64ArrayReverseOne012
     * @tc.desc Verify reverse on a 100-element sequential array swaps boundaries correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      arr.reverse();
      expect(arr[0]).assertEqual(99n);
      expect(arr[1]).assertEqual(98n);
      expect(arr[49]).assertEqual(50n);
      expect(arr[50]).assertEqual(49n);
      expect(arr[98]).assertEqual(1n);
      expect(arr[99]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0130
     * @tc.name testBigInt64ArrayReverseOne013
     * @tc.desc Verify reverse on a 101-element odd-length array keeps middle element unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(101);
      for (let i = 0; i < 101; i++) {
        arr[i] = BigInt(i);
      }
      arr.reverse();
      expect(arr[0]).assertEqual(100n);
      expect(arr[50]).assertEqual(50n);
      expect(arr[100]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0140
     * @tc.name testBigInt64ArrayReverseOne014
     * @tc.desc Verify subarray reverse updates the parent array in place.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      sub.reverse();
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(40n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0150
     * @tc.name testBigInt64ArrayReverseOne015
     * @tc.desc Verify reverse on a view created from a buffer with byte offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 100n;
      arr[1] = 200n;
      arr[2] = 300n;
      arr.reverse();
      expect(arr[0]).assertEqual(300n);
      expect(arr[1]).assertEqual(200n);
      expect(arr[2]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0160
     * @tc.name testBigInt64ArrayReverseOne016
     * @tc.desc Verify reverse correctly swaps all-negative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
      arr.reverse();
      expect(arr[0]).assertEqual(-5n);
      expect(arr[1]).assertEqual(-4n);
      expect(arr[2]).assertEqual(-3n);
      expect(arr[3]).assertEqual(-2n);
      expect(arr[4]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0170
     * @tc.name testBigInt64ArrayReverseOne017
     * @tc.desc Verify reverse swaps mixed positive and negative values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-100n, 0n, 100n, -50n, 50n]);
      arr.reverse();
      expect(arr[0]).assertEqual(50n);
      expect(arr[1]).assertEqual(-50n);
      expect(arr[2]).assertEqual(100n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0180
     * @tc.name testBigInt64ArrayReverseOne018
     * @tc.desc Verify triple reverse produces the same result as a single reverse.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let single = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.reverse().reverse().reverse();
      single.reverse();
      expect(arr[0]).assertEqual(single[0]);
      expect(arr[1]).assertEqual(single[1]);
      expect(arr[2]).assertEqual(single[2]);
      expect(arr[3]).assertEqual(single[3]);
      expect(arr[4]).assertEqual(single[4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0190
     * @tc.name testBigInt64ArrayReverseOne019
     * @tc.desc Verify quadruple reverse restores the original element order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.reverse().reverse().reverse().reverse();
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(40n);
      expect(arr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0200
     * @tc.name testBigInt64ArrayReverseOne020
     * @tc.desc Verify reverse on a constructor-created all-zero array keeps all zeros.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.reverse();
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0210
     * @tc.name testBigInt64ArrayReverseOne021
     * @tc.desc Verify reverse after per-index assignment produces correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr[0] = 5n;
      arr[1] = 15n;
      arr[2] = 25n;
      arr[3] = 35n;
      arr.reverse();
      expect(arr[0]).assertEqual(35n);
      expect(arr[1]).assertEqual(25n);
      expect(arr[2]).assertEqual(15n);
      expect(arr[3]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0220
     * @tc.name testBigInt64ArrayReverseOne022
     * @tc.desc Verify reverse swaps alternating sign values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n, 3n, -3n]);
      arr.reverse();
      expect(arr[0]).assertEqual(-3n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(-2n);
      expect(arr[3]).assertEqual(2n);
      expect(arr[4]).assertEqual(-1n);
      expect(arr[5]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0230
     * @tc.name testBigInt64ArrayReverseOne023
     * @tc.desc Verify reverse on an array with all identical non-zero values shows no change.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 7n, 7n, 7n]);
      arr.reverse();
      expect(arr[0]).assertEqual(7n);
      expect(arr[1]).assertEqual(7n);
      expect(arr[2]).assertEqual(7n);
      expect(arr[3]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0240
     * @tc.name testBigInt64ArrayReverseOne024
     * @tc.desc Verify reverse on a view created directly from an ArrayBuffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      arr[0] = 42n;
      arr[1] = 84n;
      arr.reverse();
      expect(arr[0]).assertEqual(84n);
      expect(arr[1]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0250
     * @tc.name testBigInt64ArrayReverseOne025
     * @tc.desc Verify reverse on descending consecutive values produces ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 8n, 7n, 6n, 5n]);
      arr.reverse();
      expect(arr[0]).assertEqual(5n);
      expect(arr[1]).assertEqual(6n);
      expect(arr[2]).assertEqual(7n);
      expect(arr[3]).assertEqual(8n);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0260
     * @tc.name testBigInt64ArrayReverseOne026
     * @tc.desc Verify reverse on six elements with full position verification.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n, 400n, 500n, 600n]);
      arr.reverse();
      expect(arr[0]).assertEqual(600n);
      expect(arr[1]).assertEqual(500n);
      expect(arr[2]).assertEqual(400n);
      expect(arr[3]).assertEqual(300n);
      expect(arr[4]).assertEqual(200n);
      expect(arr[5]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0270
     * @tc.name testBigInt64ArrayReverseOne027
     * @tc.desc Verify reverse swaps powers of two correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 4n, 8n, 16n, 32n]);
      arr.reverse();
      expect(arr[0]).assertEqual(32n);
      expect(arr[1]).assertEqual(16n);
      expect(arr[2]).assertEqual(8n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(2n);
      expect(arr[5]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0280
     * @tc.name testBigInt64ArrayReverseOne028
     * @tc.desc Verify reverse, modify, and reverse again preserves the new modifications.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.reverse();
      arr[1] = 99n;
      arr.reverse();
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(99n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0290
     * @tc.name testBigInt64ArrayReverseOne029
     * @tc.desc Verify reverse on a range spanning negative to positive values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-3n, -2n, -1n, 0n, 1n, 2n, 3n]);
      arr.reverse();
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(-1n);
      expect(arr[5]).assertEqual(-2n);
      expect(arr[6]).assertEqual(-3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0300
     * @tc.name testBigInt64ArrayReverseOne030
     * @tc.desc Verify reverse on an array of all -1 values shows no visible change.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -1n, -1n]);
      arr.reverse();
      expect(arr[0]).assertEqual(-1n);
      expect(arr[1]).assertEqual(-1n);
      expect(arr[2]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0310
     * @tc.name testBigInt64ArrayReverseOne031
     * @tc.desc Verify reverse on sequential values starting from a negative number.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, -4n, -3n, -2n, -1n, 0n]);
      arr.reverse();
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-1n);
      expect(arr[2]).assertEqual(-2n);
      expect(arr[3]).assertEqual(-3n);
      expect(arr[4]).assertEqual(-4n);
      expect(arr[5]).assertEqual(-5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0320
     * @tc.name testBigInt64ArrayReverseOne032
     * @tc.desc Verify reverse on two negative elements swaps them correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1000n, -1n]);
      arr.reverse();
      expect(arr[0]).assertEqual(-1n);
      expect(arr[1]).assertEqual(-1000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0330
     * @tc.name testBigInt64ArrayReverseOne033
     * @tc.desc Verify reverse on boundary values near zero swaps correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 0n, -1n]);
      arr.reverse();
      expect(arr[0]).assertEqual(-1n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0340
     * @tc.name testBigInt64ArrayReverseOne034
     * @tc.desc Verify reverse preserves truncation behavior for values well beyond 64-bit range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775808n, 9223372036854775809n]);
      arr.reverse();
      expect(arr[0]).assertEqual(-9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0350
     * @tc.name testBigInt64ArrayReverseOne035
     * @tc.desc Verify reverse after creating a zero-length subarray does not affect the parent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(1, 1);
      sub.reverse();
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0360
     * @tc.name testBigInt64ArrayReverseOne036
     * @tc.desc Verify reverse handles the full 64-bit signed integer range swapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        9223372036854775807n,
        0n,
        -9223372036854775808n
      ]);
      arr.reverse();
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0370
     * @tc.name testBigInt64ArrayReverseOne037
     * @tc.desc Verify reverse on a single-element subarray keeps parent values intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(2, 3);
      sub.reverse();
      expect(sub[0]).assertEqual(3n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_ONE_0380
     * @tc.name testBigInt64ArrayReverseOne038
     * @tc.desc Verify reversing array with large gaps between elements works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([
        1000000000n,
        2000000000n,
        3000000000n,
        4000000000n
      ]);
      arr.reverse();
      expect(arr[0]).assertEqual(4000000000n);
      expect(arr[1]).assertEqual(3000000000n);
      expect(arr[2]).assertEqual(2000000000n);
      expect(arr[3]).assertEqual(1000000000n);
    });
  });
}
