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

export default function BigInt64ArraySlice02Test(): void {
  describe('BigInt64ArraySlice02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_0100
     * @tc.name testBigInt64ArraySliceTwo001
     * @tc.desc Verify slice() byteLength is correct for a non-zero byteOffset source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 16, 2);
      let res = arr.slice();
      expect(res.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_0200
     * @tc.name testBigInt64ArraySliceTwo002
     * @tc.desc Verify slice().buffer.byteLength equals the slice byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.slice();
      expect(res.buffer.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_0300
     * @tc.name testBigInt64ArraySliceTwo003
     * @tc.desc Verify slice().buffer.byteLength is correct for a non-zero byteOffset source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let arr = new BigInt64Array(buf, 8, 3);
      let res = arr.slice(1);
      expect(res.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_0400
     * @tc.name testBigInt64ArraySliceTwo004
     * @tc.desc Verify two slice() calls from the same source do not share one buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res1 = arr.slice();
      let res2 = arr.slice();
      expect(res1.buffer === res2.buffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_0500
     * @tc.name testBigInt64ArraySliceTwo005
     * @tc.desc Verify mutating the source buffer through Int8Array does not change slice result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.slice();
      let i8 = new Int8Array(arr.buffer);
      i8[0] = 55;
      expect(res[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_0600
     * @tc.name testBigInt64ArraySliceTwo006
     * @tc.desc Verify slice() preserves zero value 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.slice();
      expect(res[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_0700
     * @tc.name testBigInt64ArraySliceTwo007
     * @tc.desc Verify slice(undefined, 2) treats undefined begin as zero and returns correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.slice(undefined, 2);
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_0800
     * @tc.name testBigInt64ArraySliceTwo008
     * @tc.desc Verify slice(undefined, undefined) treats both as zero and full length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.slice(undefined, undefined);
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_0900
     * @tc.name testBigInt64ArraySliceTwo009
     * @tc.desc Verify slice(1, undefined) returns from index 1 to end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([88n, 99n]);
      let res = arr.slice(1, undefined);
      expect(res[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1000
     * @tc.name testBigInt64ArraySliceTwo010
     * @tc.desc Verify chained slice().slice() preserves the expected middle value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.slice().slice();
      expect(res[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1100
     * @tc.name testBigInt64ArraySliceTwo011
     * @tc.desc Verify chained slice(0,2).slice(0,1) preserves the expected first value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.slice(0, 2).slice(0, 1);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1200
     * @tc.name testBigInt64ArraySliceTwo012
     * @tc.desc Verify repeated slice() calls on an empty result keep length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.slice(0, 0).slice().slice();
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1300
     * @tc.name testBigInt64ArraySliceTwo013
     * @tc.desc Verify mutating the original buffer through DataView does not change a cascaded slice.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let cascade = arr.slice(1).slice();
      let view = new DataView(arr.buffer);
      view.setBigInt64(8, 999n, true);
      expect(cascade[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1400
     * @tc.name testBigInt64ArraySliceTwo014
     * @tc.desc Verify Uint8Array modification of source buffer does not affect slice values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let res = arr.slice();
      let u8 = new Uint8Array(arr.buffer);
      u8[0] = 255;
      u8[7] = 127;
      expect(res[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1500
     * @tc.name testBigInt64ArraySliceTwo015
     * @tc.desc Verify Int16Array modification of source buffer does not affect slice result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      let res = arr.slice();
      let i16 = new Int16Array(arr.buffer);
      i16[0] = 999;
      expect(res[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1600
     * @tc.name testBigInt64ArraySliceTwo016
     * @tc.desc Verify DataView getBigInt64 on slice buffer returns correct values at each position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n]);
      let res = arr.slice(1, 3);
      let view = new DataView(res.buffer);
      let v0 = view.getBigInt64(0, true);
      let v1 = view.getBigInt64(8, true);
      expect(v0).assertEqual(200n);
      expect(v1).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1700
     * @tc.name testBigInt64ArraySliceTwo017
     * @tc.desc Verify DataView setBigInt64 on slice buffer each element is independently modifiable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.slice();
      let view = new DataView(res.buffer);
      view.setBigInt64(0, 111n, true);
      view.setBigInt64(8, 222n, true);
      expect(res[0]).assertEqual(111n);
      expect(res[1]).assertEqual(222n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1800
     * @tc.name testBigInt64ArraySliceTwo018
     * @tc.desc Verify Uint32Array modification of source buffer does not affect slice BigInt64 values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([999n, 888n]);
      let res = arr.slice();
      let u32 = new Uint32Array(arr.buffer);
      u32[0] = 12345;
      expect(res[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_1900
     * @tc.name testBigInt64ArraySliceTwo019
     * @tc.desc Verify slice buffer byte contents via Uint8Array match the expected layout.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let res = arr.slice();
      let bytes = new Uint8Array(res.buffer);
      expect(bytes[0]).assertEqual(1);
      expect(bytes[7]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2000
     * @tc.name testBigInt64ArraySliceTwo020
     * @tc.desc Verify modifying slice buffer at byte level reflects in BigInt64 read.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.slice();
      let bytes = new Uint8Array(res.buffer);
      bytes[0] = 100;
      expect(res[0] > 0n).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2100
     * @tc.name testBigInt64ArraySliceTwo021
     * @tc.desc Verify slice of empty array produces buffer with byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.slice();
      expect(res.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2200
     * @tc.name testBigInt64ArraySliceTwo022
     * @tc.desc Verify slice from BigInt64Array.of() source has independent buffer from the of result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(10n, 20n, 30n);
      let res = arr.slice(1, 2);
      expect(res[0]).assertEqual(20n);
      expect(res.buffer !== arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2300
     * @tc.name testBigInt64ArraySliceTwo023
     * @tc.desc Verify slice from ArrayBuffer-backed source produces an independent buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 8, 2);
      arr[0] = 42n;
      arr[1] = 84n;
      let res = arr.slice();
      expect(res[0]).assertEqual(42n);
      expect(res.buffer !== arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2400
     * @tc.name testBigInt64ArraySliceTwo024
     * @tc.desc Verify constructing new BigInt64Array from slice result creates yet another buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n, 21n]);
      let res1 = arr.slice(1);
      let res2 = new BigInt64Array(res1);
      expect(res2[0]).assertEqual(14n);
      expect(res2.buffer !== res1.buffer).assertTrue();
      expect(res2.buffer !== arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2500
     * @tc.name testBigInt64ArraySliceTwo025
     * @tc.desc Verify slice result element values reflect the number of elements in the sliced range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let res = arr.slice(1);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2600
     * @tc.name testBigInt64ArraySliceTwo026
     * @tc.desc Verify slice result byteLength is a multiple of 8 regardless of source offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 16, 3);
      let res = arr.slice(0, 2);
      expect(res.byteLength % 8).assertEqual(0);
      expect(res.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2700
     * @tc.name testBigInt64ArraySliceTwo027
     * @tc.desc Verify slice result length multiplied by 8 equals byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(1, 4);
      expect(res.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2800
     * @tc.name testBigInt64ArraySliceTwo028
     * @tc.desc Verify slice after calling with() produces an independent buffer from the with result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let replaced = arr.with(1, 99n);
      let res = replaced.slice(1, 3);
      expect(res[0]).assertEqual(99n);
      expect(res[1]).assertEqual(30n);
      expect(res.buffer !== replaced.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_2900
     * @tc.name testBigInt64ArraySliceTwo029
     * @tc.desc Verify with() on a slice result does not change the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.slice();
      let modified = res.with(0, 88n);
      expect(arr[0]).assertEqual(1n);
      expect(modified[0]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3000
     * @tc.name testBigInt64ArraySliceTwo030
     * @tc.desc Verify toReversed on slice result does not change the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.slice(1, 4);
      let rev = res.toReversed();
      expect(arr[1]).assertEqual(2n);
      expect(rev[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3100
     * @tc.name testBigInt64ArraySliceTwo031
     * @tc.desc Verify sort on slice result does not change the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([30n, 10n, 20n]);
      let res = arr.slice();
      res.sort();
      expect(arr[0]).assertEqual(30n);
      expect(res[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3200
     * @tc.name testBigInt64ArraySliceTwo032
     * @tc.desc Verify keys() on slice result returns sequential indices starting from 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let res = arr.slice(1, 3);
      let iter = res.keys();
      expect(iter.next().value).assertEqual(0);
      expect(iter.next().value).assertEqual(1);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3300
     * @tc.name testBigInt64ArraySliceTwo033
     * @tc.desc Verify at() with positive index on slice result returns the correct element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.slice(1, 3);
      expect(res.at(0)).assertEqual(20n);
      expect(res.at(1)).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3400
     * @tc.name testBigInt64ArraySliceTwo034
     * @tc.desc Verify includes() on slice result correctly reports presence and absence of values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n, 400n]);
      let res = arr.slice(1, 3);
      expect(res.includes(200n)).assertTrue();
      expect(res.includes(300n)).assertTrue();
      expect(res.includes(100n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3500
     * @tc.name testBigInt64ArraySliceTwo035
     * @tc.desc Verify BigInt64Array constructor on slice result creates a new typed array with matching values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n, 21n]);
      let res = arr.slice(1);
      let vals: BigInt64Array = new BigInt64Array(res);
      expect(vals[0]).assertEqual(14n);
      expect(vals[1]).assertEqual(21n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3600
     * @tc.name testBigInt64ArraySliceTwo036
     * @tc.desc Verify 3-level cascade slice(1).slice().slice() preserves the correct value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let cascade = arr.slice(1).slice().slice();
      expect(cascade[0]).assertEqual(20n);
      expect(cascade[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3700
     * @tc.name testBigInt64ArraySliceTwo037
     * @tc.desc Verify modifying level-2 in 3-level cascade keeps level-3 and level-1 unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let l1 = arr.slice();
      let l2 = l1.slice();
      let l3 = l2.slice();
      l2[0] = 99n;
      expect(l1[0]).assertEqual(1n);
      expect(l3[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3800
     * @tc.name testBigInt64ArraySliceTwo038
     * @tc.desc Verify three different slice ranges cascaded produce correct independent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let res1 = arr.slice(1, 4);
      let res2 = res1.slice(0, 2);
      let res3 = res2.slice(1);
      expect(res3[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_3900
     * @tc.name testBigInt64ArraySliceTwo039
     * @tc.desc Verify slice of a single-element array has byteLength 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let res = arr.slice();
      expect(res.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4000
     * @tc.name testBigInt64ArraySliceTwo040
     * @tc.desc Verify slice(0,1) on multi-element array has byteLength 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(0, 1);
      expect(res.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4100
     * @tc.name testBigInt64ArraySliceTwo041
     * @tc.desc Verify slice(2,5) on 5-element array has byteLength 24.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.slice(2, 5);
      expect(res.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4200
     * @tc.name testBigInt64ArraySliceTwo042
     * @tc.desc Verify offset view source slice byteOffset is 0, not inherited from source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 16, 3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      let res = arr.slice(1);
      expect(res.byteOffset).assertEqual(0);
      expect(arr.byteOffset).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4300
     * @tc.name testBigInt64ArraySliceTwo043
     * @tc.desc Verify buffer.byteLength of slice equals the slice byteLength exactly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.slice(1, 3);
      expect(res.buffer.byteLength).assertEqual(res.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4400
     * @tc.name testBigInt64ArraySliceTwo044
     * @tc.desc Verify slice(0,0) on non-empty array produces buffer with byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.slice(0, 0);
      expect(res.byteLength).assertEqual(0);
      expect(res.buffer.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4500
     * @tc.name testBigInt64ArraySliceTwo045
     * @tc.desc Verify slice(length, length) on non-empty array produces byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.slice(4, 4);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(res.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4600
     * @tc.name testBigInt64ArraySliceTwo046
     * @tc.desc Verify two slice results from the same source are not reference-equal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let res1 = arr.slice();
      let res2 = arr.slice();
      expect(res1 === res2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4700
     * @tc.name testBigInt64ArraySliceTwo047
     * @tc.desc Verify slice result toString output matches the source array content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.slice(1, 3);
      let str = res.toString();
      expect(str).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4800
     * @tc.name testBigInt64ArraySliceTwo048
     * @tc.desc Verify slice on 50-element array produces correct byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        arr[i] = BigInt(i);
      }
      let res = arr.slice(10, 30);
      expect(res.byteLength).assertEqual(160);
      expect(res[0]).assertEqual(10n);
      expect(res[19]).assertEqual(29n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_4900
     * @tc.name testBigInt64ArraySliceTwo049
     * @tc.desc Verify slice with begin -1 on 50-element array returns single last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        arr[i] = BigInt(i * 2);
      }
      let res = arr.slice(-1);
      expect(res[0]).assertEqual(98n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5000
     * @tc.name testBigInt64ArraySliceTwo050
     * @tc.desc Verify slice on array with all BigInt64 maximum values preserves all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n, 9223372036854775807n]);
      let res = arr.slice(0, 2);
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5100
     * @tc.name testBigInt64ArraySliceTwo051
     * @tc.desc Verify slice on array with all BigInt64 minimum values preserves all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n]);
      let res = arr.slice();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5200
     * @tc.name testBigInt64ArraySliceTwo052
     * @tc.desc Verify slice preserves both MAX and MIN values together in the result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 9223372036854775807n, -9223372036854775808n]);
      let res = arr.slice(1, 3);
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5300
     * @tc.name testBigInt64ArraySliceTwo053
     * @tc.desc Verify source modified multiple times after slice does not affect the earlier slice result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.slice();
      arr[0] = 100n;
      arr[1] = 200n;
      arr[2] = 300n;
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
      expect(res[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5400
     * @tc.name testBigInt64ArraySliceTwo054
     * @tc.desc Verify chain of empty slices on non-empty source ultimately produces empty result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      let res = arr.slice(0, 0).slice().slice(0, 0);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(res.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5500
     * @tc.name testBigInt64ArraySliceTwo055
     * @tc.desc Verify slice through subarray maintains isolation from the original source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 4);
      let res = sub.slice();
      arr[1] = 99n;
      expect(res[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5600
     * @tc.name testBigInt64ArraySliceTwo056
     * @tc.desc Verify DataView setInt8 on source first byte does not affect slice first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([256n]);
      let res = arr.slice();
      let view = new DataView(arr.buffer);
      view.setInt8(0, 127);
      expect(res[0]).assertEqual(256n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5700
     * @tc.name testBigInt64ArraySliceTwo057
     * @tc.desc Verify Int32Array modification of source does not affect slice BigInt64 values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000n, 2000n]);
      let res = arr.slice();
      let i32 = new Int32Array(arr.buffer);
      i32[0] = -1;
      i32[1] = -1;
      expect(res[0]).assertEqual(1000n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5800
     * @tc.name testBigInt64ArraySliceTwo058
     * @tc.desc Verify Uint32Array modification of source does not affect slice values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([500n, 600n]);
      let res = arr.slice();
      let u32 = new Uint32Array(arr.buffer);
      u32[2] = 99999;
      u32[3] = 88888;
      expect(res[1]).assertEqual(600n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_5900
     * @tc.name testBigInt64ArraySliceTwo059
     * @tc.desc Verify slice result of slice result is isolated from both ancestor arrays.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let gen1 = arr.slice(1, 4);
      let gen2 = gen1.slice(0, 2);
      arr[2] = 99n;
      gen1[0] = 88n;
      expect(gen2[0]).assertEqual(2n);
      expect(gen2[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6000
     * @tc.name testBigInt64ArraySliceTwo060
     * @tc.desc Verify slice result elements are individually writable and readable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.slice();
      res[0] = 111n;
      res[1] = 222n;
      res[2] = 333n;
      expect(res[0]).assertEqual(111n);
      expect(res[1]).assertEqual(222n);
      expect(res[2]).assertEqual(333n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6100
     * @tc.name testBigInt64ArraySliceTwo061
     * @tc.desc Verify slice on non-zero byteOffset source with negative begin produces correct tail.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 16, 4);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      arr[3] = 40n;
      let res = arr.slice(-2);
      expect(res[0]).assertEqual(30n);
      expect(res[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6200
     * @tc.name testBigInt64ArraySliceTwo062
     * @tc.desc Verify subarray of slice result shares buffer with slice, not source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sliced = arr.slice(1, 4);
      let sub = sliced.subarray(0, 2);
      expect(sub.buffer).assertEqual(sliced.buffer);
      expect(sub.buffer === arr.buffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6300
     * @tc.name testBigInt64ArraySliceTwo063
     * @tc.desc Verify iterating both source and slice result concurrently yields independent sequences.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.slice();
      let iterSrc = arr.values();
      let iterRes = res.values();
      iterSrc.next();
      iterSrc.next();
      expect(iterRes.next().value).assertEqual(10n);
      expect(iterRes.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6400
     * @tc.name testBigInt64ArraySliceTwo064
     * @tc.desc Verify constructing BigInt64Array from slice result creates correct new instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n]);
      let sliced = arr.slice(0, 2);
      let copy = new BigInt64Array(sliced);
      expect(copy[0]).assertEqual(5n);
      expect(copy[1]).assertEqual(15n);
      expect(copy.buffer !== sliced.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6500
     * @tc.name testBigInt64ArraySliceTwo065
     * @tc.desc Verify slicing twice from different source arrays yields independent results with same structure.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n, 3n]);
      let res1 = arr1.slice(1);
      let res2 = arr1.slice(1);
      expect(res1[0]).assertEqual(res2[0]);
      expect(res1[1]).assertEqual(res2[1]);
      expect(res1[0]).assertEqual(2n);
      expect(res2[0]).assertEqual(2n);
      expect(res1.buffer !== res2.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6600
     * @tc.name testBigInt64ArraySliceTwo066
     * @tc.desc Verify slice from offset view source with byteLength exactly matching element count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 3);
      arr[0] = 33n;
      arr[1] = 66n;
      arr[2] = 99n;
      let res = arr.slice(0, 2);
      expect(res.byteLength).assertEqual(16);
      expect(res[0]).assertEqual(33n);
      expect(res[1]).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6700
     * @tc.name testBigInt64ArraySliceTwo067
     * @tc.desc Verify every element in a slice result can be accessed and equals the expected value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n, 44n]);
      let res = arr.slice(1, 3);
      let allMatch = true;
      let expectedVals = [22n, 33n];
      for (let i = 0; i < 2; i++) {
        if (res[i] !== expectedVals[i]) {
          allMatch = false;
        }
      }
      expect(allMatch).assertTrue();
      expect(res[0]).assertEqual(22n);
      expect(res[1]).assertEqual(33n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6800
     * @tc.name testBigInt64ArraySliceTwo068
     * @tc.desc Verify slice on 100-element array produces correct byteLength for a 50-element sub-range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i + 1);
      }
      let res = arr.slice(25, 75);
      expect(res.byteLength).assertEqual(400);
      expect(res[0]).assertEqual(26n);
      expect(res[49]).assertEqual(75n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_6900
     * @tc.name testBigInt64ArraySliceTwo069
     * @tc.desc Verify slice with begin greater than array length returns empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.slice(10);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(res.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_7000
     * @tc.name testBigInt64ArraySliceTwo070
     * @tc.desc Verify slice with begin and end both equal to array length returns empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.slice(4, 4);
      try {
        let v = res[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_7100
     * @tc.name testBigInt64ArraySliceTwo071
     * @tc.desc Verify slice(-0, 2) treats -0 as 0 and returns first two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.slice(-0, 2);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_7200
     * @tc.name testBigInt64ArraySliceTwo072
     * @tc.desc Verify slice() on a subarray preserves byteOffset-relative indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(1, 4);
      let res = sub.slice(0, 2);
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_7300
     * @tc.name testBigInt64ArraySliceTwo073
     * @tc.desc Verify BigInt64Array.of() result slice(0,1) returns the first element correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(11n, 22n, 33n);
      let res = arr.slice(0, 1);
      expect(res[0]).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SLICE_TWO_7400
     * @tc.name testBigInt64ArraySliceTwo074
     * @tc.desc Verify slice() on array from ArrayBuffer with byteOffset 16 yields correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySliceTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(48);
      let arr = new BigInt64Array(buf, 16, 4);
      arr[0] = 5n;
      arr[1] = 10n;
      arr[2] = 15n;
      arr[3] = 20n;
      let res = arr.slice(1, 3);
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(15n);
    });

  });
}
