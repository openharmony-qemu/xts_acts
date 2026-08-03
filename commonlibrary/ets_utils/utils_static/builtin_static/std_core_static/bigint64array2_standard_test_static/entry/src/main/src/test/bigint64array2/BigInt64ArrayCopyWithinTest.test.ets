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

export default function BigInt64ArrayCopyWithinTest(): void {
  describe('BigInt64ArrayCopyWithinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_0100
     * @tc.name testBigInt64ArrayCopyWithin001
     * @tc.desc Verify copyWithin(0, 1) returns the same array reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.copyWithin(0, 1);
      expect(res).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_0200
     * @tc.name testBigInt64ArrayCopyWithin002
     * @tc.desc Verify copyWithin(0, 1) has changed the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_0300
     * @tc.name testBigInt64ArrayCopyWithin003
     * @tc.desc Verify the array is unchanged after copyWithin(0, 0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.copyWithin(0, 0);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_0400
     * @tc.name testBigInt64ArrayCopyWithin004
     * @tc.desc Verify buffer reference is unchanged after copyWithin(1, 0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let oldBuf = arr.buffer;
      let res = arr.copyWithin(1, 0);
      expect(res.buffer).assertEqual(oldBuf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_0500
     * @tc.name testBigInt64ArrayCopyWithin005
     * @tc.desc Verify byteOffset is unchanged after copyWithin(1, 0).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let oldOffset = arr.byteOffset;
      let res = arr.copyWithin(1, 0);
      expect(res.byteOffset).assertEqual(oldOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_0600
     * @tc.name testBigInt64ArrayCopyWithin006
     * @tc.desc Verify copyWithin on ArrayBuffer based array preserves byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 8, 5);
      arr[0] = 11n;
      arr[1] = 22n;
      arr[2] = 33n;
      arr[3] = 44n;
      arr[4] = 55n;
      let oldOffset = arr.byteOffset;
      arr.copyWithin(0, 2, 3);
      expect(arr.byteOffset).assertEqual(oldOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_0700
     * @tc.name testBigInt64ArrayCopyWithin007
     * @tc.desc Verify copyWithin with negative target -1 copies from index 0 to the last position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(-1, 0, 1);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_0800
     * @tc.name testBigInt64ArrayCopyWithin008
     * @tc.desc Verify copyWithin target one start zero end two copies first two elements shifted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.copyWithin(1, 0, 2);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_0900
     * @tc.name testBigInt64ArrayCopyWithin009
     * @tc.desc Verify copyWithin target two start zero end two copies to index two.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(2, 0, 2);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
      expect(arr[3]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1000
     * @tc.name testBigInt64ArrayCopyWithin010
     * @tc.desc Verify copyWithin with target zero start two end four on five element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(30n);
      expect(arr[1]).assertEqual(40n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(40n);
      expect(arr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1100
     * @tc.name testBigInt64ArrayCopyWithin011
     * @tc.desc Verify copyWithin target one start zero copies all from start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(1, 0);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1200
     * @tc.name testBigInt64ArrayCopyWithin012
     * @tc.desc Verify copyWithin target zero start two copies element from index two onward.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(30n);
      expect(arr[1]).assertEqual(40n);
      expect(arr[2]).assertEqual(50n);
      expect(arr[3]).assertEqual(40n);
      expect(arr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1300
     * @tc.name testBigInt64ArrayCopyWithin013
     * @tc.desc Verify copyWithin with precise element level verification on six elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      arr.copyWithin(2, 0, 4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
      expect(arr[3]).assertEqual(2n);
      expect(arr[4]).assertEqual(3n);
      expect(arr[5]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1400
     * @tc.name testBigInt64ArrayCopyWithin014
     * @tc.desc Verify copyWithin copies rightmost single element to target zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(0, 3, 4);
      expect(arr[0]).assertEqual(40n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1500
     * @tc.name testBigInt64ArrayCopyWithin015
     * @tc.desc Verify copyWithin with negative target minus one start zero end two.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(-1, 0, 2);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1600
     * @tc.name testBigInt64ArrayCopyWithin016
     * @tc.desc Verify copyWithin with negative start minus two target zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(0, -2);
      expect(arr[0]).assertEqual(30n);
      expect(arr[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1700
     * @tc.name testBigInt64ArrayCopyWithin017
     * @tc.desc Verify copyWithin with negative end minus one clamps correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.copyWithin(0, 1, -1);
      expect(arr[0]).assertEqual(20n);
      expect(arr[1]).assertEqual(30n);
      expect(arr[2]).assertEqual(40n);
      expect(arr[3]).assertEqual(40n);
      expect(arr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1800
     * @tc.name testBigInt64ArrayCopyWithin018
     * @tc.desc Verify copyWithin with mixed negative and zero parameters target minus three start zero end minus one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.copyWithin(-3, 0, -1);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_1900
     * @tc.name testBigInt64ArrayCopyWithin019
     * @tc.desc Verify copyWithin with negative start minus ten clamps to zero target zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.copyWithin(0, -10, 2);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2000
     * @tc.name testBigInt64ArrayCopyWithin020
     * @tc.desc Verify copyWithin with negative target minus five clamps to zero start one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.copyWithin(-5, 1, 3);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2100
     * @tc.name testBigInt64ArrayCopyWithin021
     * @tc.desc Verify copyWithin with negative target minus one start zero end five overflow.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.copyWithin(-1, 0, 5);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2200
     * @tc.name testBigInt64ArrayCopyWithin022
     * @tc.desc Verify copyWithin with negative end minus two on four element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(0, 1, -2);
      expect(arr[0]).assertEqual(20n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2300
     * @tc.name testBigInt64ArrayCopyWithin023
     * @tc.desc Verify copyWithin with all three parameters negative relative to length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(-4, -5, -1);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(1n);
      expect(arr[2]).assertEqual(2n);
      expect(arr[3]).assertEqual(3n);
      expect(arr[4]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2400
     * @tc.name testBigInt64ArrayCopyWithin024
     * @tc.desc Verify copyWithin start equals length end equals length is no op.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let old0 = arr[0];
      let old1 = arr[1];
      let old2 = arr[2];
      arr.copyWithin(0, 3, 3);
      expect(arr[0]).assertEqual(old0);
      expect(arr[1]).assertEqual(old1);
      expect(arr[2]).assertEqual(old2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2500
     * @tc.name testBigInt64ArrayCopyWithin025
     * @tc.desc Verify copyWithin end beyond length clamps to length copy all from start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n]);
      arr.copyWithin(1, 0, 10);
      expect(arr[0]).assertEqual(-1n);
      expect(arr[1]).assertEqual(-1n);
      expect(arr[2]).assertEqual(-2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2600
     * @tc.name testBigInt64ArrayCopyWithin026
     * @tc.desc Verify copyWithin target at length minus one start zero end four truncates.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(3, 0, 4);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2700
     * @tc.name testBigInt64ArrayCopyWithin027
     * @tc.desc Verify overlapping copyWithin target one start zero end three right shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(1, 0, 3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(1n);
      expect(arr[2]).assertEqual(2n);
      expect(arr[3]).assertEqual(3n);
      expect(arr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2800
     * @tc.name testBigInt64ArrayCopyWithin028
     * @tc.desc Verify overlapping copyWithin target zero start one end four left shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(4n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_2900
     * @tc.name testBigInt64ArrayCopyWithin029
     * @tc.desc Verify overlapping copyWithin with negative values left shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n, -4n, -5n]);
      arr.copyWithin(0, 2, 5);
      expect(arr[0]).assertEqual(-3n);
      expect(arr[1]).assertEqual(-4n);
      expect(arr[2]).assertEqual(-5n);
      expect(arr[3]).assertEqual(-4n);
      expect(arr[4]).assertEqual(-5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3000
     * @tc.name testBigInt64ArrayCopyWithin030
     * @tc.desc Verify copyWithin right shift overlap with large gap target two start zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.copyWithin(2, 0, 3);
      expect(arr[0]).assertEqual(10n);
      expect(arr[2]).assertEqual(10n);
      expect(arr[3]).assertEqual(20n);
      expect(arr[4]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3100
     * @tc.name testBigInt64ArrayCopyWithin031
     * @tc.desc Verify copyWithin single element overlap target zero start zero end one no change.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      arr.copyWithin(0, 0, 1);
      expect(arr[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3200
     * @tc.name testBigInt64ArrayCopyWithin032
     * @tc.desc Verify overlapping copyWithin with MAX values right shift preserves order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 2n, 3n, 4n]);
      arr.copyWithin(1, 0, 3);
      expect(arr[1]).assertEqual(9223372036854775807n);
      expect(arr[2]).assertEqual(2n);
      expect(arr[3]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3300
     * @tc.name testBigInt64ArrayCopyWithin033
     * @tc.desc Verify copyWithin with target zero and start zero copies entire array onto itself (no-op).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.copyWithin(0, 0, 3);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3400
     * @tc.name testBigInt64ArrayCopyWithin034
     * @tc.desc Verify copyWithin single argument target two copies from zero to end shifted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(2);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
      expect(arr[3]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3500
     * @tc.name testBigInt64ArrayCopyWithin035
     * @tc.desc Verify copyWithin on empty array does not throw; OOB access throws RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      arr.copyWithin(0, 0);
      try {
        arr[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3600
     * @tc.name testBigInt64ArrayCopyWithin036
     * @tc.desc Verify copyWithin on ten element array target zero start five end eight.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n, 9n]);
      arr.copyWithin(0, 5, 8);
      expect(arr[0]).assertEqual(5n);
      expect(arr[1]).assertEqual(6n);
      expect(arr[2]).assertEqual(7n);
      expect(arr[3]).assertEqual(3n);
      expect(arr[9]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3700
     * @tc.name testBigInt64ArrayCopyWithin037
     * @tc.desc Verify copyWithin on hundred element array loop initialized target fifty start zero end ten.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) { arr[i] = BigInt(i); }
      arr.copyWithin(50, 0, 10);
      expect(arr[50]).assertEqual(0n);
      expect(arr[51]).assertEqual(1n);
      expect(arr[59]).assertEqual(9n);
      expect(arr[60]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3800
     * @tc.name testBigInt64ArrayCopyWithin038
     * @tc.desc Verify copyWithin on ArrayBuffer based array with nonzero byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 8, 5);
      arr[0] = 11n;
      arr[1] = 22n;
      arr[2] = 33n;
      arr[3] = 44n;
      arr[4] = 55n;
      arr.copyWithin(0, 2, 3);
      expect(arr[0]).assertEqual(33n);
      expect(arr[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_3900
     * @tc.name testBigInt64ArrayCopyWithin039
     * @tc.desc Verify copyWithin on array constructed with explicit length and filled.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      arr[3] = 40n;
      arr[4] = 50n;
      arr.copyWithin(1, 3, 5);
      expect(arr[1]).assertEqual(40n);
      expect(arr[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4000
     * @tc.name testBigInt64ArrayCopyWithin040
     * @tc.desc Verify copyWithin on subarray view only affects the subarray range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      sub.copyWithin(0, 1);
      expect(sub[0]).assertEqual(30n);
      expect(sub[1]).assertEqual(40n);
      expect(sub[2]).assertEqual(40n);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4100
     * @tc.name testBigInt64ArrayCopyWithin041
     * @tc.desc Verify copyWithin on array constructed from another array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([5n, 10n, 15n, 20n]);
      let arr = new BigInt64Array(src);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(15n);
      expect(arr[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4200
     * @tc.name testBigInt64ArrayCopyWithin042
     * @tc.desc Verify copyWithin on zero byteOffset ArrayBuffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 0, 3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      arr.copyWithin(0, 1);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4300
     * @tc.name testBigInt64ArrayCopyWithin043
     * @tc.desc Verify copyWithin on array with all identical values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 7n, 7n, 7n]);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(7n);
      expect(arr[1]).assertEqual(7n);
      expect(arr[2]).assertEqual(7n);
      expect(arr[3]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4400
     * @tc.name testBigInt64ArrayCopyWithin044
     * @tc.desc Verify copyWithin on array with alternating positive negative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n, 3n, -3n]);
      arr.copyWithin(0, 2, 4);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(-2n);
      expect(arr[4]).assertEqual(3n);
      expect(arr[5]).assertEqual(-3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4500
     * @tc.name testBigInt64ArrayCopyWithin045
     * @tc.desc Verify copyWithin on array with all zero elements non-trivial copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n]);
      arr[2] = 99n;
      arr.copyWithin(0, 2, 3);
      expect(arr[0]).assertEqual(99n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(99n);
      expect(arr[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4600
     * @tc.name testBigInt64ArrayCopyWithin046
     * @tc.desc Verify copyWithin on array with all negative values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, -20n, -30n, -40n]);
      arr.copyWithin(1, 0, 2);
      expect(arr[0]).assertEqual(-10n);
      expect(arr[1]).assertEqual(-10n);
      expect(arr[2]).assertEqual(-20n);
      expect(arr[3]).assertEqual(-40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4700
     * @tc.name testBigInt64ArrayCopyWithin047
     * @tc.desc Verify copyWithin on array with mixed extreme boundary values copies elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 0n, 1n, -1n]);
      arr.copyWithin(1, 0, 2);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(9223372036854775807n);
      expect(arr[2]).assertEqual(-9223372036854775808n);
      expect(arr[3]).assertEqual(1n);
      expect(arr[4]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4800
     * @tc.name testBigInt64ArrayCopyWithin048
     * @tc.desc Verify copyWithin all max values array overlapping copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n, 9223372036854775807n, 9223372036854775807n]);
      arr.copyWithin(2, 0, 2);
      expect(arr[2]).assertEqual(9223372036854775807n);
      expect(arr[3]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_4900
     * @tc.name testBigInt64ArrayCopyWithin049
     * @tc.desc Verify copyWithin all min values array overlapping copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n, -9223372036854775808n, -9223372036854775808n]);
      arr.copyWithin(1, 0, 3);
      expect(arr[1]).assertEqual(-9223372036854775808n);
      expect(arr[2]).assertEqual(-9223372036854775808n);
      expect(arr[3]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5000
     * @tc.name testBigInt64ArrayCopyWithin050
     * @tc.desc Verify chained fill after copyWithin produces correct element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.copyWithin(1, 0).fill(88n, 0, 1);
      expect(res[0]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5100
     * @tc.name testBigInt64ArrayCopyWithin051
     * @tc.desc Verify copyWithin followed by with() produces correct final array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(1, 0, 2);
      let res = arr.with(3, 99n);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(10n);
      expect(res[2]).assertEqual(20n);
      expect(res[3]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5200
     * @tc.name testBigInt64ArrayCopyWithin052
     * @tc.desc Verify with after copyWithin on same array produces independent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(1, 2, 4);
      let res = arr.with(0, 99n);
      expect(res[0]).assertEqual(99n);
      expect(res[1]).assertEqual(30n);
      expect(res[2]).assertEqual(40n);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5300
     * @tc.name testBigInt64ArrayCopyWithin053
     * @tc.desc Verify forEach after copyWithin iterates all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(0, 1);
      let sum: bigint = 0n;
      arr.forEach((v: bigint): void => { sum = sum + v; });
      expect(sum).assertEqual(13n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5400
     * @tc.name testBigInt64ArrayCopyWithin054
     * @tc.desc Verify values iterator after copyWithin produces correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.copyWithin(0, 1);
      let first: bigint = 0n;
      for (let v of arr.values()) { first = v; break; }
      expect(first).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5500
     * @tc.name testBigInt64ArrayCopyWithin055
     * @tc.desc Verify fill then copyWithin on same array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(5n);
      arr[3] = 99n;
      arr.copyWithin(0, 3, 4);
      expect(arr[0]).assertEqual(99n);
      expect(arr[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5600
     * @tc.name testBigInt64ArrayCopyWithin056
     * @tc.desc Verify copyWithin then fill on different regions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(2, 0, 2);
      arr.fill(99n, 0, 1);
      expect(arr[0]).assertEqual(99n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5700
     * @tc.name testBigInt64ArrayCopyWithin057
     * @tc.desc Verify sort after copyWithin on array with unordered elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 40n, 20n]);
      arr.copyWithin(0, 2, 4);
      arr.sort();
      expect(arr[0]).assertEqual(20n);
      expect(arr[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5800
     * @tc.name testBigInt64ArrayCopyWithin058
     * @tc.desc Verify slice after copyWithin captures current state correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(1, 0, 2);
      let sliced = arr.slice(0, 2);
      expect(sliced[0]).assertEqual(10n);
      expect(sliced[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_5900
     * @tc.name testBigInt64ArrayCopyWithin059
     * @tc.desc Verify every on copyWithin result returns expected boolean.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.copyWithin(0, 1);
      let allPositive = arr.every((v: bigint): boolean => v > 0n);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6000
     * @tc.name testBigInt64ArrayCopyWithin060
     * @tc.desc Verify copyWithin target positive one start zero end omitted on max min array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      arr.copyWithin(1, 0);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6100
     * @tc.name testBigInt64ArrayCopyWithin061
     * @tc.desc Verify copyWithin with negative target and negative start correct clamping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(-2, -3, -1);
      expect(arr[2]).assertEqual(2n);
      expect(arr[3]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6200
     * @tc.name testBigInt64ArrayCopyWithin062
     * @tc.desc Verify copyWithin large gap between target and start no overlap.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      arr.copyWithin(0, 3, 6);
      expect(arr[0]).assertEqual(40n);
      expect(arr[1]).assertEqual(50n);
      expect(arr[2]).assertEqual(60n);
      expect(arr[3]).assertEqual(40n);
      expect(arr[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6300
     * @tc.name testBigInt64ArrayCopyWithin063
     * @tc.desc Verify copyWithin copies single element from start to specific target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(2, 0, 1);
      expect(arr[0]).assertEqual(10n);
      expect(arr[2]).assertEqual(10n);
      expect(arr[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6400
     * @tc.name testBigInt64ArrayCopyWithin064
     * @tc.desc Verify copyWithin preserves elements before target region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      arr.copyWithin(3, 0, 2);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(1n);
      expect(arr[4]).assertEqual(2n);
      expect(arr[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6500
     * @tc.name testBigInt64ArrayCopyWithin065
     * @tc.desc Verify copyWithin on fifty element array loop initialized data integrity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) { arr[i] = BigInt(i * 2); }
      arr.copyWithin(30, 0, 10);
      expect(arr[30]).assertEqual(0n);
      expect(arr[31]).assertEqual(2n);
      expect(arr[39]).assertEqual(18n);
      expect(arr[40]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6600
     * @tc.name testBigInt64ArrayCopyWithin066
     * @tc.desc Verify copyWithin on large array source region verification after copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) { arr[i] = BigInt(i); }
      arr.copyWithin(20, 60, 70);
      expect(arr[20]).assertEqual(60n);
      expect(arr[25]).assertEqual(65n);
      expect(arr[29]).assertEqual(69n);
      expect(arr[30]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6700
     * @tc.name testBigInt64ArrayCopyWithin067
     * @tc.desc Verify copyWithin on seventy element array overlapping large region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(70);
      for (let i = 0; i < 70; i++) { arr[i] = BigInt(i * 5); }
      arr.copyWithin(0, 35, 70);
      expect(arr[0]).assertEqual(175n);
      expect(arr[1]).assertEqual(180n);
      expect(arr[34]).assertEqual(345n);
      expect(arr[35]).assertEqual(175n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6800
     * @tc.name testBigInt64ArrayCopyWithin068
     * @tc.desc Verify copyWithin on large array with negative target large move.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(80);
      for (let i = 0; i < 80; i++) { arr[i] = BigInt(i * 3); }
      arr.copyWithin(-10, 0, 10);
      expect(arr[70]).assertEqual(0n);
      expect(arr[71]).assertEqual(3n);
      expect(arr[79]).assertEqual(27n);
      expect(arr[60]).assertEqual(180n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_6900
     * @tc.name testBigInt64ArrayCopyWithin069
     * @tc.desc Verify copyWithin on hundred element array no overlap regions check integrity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) { arr[i] = BigInt(i * 10); }
      arr.copyWithin(90, 0, 5);
      expect(arr[90]).assertEqual(0n);
      expect(arr[91]).assertEqual(10n);
      expect(arr[94]).assertEqual(40n);
      expect(arr[95]).assertEqual(950n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7000
     * @tc.name testBigInt64ArrayCopyWithin070
     * @tc.desc Verify shared buffer view isolation at offset zero copyWithin.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr1 = new BigInt64Array(buf, 0, 4);
      arr1[0] = 1n;
      arr1[1] = 2n;
      arr1[2] = 3n;
      arr1[3] = 4n;
      let arr2 = new BigInt64Array(buf, 0, 4);
      arr2.copyWithin(0, 1, 2);
      expect(arr1[0]).assertEqual(2n);
      expect(arr2[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7100
     * @tc.name testBigInt64ArrayCopyWithin071
     * @tc.desc Verify copyWithin on BigInt64Array sharing buffer with Int8Array correctly copies element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr8 = new Int8Array(buf);
      let arr64 = new BigInt64Array(buf, 0, 4);
      arr64[0] = 15n;
      arr64[1] = 30n;
      arr64.copyWithin(0, 1, 2);
      expect(arr8[0]).assertEqual(30);
      expect(arr8[31]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7200
     * @tc.name testBigInt64ArrayCopyWithin072
     * @tc.desc Verify copyWithin subarray view preserves parent array elements outside range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      sub.copyWithin(0, 2);
      expect(sub[0]).assertEqual(40n);
      expect(arr[0]).assertEqual(10n);
      expect(arr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7300
     * @tc.name testBigInt64ArrayCopyWithin073
     * @tc.desc Verify copyWithin on two different subarray views of same array independently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let sub1 = arr.subarray(0, 3);
      let sub2 = arr.subarray(3, 6);
      sub1.copyWithin(0, 1);
      sub2.copyWithin(0, 2);
      expect(arr[0]).assertEqual(2n);
      expect(arr[3]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7400
     * @tc.name testBigInt64ArrayCopyWithin074
     * @tc.desc Verify copyWithin on ArrayBuffer view with offset preserves MAX value correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 9223372036854775807n;
      arr[1] = 22n;
      arr[2] = 33n;
      arr.copyWithin(1, 0, 1);
      expect(arr[1]).assertEqual(9223372036854775807n);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7500
     * @tc.name testBigInt64ArrayCopyWithin075
     * @tc.desc Verify copyWithin with MAX value left to right copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 2n, 3n]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7600
     * @tc.name testBigInt64ArrayCopyWithin076
     * @tc.desc Verify copyWithin with MAX value right to left copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 9223372036854775807n]);
      arr.copyWithin(0, 2, 3);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7700
     * @tc.name testBigInt64ArrayCopyWithin077
     * @tc.desc Verify copyWithin with MIN value left to right copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 2n, 3n]);
      arr.copyWithin(2, 0, 1);
      expect(arr[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7800
     * @tc.name testBigInt64ArrayCopyWithin078
     * @tc.desc Verify copyWithin with MIN value right to left copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, -9223372036854775808n]);
      arr.copyWithin(0, 2, 3);
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_7900
     * @tc.name testBigInt64ArrayCopyWithin079
     * @tc.desc Verify copyWithin overlapping with MAX values left shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 9223372036854775807n, 3n, 4n]);
      arr.copyWithin(0, 1, 4);
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8000
     * @tc.name testBigInt64ArrayCopyWithin080
     * @tc.desc Verify copyWithin overlapping with MIN values right shift.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, 2n, 3n, 4n]);
      arr.copyWithin(1, 0, 3);
      expect(arr[1]).assertEqual(-9223372036854775808n);
      expect(arr[2]).assertEqual(2n);
      expect(arr[3]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8100
     * @tc.name testBigInt64ArrayCopyWithin081
     * @tc.desc Verify copyWithin with omitted end parameter copies from start to array end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.copyWithin(0, 3);
      expect(arr[0]).assertEqual(40n);
      expect(arr[1]).assertEqual(50n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8200
     * @tc.name testBigInt64ArrayCopyWithin082
     * @tc.desc Verify copyWithin with omitted end two argument form partial copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(2, 0);
      expect(arr[2]).assertEqual(1n);
      expect(arr[3]).assertEqual(2n);
      expect(arr[4]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8300
     * @tc.name testBigInt64ArrayCopyWithin083
     * @tc.desc Verify copyWithin with omitted end negative start.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      arr.copyWithin(0, -3);
      expect(arr[0]).assertEqual(20n);
      expect(arr[1]).assertEqual(30n);
      expect(arr[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8400
     * @tc.name testBigInt64ArrayCopyWithin084
     * @tc.desc Verify copyWithin(4, 0, 1) copies the first element to the last position of a 5-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      arr.copyWithin(4, 0, 1);
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(40n);
      expect(arr[4]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8500
     * @tc.name testBigInt64ArrayCopyWithin085
     * @tc.desc Verify copyWithin on BigInt64Array backed by an ArrayBuffer preserves correct values when a Uint8Array view also exists.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 0, 3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      arr.copyWithin(0, 1);
      let u8 = new Uint8Array(buf);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(3n);
      expect(arr[2]).assertEqual(3n);
      expect(u8[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8600
     * @tc.name testBigInt64ArrayCopyWithin086
     * @tc.desc Verify copyWithin on a buffer-backed view with non-zero byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      arr.copyWithin(1, 0);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(1n);
      expect(arr[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8700
     * @tc.name testBigInt64ArrayCopyWithin087
     * @tc.desc Verify copyWithin overlapping right-shift where target gap is minimal does not corrupt data or throw.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      arr.copyWithin(3, 0, 4);
      expect(arr[3]).assertEqual(10n);
      expect(arr[4]).assertEqual(20n);
      expect(arr[5]).assertEqual(30n);
      expect(arr[0]).assertEqual(10n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8800
     * @tc.name testBigInt64ArrayCopyWithin088
     * @tc.desc Verify copyWithin with -0 target is treated as zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(-0, 2);
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_8900
     * @tc.name testBigInt64ArrayCopyWithin089
     * @tc.desc Verify overlapping copy forward target>start: [1,2,3,4,5] copyWithin(3,1) becomes [1,2,3,2,3].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(3, 1);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(2n);
      expect(arr[4]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_9000
     * @tc.name testBigInt64ArrayCopyWithin090
     * @tc.desc Verify 100-element array copyWithin(50, 0, 50) copies first half to second half.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      arr.copyWithin(50, 0, 50);
      expect(arr[50]).assertEqual(0n);
      expect(arr[75]).assertEqual(25n);
      expect(arr[99]).assertEqual(49n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_9100
     * @tc.name testBigInt64ArrayCopyWithin091
     * @tc.desc Verify 200-element array copyWithin copies elements correctly; verify first two and last element to prove array integrity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(200);
      for (let i = 0; i < 200; i++) {
        arr[i] = BigInt(i);
      }
      arr.copyWithin(0, 100, 200);
      expect(arr[0]).assertEqual(100n);
      expect(arr[1]).assertEqual(101n);
      expect(arr[199]).assertEqual(199n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_9200
     * @tc.name testBigInt64ArrayCopyWithin092
     * @tc.desc Verify copyWithin on 500-element array byteLength unchanged after operation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(500);
      for (let i = 0; i < 500; i++) {
        arr[i] = BigInt(i);
      }
      let origByteLen = arr.byteLength;
      arr.copyWithin(100, 200, 300);
      expect(arr.byteLength).assertEqual(origByteLen);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_9300
     * @tc.name testBigInt64ArrayCopyWithin093
     * @tc.desc Verify copyWithin with end greater than length clamps end to length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(0, 2, 100);
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(4n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_9400
     * @tc.name testBigInt64ArrayCopyWithin094
     * @tc.desc Verify fill then copyWithin chain: fill all 1n then copyWithin(0,2) shifts.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(6);
      arr.fill(1n);
      arr.fill(99n, 2, 4);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(99n);
      expect(arr[1]).assertEqual(99n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_9500
     * @tc.name testBigInt64ArrayCopyWithin095
     * @tc.desc Verify BigInt64Array.of(10n,20n,30n,40n).copyWithin(0,2) produces correct result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n, 20n, 30n, 40n);
      arr.copyWithin(0, 2);
      expect(arr[0]).assertEqual(30n);
      expect(arr[1]).assertEqual(40n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_COPY_WITHIN_9600
     * @tc.name testBigInt64ArrayCopyWithin096
     * @tc.desc Verify copyWithin on subarray writes through to parent buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayCopyWithin096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let sub = arr.subarray(2, 5);
      sub.copyWithin(0, 1);
      expect(sub[0]).assertEqual(4n);
      expect(arr[2]).assertEqual(4n);
      expect(arr[3]).assertEqual(5n);
    });

  });
}
