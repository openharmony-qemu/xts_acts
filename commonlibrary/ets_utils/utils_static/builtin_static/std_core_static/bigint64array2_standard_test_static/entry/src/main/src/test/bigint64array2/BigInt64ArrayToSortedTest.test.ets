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

export default function BigInt64ArrayToSortedTest(): void {
  describe('BigInt64ArrayToSortedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0010
     * @tc.name testBigInt64ArrayToSorted001
     * @tc.desc Verify toSorted on an empty BigInt64Array returns an array where OOB access throws RangeError.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.toSorted();
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0020
     * @tc.name testBigInt64ArrayToSorted002
     * @tc.desc Verify toSorted returns a new array and result mutation does not affect the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res = arr.toSorted();
      res[0] = 99n;
      expect(arr[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0030
     * @tc.name testBigInt64ArrayToSorted003
     * @tc.desc Verify two toSorted calls on the same source return independent instances.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res1 = arr.toSorted();
      let res2 = arr.toSorted();
      res1[0] = 100n;
      expect(res2[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0040
     * @tc.name testBigInt64ArrayToSorted004
     * @tc.desc Verify toSorted does not modify the source array elements or length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([8n, 5n, 2n]);
      arr.toSorted();
      expect(arr[0]).assertEqual(8n);
      expect(arr[1]).assertEqual(5n);
      expect(arr[2]).assertEqual(2n);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0050
     * @tc.name testBigInt64ArrayToSorted005
     * @tc.desc Verify chained toSorted access returns the smallest element at index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = new BigInt64Array([200n, 100n]).toSorted()[0];
      expect(val).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0060
     * @tc.name testBigInt64ArrayToSorted006
     * @tc.desc Verify toSorted preserves a single-element [0n] array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0070
     * @tc.name testBigInt64ArrayToSorted007
     * @tc.desc Verify toSorted preserves a single-element [MAX] array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0080
     * @tc.name testBigInt64ArrayToSorted008
     * @tc.desc Verify toSorted preserves a single-element [MIN] array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0090
     * @tc.name testBigInt64ArrayToSorted009
     * @tc.desc Verify toSorted on a single-element array from BigInt64Array.of() preserves the value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(42n);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0100
     * @tc.name testBigInt64ArrayToSorted010
     * @tc.desc Verify toSorted orders [1n, 0n] into [0n, 1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 0n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0110
     * @tc.name testBigInt64ArrayToSorted011
     * @tc.desc Verify toSorted orders [MAX, MIN] into [MIN, MAX].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0120
     * @tc.name testBigInt64ArrayToSorted012
     * @tc.desc Verify toSorted orders [-1n, -2n] into [-2n, -1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-2n);
      expect(res[1]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0130
     * @tc.name testBigInt64ArrayToSorted013
     * @tc.desc Verify toSorted keeps already-sorted [1n, 2n] unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0140
     * @tc.name testBigInt64ArrayToSorted014
     * @tc.desc Verify toSorted on two equal elements [5n, 5n] preserves both.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(5n);
      expect(res[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0150
     * @tc.name testBigInt64ArrayToSorted015
     * @tc.desc Verify toSorted on already-sorted [1n,2n,3n] keeps order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0160
     * @tc.name testBigInt64ArrayToSorted016
     * @tc.desc Verify toSorted on reverse-sorted [3n,2n,1n] produces ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 2n, 1n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0170
     * @tc.name testBigInt64ArrayToSorted017
     * @tc.desc Verify toSorted on negative triple [-1n,-2n,-3n] sorts ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-3n);
      expect(res[1]).assertEqual(-2n);
      expect(res[2]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0180
     * @tc.name testBigInt64ArrayToSorted018
     * @tc.desc Verify toSorted on boundary triple [MAX,0n,MIN] sorts correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775808n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(0n);
      expect(res[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0190
     * @tc.name testBigInt64ArrayToSorted019
     * @tc.desc Verify toSorted on [0n,-1n,1n] sorts to [-1n,0n,1n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, -1n, 1n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-1n);
      expect(res[1]).assertEqual(0n);
      expect(res[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0200
     * @tc.name testBigInt64ArrayToSorted020
     * @tc.desc Verify toSorted on [10n,-10n,0n] sorts to [-10n,0n,10n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, -10n, 0n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-10n);
      expect(res[1]).assertEqual(0n);
      expect(res[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0210
     * @tc.name testBigInt64ArrayToSorted021
     * @tc.desc Verify toSorted on [1n,3n,2n] sorts to [1n,2n,3n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 2n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0220
     * @tc.name testBigInt64ArrayToSorted022
     * @tc.desc Verify toSorted on near-boundary triple [MAX,MAX-1n,MAX-2n] sorts descending-to-ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n - 1n, 9223372036854775807n - 2n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(9223372036854775807n - 2n);
      expect(res[1]).assertEqual(9223372036854775807n - 1n);
      expect(res[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0230
     * @tc.name testBigInt64ArrayToSorted023
     * @tc.desc Verify toSorted on near-boundary triple [MIN,MIN+1n,MIN+2n] sorts ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n + 1n, -9223372036854775808n + 2n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(-9223372036854775808n + 1n);
      expect(res[2]).assertEqual(-9223372036854775808n + 2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0240
     * @tc.name testBigInt64ArrayToSorted024
     * @tc.desc Verify toSorted on 5-element descending array [5n,4n,3n,2n,1n] sorts ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 4n, 3n, 2n, 1n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
      expect(res[3]).assertEqual(4n);
      expect(res[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0250
     * @tc.name testBigInt64ArrayToSorted025
     * @tc.desc Verify toSorted on 5-element mixed array [1n,3n,5n,2n,4n] sorts ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 5n, 2n, 4n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
      expect(res[3]).assertEqual(4n);
      expect(res[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0260
     * @tc.name testBigInt64ArrayToSorted026
     * @tc.desc Verify toSorted on 6-element alternating sign array sorts ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n, 3n, -3n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-3n);
      expect(res[1]).assertEqual(-2n);
      expect(res[2]).assertEqual(-1n);
      expect(res[3]).assertEqual(1n);
      expect(res[4]).assertEqual(2n);
      expect(res[5]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0270
     * @tc.name testBigInt64ArrayToSorted027
     * @tc.desc Verify toSorted on 6-element reverse-sorted array [6n..1n] sorts ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([6n, 5n, 4n, 3n, 2n, 1n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0280
     * @tc.name testBigInt64ArrayToSorted028
     * @tc.desc Verify toSorted on array with positive/negative/zero values [10n,5n,0n,-5n,-10n] sorts ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 5n, 0n, -5n, -10n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-10n);
      expect(res[1]).assertEqual(-5n);
      expect(res[2]).assertEqual(0n);
      expect(res[3]).assertEqual(5n);
      expect(res[4]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0290
     * @tc.name testBigInt64ArrayToSorted029
     * @tc.desc Verify toSorted on full-range array [MAX, -1n, 0n, 1n, MIN] sorts to [MIN, -1n, 0n, 1n, MAX].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -1n, 0n, 1n, -9223372036854775808n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(-1n);
      expect(res[2]).assertEqual(0n);
      expect(res[3]).assertEqual(1n);
      expect(res[4]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0300
     * @tc.name testBigInt64ArrayToSorted030
     * @tc.desc Verify toSorted handles duplicate elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n, 1n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(1n);
      expect(res[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0310
     * @tc.name testBigInt64ArrayToSorted031
     * @tc.desc Verify toSorted on [0n,0n,0n] preserves all zeros.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(0n);
      expect(res[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0320
     * @tc.name testBigInt64ArrayToSorted032
     * @tc.desc Verify toSorted on [1n,0n,1n,0n] keeps duplicate 0n and 1n adjacent in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 0n, 1n, 0n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(0n);
      expect(res[2]).assertEqual(1n);
      expect(res[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0330
     * @tc.name testBigInt64ArrayToSorted033
     * @tc.desc Verify toSorted on [5n,5n,3n,3n,1n,1n] sorts all duplicate pairs correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 3n, 3n, 1n, 1n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(1n);
      expect(res[2]).assertEqual(3n);
      expect(res[3]).assertEqual(3n);
      expect(res[4]).assertEqual(5n);
      expect(res[5]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0340
     * @tc.name testBigInt64ArrayToSorted034
     * @tc.desc Verify toSorted orders expression-based elements [1n+1n, 0n] into [0n, 2n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n+1n, 0n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0350
     * @tc.name testBigInt64ArrayToSorted035
     * @tc.desc Verify toSorted orders expression-based elements [2n*3n, 1n] into [1n, 6n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n*3n, 1n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0360
     * @tc.name testBigInt64ArrayToSorted036
     * @tc.desc Verify toSorted on array with computed element from BigInt64Array index value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      for (let i = 0; i < 5; i++) {
        arr[i] = BigInt(4 - i);
      }
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[4]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0370
     * @tc.name testBigInt64ArrayToSorted037
     * @tc.desc Verify toSorted on array where elements are BigInt(i*i) computed values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      for (let i = 0; i < 4; i++) {
        arr[i] = BigInt((3 - i) * (3 - i));
      }
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0380
     * @tc.name testBigInt64ArrayToSorted038
     * @tc.desc Verify toSorted result has byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res = arr.toSorted();
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0390
     * @tc.name testBigInt64ArrayToSorted039
     * @tc.desc Verify toSorted result byteLength equals length * 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res = arr.toSorted();
      expect(res.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0400
     * @tc.name testBigInt64ArrayToSorted040
     * @tc.desc Verify toSorted result has the same length as the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 1n, 4n, 2n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n); expect(res[4]).assertEqual(5n);
      expect(res.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0410
     * @tc.name testBigInt64ArrayToSorted041
     * @tc.desc Verify toSorted result buffer is not the same reference as the source buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res = arr.toSorted();
      expect(arr.buffer !== res.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0420
     * @tc.name testBigInt64ArrayToSorted042
     * @tc.desc Verify modifying source after toSorted does not affect the sorted result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res = arr.toSorted();
      arr[0] = 99n;
      expect(res[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0430
     * @tc.name testBigInt64ArrayToSorted043
     * @tc.desc Verify modifying sorted result does not affect the source buffer content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res = arr.toSorted();
      res[0] = 99n;
      let i8 = new Int8Array(arr.buffer);
      expect(arr[0]).assertEqual(3n);
      expect(i8[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0440
     * @tc.name testBigInt64ArrayToSorted044
     * @tc.desc Verify two toSorted results from the same source have independent buffers.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n]);
      let res1 = arr.toSorted();
      let res2 = arr.toSorted();
      expect(res1.buffer !== res2.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0450
     * @tc.name testBigInt64ArrayToSorted045
     * @tc.desc Verify source byteLength is unchanged after toSorted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      arr.toSorted();
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0460
     * @tc.name testBigInt64ArrayToSorted046
     * @tc.desc Verify toSorted on array from BigInt64Array.from() with mapping function sorts correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([3n, 1n, 2n], (x: bigint) => x * 10n);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0470
     * @tc.name testBigInt64ArrayToSorted047
     * @tc.desc Verify toSorted after set() with a target offset reflects the updated element order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 5n, 3n]);
      arr.set([8n, 2n], 1);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0480
     * @tc.name testBigInt64ArrayToSorted048
     * @tc.desc Verify toSorted on array created from an ArrayBuffer via DataView setBigInt64 produces correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let dv = new DataView(buf);
      dv.setBigInt64(0, 30n, true);
      dv.setBigInt64(8, 10n, true);
      dv.setBigInt64(16, 20n, true);
      let arr = new BigInt64Array(buf);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0490
     * @tc.name testBigInt64ArrayToSorted049
     * @tc.desc Verify toSorted on array created by constructor copy preserves values and sorts correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([9n, 3n, 6n]);
      let arr = new BigInt64Array(src);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(3n);
      expect(res[1]).assertEqual(6n);
      expect(res[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0500
     * @tc.name testBigInt64ArrayToSorted050
     * @tc.desc Verify toSorted on a subarray with a non-zero start index sorts only the viewed elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 2n, 4n]);
      let sub = arr.subarray(1, 3);
      let res = sub.toSorted();
      expect(res[0]).assertEqual(2n);
      expect(res[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0510
     * @tc.name testBigInt64ArrayToSorted051
     * @tc.desc Verify toSorted on a subarray sorts only the subarray elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 4n, 2n]);
      let sub = arr.subarray(0, 2);
      let res = sub.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0520
     * @tc.name testBigInt64ArrayToSorted052
     * @tc.desc Verify toSorted on a slice result sorts the sliced elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 4n, 1n, 2n]);
      let sli = arr.slice(1, 4);
      let res = sli.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(3n);
      expect(res[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0530
     * @tc.name testBigInt64ArrayToSorted053
     * @tc.desc Verify toSorted on BigInt64Array.of() result sorts correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(30n, 10n, 20n);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0540
     * @tc.name testBigInt64ArrayToSorted054
     * @tc.desc Verify toSorted on BigInt64Array.from() result sorts correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([30n, 10n, 20n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
      expect(res[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0550
     * @tc.name testBigInt64ArrayToSorted055
     * @tc.desc Verify toSorted on ArrayBuffer offset source preserves correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let full = new BigInt64Array(buf);
      full[0] = 30n;
      full[1] = 10n;
      full[2] = 20n;
      let arr = new BigInt64Array(buf, 8, 2);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0560
     * @tc.name testBigInt64ArrayToSorted056
     * @tc.desc Verify toSorted on with()-modified array reflects the modified value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 1n, 3n]);
      let modified = arr.with(0, 2n);
      let res = modified.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0570
     * @tc.name testBigInt64ArrayToSorted057
     * @tc.desc Verify toSorted after fill on a portion of the array produces correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 1n, 4n]);
      arr.fill(0n, 0, 2);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(0n);
      expect(res[2]).assertEqual(1n);
      expect(res[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0580
     * @tc.name testBigInt64ArrayToSorted058
     * @tc.desc Verify toSorted after copyWithin reflects copied element order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 1n, 3n, 2n]);
      arr.copyWithin(0, 2);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(2n);
      expect(res[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0590
     * @tc.name testBigInt64ArrayToSorted059
     * @tc.desc Verify toSorted after set() modifies elements and sort reflects changes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 5n, 3n]);
      arr.set([2n, 4n], 0);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(2n);
      expect(res[1]).assertEqual(3n);
      expect(res[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0600
     * @tc.name testBigInt64ArrayToSorted060
     * @tc.desc Verify toSorted after reverse() produces ascending order from reversed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 1n]);
      arr.reverse();
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(3n);
      expect(res[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0610
     * @tc.name testBigInt64ArrayToSorted061
     * @tc.desc Verify toReversed().toSorted() chain produces ascending sorted order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 4n, 1n, 2n]);
      let res = arr.toReversed().toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
      expect(res[3]).assertEqual(4n);
      expect(res[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0620
     * @tc.name testBigInt64ArrayToSorted062
     * @tc.desc Verify toSorted().slice(0,2) returns first two sorted elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 1n, 4n, 2n]);
      let res = arr.toSorted().slice(0, 2);
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0630
     * @tc.name testBigInt64ArrayToSorted063
     * @tc.desc Verify sort() on the sorted result modifies it in-place independently of source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res = arr.toSorted();
      res.sort((a: bigint, b: bigint): bigint => {
        if (a > b) { return -1n; }
        if (a < b) { return 1n; }
        return 0n;
      });
      expect(res[0]).assertEqual(3n);
      expect(arr[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0640
     * @tc.name testBigInt64ArrayToSorted064
     * @tc.desc Verify toSorted on 10-element random-like array sorts all elements ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let vals: bigint[] = [7n, 2n, 9n, 1n, 5n, 3n, 8n, 0n, 6n, 4n];
      let arr = new BigInt64Array(vals);
      let res = arr.toSorted();
      let sorted = true;
      for (let i = 1; i < 10; i++) {
        if (res[i] < res[i - 1]) { sorted = false; }
      }
      expect(sorted).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0650
     * @tc.name testBigInt64ArrayToSorted065
     * @tc.desc Verify toSorted on 20-element reverse-sorted programmatic array sorts ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      for (let i = 0; i < 20; i++) {
        arr[i] = BigInt(19 - i);
      }
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[19]).assertEqual(19n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0660
     * @tc.name testBigInt64ArrayToSorted066
     * @tc.desc Verify toSorted on 50-element zero-filled array produces all zeros.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[25]).assertEqual(0n);
      expect(res[49]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0670
     * @tc.name testBigInt64ArrayToSorted067
     * @tc.desc Verify toSorted on 10-element alternating parity array sorts correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        arr[i] = BigInt((i % 2 === 0) ? 100 - i : i);
      }
      let res = arr.toSorted();
      let isAscending = true;
      for (let i = 1; i < 10; i++) {
        if (res[i] < res[i - 1]) { isAscending = false; }
      }
      expect(isAscending).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0680
     * @tc.name testBigInt64ArrayToSorted068
     * @tc.desc Verify toSorted on 15-element descending array has correct first and last elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(15);
      for (let i = 0; i < 15; i++) {
        arr[i] = BigInt(100 - i * 10);
      }
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-40n);
      expect(res[14]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0690
     * @tc.name testBigInt64ArrayToSorted069
     * @tc.desc Verify double toSorted on unsorted array is idempotent (second call doesn't change result).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let res1 = arr.toSorted();
      let res2 = res1.toSorted();
      expect(res2[0]).assertEqual(1n);
      expect(res2[1]).assertEqual(2n);
      expect(res2[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0700
     * @tc.name testBigInt64ArrayToSorted070
     * @tc.desc Verify double toSorted on already-sorted array produces identical result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.toSorted().toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0710
     * @tc.name testBigInt64ArrayToSorted071
     * @tc.desc Verify double toSorted on reverse-sorted array restores ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 4n, 3n, 2n, 1n]);
      let res = arr.toSorted().toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0720
     * @tc.name testBigInt64ArrayToSorted072
     * @tc.desc Verify toSorted().toSorted() preserves length and byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 1n, 3n, 2n, 4n]);
      let res = arr.toSorted().toSorted();
      expect(res[0]).assertEqual(1n); expect(res[4]).assertEqual(5n);
      expect(res.length).assertEqual(5);
      expect(res.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0730
     * @tc.name testBigInt64ArrayToSorted073
     * @tc.desc Verify toSorted on array with all MAX values preserves all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n, 9223372036854775807n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0740
     * @tc.name testBigInt64ArrayToSorted074
     * @tc.desc Verify toSorted on array with all MIN values preserves all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n, -9223372036854775808n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0750
     * @tc.name testBigInt64ArrayToSorted075
     * @tc.desc Verify toSorted on new BigInt64Array(5) zero-filled array produces all zeros.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[2]).assertEqual(0n);
      expect(res[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0760
     * @tc.name testBigInt64ArrayToSorted076
     * @tc.desc Verify toSorted on array from subarray with byteOffset preserves byteOffset 0 in result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 30n;
      arr[1] = 10n;
      arr[2] = 20n;
      let res = arr.toSorted();
      expect(res.byteOffset).assertEqual(0);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0770
     * @tc.name testBigInt64ArrayToSorted077
     * @tc.desc Verify toSorted on array with Number.MAX_SAFE_INTEGER as bigint sorts correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9007199254740991n, 0n, 1n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(1n);
      expect(res[2]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0780
     * @tc.name testBigInt64ArrayToSorted078
     * @tc.desc Verify toSorted on array of sequential powers of 10 sorts ascending.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000n, 1n, 100n, 10n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(10n);
      expect(res[2]).assertEqual(100n);
      expect(res[3]).assertEqual(1000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0790
     * @tc.name testBigInt64ArrayToSorted079
     * @tc.desc Verify toSorted result is in ascending order by checking each consecutive element pair.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 2n, 9n, 1n, 5n, 3n, 8n, 4n, 6n]);
      let res = arr.toSorted();
      let ordered = true;
      for (let i = 1; i < 9; i++) {
        if (res[i] < res[i - 1]) { ordered = false; }
      }
      expect(ordered).assertTrue();
      expect(res[0]).assertEqual(1n); expect(res[8]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0800
     * @tc.name testBigInt64ArrayToSorted080
     * @tc.desc Verify fill().toSorted() chain: fill then sort produces correct ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(5n, 0, 3);
      let result = arr.toSorted();
      expect(result[0]).assertEqual(0n);
      expect(result[1]).assertEqual(0n);
      expect(result[2]).assertEqual(5n);
      expect(result[3]).assertEqual(5n);
      expect(result[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0810
     * @tc.name testBigInt64ArrayToSorted081
     * @tc.desc Verify for-of iteration over toSorted result yields elements in ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 40n, 20n]);
      let result = arr.toSorted();
      let vals: bigint[] = [];
      for (let v of result) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(10n);
      expect(vals[1]).assertEqual(20n);
      expect(vals[2]).assertEqual(30n);
      expect(vals[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0820
     * @tc.name testBigInt64ArrayToSorted082
     * @tc.desc Verify values() iterator on toSorted result produces correct elements in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 1n, 4n, 2n]);
      let result = arr.toSorted();
      let iter = result.values();
      expect(iter.next().value).assertEqual(1n);
      expect(iter.next().value).assertEqual(2n);
      expect(iter.next().value).assertEqual(3n);
      expect(iter.next().value).assertEqual(4n);
      expect(iter.next().value).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0830
     * @tc.name testBigInt64ArrayToSorted083
     * @tc.desc Verify entries() iterator on toSorted result produces correct [index, value] pairs.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let result = arr.toSorted();
      let pairs: [int, bigint][] = [];
      for (let entry of result.entries()) {
        pairs.push(entry);
      }
      expect(pairs[0][0]).assertEqual(0);
      expect(pairs[0][1]).assertEqual(1n);
      expect(pairs[1][0]).assertEqual(1);
      expect(pairs[1][1]).assertEqual(2n);
      expect(pairs[2][0]).assertEqual(2);
      expect(pairs[2][1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0840
     * @tc.name testBigInt64ArrayToSorted084
     * @tc.desc Verify toSorted correctly sorts array with duplicate values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 1n, 2n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(1n);
      expect(res[2]).assertEqual(2n);
      expect(res[3]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0850
     * @tc.name testBigInt64ArrayToSorted085
     * @tc.desc Verify toSorted on all-equal array [5n,5n,5n,5n,5n] returns identical content in same order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 5n, 5n, 5n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(5n);
      expect(res[1]).assertEqual(5n);
      expect(res[2]).assertEqual(5n);
      expect(res[3]).assertEqual(5n);
      expect(res[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0860
     * @tc.name testBigInt64ArrayToSorted086
     * @tc.desc Verify toSorted preserves equal MAX values at different indices in correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 9223372036854775807n, 9223372036854775807n, 0n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(1n);
      expect(res[2]).assertEqual(9223372036854775807n);
      expect(res[3]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0870
     * @tc.name testBigInt64ArrayToSorted087
     * @tc.desc Verify toSorted on alternating repeated values [2n,1n,2n,1n,2n] produces [1n,1n,2n,2n,2n].
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 1n, 2n, 1n, 2n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(1n);
      expect(res[2]).assertEqual(2n);
      expect(res[3]).assertEqual(2n);
      expect(res[4]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0880
     * @tc.name testBigInt64ArrayToSorted088
     * @tc.desc Verify toSorted after array modified by sort produces independent result from source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 1n, 4n, 2n, 3n]);
      arr.sort();
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(arr[0]).assertEqual(1n);
      res[0] = 99n;
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0890
     * @tc.name testBigInt64ArrayToSorted089
     * @tc.desc Verify toSorted on 500-element descending array produces correct ascending result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(500);
      for (let i = 0; i < 500; i++) {
        arr[i] = BigInt(500 - i);
      }
      let res = arr.toSorted();
      expect(res[0]).assertEqual(1n);
      expect(res[250]).assertEqual(251n);
      expect(res[499]).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0900
     * @tc.name testBigInt64ArrayToSorted090
     * @tc.desc Verify toSorted then toReversed chain produces descending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 1n, 4n, 2n, 3n]);
      let res = arr.toSorted().toReversed();
      expect(res[0]).assertEqual(5n);
      expect(res[1]).assertEqual(4n);
      expect(res[2]).assertEqual(3n);
      expect(res[3]).assertEqual(2n);
      expect(res[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0910
     * @tc.name testBigInt64ArrayToSorted091
     * @tc.desc Verify toSorted then slice chain extracts correctly sorted sub-elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 3n, 7n, 1n, 5n]);
      let res = arr.toSorted().slice(1, 4);
      expect(res[0]).assertEqual(3n);
      expect(res[1]).assertEqual(5n);
      expect(res[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0920
     * @tc.name testBigInt64ArrayToSorted092
     * @tc.desc Verify toSorted then with chain replaces element and preserves sort order of remaining elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n, 1n, 4n]);
      let res = arr.toSorted().with(0, 0n);
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(4n);
      expect(res[3]).assertEqual(5n);
      expect(res[4]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0930
     * @tc.name testBigInt64ArrayToSorted093
     * @tc.desc Verify subarray then toSorted returns independent sorted copy of subarray elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n, 4n, 7n, 2n, 5n]);
      let sub = arr.subarray(1, 4);
      let res = sub.toSorted();
      expect(res[0]).assertEqual(2n);
      expect(res[1]).assertEqual(4n);
      expect(res[2]).assertEqual(7n);
      expect(sub[0]).assertEqual(4n);
      expect(arr[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0940
     * @tc.name testBigInt64ArrayToSorted094
     * @tc.desc Verify toSorted result keys iterator produces sequential indices starting from 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 30n, 10n, 40n, 20n]);
      let result = arr.toSorted();
      let keys: number[] = [];
      for (let k of result.keys()) {
        keys.push(k);
      }
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
      expect(keys[3]).assertEqual(3);
      expect(keys[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0950
     * @tc.name testBigInt64ArrayToSorted095
     * @tc.desc Verify toSorted result has correct byteLength matching length times 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 3n, 5n, 1n]);
      let res = arr.toSorted();
      expect(res.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0960
     * @tc.name testBigInt64ArrayToSorted096
     * @tc.desc Verify toSorted on 300-element pseudo-random array sorts all elements in ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(300);
      for (let i = 0; i < 300; i++) {
        arr[i] = BigInt((i * 17 + 53) % 300);
      }
      let res = arr.toSorted();
      let isAscending = true;
      for (let i = 1; i < 300; i++) {
        if (res[i] < res[i - 1]) { isAscending = false; }
      }
      expect(isAscending).assertTrue();
      expect(res[0]).assertEqual(0n); expect(res[299]).assertEqual(299n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0970
     * @tc.name testBigInt64ArrayToSorted097
     * @tc.desc Verify toSorted on 500-element arithmetically descending array produces ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(500);
      for (let i = 0; i < 500; i++) {
        arr[i] = BigInt(1000 - i * 2);
      }
      let res = arr.toSorted();
      let isAscending = true;
      for (let i = 1; i < 500; i++) {
        if (res[i] < res[i - 1]) { isAscending = false; }
      }
      expect(isAscending).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0980
     * @tc.name testBigInt64ArrayToSorted098
     * @tc.desc Verify toSorted on array with MAX and MIN at ends sorts correctly including interior values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 5n, 3n, 1n, -9223372036854775808n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(1n);
      expect(res[2]).assertEqual(3n);
      expect(res[3]).assertEqual(5n);
      expect(res[4]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_0990
     * @tc.name testBigInt64ArrayToSorted099
     * @tc.desc Verify toSorted on [-1n, 0n, 1n] preserves already-sorted ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 0n, 1n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-1n);
      expect(res[1]).assertEqual(0n);
      expect(res[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_1000
     * @tc.name testBigInt64ArrayToSorted100
     * @tc.desc Verify toSorted on near-MAX values [MAX-1n, MAX, MAX-2n] sorts ascending correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n, 9223372036854775807n, 9223372036854775805n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(9223372036854775805n);
      expect(res[1]).assertEqual(9223372036854775806n);
      expect(res[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_1010
     * @tc.name testBigInt64ArrayToSorted101
     * @tc.desc Verify toSorted on near-MIN values [MIN+1n, MIN, MIN+2n] sorts ascending correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n, -9223372036854775808n, -9223372036854775806n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(-9223372036854775807n);
      expect(res[2]).assertEqual(-9223372036854775806n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_1020
     * @tc.name testBigInt64ArrayToSorted102
     * @tc.desc Verify toSorted on [0n, -0n] treats both zero representations as equal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, -0n]);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(0n);
      expect(res[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_1030
     * @tc.name testBigInt64ArrayToSorted103
     * @tc.desc Verify toSorted on array created via ArrayBuffer offset sorts only the viewed elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let full = new BigInt64Array(buf);
      full[0] = 1n;
      full[1] = 5n;
      full[2] = 3n;
      full[3] = 6n;
      let arr = new BigInt64Array(buf, 8, 2);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(3n);
      expect(res[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_TO_SORTED_1040
     * @tc.name testBigInt64ArrayToSorted104
     * @tc.desc Verify toSorted on array created via new BigInt64Array(buffer, 8, 3) sorts viewed elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayToSorted104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      full[0] = 0n;
      full[1] = 8n;
      full[2] = 2n;
      full[3] = 6n;
      full[4] = 0n;
      let arr = new BigInt64Array(buf, 8, 3);
      let res = arr.toSorted();
      expect(res[0]).assertEqual(2n);
      expect(res[1]).assertEqual(6n);
      expect(res[2]).assertEqual(8n);
    });

  });
}
