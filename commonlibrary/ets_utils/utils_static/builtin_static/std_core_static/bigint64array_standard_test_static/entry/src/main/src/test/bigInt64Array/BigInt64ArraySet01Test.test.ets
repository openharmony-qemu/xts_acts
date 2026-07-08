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
     * @tc.name testBigInt64ArraySetOne0010
     * @tc.desc Verify bracket assignment of 0n stores and reads back correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 0n;
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0020
     * @tc.name testBigInt64ArraySetOne0020
     * @tc.desc Verify bracket assignment of MAX signed 64-bit value stores and reads back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 9223372036854775807n;
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0030
     * @tc.name testBigInt64ArraySetOne0030
     * @tc.desc Verify bracket assignment of MIN signed 64-bit value stores and reads back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -9223372036854775807n - 1n;
      expect(arr[0]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0040
     * @tc.name testBigInt64ArraySetOne0040
     * @tc.desc Verify bracket assignment of 1n and -1n at distinct indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 1n;
      arr[2] = -1n;
      expect(arr[0]).assertEqual(1n);
      expect(arr[2]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0050
     * @tc.name testBigInt64ArraySetOne0050
     * @tc.desc Verify positive overflow value is truncated to signed 64-bit range on assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 9223372036854775808n;
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0060
     * @tc.name testBigInt64ArraySetOne0060
     * @tc.desc Verify negative overflow value is truncated to signed 64-bit range on assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -9223372036854775809n;
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0070
     * @tc.name testBigInt64ArraySetOne0070
     * @tc.desc Verify setting first element leaves other elements at their initial zero value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0080
     * @tc.desc Verify setting last element leaves other elements unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr[4] = -77n;
      expect(arr[0]).assertEqual(0n);
      expect(arr[3]).assertEqual(0n);
      expect(arr[4]).assertEqual(-77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0090
     * @tc.name testBigInt64ArraySetOne0090
     * @tc.desc Verify setting middle element leaves boundary elements unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0100
     * @tc.desc Verify sequentially assigning all elements stores each value correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0110
     * @tc.desc Verify expression-based value assignment stores computed result correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 1000n * 1000n;
      expect(arr[0]).assertEqual(1000000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0120
     * @tc.name testBigInt64ArraySetOne0120
     * @tc.desc Verify UInt32 maximum boundary value is preserved on bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 4294967295n;
      expect(arr[0]).assertEqual(4294967295n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0130
     * @tc.name testBigInt64ArraySetOne0130
     * @tc.desc Verify Int32 minimum boundary value is preserved on bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -4294967296n;
      expect(arr[0]).assertEqual(-4294967296n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0140
     * @tc.name testBigInt64ArraySetOne0140
     * @tc.desc Verify repeated writes to the same index keep the last written value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 10n;
      arr[0] = 20n;
      arr[0] = 30n;
      expect(arr[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0150
     * @tc.name testBigInt64ArraySetOne0150
     * @tc.desc Verify assignment overwrites values set by fill operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0160
     * @tc.desc Verify assignment combined with reverse produces correct element positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0170
     * @tc.desc Verify subarray bracket assignment updates the parent array at the correct offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0180
     * @tc.desc Verify bracket assignment on a buffer offset view writes to the correct memory
     * location.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0190
     * @tc.desc Verify assignment through one view on a shared buffer is visible through another
     * view on the same buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0200
     * @tc.desc Verify BYTES_PER_ELEMENT remains 8 after bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      expect(arr.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0210
     * @tc.name testBigInt64ArraySetOne0210
     * @tc.desc Verify length remains unchanged after bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr[0] = 10n;
      arr[4] = 50n;
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0220
     * @tc.name testBigInt64ArraySetOne0220
     * @tc.desc Verify byteLength remains unchanged after bracket assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr[0] = -1n;
      arr[3] = 1n;
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0230
     * @tc.name testBigInt64ArraySetOne0230
     * @tc.desc Verify byteOffset remains unchanged after bracket assignment on a buffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 8, 2);
      arr[0] = 5n;
      arr[1] = 10n;
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0240
     * @tc.name testBigInt64ArraySetOne0240
     * @tc.desc Verify large array bracket assignment at boundary indices works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0250
     * @tc.desc Verify constructor-created all-zero array has correct initial values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0260
     * @tc.name testBigInt64ArraySetOne0260
     * @tc.desc Verify alternating positive and negative value assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0270
     * @tc.desc Verify assignment of powers of two values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0280
     * @tc.desc Verify assignment of a large arbitrary positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 1311768467463790320n;
      expect(arr[0]).assertEqual(1311768467463790320n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0290
     * @tc.name testBigInt64ArraySetOne0290
     * @tc.desc Verify assignment of a specific large arbitrary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 6148914691236517205n;
      expect(arr[0]).assertEqual(6148914691236517205n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0300
     * @tc.name testBigInt64ArraySetOne0300
     * @tc.desc Verify assignment of a smaller arbitrary positive value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 2941116470193674n;
      expect(arr[0]).assertEqual(2941116470193674n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0310
     * @tc.name testBigInt64ArraySetOne0310
     * @tc.desc Verify assignment of a negative arbitrary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = -1311768467463790320n;
      expect(arr[0]).assertEqual(-1311768467463790320n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0320
     * @tc.name testBigInt64ArraySetOne0320
     * @tc.desc Verify MAX then MIN then 0 assigned to same index keeps only the last value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 9223372036854775807n;
      arr[0] = -9223372036854775807n - 1n;
      arr[0] = 0n;
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0330
     * @tc.name testBigInt64ArraySetOne0330
     * @tc.desc Verify assignment after copyWithin operation overrides copied values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0340
     * @tc.desc Verify two separate views over non-overlapping buffer regions are independent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0350
     * @tc.desc Verify assignment using values that are powers of ten.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0360
     * @tc.desc Verify bracket assignment on a zero-length array has no effect on buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf, 0, 0);
      expect(arr.length).assertEqual(0);
      expect(arr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0370
     * @tc.name testBigInt64ArraySetOne0370
     * @tc.desc Verify setting a value and then reading from a different reference to the same
     * array reflects the change.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let ref = arr;
      arr[0] = 42n;
      expect(ref[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0380
     * @tc.name testBigInt64ArraySetOne0380
     * @tc.desc Verify assigning a negative value to the last element of a multi-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0390
     * @tc.desc Verify assignment of negative powers of two values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0400
     * @tc.desc Verify that assignment preserves the underlying buffer reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      arr[0] = 1n;
      arr[1] = 2n;
      expect(arr.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0410
     * @tc.name testBigInt64ArraySetOne0410
     * @tc.desc Verify assignment with two large-value elements does not corrupt adjacent memory.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 9223372036854775807n;
      arr[2] = -9223372036854775807n - 1n;
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[2]).assertEqual(-9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_ONE_0420
     * @tc.name testBigInt64ArraySetOne0420
     * @tc.desc Verify assignment on nested views keeps all reads consistent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0430
     * @tc.desc Verify assigning values in descending order works correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.name testBigInt64ArraySetOne0440
     * @tc.desc Verify bracket assignment combined with fill on remaining elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySetOne0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0450
     * @tc.name testBigInt64ArraySet0450
     * @tc.desc Verify set with int and E writes normally boundary E value maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 9223372036854775807n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0460
     * @tc.name testBigInt64ArraySet0460
     * @tc.desc Verify set with int and E writes normally boundary E value minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -9223372036854775808n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0470
     * @tc.name testBigInt64ArraySet0470
     * @tc.desc Verify set with int and E writes normally boundary E value zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 0n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0480
     * @tc.name testBigInt64ArraySet0480
     * @tc.desc Verify set with int and E writes normally boundary E value positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 1n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0490
     * @tc.name testBigInt64ArraySet0490
     * @tc.desc Verify set with int and E writes normally boundary E value negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -1n;
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0500
     * @tc.name testBigInt64ArraySet0500
     * @tc.desc Verify set with int and E writes normally boundary E value large hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt("0x3F3F3F3F3F3F3F3F");
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0510
     * @tc.name testBigInt64ArraySet0510
     * @tc.desc Verify set with int and E writes normally boundary E value small negative hexadecimal
     * value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -BigInt("0x3F3F3F3F3F3F3F3F");
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0520
     * @tc.name testBigInt64ArraySet0520
     * @tc.desc Verify set with int and E writes normally boundary E value octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt(0o77);
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0530
     * @tc.name testBigInt64ArraySet0530
     * @tc.desc Verify set with int and E writes normally boundary E value binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt(0b11);
      arr.set(0, eVal);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0540
     * @tc.name testBigInt64ArraySet0540
     * @tc.desc Verify set with int and E with out-of-range insertPos negative one either throws or
     * remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-1, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0550
     * @tc.name testBigInt64ArraySet0550
     * @tc.desc Verify set with int and BigInt with out-of-range insertPos negative one either throws or
     * remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-1, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0560
     * @tc.name testBigInt64ArraySet0560
     * @tc.desc Verify set with int and E with out-of-range insertPos negative length either throws or
     * remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-3, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0570
     * @tc.name testBigInt64ArraySet0570
     * @tc.desc Verify set with int and BigInt with out-of-range insertPos negative length either throws
     * or remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-3, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0580
     * @tc.name testBigInt64ArraySet0580
     * @tc.desc Verify set with int and E with out-of-range insertPos negative length minus one either
     * throws or remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-4, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0590
     * @tc.name testBigInt64ArraySet0590
     * @tc.desc Verify set with int and BigInt with out-of-range insertPos negative length minus one
     * either throws or remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      try {
        arr.set(-4, 10n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0600
     * @tc.name testBigInt64ArraySet0600
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 9223372036854775807n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0610
     * @tc.name testBigInt64ArraySet0610
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -9223372036854775808n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0620
     * @tc.name testBigInt64ArraySet0620
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 0n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0630
     * @tc.name testBigInt64ArraySet0630
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = 1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0640
     * @tc.name testBigInt64ArraySet0640
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0650
     * @tc.name testBigInt64ArraySet0650
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing large
     * hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt('0x3F3F3F3F3F3F3F3F');
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0660
     * @tc.name testBigInt64ArraySet0660
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing small negative
     * hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = -BigInt('0x3F3F3F3F3F3F3F3F');
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0670
     * @tc.name testBigInt64ArraySet0670
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt('0o77');
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0680
     * @tc.name testBigInt64ArraySet0680
     * @tc.desc Verify set with FixedArray<E> writes a single-element E array containing binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const eVal: bigint = BigInt('0b11');
      const src = new BigInt64Array([eVal]);
      arr.set(src);
      expect(arr[0]).assertEqual(eVal);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0690
     * @tc.name testBigInt64ArraySet0690
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 9223372036854775807n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0700
     * @tc.name testBigInt64ArraySet0700
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 9223372036854775807n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0710
     * @tc.name testBigInt64ArraySet0710
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 9223372036854775807n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0720
     * @tc.name testBigInt64ArraySet0720
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -9223372036854775808n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0730
     * @tc.name testBigInt64ArraySet0730
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -9223372036854775808n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0740
     * @tc.name testBigInt64ArraySet0740
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -9223372036854775808n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0750
     * @tc.name testBigInt64ArraySet0750
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 0n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0760
     * @tc.name testBigInt64ArraySet0760
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 0n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0770
     * @tc.name testBigInt64ArraySet0770
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 0n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0780
     * @tc.name testBigInt64ArraySet0780
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0790
     * @tc.name testBigInt64ArraySet0790
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0800
     * @tc.name testBigInt64ArraySet0800
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing positive one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = 1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0810
     * @tc.name testBigInt64ArraySet0810
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0820
     * @tc.name testBigInt64ArraySet0820
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0830
     * @tc.name testBigInt64ArraySet0830
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -1n;
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0840
     * @tc.name testBigInt64ArraySet0840
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing large hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0850
     * @tc.name testBigInt64ArraySet0850
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing large hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0860
     * @tc.name testBigInt64ArraySet0860
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing large hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0870
     * @tc.name testBigInt64ArraySet0870
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing small negative hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0880
     * @tc.name testBigInt64ArraySet0880
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing small negative hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0890
     * @tc.name testBigInt64ArraySet0890
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing small negative hexadecimal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = -BigInt("0x3F3F3F3F3F3F3F3F");
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0900
     * @tc.name testBigInt64ArraySet0900
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0o77);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0910
     * @tc.name testBigInt64ArraySet0910
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0o77);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0920
     * @tc.name testBigInt64ArraySet0920
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing octal value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0o77);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0930
     * @tc.name testBigInt64ArraySet0930
     * @tc.desc Verify set with FixedArray<E> and offset at offset zerowrites a single-element E array
     * containing binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0b11);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0940
     * @tc.name testBigInt64ArraySet0940
     * @tc.desc Verify set with FixedArray<E> and offset at the middle offsetwrites a single-element E
     * array containing binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0b11);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0950
     * @tc.name testBigInt64ArraySet0950
     * @tc.desc Verify set with FixedArray<E> and offset before the last valid offsetwrites a
     * single-element E array containing binary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      const eVal: bigint = BigInt(0b11);
      const src = new BigInt64Array([eVal]);
      arr.set(src, 2);
      expect(arr[2]).assertEqual(eVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0960
     * @tc.name testBigInt64ArraySet0960
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 2 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0970
     * @tc.name testBigInt64ArraySet0970
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 3 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0980
     * @tc.name testBigInt64ArraySet0980
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 4 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_0990
     * @tc.name testBigInt64ArraySet0990
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 0 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1000
     * @tc.name testBigInt64ArraySet1000
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 1 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1010
     * @tc.name testBigInt64ArraySet1010
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 2 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1020
     * @tc.name testBigInt64ArraySet1020
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 3 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1030
     * @tc.name testBigInt64ArraySet1030
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 4 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1040
     * @tc.name testBigInt64ArraySet1040
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 0 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(10);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1050
     * @tc.name testBigInt64ArraySet1050
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 1 writes an
     * overflowing ten-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1060
     * @tc.name testBigInt64ArraySet1060
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 2 writes an
     * overflowing ten-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1070
     * @tc.name testBigInt64ArraySet1070
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 3 writes an
     * overflowing ten-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1080
     * @tc.name testBigInt64ArraySet1080
     * @tc.desc Verify set with ArrayLike<BigInt> and offset capacity 10 from offset 4 writes an
     * overflowing ten-element source throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1090
     * @tc.name testBigInt64ArraySet1090
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 0 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1100
     * @tc.name testBigInt64ArraySet1100
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 1 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1110
     * @tc.name testBigInt64ArraySet1110
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 2 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1120
     * @tc.name testBigInt64ArraySet1120
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 3 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1130
     * @tc.name testBigInt64ArraySet1130
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 4 writes a
     * one-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1140
     * @tc.name testBigInt64ArraySet1140
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 0 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1150
     * @tc.name testBigInt64ArraySet1150
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 1 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1160
     * @tc.name testBigInt64ArraySet1160
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 2 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1170
     * @tc.name testBigInt64ArraySet1170
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 3 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1180
     * @tc.name testBigInt64ArraySet1180
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 4 writes a
     * two-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1190
     * @tc.name testBigInt64ArraySet1190
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 0 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1200
     * @tc.name testBigInt64ArraySet1200
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 1 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1210
     * @tc.name testBigInt64ArraySet1210
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 2 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1220
     * @tc.name testBigInt64ArraySet1220
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 3 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1230
     * @tc.name testBigInt64ArraySet1230
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 4 writes a
     * five-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1240
     * @tc.name testBigInt64ArraySet1240
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 0 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 0);
      expect(arr[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1250
     * @tc.name testBigInt64ArraySet1250
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 1 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1260
     * @tc.name testBigInt64ArraySet1260
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 2 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 2);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1270
     * @tc.name testBigInt64ArraySet1270
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 3 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 3);
      expect(arr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1280
     * @tc.name testBigInt64ArraySet1280
     * @tc.desc Verify set with ArrayLike<BigInt> and offset large capacity from offset 4 writes a
     * ten-element source successfully
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(100);
      const src = [9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n, 9n];
      arr.set(src, 4);
      expect(arr[4]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1290
     * @tc.name testBigInt64ArraySet1290
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1300
     * @tc.name testBigInt64ArraySet1300
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1310
     * @tc.name testBigInt64ArraySet1310
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1320
     * @tc.name testBigInt64ArraySet1320
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1330
     * @tc.name testBigInt64ArraySet1330
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1340
     * @tc.name testBigInt64ArraySet1340
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1350
     * @tc.name testBigInt64ArraySet1350
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1360
     * @tc.name testBigInt64ArraySet1360
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1370
     * @tc.name testBigInt64ArraySet1370
     * @tc.desc Verify set with FixedArray<E> 写入双元素 0 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1380
     * @tc.name testBigInt64ArraySet1380
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 0 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([0n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1390
     * @tc.name testBigInt64ArraySet1390
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1400
     * @tc.name testBigInt64ArraySet1400
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1410
     * @tc.name testBigInt64ArraySet1410
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1420
     * @tc.name testBigInt64ArraySet1420
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1430
     * @tc.name testBigInt64ArraySet1430
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1440
     * @tc.name testBigInt64ArraySet1440
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1450
     * @tc.name testBigInt64ArraySet1450
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1460
     * @tc.name testBigInt64ArraySet1460
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1470
     * @tc.name testBigInt64ArraySet1470
     * @tc.desc Verify set with FixedArray<E> 写入双元素 正数 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1480
     * @tc.name testBigInt64ArraySet1480
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 正数 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([10n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1490
     * @tc.name testBigInt64ArraySet1490
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1500
     * @tc.name testBigInt64ArraySet1500
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1510
     * @tc.name testBigInt64ArraySet1510
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1520
     * @tc.name testBigInt64ArraySet1520
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1530
     * @tc.name testBigInt64ArraySet1530
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1540
     * @tc.name testBigInt64ArraySet1540
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1550
     * @tc.name testBigInt64ArraySet1550
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1560
     * @tc.name testBigInt64ArraySet1560
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1570
     * @tc.name testBigInt64ArraySet1570
     * @tc.desc Verify set with FixedArray<E> 写入双元素 负数 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1580
     * @tc.name testBigInt64ArraySet1580
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 负数 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-10n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1590
     * @tc.name testBigInt64ArraySet1590
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1600
     * @tc.name testBigInt64ArraySet1600
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1610
     * @tc.name testBigInt64ArraySet1610
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1620
     * @tc.name testBigInt64ArraySet1620
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1630
     * @tc.name testBigInt64ArraySet1630
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1640
     * @tc.name testBigInt64ArraySet1640
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1650
     * @tc.name testBigInt64ArraySet1650
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1660
     * @tc.name testBigInt64ArraySet1660
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1670
     * @tc.name testBigInt64ArraySet1670
     * @tc.desc Verify set with FixedArray<E> 写入双元素 maximum value 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1680
     * @tc.name testBigInt64ArraySet1680
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 maximum value 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1690
     * @tc.name testBigInt64ArraySet1690
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1700
     * @tc.name testBigInt64ArraySet1700
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 0n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1710
     * @tc.name testBigInt64ArraySet1710
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1720
     * @tc.name testBigInt64ArraySet1720
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1730
     * @tc.name testBigInt64ArraySet1730
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1740
     * @tc.name testBigInt64ArraySet1740
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, -10n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1750
     * @tc.name testBigInt64ArraySet1750
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1760
     * @tc.name testBigInt64ArraySet1760
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, 9223372036854775807n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1770
     * @tc.name testBigInt64ArraySet1770
     * @tc.desc Verify set with FixedArray<E> 写入双元素 minimum value 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1780
     * @tc.name testBigInt64ArraySet1780
     * @tc.desc Verify set with FixedArray<BigInt> 写入双元素 minimum value 与 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([-9223372036854775808n, -9223372036854775808n]);
      arr.set(src);
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1790
     * @tc.name testBigInt64ArraySet1790
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, 0n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1800
     * @tc.name testBigInt64ArraySet1800
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, 0n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1810
     * @tc.name testBigInt64ArraySet1810
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, 10n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1820
     * @tc.name testBigInt64ArraySet1820
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, 10n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1830
     * @tc.name testBigInt64ArraySet1830
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, -10n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1840
     * @tc.name testBigInt64ArraySet1840
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 负数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, -10n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1850
     * @tc.name testBigInt64ArraySet1850
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, 9223372036854775807n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1860
     * @tc.name testBigInt64ArraySet1860
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, 9223372036854775807n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1870
     * @tc.name testBigInt64ArraySet1870
     * @tc.desc Verify set with BigInt64Array 写入视图含 0 和 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(0n, -9223372036854775808n);
      arr.set(src);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1880
     * @tc.name testBigInt64ArraySet1880
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 0 和 minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([0n, -9223372036854775808n]);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1890
     * @tc.name testBigInt64ArraySet1890
     * @tc.desc Verify set with BigInt64Array 写入视图含 正数 和 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(10n, 0n);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1900
     * @tc.name testBigInt64ArraySet1900
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 正数 和 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([10n, 0n]);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1910
     * @tc.name testBigInt64ArraySet1910
     * @tc.desc Verify set with BigInt64Array 写入视图含 正数 和 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      const src = BigInt64Array.of(10n, 10n);
      arr.set(src);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1920
     * @tc.name testBigInt64ArraySet1920
     * @tc.desc Verify set with ArrayLike<BigInt> 写入类数组含 正数 和 正数
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(2);
      arr.set([10n, 10n]);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1930
     * @tc.name testBigInt64ArraySet1930
     * @tc.desc Verify set(index, value) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const result = arr.set(0, 100n);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1940
     * @tc.name testBigInt64ArraySet1940
     * @tc.desc Verify set(src) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      const src = new BigInt64Array([1n, 2n, 3n]);
      const result = arr.set(src);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1950
     * @tc.name testBigInt64ArraySet1950
     * @tc.desc Verify set(src, offset) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(5);
      const src = new BigInt64Array([1n, 2n]);
      const result = arr.set(src, 2);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1960
     * @tc.name testBigInt64ArraySet1960
     * @tc.desc Verify set(src) with 100-element BigInt64Array source verifies first middle and last positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1970
     * @tc.name testBigInt64ArraySet1970
     * @tc.desc Verify set(src, offset) at offset equal to target length minus src length fills to last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1980
     * @tc.name testBigInt64ArraySet1980
     * @tc.desc Verify fill then set(src) overrides specific positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_1990
     * @tc.name testBigInt64ArraySet1990
     * @tc.desc Verify shared buffer set through one BigInt64Array view and verify from another view on same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet1990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(16);
      const view1 = new BigInt64Array(buffer, 0, 2);
      const src = new BigInt64Array([42n, 84n]);
      view1.set(src);
      const view2 = new BigInt64Array(buffer, 0, 2);
      expect(view2[0]).assertEqual(42n);
      expect(view2[1]).assertEqual(84n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_2000
     * @tc.name testBigInt64ArraySet2000
     * @tc.desc Verify subarray used as set(src) source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      const sub = original.subarray(1, 4);
      const arr = new BigInt64Array(3);
      arr.set(sub);
      expect(arr[0]).assertEqual(20n);
      expect(arr[1]).assertEqual(30n);
      expect(arr[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_2010
     * @tc.name testBigInt64ArraySet2010
     * @tc.desc Verify set(src) with MAX_VALUE and MIN_VALUE both present verifies all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_2020
     * @tc.name testBigInt64ArraySet2020
     * @tc.desc Verify set(index, value) with computed index using arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_2030
     * @tc.name testBigInt64ArraySet2030
     * @tc.desc Verify BYTES_PER_ELEMENT length byteLength and byteOffset preserved after set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(5);
      const src = new BigInt64Array([1n, 2n, 3n]);
      arr.set(src);
      expect(arr.length).assertEqual(5);
      expect(arr.byteLength).assertEqual(40);
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_2040
     * @tc.name testBigInt64ArraySet2040
     * @tc.desc Verify set(src, offset) with 50 elements into 100-size target at offset 50 exact boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet2040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_2050
     * @tc.name testBigInt64ArraySet2050
     * @tc.desc Verify set(array) with alternating sign values verifies all positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet2050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(5);
      arr.set([100n, -200n, 300n, -400n, 500n]);
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(-200n);
      expect(arr[2]).assertEqual(300n);
      expect(arr[3]).assertEqual(-400n);
      expect(arr[4]).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_2060
     * @tc.name testBigInt64ArraySet2060
     * @tc.desc Verify multiple consecutive set calls on same target
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet2060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SET_2070
     * @tc.name testBigInt64ArraySet2070
     * @tc.desc Verify set(src, offset) on buffer-offset view with non-zero byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySet2070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
