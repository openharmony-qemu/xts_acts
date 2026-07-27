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

export default function BigInt64ArraySubarray03Test(): void {
  describe('BigInt64ArraySubarray03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_0100
     * @tc.name testBigInt64ArraySubarrayThree001
     * @tc.desc Verify subarray(1).subarray(0) returns view offset by 1 from original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1).subarray(0);
      expect(sub[0]).assertEqual(2n);
      expect(sub[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_0200
     * @tc.name testBigInt64ArraySubarrayThree002
     * @tc.desc Verify subarray(2, 5).subarray(1) returns view within the sub-range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let sub = arr.subarray(2, 5).subarray(1);
      expect(sub[0]).assertEqual(4n);
      expect(sub[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_0300
     * @tc.name testBigInt64ArraySubarrayThree003
     * @tc.desc Verify three-level chained subarray preserves correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1).subarray(1).subarray(0);
      expect(sub[0]).assertEqual(3n);
      expect(sub[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_0400
     * @tc.name testBigInt64ArraySubarrayThree004
     * @tc.desc Verify subarray(1, 4).subarray(0, 2) two-level with double params.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4).subarray(0, 2);
      expect(sub[0]).assertEqual(20n);
      expect(sub[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_0500
     * @tc.name testBigInt64ArraySubarrayThree005
     * @tc.desc Verify subarray(-2).subarray(0) from tail then re-base to index 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(-2).subarray(0);
      expect(sub[0]).assertEqual(4n);
      expect(sub[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_0600
     * @tc.name testBigInt64ArraySubarrayThree006
     * @tc.desc Verify chained subarray shares buffer with the original source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let chain = arr.subarray(1).subarray(0);
      expect(chain.buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_0700
     * @tc.name testBigInt64ArraySubarrayThree007
     * @tc.desc Verify subarray().slice() creates an independent copy with own buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1, 3);
      let sliced = sub.slice();
      expect(sliced.buffer !== arr.buffer).assertTrue();
      expect(sliced[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_0800
     * @tc.name testBigInt64ArraySubarrayThree008
     * @tc.desc Verify modifying source after slice of subarray does not affect the slice result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      let sliced = sub.slice();
      arr[1] = 99n;
      expect(sliced[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_0900
     * @tc.name testBigInt64ArraySubarrayThree009
     * @tc.desc Verify slice result subarray has byteOffset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sliced = arr.slice(1);
      let sub = sliced.subarray(0, 1);
      expect(sub.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1000
     * @tc.name testBigInt64ArraySubarrayThree010
     * @tc.desc Verify subarray then slice: modifying subarray doesn't change slice copy.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(0, 2);
      let sliced = sub.slice();
      sub[0] = 99n;
      expect(sliced[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1100
     * @tc.name testBigInt64ArraySubarrayThree011
     * @tc.desc Verify slice of subarray has same byteLength as the subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      let sliced = sub.slice();
      expect(sliced.byteLength).assertEqual(sub.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1200
     * @tc.name testBigInt64ArraySubarrayThree012
     * @tc.desc Verify subarray after slice: modifying source doesn't affect sliced-subarray chain.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let sliced = arr.slice(1);
      let sub = sliced.subarray(0);
      arr[2] = 99n;
      expect(sub[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1300
     * @tc.name testBigInt64ArraySubarrayThree013
     * @tc.desc Verify subarray().fill() fills values through shared buffer to source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 2);
      sub.fill(99n);
      expect(arr[0]).assertEqual(99n);
      expect(arr[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1400
     * @tc.name testBigInt64ArraySubarrayThree014
     * @tc.desc Verify subarray().reverse() reverses through shared buffer to source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray();
      sub.reverse();
      expect(arr[0]).assertEqual(3n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1500
     * @tc.name testBigInt64ArraySubarrayThree015
     * @tc.desc Verify subarray().copyWithin() within subarray range works through shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(0, 3);
      sub.copyWithin(0, 1);
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1600
     * @tc.name testBigInt64ArraySubarrayThree016
     * @tc.desc Verify subarray().set() writes to subarray range and source reflects it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      let other = new BigInt64Array([99n, 88n]);
      sub.set(other);
      expect(arr[1]).assertEqual(99n);
      expect(arr[2]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1700
     * @tc.name testBigInt64ArraySubarrayThree017
     * @tc.desc Verify keys() on subarray returns 0-based sequential indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 20n]);
      let sub = arr.subarray(1, 3);
      let iter = sub.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1800
     * @tc.name testBigInt64ArraySubarrayThree018
     * @tc.desc Verify at() with positive index on subarray returns correct element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n]);
      let sub = arr.subarray(1, 3);
      expect(sub.at(0)).assertEqual(200n);
      expect(sub.at(1)).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_1900
     * @tc.name testBigInt64ArraySubarrayThree019
     * @tc.desc Verify includes() on subarray correctly reports value presence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      expect(sub.includes(20n)).assertTrue();
      expect(sub.includes(10n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2000
     * @tc.name testBigInt64ArraySubarrayThree020
     * @tc.desc Verify indexOf() on subarray returns the 0-based index within the subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 2n]);
      let sub = arr.subarray(1, 4);
      let idx = sub.indexOf(3n);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2100
     * @tc.name testBigInt64ArraySubarrayThree021
     * @tc.desc Verify for-of loop on subarray iterates the correct number of elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 4);
      let count = 0;
      for (let v of sub) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2200
     * @tc.name testBigInt64ArraySubarrayThree022
     * @tc.desc Verify subarray length property equals the number of elements in the range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(2, 5);
      expect(sub[0]).assertEqual(3n);
      expect(sub[2]).assertEqual(5n);
      expect(sub.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2300
     * @tc.name testBigInt64ArraySubarrayThree023
     * @tc.desc Verify indexOf on subarray returns correct subarray-relative index for found and not-found elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 20n, 40n]);
      let sub = arr.subarray(1, 4);
      expect(sub.indexOf(20n)).assertEqual(0);
      expect(sub.lastIndexOf(20n)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2400
     * @tc.name testBigInt64ArraySubarrayThree024
     * @tc.desc Verify every() on subarray correctly reports all elements satisfying condition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n, 8n]);
      let sub = arr.subarray(0, 3);
      let res = sub.every((e: bigint) => e % 2n === 0n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2500
     * @tc.name testBigInt64ArraySubarrayThree025
     * @tc.desc Verify subarray after with() on source: with() creates new buffer distinct from original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1, 3);
      let replaced = arr.with(1, 99n);
      let sub2 = replaced.subarray(1, 3);
      expect(sub.buffer !== replaced.buffer).assertTrue();
      expect(sub2[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2600
     * @tc.name testBigInt64ArraySubarrayThree026
     * @tc.desc Verify subarray on 100-element array for a 50-element mid-range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      let sub = arr.subarray(25, 75);
      expect(sub[0]).assertEqual(25n);
      expect(sub[49]).assertEqual(74n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2700
     * @tc.name testBigInt64ArraySubarrayThree027
     * @tc.desc Verify subarray on 200-element array for a 100-element half range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(200);
      for (let i = 0; i < 200; i++) {
        arr[i] = BigInt(i + 1);
      }
      let sub = arr.subarray(50, 150);
      expect(sub[0]).assertEqual(51n);
      expect(sub[99]).assertEqual(150n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2800
     * @tc.name testBigInt64ArraySubarrayThree028
     * @tc.desc Verify subarray(-50) on 100-element array returns last 50 elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i * 2);
      }
      let sub = arr.subarray(-50);
      expect(sub[0]).assertEqual(100n);
      expect(sub[49]).assertEqual(198n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_2900
     * @tc.name testBigInt64ArraySubarrayThree029
     * @tc.desc Verify nested subarrays on 50-element array preserve correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        arr[i] = BigInt(i + 10);
      }
      let sub1 = arr.subarray(10, 40);
      let sub2 = sub1.subarray(5, 25);
      expect(sub2[0]).assertEqual(25n);
      expect(sub2[19]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3000
     * @tc.name testBigInt64ArraySubarrayThree030
     * @tc.desc Verify large array subarray byteLength matches element count * 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(64);
      for (let i = 0; i < 64; i++) {
        arr[i] = BigInt(i);
      }
      let sub = arr.subarray(16, 48);
      expect(sub[0]).assertEqual(16n);
      expect(sub[31]).assertEqual(47n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3100
     * @tc.name testBigInt64ArraySubarrayThree031
     * @tc.desc Verify subarray on non-zero byteOffset source has correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 16, 3);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      let sub = arr.subarray(1, 3);
      expect(sub[0]).assertEqual(20n);
      expect(sub[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3200
     * @tc.name testBigInt64ArraySubarrayThree032
     * @tc.desc Verify double subarray on offset source accumulates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 8, 4);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      arr[3] = 4n;
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(1, 3);
      expect(sub2[0]).assertEqual(3n);
      expect(sub2[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3300
     * @tc.name testBigInt64ArraySubarrayThree033
     * @tc.desc Verify offset source subarray byteOffset includes the source offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let arr = new BigInt64Array(buf, 16, 2);
      arr[0] = 5n;
      arr[1] = 6n;
      let sub = arr.subarray(1, 2);
      expect(sub.byteOffset).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3400
     * @tc.name testBigInt64ArraySubarrayThree034
     * @tc.desc Verify offset source subarray write-through affects the original offset view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      let sub = arr.subarray(0, 2);
      sub[0] = 99n;
      expect(arr[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3500
     * @tc.name testBigInt64ArraySubarrayThree035
     * @tc.desc Verify offset source subarray with negative index resolves correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 16, 4);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      arr[3] = 40n;
      let sub = arr.subarray(-2);
      expect(sub[0]).assertEqual(30n);
      expect(sub[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3600
     * @tc.name testBigInt64ArraySubarrayThree036
     * @tc.desc Verify subarray(0, 0) on non-empty source returns empty view with length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 0);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(sub.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3700
     * @tc.name testBigInt64ArraySubarrayThree037
     * @tc.desc Verify empty subarray byteLength is 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sub = arr.subarray(1, 1);
      expect(sub.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3800
     * @tc.name testBigInt64ArraySubarrayThree038
     * @tc.desc Verify iterating an empty subarray with for-of runs zero times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1, 1);
      let count = 0;
      for (let v of sub) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_3900
     * @tc.name testBigInt64ArraySubarrayThree039
     * @tc.desc Verify subarray covering the full range has same properties as source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(0, 4);
      expect(sub[0]).assertEqual(1n);
      expect(sub[3]).assertEqual(4n);
      expect(sub.byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4000
     * @tc.name testBigInt64ArraySubarrayThree040
     * @tc.desc Verify find() on subarray returns first element matching the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 5);
      let found = sub.find((e: bigint) => e > 3n);
      expect(found).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4100
     * @tc.name testBigInt64ArraySubarrayThree041
     * @tc.desc Verify forEach on subarray visits each element within the subarray range in correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 4);
      let vals: bigint[] = [];
      sub.forEach((e: bigint) => {
        vals.push(e);
      });
      expect(vals[0]).assertEqual(2n);
      expect(vals[1]).assertEqual(3n);
      expect(vals[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4200
     * @tc.name testBigInt64ArraySubarrayThree042
     * @tc.desc Verify subarray on empty source returns empty view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let sub = arr.subarray(0, 0);
      try {
        let v = sub[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4300
     * @tc.name testBigInt64ArraySubarrayThree043
     * @tc.desc Verify constructing new BigInt64Array from subarray creates independent buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      let copy = new BigInt64Array(sub);
      expect(copy[0]).assertEqual(2n);
      expect(copy.buffer !== arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4400
     * @tc.name testBigInt64ArraySubarrayThree044
     * @tc.desc Verify for-of loop over subarray visits each element in correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      let items: BigInt64Array = new BigInt64Array(2);
      let i = 0;
      for (let v of sub) {
        items[i] = v;
        i++;
      }
      expect(items[0]).assertEqual(20n);
      expect(items[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4500
     * @tc.name testBigInt64ArraySubarrayThree045
     * @tc.desc Verify subarray can be used to read elements via index in a for loop.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(2, 5);
      let sum = 0n;
      for (let v of sub) {
        sum = sum + v;
      }
      expect(sum).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4600
     * @tc.name testBigInt64ArraySubarrayThree046
     * @tc.desc Verify multiple independent subarray views can coexist on the same source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let v1 = arr.subarray(0, 2);
      let v2 = arr.subarray(1, 3);
      let v3 = arr.subarray(2, 4);
      expect(v1[0]).assertEqual(1n);
      expect(v2[0]).assertEqual(2n);
      expect(v3[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4700
     * @tc.name testBigInt64ArraySubarrayThree047
     * @tc.desc Verify subarray on subarray preserves the correct element access sequence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let l1 = arr.subarray(1, 5);
      let l2 = l1.subarray(1, 3);
      expect(l2[0]).assertEqual(30n);
      expect(l2[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4800
     * @tc.name testBigInt64ArraySubarrayThree048
     * @tc.desc Verify modifying source through subarray fill changes all in-range elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 4);
      sub.fill(0n);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
      expect(arr[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_4900
     * @tc.name testBigInt64ArraySubarrayThree049
     * @tc.desc Verify subarray and original array can be used in the same expression independently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let sub = arr.subarray(1, 3);
      let origSum = arr[0] + arr[1] + arr[2];
      let subSum = sub[0] + sub[1];
      expect(origSum).assertEqual(30n);
      expect(subSum).assertEqual(25n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5000
     * @tc.name testBigInt64ArraySubarrayThree050
     * @tc.desc Verify subarray on a reversed source array returns the reversed values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.reverse();
      let sub = arr.subarray(0, 2);
      expect(sub[0]).assertEqual(3n);
      expect(sub[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5100
     * @tc.name testBigInt64ArraySubarrayThree051
     * @tc.desc Verify subarray on a sorted source array returns the sorted values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([50n, 10n, 30n, 20n, 40n]);
      arr.sort();
      let sub = arr.subarray(0, 3);
      expect(sub[0]).assertEqual(10n);
      expect(sub[1]).assertEqual(20n);
      expect(sub[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5200
     * @tc.name testBigInt64ArraySubarrayThree052
     * @tc.desc Verify chained subarray byteOffset accumulates correctly across multiple views.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n, 8n]);
      let sub1 = arr.subarray(2);
      let sub2 = sub1.subarray(1);
      expect(sub2.byteOffset).assertEqual(24);
      expect(sub2[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5300
     * @tc.name testBigInt64ArraySubarrayThree053
     * @tc.desc Verify triple-chained subarray with mixed begin/end params preserves correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let s1 = arr.subarray(1, 5);
      let s2 = s1.subarray(1);
      let s3 = s2.subarray(0, 2);
      expect(s3[0]).assertEqual(30n);
      expect(s3[1]).assertEqual(40n);
      expect(s3.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5400
     * @tc.name testBigInt64ArraySubarrayThree054
     * @tc.desc Verify subarray containing MAX_VALUE at the first position preserves the boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 1n, 2n, 3n]);
      let sub = arr.subarray(0, 2);
      expect(sub[0]).assertEqual(9223372036854775807n);
      expect(sub[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5500
     * @tc.name testBigInt64ArraySubarrayThree055
     * @tc.desc Verify subarray containing MIN_VALUE at the last position preserves the boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, -9223372036854775808n]);
      let sub = arr.subarray(2, 4);
      expect(sub[0]).assertEqual(3n);
      expect(sub[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5600
     * @tc.name testBigInt64ArraySubarrayThree056
     * @tc.desc Verify subarray on buffer-backed view at non-zero byteOffset containing MAX_VALUE at view boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let full = new BigInt64Array(buf);
      full[0] = 1n;
      full[1] = 9223372036854775807n;
      full[2] = -9223372036854775808n;
      full[3] = 2n;
      let view = new BigInt64Array(buf, 8, 3);
      let sub = view.subarray(1, 3);
      expect(sub[0]).assertEqual(-9223372036854775808n);
      expect(sub[1]).assertEqual(2n);
      expect(sub.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5700
     * @tc.name testBigInt64ArraySubarrayThree057
     * @tc.desc Verify subarray(0, length) on array with MAX and MIN boundary values returns full-length view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775808n]);
      let sub = arr.subarray(0, 3);
      expect(sub.byteOffset).assertEqual(0);
      expect(sub[0]).assertEqual(9223372036854775807n);
      expect(sub[1]).assertEqual(0n);
      expect(sub[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5800
     * @tc.name testBigInt64ArraySubarrayThree058
     * @tc.desc Verify subarray(-1) on MAX/MIN array yields single-element view with the last boundary element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775808n]);
      let sub = arr.subarray(-1);
      expect(sub[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_5900
     * @tc.name testBigInt64ArraySubarrayThree059
     * @tc.desc Verify subarray on buffer-backed view near buffer end containing both MAX and MIN boundary values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      full[0] = 0n;
      full[1] = 0n;
      full[2] = 0n;
      full[3] = 9223372036854775807n;
      full[4] = -9223372036854775808n;
      let view = new BigInt64Array(buf, 24, 2);
      let sub = view.subarray(0, 2);
      expect(sub[0]).assertEqual(9223372036854775807n);
      expect(sub[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_6000
     * @tc.name testBigInt64ArraySubarrayThree060
     * @tc.desc Verify subarray begin at 0 end at 1 on array with MAX at index 0 yields single boundary element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n, 1n, 2n]);
      let sub = arr.subarray(0, 1);
      expect(sub[0]).assertEqual(9223372036854775807n);
      expect(sub.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_6100
     * @tc.name testBigInt64ArraySubarrayThree061
     * @tc.desc Verify subarray(begin, end) where begin equals length-1 yields single element with MIN boundary value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, -9223372036854775808n]);
      let sub = arr.subarray(3, 4);
      expect(sub[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SUBARRAY_THREE_6200
     * @tc.name testBigInt64ArraySubarrayThree062
     * @tc.desc Verify chained subarray on buffer-backed views at boundary offsets preserves MAX through all levels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySubarrayThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let full = new BigInt64Array(buf);
      full[0] = 0n;
      full[1] = 9223372036854775807n;
      full[2] = -9223372036854775808n;
      full[3] = 0n;
      full[4] = 0n;
      full[5] = 0n;
      let view = new BigInt64Array(buf, 8, 4);
      let sub1 = view.subarray(0, 3);
      let sub2 = sub1.subarray(1, 2);
      expect(sub2[0]).assertEqual(-9223372036854775808n);
    });

  });
}
