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

export default function BigInt64ArrayValues04Test(): void {
  describe('BigInt64ArrayValues04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_0100
     * @tc.name testBigInt64ArrayValuesFour001
     * @tc.desc Verify values on subarray(0) of a 3-element array yields all three elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(0);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(10n);
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_0200
     * @tc.name testBigInt64ArrayValuesFour002
     * @tc.desc Verify values on subarray(1) yields elements starting from the second.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(1);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_0300
     * @tc.name testBigInt64ArrayValuesFour003
     * @tc.desc Verify values on subarray(2) yields only the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(2);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(3n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_0400
     * @tc.name testBigInt64ArrayValuesFour004
     * @tc.desc Verify values on subarray(0, 1) yields exactly the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(0, 1);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(10n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_0500
     * @tc.name testBigInt64ArrayValuesFour005
     * @tc.desc Verify values on subarray(1, 3) yields two elements then done.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_0600
     * @tc.name testBigInt64ArrayValuesFour006
     * @tc.desc Verify values on subarray(0, 0) value is undefined.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 0);
      let iter = sub.values();
      expect(iter.next().value).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_0700
     * @tc.name testBigInt64ArrayValuesFour007
     * @tc.desc Verify values on subarray(-2) yields the last two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(-2);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_0800
     * @tc.name testBigInt64ArrayValuesFour008
     * @tc.desc Verify values on subarray(-3) yields all elements for a 3-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(-3);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(10n);
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_0900
     * @tc.name testBigInt64ArrayValuesFour009
     * @tc.desc Verify values on subarray with begin equals end returns an immediately exhausted iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(3, 3);
      let iter = sub.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1000
     * @tc.name testBigInt64ArrayValuesFour010
     * @tc.desc Verify values on subarray with negative start exceeding length clamps to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(-10);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1100
     * @tc.name testBigInt64ArrayValuesFour011
     * @tc.desc Verify values on subarray(2, 1) returns empty iterator due to reversed range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(2, 1);
      let iter = sub.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1200
     * @tc.name testBigInt64ArrayValuesFour012
     * @tc.desc Verify values on subarray(0, 0) of a single-element array yields empty iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([42n]);
      let sub = arr.subarray(0, 0);
      let iter = sub.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1300
     * @tc.name testBigInt64ArrayValuesFour013
     * @tc.desc Verify values on an ArrayBuffer-backed view with byteOffset 0 yields correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer, 0, 3);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      let iter = arr.values();
      expect(iter.next().value).assertEqual(10n);
      expect(iter.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1400
     * @tc.name testBigInt64ArrayValuesFour014
     * @tc.desc Verify values on an ArrayBuffer-backed view with non-zero byteOffset yields correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let full = new BigInt64Array(buffer);
      full[0] = 1n;
      full[1] = 2n;
      full[2] = 3n;
      let offset = new BigInt64Array(buffer, 8, 2);
      let iter = offset.values();
      expect(iter.next().value).assertEqual(2n);
      expect(iter.next().value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1500
     * @tc.name testBigInt64ArrayValuesFour015
     * @tc.desc Verify values on a buffer view with the maximum byteOffset yields correct last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let full = new BigInt64Array(buffer);
      full[0] = 1n;
      full[1] = 2n;
      full[2] = 3n;
      let last = new BigInt64Array(buffer, 16, 1);
      let iter = last.values();
      expect(iter.next().value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1600
     * @tc.name testBigInt64ArrayValuesFour016
     * @tc.desc Verify values on a buffer view with length 1 and offset 0 yields single element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(8);
      let arr = new BigInt64Array(buffer, 0, 1);
      arr[0] = 99n;
      let iter = arr.values();
      expect(iter.next().value).assertEqual(99n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1700
     * @tc.name testBigInt64ArrayValuesFour017
     * @tc.desc Verify values on buffer views with different offsets yield correct independent elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let v1 = new BigInt64Array(buffer, 0, 2);
      let v2 = new BigInt64Array(buffer, 16, 2);
      v1[0] = 100n;
      v2[0] = 200n;
      let i1 = v1.values();
      let i2 = v2.values();
      expect(i1.next().value).assertEqual(100n);
      expect(i2.next().value).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1800
     * @tc.name testBigInt64ArrayValuesFour018
     * @tc.desc Verify values on a buffer view created with explicit length 0 returns empty iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr = new BigInt64Array(buffer, 0, 0);
      let iter = arr.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_1900
     * @tc.name testBigInt64ArrayValuesFour019
     * @tc.desc Verify values on all three non-overlapping buffer views traverse independently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr1 = new BigInt64Array(buffer, 0, 1);
      let arr2 = new BigInt64Array(buffer, 8, 1);
      let arr3 = new BigInt64Array(buffer, 16, 1);
      arr1[0] = 1n;
      arr2[0] = 2n;
      arr3[0] = 3n;
      let it1 = arr1.values();
      let it2 = arr2.values();
      let it3 = arr3.values();
      expect(it1.next().value).assertEqual(1n);
      expect(it2.next().value).assertEqual(2n);
      expect(it3.next().value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2000
     * @tc.name testBigInt64ArrayValuesFour020
     * @tc.desc Verify overlapping buffer views share the same underlying data for the overlapped region.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let full = new BigInt64Array(buffer, 0, 2);
      let partial = new BigInt64Array(buffer, 8, 1);
      full[1] = 77n;
      let iter = partial.values();
      expect(iter.next().value).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2100
     * @tc.name testBigInt64ArrayValuesFour021
     * @tc.desc Verify two overlapping views starting at the same offset see the same first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let v1 = new BigInt64Array(buffer, 0, 2);
      let v2 = new BigInt64Array(buffer, 0, 1);
      v1[0] = 55n;
      let i1 = v1.values();
      let i2 = v2.values();
      expect(i1.next().value).assertEqual(55n);
      expect(i2.next().value).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2200
     * @tc.name testBigInt64ArrayValuesFour022
     * @tc.desc Verify values from an overlapping buffer view reflects a write to the shared element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr = new BigInt64Array(buffer);
      let sub = new BigInt64Array(buffer, 0, 1);
      arr[0] = 42n;
      let iter = sub.values();
      expect(iter.next().value).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2300
     * @tc.name testBigInt64ArrayValuesFour023
     * @tc.desc Verify values from the full view reflect writes made through a sub-view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let full = new BigInt64Array(buffer);
      let sub = new BigInt64Array(buffer, 8, 1);
      sub[0] = 88n;
      let iter = full.values();
      iter.next();
      expect(iter.next().value).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2400
     * @tc.name testBigInt64ArrayValuesFour024
     * @tc.desc Verify two non-overlapping views on the same buffer iterate independently.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(32);
      let v1 = new BigInt64Array(buffer, 0, 2);
      let v2 = new BigInt64Array(buffer, 16, 2);
      v1[0] = 1n;
      v1[1] = 2n;
      v2[0] = 3n;
      v2[1] = 4n;
      let i1 = v1.values();
      let i2 = v2.values();
      expect(i1.next().value).assertEqual(1n);
      expect(i1.next().value).assertEqual(2n);
      expect(i2.next().value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2500
     * @tc.name testBigInt64ArrayValuesFour025
     * @tc.desc Verify values on a subarray of a buffer-backed view yields correct elements from the offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer, 0, 3);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      let sub = arr.subarray(1);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2600
     * @tc.name testBigInt64ArrayValuesFour026
     * @tc.desc Verify values on a buffer view with subarray(-1) of a view yields the view's last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer, 8, 2);
      arr[0] = 10n;
      arr[1] = 20n;
      let sub = arr.subarray(-1);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2700
     * @tc.name testBigInt64ArrayValuesFour027
     * @tc.desc Verify mutation through a buffer-backed parent is reflected in the offset view iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let full = new BigInt64Array(buffer);
      let offset = new BigInt64Array(buffer, 8, 2);
      full[1] = 77n;
      let iter = offset.values();
      expect(iter.next().value).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2800
     * @tc.name testBigInt64ArrayValuesFour028
     * @tc.desc Verify mutation through an offset view is reflected in the full buffer view iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let full = new BigInt64Array(buffer);
      let offset = new BigInt64Array(buffer, 8, 1);
      offset[0] = 66n;
      let iter = full.values();
      iter.next();
      expect(iter.next().value).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_2900
     * @tc.name testBigInt64ArrayValuesFour029
     * @tc.desc Verify multiple mutations to the same element through different views yield last written value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let sub = arr.subarray(0);
      arr[1] = 10n;
      sub[1] = 20n;
      let iter = arr.values();
      iter.next();
      expect(iter.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3000
     * @tc.name testBigInt64ArrayValuesFour030
     * @tc.desc Verify mutation of an already-consumed element does not affect the iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let iter = arr.values();
      iter.next();
      arr[0] = 99n;
      expect(iter.next().value).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3100
     * @tc.name testBigInt64ArrayValuesFour031
     * @tc.desc Verify cross-view mutation during for-of over subarray reflects the change.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1);
      let vals: bigint[] = [];
      for (let v of sub) {
        vals.push(v);
        arr[2] = 99n;
      }
      expect(vals[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3200
     * @tc.name testBigInt64ArrayValuesFour032
     * @tc.desc Verify for-of over subarray(-2) values() yields the last two elements of the parent array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n, 400n]);
      let sub = arr.subarray(-2);
      let results: bigint[] = [];
      for (let v of sub.values()) {
        results.push(v);
      }
      expect(results[0]).assertEqual(300n);
      expect(results[1]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3300
     * @tc.name testBigInt64ArrayValuesFour033
     * @tc.desc Verify for-of over partially consumed buffer offset view iterator yields remaining elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer, 0, 3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      let iter = arr.values();
      iter.next();
      let count = 0;
      for (let v of iter) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3400
     * @tc.name testBigInt64ArrayValuesFour034
     * @tc.desc Verify a partially consumed subarray iterator with one remaining element yields correct value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(1, 3);
      let iter = sub.values();
      iter.next();
      expect(iter.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3500
     * @tc.name testBigInt64ArrayValuesFour035
     * @tc.desc Verify fully consuming a subarray iterator then creating a new one starts fresh.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(1);
      let iter1 = sub.values();
      iter1.next();
      iter1.next();
      let iter2 = sub.values();
      expect(iter2.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3600
     * @tc.name testBigInt64ArrayValuesFour036
     * @tc.desc Verify a partially consumed buffer view iterator correctly reports the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer, 8, 2);
      arr[0] = 100n;
      arr[1] = 200n;
      let iter = arr.values();
      iter.next();
      expect(iter.next().value).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3700
     * @tc.name testBigInt64ArrayValuesFour037
     * @tc.desc Verify two partially consumed subarray iterators from the same view are independent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 2);
      let iter1 = sub.values();
      let iter2 = sub.values();
      iter1.next();
      expect(iter2.next().value).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3800
     * @tc.name testBigInt64ArrayValuesFour038
     * @tc.desc Verify values on a subarray of a subarray yields correct chained view elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub1 = arr.subarray(1);
      let sub2 = sub1.subarray(0, 2);
      let iter = sub2.values();
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_3900
     * @tc.name testBigInt64ArrayValuesFour039
     * @tc.desc Verify values on subarray of subarray with negative index yields correct element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(-1);
      let iter = sub2.values();
      expect(iter.next().value).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4000
     * @tc.name testBigInt64ArrayValuesFour040
     * @tc.desc Verify values on subarray of subarray with zero-length range returns empty iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub1 = arr.subarray(0);
      let sub2 = sub1.subarray(1, 1);
      let iter = sub2.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4100
     * @tc.name testBigInt64ArrayValuesFour041
     * @tc.desc Verify mutation through original array reflected in chained subarray-of-subarray iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub1 = arr.subarray(1, 3);
      let sub2 = sub1.subarray(0);
      arr[1] = 99n;
      let iter = sub2.values();
      expect(iter.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4200
     * @tc.name testBigInt64ArrayValuesFour042
     * @tc.desc Verify values on subarray of subarray with full range yields all elements of the inner view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 20n]);
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(0, 3);
      let iter = sub2.values();
      expect(iter.next().value).assertEqual(10n);
      expect(iter.next().value).assertEqual(15n);
      expect(iter.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4300
     * @tc.name testBigInt64ArrayValuesFour043
     * @tc.desc Verify for-of over subarray of subarray yields correct count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(1);
      let count = 0;
      for (let v of sub2) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4400
     * @tc.name testBigInt64ArrayValuesFour044
     * @tc.desc Verify values on subarray of a 50-element array traverses all viewed elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        arr[i] = BigInt(i);
      }
      let sub = arr.subarray(10, 30);
      let count = 0;
      for (let v of sub) {
        count++;
      }
      expect(count).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4500
     * @tc.name testBigInt64ArrayValuesFour045
     * @tc.desc Verify values on subarray with MAX boundary values preserves them during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 9223372036854775807n, 3n]);
      let sub = arr.subarray(1, 2);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4600
     * @tc.name testBigInt64ArrayValuesFour046
     * @tc.desc Verify values on subarray with MIN boundary values preserves them during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -9223372036854775808n, 3n]);
      let sub = arr.subarray(1, 2);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4700
     * @tc.name testBigInt64ArrayValuesFour047
     * @tc.desc Verify values on a buffer view at byteOffset 0 of a large buffer yields all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(80);
      let arr = new BigInt64Array(buffer, 0, 10);
      for (let i = 0; i < 10; i++) {
        arr[i] = BigInt(i);
      }
      let index = 0;
      for (let v of arr) {
        expect(v).assertEqual(BigInt(index));
        index++;
      }
      expect(index).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4800
     * @tc.name testBigInt64ArrayValuesFour048
     * @tc.desc Verify multiple subarray iterators from the same large array with different ranges are independent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(60);
      for (let i = 0; i < 60; i++) {
        arr[i] = BigInt(i);
      }
      let sub1 = arr.subarray(0, 10);
      let sub2 = arr.subarray(50, 60);
      let i1 = sub1.values();
      let i2 = sub2.values();
      expect(i1.next().value).assertEqual(0n);
      expect(i2.next().value).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_4900
     * @tc.name testBigInt64ArrayValuesFour049
     * @tc.desc Verify values on subarray of 100-element buffer-backed array traverses correct sub-range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(800);
      let arr = new BigInt64Array(buffer);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      let sub = arr.subarray(90);
      let count = 0;
      for (let v of sub) {
        count++;
      }
      expect(count).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_5000
     * @tc.name testBigInt64ArrayValuesFour050
     * @tc.desc Verify values on subarray with start equal to array length returns empty iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(3);
      let iter = sub.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_5100
     * @tc.name testBigInt64ArrayValuesFour051
     * @tc.desc Verify chained subarray().values().next() on buffer view returns correct first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr = new BigInt64Array(buffer, 8, 2);
      arr[0] = 42n;
      let val = arr.subarray(0).values().next().value;
      expect(val).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_5200
     * @tc.name testBigInt64ArrayValuesFour052
     * @tc.desc Verify for-of over subarray of BigInt64Array.from() result iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      let vals: bigint[] = [];
      for (let v of sub) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(20n);
      expect(vals[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_5300
     * @tc.name testBigInt64ArrayValuesFour053
     * @tc.desc Verify for-of over subarray of BigInt64Array.of() result iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(5n, 10n, 15n);
      let sub = arr.subarray(0, 2);
      let count = 0;
      for (let v of sub) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_5400
     * @tc.name testBigInt64ArrayValuesFour054
     * @tc.desc Verify buffer view with subarray iteration and explicit done check at each step.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr = new BigInt64Array(buffer, 0, 2);
      arr[0] = 10n;
      arr[1] = 20n;
      let sub = arr.subarray(0);
      let iter = sub.values();
      let r1 = iter.next();
      expect(r1.value).assertEqual(10n);
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.value).assertEqual(20n);
      expect(r2.done).assertFalse();
      let r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_5500
     * @tc.name testBigInt64ArrayValuesFour055
     * @tc.desc Verify values on subarray after copyWithin mutates the view yields updated elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(0, 2);
      arr.copyWithin(0, 2);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(3n);
      expect(iter.next().value).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_5600
     * @tc.name testBigInt64ArrayValuesFour056
     * @tc.desc Verify values() iterator next() after exhaustion consistently returns {done: true} without throwing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter = arr.values();
      iter.next();
      iter.next();
      let r3 = iter.next();
      expect(r3.done).assertTrue();
      let r4 = iter.next();
      expect(r4.done).assertTrue();
      let r5 = iter.next();
      expect(r5.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_5700
     * @tc.name testBigInt64ArrayValuesFour057
     * @tc.desc Verify for-of over subarray of subarray yields correct count and values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(1);
      let count = 0;
      let values: bigint[] = [];
      for (let v of sub2) {
        values.push(v);
        count++;
      }
      expect(count).assertEqual(2);
      expect(values[0]).assertEqual(3n);
      expect(values[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_FOUR_5800
     * @tc.name testBigInt64ArrayValuesFour058
     * @tc.desc Verify values() iterator handles external buffer mutation between creation and consumption.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      let iter = arr.values();
      let i8 = new Int8Array(buf);
      i8[8] = 99;
      i8[9] = 0;
      i8[10] = 0;
      i8[11] = 0;
      i8[12] = 0;
      i8[13] = 0;
      i8[14] = 0;
      i8[15] = 0;
      expect(iter.next().value).assertEqual(10n);
      let second = iter.next().value;
      expect(typeof second).assertEqual('bigint');
      expect(second).assertEqual(99n);
    });

  });
}
