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

export default function BigInt64ArraySet01Test(): void {
  describe('BigInt64ArraySet01Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0010
     * @tc.name testBigInt64ArraySetOne001
     * @tc.desc Verify bracket assignment of 0n stores and reads back correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 0n;
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0020
     * @tc.name testBigInt64ArraySetOne002
     * @tc.desc Verify bracket assignment of MAX signed 64-bit value stores and reads back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 9223372036854775807n;
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0030
     * @tc.name testBigInt64ArraySetOne003
     * @tc.desc Verify bracket assignment of MIN signed 64-bit value stores and reads back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -9223372036854775807n - 1n;
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0040
     * @tc.name testBigInt64ArraySetOne004
     * @tc.desc Verify bracket assignment of 1n and -1n at distinct indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 1n;
      arr[2] = -1n;
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0050
     * @tc.name testBigInt64ArraySetOne005
     * @tc.desc Verify positive overflow value is truncated to signed 64-bit range on assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 9223372036854775808n;
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0060
     * @tc.name testBigInt64ArraySetOne006
     * @tc.desc Verify negative overflow value is truncated to signed 64-bit range on assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -9223372036854775809n;
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0070
     * @tc.name testBigInt64ArraySetOne007
     * @tc.desc Verify setting first element leaves other elements at their initial zero value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr[0] = 99n;
      expect(arr[0]).assertEqual(99n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0080
     * @tc.name testBigInt64ArraySetOne008
     * @tc.desc Verify setting last element leaves other elements unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr[4] = -77n;
      expect(arr[0]).assertEqual(0n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(-77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0090
     * @tc.name testBigInt64ArraySetOne009
     * @tc.desc Verify setting middle element leaves boundary elements unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr[2] = 42n;
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(42n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0100
     * @tc.name testBigInt64ArraySetOne010
     * @tc.desc Verify sequentially assigning all elements stores each value correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      arr[3] = 40n;
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0110
     * @tc.name testBigInt64ArraySetOne011
     * @tc.desc Verify expression-based value assignment stores computed result correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 1000n * 1000n;
      expect(arr[0]).assertEqual(1000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0120
     * @tc.name testBigInt64ArraySetOne012
     * @tc.desc Verify UInt32 maximum boundary value is preserved on bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 4294967295n;
      expect(arr[0]).assertEqual(4294967295n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0130
     * @tc.name testBigInt64ArraySetOne013
     * @tc.desc Verify Int32 minimum boundary value is preserved on bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -4294967296n;
      expect(arr[0]).assertEqual(-4294967296n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0140
     * @tc.name testBigInt64ArraySetOne014
     * @tc.desc Verify repeated writes to the same index keep the last written value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 10n;
      arr[0] = 20n;
      arr[0] = 30n;
      expect(arr[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0150
     * @tc.name testBigInt64ArraySetOne015
     * @tc.desc Verify assignment overwrites values set by fill operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr.fill(5n);
      arr[0] = 99n;
      arr[3] = 88n;
      expect(arr[0]).assertEqual(99n);
      expect(arr[1]).assertEqual(5n);
      expect(arr[2]).assertEqual(5n);
      expect(arr[3]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0160
     * @tc.name testBigInt64ArraySetOne016
     * @tc.desc Verify assignment combined with reverse produces correct element positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      arr.reverse();
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0170
     * @tc.name testBigInt64ArraySetOne017
     * @tc.desc Verify subarray bracket assignment updates the parent array at the correct offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      sub[0] = 99n;
      sub[2] = 77n;
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(99n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(77n);
      expect(arr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0180
     * @tc.name testBigInt64ArraySetOne018
     * @tc.desc Verify bracket assignment on a buffer offset view writes to the correct memory
     * location.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 111n;
      arr[1] = 222n;
      arr[2] = 333n;
      expect(arr[0]).assertEqual(111n);
      expect(arr[1]).assertEqual(222n);
      expect(arr[2]).assertEqual(333n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0190
     * @tc.name testBigInt64ArraySetOne019
     * @tc.desc Verify assignment through one view on a shared buffer is visible through another
     * view on the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v1 = new BigInt64Array(buf);
      let v2 = new BigInt64Array(buf);
      v1[0] = 100n;
      v1[1] = 200n;
      expect(v2[0]).assertEqual(100n);
      expect(v2[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0200
     * @tc.name testBigInt64ArraySetOne020
     * @tc.desc Verify BYTES_PER_ELEMENT remains 8 after bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      expect(arr.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0210
     * @tc.name testBigInt64ArraySetOne021
     * @tc.desc Verify length remains unchanged after bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr[0] = 10n;
      arr[4] = 50n;
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0220
     * @tc.name testBigInt64ArraySetOne022
     * @tc.desc Verify byteLength remains unchanged after bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr[0] = -1n;
      arr[3] = 1n;
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0230
     * @tc.name testBigInt64ArraySetOne023
     * @tc.desc Verify byteOffset remains unchanged after bracket assignment on a buffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 8, 2);
      arr[0] = 5n;
      arr[1] = 10n;
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0240
     * @tc.name testBigInt64ArraySetOne024
     * @tc.desc Verify large array bracket assignment at boundary indices works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[0] = 1n;
      arr[50] = 50n;
      arr[99] = 99n;
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[50]).assertEqual(50n);
      expect(arr[98]).assertEqual(0n);
      expect(arr[99]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0250
     * @tc.name testBigInt64ArraySetOne025
     * @tc.desc Verify constructor-created all-zero array has correct initial values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0260
     * @tc.name testBigInt64ArraySetOne026
     * @tc.desc Verify alternating positive and negative value assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr[0] = 10n;
      arr[1] = -10n;
      arr[2] = 20n;
      arr[3] = -20n;
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(-10n);
      expect(arr[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(-20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0270
     * @tc.name testBigInt64ArraySetOne027
     * @tc.desc Verify assignment of powers of two values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 4n;
      arr[3] = 8n;
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(4n);
      expect(arr[3]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0280
     * @tc.name testBigInt64ArraySetOne028
     * @tc.desc Verify assignment of a large arbitrary positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 1311768467463790320n;
      expect(arr[0]).assertEqual(1311768467463790320n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0290
     * @tc.name testBigInt64ArraySetOne029
     * @tc.desc Verify assignment of a specific large arbitrary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 6148914691236517205n;
      expect(arr[0]).assertEqual(6148914691236517205n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0300
     * @tc.name testBigInt64ArraySetOne030
     * @tc.desc Verify assignment of a smaller arbitrary positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 2941116470193674n;
      expect(arr[0]).assertEqual(2941116470193674n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0310
     * @tc.name testBigInt64ArraySetOne031
     * @tc.desc Verify assignment of a negative arbitrary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -1311768467463790320n;
      expect(arr[0]).assertEqual(-1311768467463790320n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0320
     * @tc.name testBigInt64ArraySetOne032
     * @tc.desc Verify MAX then MIN then 0 assigned to same index keeps only the last value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 9223372036854775807n;
      arr[0] = -9223372036854775807n - 1n;
      arr[0] = 0n;
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0330
     * @tc.name testBigInt64ArraySetOne033
     * @tc.desc Verify assignment after copyWithin operation overrides copied values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(2, 0, 2);
      arr[2] = 99n;
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(99n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0340
     * @tc.name testBigInt64ArraySetOne034
     * @tc.desc Verify two separate views over non-overlapping buffer regions are independent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let head = new BigInt64Array(buf, 0, 2);
      let tail = new BigInt64Array(buf, 16, 2);
      head[0] = 111n;
      tail[0] = 999n;
      expect(head[0]).assertEqual(111n);
      expect(head[1]).assertEqual(0n);
      expect(tail[0]).assertEqual(999n);
      expect(tail[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0350
     * @tc.name testBigInt64ArraySetOne035
     * @tc.desc Verify assignment using values that are powers of ten.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 1n;
      arr[1] = 10n;
      arr[2] = 100n;
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0360
     * @tc.name testBigInt64ArraySetOne036
     * @tc.desc Verify bracket assignment on a zero-length array has no effect on buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0370
     * @tc.name testBigInt64ArraySetOne037
     * @tc.desc Verify setting a value and then reading from a different reference to the same
     * array reflects the change.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let ref = arr;
      arr[0] = 42n;
      expect(ref[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0380
     * @tc.name testBigInt64ArraySetOne038
     * @tc.desc Verify assigning a negative value to the last element of a multi-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      arr[3] = -1000n;
      expect(arr[0]).assertEqual(1n);
      expect(arr[3]).assertEqual(-1000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0390
     * @tc.name testBigInt64ArraySetOne039
     * @tc.desc Verify assignment of negative powers of two values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = -1n;
      arr[1] = -2n;
      arr[2] = -4n;
      expect(arr[0]).assertEqual(-1n);
      expect(arr[1]).assertEqual(-2n);
      expect(arr[2]).assertEqual(-4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0400
     * @tc.name testBigInt64ArraySetOne040
     * @tc.desc Verify that assignment preserves the underlying buffer reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      arr[0] = 1n;
      arr[1] = 2n;
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0410
     * @tc.name testBigInt64ArraySetOne041
     * @tc.desc Verify assignment with two large-value elements does not corrupt adjacent memory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 9223372036854775807n;
      arr[2] = -9223372036854775807n - 1n;
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[2]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0420
     * @tc.name testBigInt64ArraySetOne042
     * @tc.desc Verify assignment on nested views keeps all reads consistent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let outer = new BigInt64Array(buf);
      outer[0] = 10n;
      outer[1] = 20n;
      outer[2] = 30n;
      let inner = new BigInt64Array(buf, 8, 2);
      inner[0] = 99n;
      expect(outer[1]).assertEqual(99n);
      expect(outer[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0430
     * @tc.name testBigInt64ArraySetOne043
     * @tc.desc Verify assigning values in descending order works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr[0] = 40n;
      arr[1] = 30n;
      arr[2] = 20n;
      arr[3] = 10n;
      expect(arr[0]).assertEqual(40n);
      expect(arr[1]).assertEqual(30n);
      expect(arr[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0440
     * @tc.name testBigInt64ArraySetOne044
     * @tc.desc Verify bracket assignment combined with fill on remaining elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr[0] = 7n;
      arr[4] = 7n;
      arr.fill(3n, 1, 4);
      expect(arr[0]).assertEqual(7n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(3n);
      expect(arr[4]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0010
     * @tc.name testBigInt64ArraySet001
     * @tc.desc Verify set with int and E writes normally boundary E value maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 9223372036854775807n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0020
     * @tc.name testBigInt64ArraySet002
     * @tc.desc Verify set with int and E writes normally boundary E value minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -9223372036854775808n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0030
     * @tc.name testBigInt64ArraySet003
     * @tc.desc Verify set with int and E writes normally boundary E value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 0n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0040
     * @tc.name testBigInt64ArraySet004
     * @tc.desc Verify set with int and E writes normally boundary E value positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 1n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0050
     * @tc.name testBigInt64ArraySet005
     * @tc.desc Verify set with int and E writes normally boundary E value negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -1n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0060
     * @tc.name testBigInt64ArraySet006
     * @tc.desc Verify set with int and E writes normally boundary E value large hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt("0x3F3F3F3F3F3F3F3F");
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0070
     * @tc.name testBigInt64ArraySet007
     * @tc.desc Verify set with int and E writes normally boundary E value small negative hexadecimal
     * value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -BigInt("0x3F3F3F3F3F3F3F3F");
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0080
     * @tc.name testBigInt64ArraySet008
     * @tc.desc Verify set with int and E writes normally boundary E value octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt(0o77);
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0090
     * @tc.name testBigInt64ArraySet009
     * @tc.desc Verify set with int and E writes normally boundary E value binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt(0b11);
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0100
     * @tc.name testBigInt64ArraySet010
     * @tc.desc Verify set with int and E with out-of-range insertPos negative one either throws or
     * remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-1, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0110
     * @tc.name testBigInt64ArraySet011
     * @tc.desc Verify set with int and BigInt with out-of-range insertPos negative one either throws or
     * remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-1, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0120
     * @tc.name testBigInt64ArraySet012
     * @tc.desc Verify set with int and E with out-of-range insertPos negative length either throws or
     * remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-3, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0130
     * @tc.name testBigInt64ArraySet013
     * @tc.desc Verify set with int and BigInt with out-of-range insertPos negative length either throws
     * or remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-3, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0140
     * @tc.name testBigInt64ArraySet014
     * @tc.desc Verify set with int and E with out-of-range insertPos negative length minus one either
     * throws or remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-4, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0150
     * @tc.name testBigInt64ArraySet015
     * @tc.desc Verify set with int and BigInt with out-of-range insertPos negative length minus one
     * either throws or remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-4, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0160
     * @tc.name testBigInt64ArraySet016
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 9223372036854775807n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0170
     * @tc.name testBigInt64ArraySet017
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -9223372036854775808n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0180
     * @tc.name testBigInt64ArraySet018
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 0n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0190
     * @tc.name testBigInt64ArraySet019
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0200
     * @tc.name testBigInt64ArraySet020
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0210
     * @tc.name testBigInt64ArraySet021
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing large
     * hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt('0x3F3F3F3F3F3F3F3F');
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0220
     * @tc.name testBigInt64ArraySet022
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing small negative
     * hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -BigInt('0x3F3F3F3F3F3F3F3F');
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0230
     * @tc.name testBigInt64ArraySet023
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt('0o77');
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0240
     * @tc.name testBigInt64ArraySet024
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt('0b11');
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0250
     * @tc.name testBigInt64ArraySet025
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 9223372036854775807n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0260
     * @tc.name testBigInt64ArraySet026
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 9223372036854775807n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0270
     * @tc.name testBigInt64ArraySet027
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 9223372036854775807n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0280
     * @tc.name testBigInt64ArraySet028
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -9223372036854775808n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0290
     * @tc.name testBigInt64ArraySet029
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -9223372036854775808n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0300
     * @tc.name testBigInt64ArraySet030
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -9223372036854775808n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0310
     * @tc.name testBigInt64ArraySet031
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 0n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0320
     * @tc.name testBigInt64ArraySet032
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 0n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0330
     * @tc.name testBigInt64ArraySet033
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 0n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0340
     * @tc.name testBigInt64ArraySet034
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0350
     * @tc.name testBigInt64ArraySet035
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0360
     * @tc.name testBigInt64ArraySet036
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0370
     * @tc.name testBigInt64ArraySet037
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0380
     * @tc.name testBigInt64ArraySet038
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0390
     * @tc.name testBigInt64ArraySet039
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0400
     * @tc.name testBigInt64ArraySet040
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing large hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0410
     * @tc.name testBigInt64ArraySet041
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing large hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0420
     * @tc.name testBigInt64ArraySet042
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing large hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0430
     * @tc.name testBigInt64ArraySet043
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing small negative hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0440
     * @tc.name testBigInt64ArraySet044
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing small negative hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0450
     * @tc.name testBigInt64ArraySet045
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing small negative hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0460
     * @tc.name testBigInt64ArraySet046
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0o77);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0470
     * @tc.name testBigInt64ArraySet047
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0o77);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0480
     * @tc.name testBigInt64ArraySet048
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0o77);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0490
     * @tc.name testBigInt64ArraySet049
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0b11);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0500
     * @tc.name testBigInt64ArraySet050
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0b11);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0510
     * @tc.name testBigInt64ArraySet051
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0b11);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0520
     * @tc.name testBigInt64ArraySet052
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 2 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0530
     * @tc.name testBigInt64ArraySet053
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 3 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0540
     * @tc.name testBigInt64ArraySet054
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 4 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0550
     * @tc.name testBigInt64ArraySet055
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 0 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0560
     * @tc.name testBigInt64ArraySet056
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 1 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0570
     * @tc.name testBigInt64ArraySet057
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 2 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0580
     * @tc.name testBigInt64ArraySet058
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 3 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0590
     * @tc.name testBigInt64ArraySet059
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 4 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0600
     * @tc.name testBigInt64ArraySet060
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 0 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

  });
}
