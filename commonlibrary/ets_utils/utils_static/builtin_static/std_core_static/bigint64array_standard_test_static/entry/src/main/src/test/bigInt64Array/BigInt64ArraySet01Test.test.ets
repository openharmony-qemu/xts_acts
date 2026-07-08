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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0610
     * @tc.name testBigInt64ArraySet061
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 1 writes an
     * overflowing ten-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      try {
        const src = [10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n];
        arr.set(src, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0620
     * @tc.name testBigInt64ArraySet062
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 2 writes an
     * overflowing ten-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      try {
        const src = [10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n];
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0630
     * @tc.name testBigInt64ArraySet063
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 3 writes an
     * overflowing ten-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      try {
        const src = [10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n];
        arr.set(src, 3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0640
     * @tc.name testBigInt64ArraySet064
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 4 writes an
     * overflowing ten-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      try {
        const src = [10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n, 10n];
        arr.set(src, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0650
     * @tc.name testBigInt64ArraySet065
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 0 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0660
     * @tc.name testBigInt64ArraySet066
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 1 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0670
     * @tc.name testBigInt64ArraySet067
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 2 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0680
     * @tc.name testBigInt64ArraySet068
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 3 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0690
     * @tc.name testBigInt64ArraySet069
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 4 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0700
     * @tc.name testBigInt64ArraySet070
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 0 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0710
     * @tc.name testBigInt64ArraySet071
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 1 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0720
     * @tc.name testBigInt64ArraySet072
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 2 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0730
     * @tc.name testBigInt64ArraySet073
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 3 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0740
     * @tc.name testBigInt64ArraySet074
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 4 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0750
     * @tc.name testBigInt64ArraySet075
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 0 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0760
     * @tc.name testBigInt64ArraySet076
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 1 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0770
     * @tc.name testBigInt64ArraySet077
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 2 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0780
     * @tc.name testBigInt64ArraySet078
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 3 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0790
     * @tc.name testBigInt64ArraySet079
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 4 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0800
     * @tc.name testBigInt64ArraySet080
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 0 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0810
     * @tc.name testBigInt64ArraySet081
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 1 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0820
     * @tc.name testBigInt64ArraySet082
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 2 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0830
     * @tc.name testBigInt64ArraySet083
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 3 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0840
     * @tc.name testBigInt64ArraySet084
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 4 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0850
     * @tc.name testBigInt64ArraySet085
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0860
     * @tc.name testBigInt64ArraySet086
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0870
     * @tc.name testBigInt64ArraySet087
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0880
     * @tc.name testBigInt64ArraySet088
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0890
     * @tc.name testBigInt64ArraySet089
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0900
     * @tc.name testBigInt64ArraySet090
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0910
     * @tc.name testBigInt64ArraySet091
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0920
     * @tc.name testBigInt64ArraySet092
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0930
     * @tc.name testBigInt64ArraySet093
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0940
     * @tc.name testBigInt64ArraySet094
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0950
     * @tc.name testBigInt64ArraySet095
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0960
     * @tc.name testBigInt64ArraySet096
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0970
     * @tc.name testBigInt64ArraySet097
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0980
     * @tc.name testBigInt64ArraySet098
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0990
     * @tc.name testBigInt64ArraySet099
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1000
     * @tc.name testBigInt64ArraySet100
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1010
     * @tc.name testBigInt64ArraySet101
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1020
     * @tc.name testBigInt64ArraySet102
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1030
     * @tc.name testBigInt64ArraySet103
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1040
     * @tc.name testBigInt64ArraySet104
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1050
     * @tc.name testBigInt64ArraySet105
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1060
     * @tc.name testBigInt64ArraySet106
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1070
     * @tc.name testBigInt64ArraySet107
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1080
     * @tc.name testBigInt64ArraySet108
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1090
     * @tc.name testBigInt64ArraySet109
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1100
     * @tc.name testBigInt64ArraySet110
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1110
     * @tc.name testBigInt64ArraySet111
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1120
     * @tc.name testBigInt64ArraySet112
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1130
     * @tc.name testBigInt64ArraySet113
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1140
     * @tc.name testBigInt64ArraySet114
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1150
     * @tc.name testBigInt64ArraySet115
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1160
     * @tc.name testBigInt64ArraySet116
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1170
     * @tc.name testBigInt64ArraySet117
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1180
     * @tc.name testBigInt64ArraySet118
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1190
     * @tc.name testBigInt64ArraySet119
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1200
     * @tc.name testBigInt64ArraySet120
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1210
     * @tc.name testBigInt64ArraySet121
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1220
     * @tc.name testBigInt64ArraySet122
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1230
     * @tc.name testBigInt64ArraySet123
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1240
     * @tc.name testBigInt64ArraySet124
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1250
     * @tc.name testBigInt64ArraySet125
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1260
     * @tc.name testBigInt64ArraySet126
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1270
     * @tc.name testBigInt64ArraySet127
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1280
     * @tc.name testBigInt64ArraySet128
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1290
     * @tc.name testBigInt64ArraySet129
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1300
     * @tc.name testBigInt64ArraySet130
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1310
     * @tc.name testBigInt64ArraySet131
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1320
     * @tc.name testBigInt64ArraySet132
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1330
     * @tc.name testBigInt64ArraySet133
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1340
     * @tc.name testBigInt64ArraySet134
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1350
     * @tc.name testBigInt64ArraySet135
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, 0n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1360
     * @tc.name testBigInt64ArraySet136
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, 0n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1370
     * @tc.name testBigInt64ArraySet137
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, 10n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1380
     * @tc.name testBigInt64ArraySet138
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, 10n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1390
     * @tc.name testBigInt64ArraySet139
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, -10n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1400
     * @tc.name testBigInt64ArraySet140
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, -10n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1410
     * @tc.name testBigInt64ArraySet141
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, 9223372036854775807n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1420
     * @tc.name testBigInt64ArraySet142
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, 9223372036854775807n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1430
     * @tc.name testBigInt64ArraySet143
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, -9223372036854775808n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1440
     * @tc.name testBigInt64ArraySet144
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, -9223372036854775808n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1450
     * @tc.name testBigInt64ArraySet145
     * @tc.desc Verify set with BigInt64Array 写入视图含 正数 和 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(10n, 0n);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1460
     * @tc.name testBigInt64ArraySet146
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 正数 和 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([10n, 0n]);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1470
     * @tc.name testBigInt64ArraySet147
     * @tc.desc Verify set with BigInt64Array 写入视图含 正数 和 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(10n, 10n);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1480
     * @tc.name testBigInt64ArraySet148
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 正数 和 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([10n, 10n]);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1490
     * @tc.name testBigInt64ArraySet149
     * @tc.desc Verify set(index, value) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const result = arr.set(0, 100n);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1500
     * @tc.name testBigInt64ArraySet150
     * @tc.desc Verify set(src) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([1n, 2n, 3n]);
      const result = arr.set(src);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1510
     * @tc.name testBigInt64ArraySet151
     * @tc.desc Verify set(src, offset) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(5);
      const src = new BigInt64Array([1n, 2n]);
      const result = arr.set(src, 2);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1520
     * @tc.name testBigInt64ArraySet152
     * @tc.desc Verify set(src) with 100-element BigInt64Array source verifies first middle and last positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        src[i] = BigInt(i + 1);
      }
      arr.set(src);
      expect(arr[0]).assertEqual(1n);
      expect(arr[49]).assertEqual(50n);
      expect(arr[99]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1530
     * @tc.name testBigInt64ArraySet153
     * @tc.desc Verify set(src, offset) at offset equal to target length minus src length fills to last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = new BigInt64Array([100n, 200n, 300n]);
      const offset = arr.length - src.length;
      arr.set(src, offset);
      expect(arr[5]).assertEqual(0n);
      expect(arr[6]).assertEqual(0n);
      expect(arr[7]).assertEqual(100n);
      expect(arr[8]).assertEqual(200n);
      expect(arr[9]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1540
     * @tc.name testBigInt64ArraySet154
     * @tc.desc Verify fill then set(src) overrides specific positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(5);
      arr.fill(99n);
      const src = new BigInt64Array([1n, 2n]);
      arr.set(src, 2);
      expect(arr[0]).assertEqual(99n);
      expect(arr[1]).assertEqual(99n);
      expect(arr[2]).assertEqual(1n);
      expect(arr[3]).assertEqual(2n);
      expect(arr[4]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1550
     * @tc.name testBigInt64ArraySet155
     * @tc.desc Verify shared buffer set through one BigInt64Array view and verify from another view on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view1 = new BigInt64Array(buffer, 0, 2);
      const src = new BigInt64Array([42n, 84n]);
      view1.set(src);
      const view2 = new BigInt64Array(buffer, 0, 2);
      expect(view2[0]).assertEqual(42n);
      expect(view2[1]).assertEqual(84n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1560
     * @tc.name testBigInt64ArraySet156
     * @tc.desc Verify subarray used as set(src) source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      const sub = original.subarray(1, 4);
      const arr = new BigInt64Array(3);
      arr.set(sub);
      expect(arr[0]).assertEqual(20n);
      expect(arr[1]).assertEqual(30n);
      expect(arr[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1570
     * @tc.name testBigInt64ArraySet157
     * @tc.desc Verify set(src) with MAX_VALUE and MIN_VALUE both present verifies all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const src = new BigInt64Array([
        9223372036854775807n,
        -9223372036854775808n,
        0n,
        1n
      ]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
      expect(arr[2]).assertEqual(0n);
      expect(arr[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1580
     * @tc.name testBigInt64ArraySet158
     * @tc.desc Verify set(index, value) with computed index using arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(5);
      arr.set(arr.length - 1, 999n);
      arr.set(arr.length - 2, 888n);
      arr.set(arr.length - 3, 777n);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(777n);
      expect(arr[3]).assertEqual(888n);
      expect(arr[4]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1590
     * @tc.name testBigInt64ArraySet159
     * @tc.desc Verify BYTES_PER_ELEMENT length byteLength and byteOffset preserved after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(5);
      const src = new BigInt64Array([1n, 2n, 3n]);
      arr.set(src);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(40);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1600
     * @tc.name testBigInt64ArraySet160
     * @tc.desc Verify set(src, offset) with 50 elements into 100-size target at offset 50 exact boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        src[i] = BigInt(i + 1);
      }
      arr.set(src, 50);
      expect(arr[0]).assertEqual(0n);
      expect(arr[49]).assertEqual(0n);
      expect(arr[50]).assertEqual(1n);
      expect(arr[74]).assertEqual(25n);
      expect(arr[99]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1610
     * @tc.name testBigInt64ArraySet161
     * @tc.desc Verify set(array) with alternating sign values verifies all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(5);
      arr.set([100n, -200n, 300n, -400n, 500n]);
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(-200n);
      expect(arr[2]).assertEqual(300n);
      expect(arr[3]).assertEqual(-400n);
      expect(arr[4]).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1620
     * @tc.name testBigInt64ArraySet162
     * @tc.desc Verify multiple consecutive set calls on same target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(6);
      arr.set(new BigInt64Array([10n, 20n]), 0);
      arr.set(new BigInt64Array([30n, 40n]), 2);
      arr.set(new BigInt64Array([50n, 60n]), 4);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(40n);
      expect(arr[4]).assertEqual(50n);
      expect(arr[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1630
     * @tc.name testBigInt64ArraySet163
     * @tc.desc Verify set(src, offset) on buffer-offset view with non-zero byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(32);
      const view = new BigInt64Array(buffer, 8, 3);
      const src = new BigInt64Array([111n, 222n]);
      view.set(src, 1);
      expect(view[0]).assertEqual(0n);
      expect(view[1]).assertEqual(111n);
      expect(view[2]).assertEqual(222n);
      expect(view.byteOffset).assertEqual(8);
    });
  });
}
