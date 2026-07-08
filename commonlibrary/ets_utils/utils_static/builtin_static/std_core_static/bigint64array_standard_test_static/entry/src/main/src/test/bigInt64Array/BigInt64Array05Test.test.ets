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
import Utils from './../Util.test';

const BIGINT64_NEAR_MAX_FIVE = 9223372036854775805n;
const BIGINT64_NEAR_MIN_FIVE = -9223372036854775805n;
const BIGINT64_WRAP_MAX_PLUS_FIVE = 9223372036854775812n;
const BIGINT64_WRAP_MAX_PLUS_FIFTY_FIVE = 9223372036854775862n;
const BIGINT64_WRAP_MIN_MINUS_FIVE = -9223372036854775813n;

export default function BigInt64Array05Test(): void {
  describe('BigInt64Array05Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_0100
     * @tc.name testBigInt64ArrayFive0100
     * @tc.desc Verify constructor with zero arguments creates an empty BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_0200
     * @tc.name testBigInt64ArrayFive0200
     * @tc.desc Verify constructor with an array argument copies the provided bigint elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n]);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_0300
     * @tc.name testBigInt64ArrayFive0300
     * @tc.desc Verify constructor with an ArrayBuffer argument maps the full buffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let arr = new BigInt64Array(buf);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_0400
     * @tc.name testBigInt64ArrayFive0400
     * @tc.desc Verify constructor with buffer and byteOffset maps from the given offset to the end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let arr = new BigInt64Array(buf, 40);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_0500
     * @tc.name testBigInt64ArrayFive0500
     * @tc.desc Verify constructor with buffer, byteOffset and length maps the requested slice.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let arr = new BigInt64Array(buf, 40, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_0600
     * @tc.name testBigInt64ArrayFive0600
     * @tc.desc Verify set with an array argument writes values starting at offset zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set([5n, 15n]);
      expect(arr[1]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_0700
     * @tc.name testBigInt64ArrayFive0700
     * @tc.desc Verify set with an array and offset writes values at the specified position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.set([5n, 15n], 2);
      expect(arr[3]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_0800
     * @tc.name testBigInt64ArrayFive0800
     * @tc.desc Verify fill with only a value argument updates the entire array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(5n);
      expect(arr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_0900
     * @tc.name testBigInt64ArrayFive0900
     * @tc.desc Verify fill with value and start fills from the start index to the end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(15n, 2);
      expect(arr[2]).assertEqual(15n);
      expect(arr[1]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1000
     * @tc.name testBigInt64ArrayFive1000
     * @tc.desc Verify fill with value, start and end fills only the requested range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(5n, 1, 3);
      expect(arr[2]).assertEqual(5n);
      expect(arr[4]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1100
     * @tc.name testBigInt64ArrayFive1100
     * @tc.desc Verify slice with no arguments returns a full copied BigInt64Array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n]);
      let res = arr.slice();
      expect(res.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1200
     * @tc.name testBigInt64ArrayFive1200
     * @tc.desc Verify slice with a start argument copies from the start index to the end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n]);
      let res = arr.slice(1);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1300
     * @tc.name testBigInt64ArrayFive1300
     * @tc.desc Verify slice with start and end arguments copies the requested subrange.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n]);
      let res = arr.slice(1, 2);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1400
     * @tc.name testBigInt64ArrayFive1400
     * @tc.desc Verify subarray with no arguments returns a full shared view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n]);
      let sub = arr.subarray();
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1500
     * @tc.name testBigInt64ArrayFive1500
     * @tc.desc Verify subarray with a start argument returns the expected shared suffix view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n]);
      let sub = arr.subarray(1);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1600
     * @tc.name testBigInt64ArrayFive1600
     * @tc.desc Verify subarray with start and end arguments returns the requested shared slice
     *          view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n]);
      let sub = arr.subarray(1, 2);
      expect(sub.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1700
     * @tc.name testBigInt64ArrayFive1700
     * @tc.desc Verify indexOf with only searchElement searches from the beginning of the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 5n]);
      expect(arr.indexOf(5n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1800
     * @tc.name testBigInt64ArrayFive1800
     * @tc.desc Verify indexOf with searchElement and fromIndex searches from the given offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 5n]);
      expect(arr.indexOf(5n, 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_1900
     * @tc.name testBigInt64ArrayFive1900
     * @tc.desc Verify includes with only searchElement checks from the beginning of the array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n]);
      expect(arr.includes(15n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2000
     * @tc.name testBigInt64ArrayFive2000
     * @tc.desc Verify includes with searchElement and fromIndex checks from the given offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n]);
      expect(arr.includes(5n, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2100
     * @tc.name testBigInt64ArrayFive2100
     * @tc.desc Verify lastIndexOf with only searchElement searches backward from the end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 5n]);
      expect(arr.lastIndexOf(5n)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2200
     * @tc.name testBigInt64ArrayFive2200
     * @tc.desc Verify lastIndexOf with searchElement and fromIndex searches backward from the given
     *          index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 5n]);
      expect(arr.lastIndexOf(5n, 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2300
     * @tc.name testBigInt64ArrayFive2300
     * @tc.desc Verify constructor with length 1005 creates an array with the expected capacity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1005);
      expect(arr.length).assertEqual(1005);
      expect(arr.byteLength).assertEqual(8040);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2400
     * @tc.name testBigInt64ArrayFive2400
     * @tc.desc Verify constructor mapping with byteOffset 40 uses the expected buffer offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let arr = new BigInt64Array(buf, 40);
      expect(arr.byteOffset).assertEqual(40);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2500
     * @tc.name testBigInt64ArrayFive2500
     * @tc.desc Verify constructor mapping with byteOffset 840 uses the expected buffer offset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(1000);
      let arr = new BigInt64Array(buf, 840);
      expect(arr.byteOffset).assertEqual(840);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2600
     * @tc.name testBigInt64ArrayFive2600
     * @tc.desc Verify fill with start 5 begins writing at the expected position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      arr.fill(5n, 5);
      expect(arr[5]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2700
     * @tc.name testBigInt64ArrayFive2700
     * @tc.desc Verify fill with start 55 begins writing at the expected position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr.fill(5n, 55);
      expect(arr[55]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2800
     * @tc.name testBigInt64ArrayFive2800
     * @tc.desc Verify fill with start -5 begins writing at the expected position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      arr.fill(5n, -5);
      expect(arr[5]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_2900
     * @tc.name testBigInt64ArrayFive2900
     * @tc.desc Verify fill with start -55 begins writing at the expected position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr.fill(5n, -55);
      expect(arr[45]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3000
     * @tc.name testBigInt64ArrayFive3000
     * @tc.desc Verify fill with end 5 stops writing at the expected boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr.fill(5n, 0, 5);
      expect(arr[4]).assertEqual(5n);
      expect(arr[5]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3100
     * @tc.name testBigInt64ArrayFive3100
     * @tc.desc Verify fill with end 55 stops writing at the expected boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr.fill(5n, 0, 55);
      expect(arr[54]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3200
     * @tc.name testBigInt64ArrayFive3200
     * @tc.desc Verify fill with end -5 stops writing at the expected boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr.fill(5n, 0, -5);
      expect(arr[14]).assertEqual(5n);
      expect(arr[15]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3300
     * @tc.name testBigInt64ArrayFive3300
     * @tc.desc Verify fill with end -55 stops writing at the expected boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr.fill(5n, 0, -55);
      expect(arr[44]).assertEqual(5n);
      expect(arr[45]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3400
     * @tc.name testBigInt64ArrayFive3400
     * @tc.desc Verify slice with start 5 returns the expected copied suffix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[5] = 5n;
      let res = arr.slice(5);
      expect(res[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3500
     * @tc.name testBigInt64ArrayFive3500
     * @tc.desc Verify slice with start 55 returns the expected copied suffix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[55] = 5n;
      let res = arr.slice(55);
      expect(res[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3600
     * @tc.name testBigInt64ArrayFive3600
     * @tc.desc Verify slice with start -5 returns the expected copied suffix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[15] = 5n;
      let res = arr.slice(-5);
      expect(res[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3700
     * @tc.name testBigInt64ArrayFive3700
     * @tc.desc Verify slice with start -55 returns the expected copied suffix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[45] = 5n;
      let res = arr.slice(-55);
      expect(res[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3800
     * @tc.name testBigInt64ArrayFive3800
     * @tc.desc Verify slice with end 5 returns the expected copied prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      let res = arr.slice(0, 5);
      expect(res.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_3900
     * @tc.name testBigInt64ArrayFive3900
     * @tc.desc Verify slice with end 55 returns the expected copied prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      let res = arr.slice(0, 55);
      expect(res.length).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4000
     * @tc.name testBigInt64ArrayFive4000
     * @tc.desc Verify slice with end -5 returns the expected copied prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      let res = arr.slice(0, -5);
      expect(res.length).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4100
     * @tc.name testBigInt64ArrayFive4100
     * @tc.desc Verify slice with end -55 returns the expected copied prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      let res = arr.slice(0, -55);
      expect(res.length).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4200
     * @tc.name testBigInt64ArrayFive4200
     * @tc.desc Verify subarray with start 5 returns the expected shared view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[5] = 5n;
      let sub = arr.subarray(5);
      expect(sub[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4300
     * @tc.name testBigInt64ArrayFive4300
     * @tc.desc Verify subarray with start -5 returns the expected shared view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[15] = 5n;
      let sub = arr.subarray(-5);
      expect(sub[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4400
     * @tc.name testBigInt64ArrayFive4400
     * @tc.desc Verify subarray with start 55 returns the expected shared view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[55] = 5n;
      let sub = arr.subarray(55);
      expect(sub[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4500
     * @tc.name testBigInt64ArrayFive4500
     * @tc.desc Verify subarray with start -55 returns the expected shared view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[45] = 5n;
      let sub = arr.subarray(-55);
      expect(sub[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4600
     * @tc.name testBigInt64ArrayFive4600
     * @tc.desc Verify subarray with end 5 returns the expected shared-view length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      let sub = arr.subarray(0, 5);
      expect(sub.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4700
     * @tc.name testBigInt64ArrayFive4700
     * @tc.desc Verify subarray with end -5 returns the expected shared-view length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      let sub = arr.subarray(0, -5);
      expect(sub.length).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4800
     * @tc.name testBigInt64ArrayFive4800
     * @tc.desc Verify subarray with end 55 returns the expected shared-view length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      let sub = arr.subarray(0, 55);
      expect(sub.length).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_4900
     * @tc.name testBigInt64ArrayFive4900
     * @tc.desc Verify subarray with end -55 returns the expected shared-view length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      let sub = arr.subarray(0, -55);
      expect(sub.length).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5000
     * @tc.name testBigInt64ArrayFive5000
     * @tc.desc Verify set with offset 5 writes into the expected target index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr.set([5n], 5);
      expect(arr[5]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5100
     * @tc.name testBigInt64ArrayFive5100
     * @tc.desc Verify set with offset 55 writes into the expected target index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr.set([5n], 55);
      expect(arr[55]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5200
     * @tc.name testBigInt64ArrayFive5200
     * @tc.desc Verify set with offset 105 writes into the expected target index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(200);
      arr.set([5n], 105);
      expect(arr[105]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5300
     * @tc.name testBigInt64ArrayFive5300
     * @tc.desc Verify indexOf with fromIndex 5 returns the expected match index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[10] = 5n;
      expect(arr.indexOf(5n, 5)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5400
     * @tc.name testBigInt64ArrayFive5400
     * @tc.desc Verify indexOf with fromIndex 55 returns the expected match index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[60] = 5n;
      expect(arr.indexOf(5n, 55)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5500
     * @tc.name testBigInt64ArrayFive5500
     * @tc.desc Verify indexOf with fromIndex -5 returns the expected match index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[18] = 5n;
      expect(arr.indexOf(5n, -5)).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5600
     * @tc.name testBigInt64ArrayFive5600
     * @tc.desc Verify indexOf with fromIndex -55 returns the expected match index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      arr[60] = 5n;
      expect(arr.indexOf(5n, -55)).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5700
     * @tc.name testBigInt64ArrayFive5700
     * @tc.desc Verify includes with fromIndex 5 returns the expected containment result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[10] = 5n;
      expect(arr.includes(5n, 5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5800
     * @tc.name testBigInt64ArrayFive5800
     * @tc.desc Verify includes with fromIndex -5 returns the expected containment result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[18] = 5n;
      expect(arr.includes(5n, -5)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_5900
     * @tc.name testBigInt64ArrayFive5900
     * @tc.desc Verify lastIndexOf with fromIndex 5 returns the expected backward match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[4] = 5n;
      expect(arr.lastIndexOf(5n, 5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6000
     * @tc.name testBigInt64ArrayFive6000
     * @tc.desc Verify lastIndexOf with fromIndex -5 returns the expected backward match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(20);
      arr[10] = 5n;
      expect(arr.lastIndexOf(5n, -5)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6100
     * @tc.name testBigInt64ArrayFive6100
     * @tc.desc Verify fill stores the value 5n exactly in the target array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(5n);
      expect(arr[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6200
     * @tc.name testBigInt64ArrayFive6200
     * @tc.desc Verify fill stores the value -5n exactly in the target array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(-5n);
      expect(arr[0]).assertEqual(-5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6300
     * @tc.name testBigInt64ArrayFive6300
     * @tc.desc Verify fill stores the value 105n exactly in the target array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(105n);
      expect(arr[0]).assertEqual(105n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6400
     * @tc.name testBigInt64ArrayFive6400
     * @tc.desc Verify fill stores the value -105n exactly in the target array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(-105n);
      expect(arr[0]).assertEqual(-105n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6500
     * @tc.name testBigInt64ArrayFive6500
     * @tc.desc Verify fill stores the near-maximum Int64 bigint value without truncation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(BIGINT64_NEAR_MAX_FIVE);
      expect(arr[0]).assertEqual(BIGINT64_NEAR_MAX_FIVE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6600
     * @tc.name testBigInt64ArrayFive6600
     * @tc.desc Verify fill stores the near-minimum Int64 bigint value without truncation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(BIGINT64_NEAR_MIN_FIVE);
      expect(arr[0]).assertEqual(BIGINT64_NEAR_MIN_FIVE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6700
     * @tc.name testBigInt64ArrayFive6700
     * @tc.desc Verify indexOf finds searchElement 5n at the expected index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      expect(arr.indexOf(5n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6800
     * @tc.name testBigInt64ArrayFive6800
     * @tc.desc Verify indexOf finds searchElement -5n at the expected index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, 10n]);
      expect(arr.indexOf(-5n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_6900
     * @tc.name testBigInt64ArrayFive6900
     * @tc.desc Verify indexOf finds searchElement 15n at the expected index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive6900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n]);
      expect(arr.indexOf(15n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7000
     * @tc.name testBigInt64ArrayFive7000
     * @tc.desc Verify indexOf finds searchElement -15n at the expected index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, -15n]);
      expect(arr.indexOf(-15n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7100
     * @tc.name testBigInt64ArrayFive7100
     * @tc.desc Verify includes reports the presence of searchElement 5n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      expect(arr.includes(5n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7200
     * @tc.name testBigInt64ArrayFive7200
     * @tc.desc Verify includes reports the presence of searchElement -5n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, 10n]);
      expect(arr.includes(-5n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7300
     * @tc.name testBigInt64ArrayFive7300
     * @tc.desc Verify includes reports the presence of searchElement 15n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n]);
      expect(arr.includes(15n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7400
     * @tc.name testBigInt64ArrayFive7400
     * @tc.desc Verify includes reports the presence of searchElement -15n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, -15n]);
      expect(arr.includes(-15n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7500
     * @tc.name testBigInt64ArrayFive7500
     * @tc.desc Verify lastIndexOf finds the final occurrence of searchElement 5n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 10n]);
      expect(arr.lastIndexOf(5n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7600
     * @tc.name testBigInt64ArrayFive7600
     * @tc.desc Verify lastIndexOf finds the final occurrence of searchElement -5n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, -5n, 10n]);
      expect(arr.lastIndexOf(-5n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7700
     * @tc.name testBigInt64ArrayFive7700
     * @tc.desc Verify lastIndexOf finds the final occurrence of searchElement 15n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([15n, 15n, 10n]);
      expect(arr.lastIndexOf(15n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7800
     * @tc.name testBigInt64ArrayFive7800
     * @tc.desc Verify lastIndexOf finds the final occurrence of searchElement -15n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-15n, -15n, 10n]);
      expect(arr.lastIndexOf(-15n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_7900
     * @tc.name testBigInt64ArrayFive7900
     * @tc.desc Verify constructing with max plus 5n wraps to the expected negative Int64 value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive7900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_WRAP_MAX_PLUS_FIVE]);
      expect(arr[0]).assertEqual(-9223372036854775804n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_8000
     * @tc.name testBigInt64ArrayFive8000
     * @tc.desc Verify constructing with max plus 55n wraps to the expected negative Int64 value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive8000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_WRAP_MAX_PLUS_FIFTY_FIVE]);
      expect(arr[0]).assertEqual(-9223372036854775754n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_8100
     * @tc.name testBigInt64ArrayFive8100
     * @tc.desc Verify constructing with min minus 5n wraps to the expected positive Int64 value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive8100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_WRAP_MIN_MINUS_FIVE]);
      expect(arr[0]).assertEqual(9223372036854775803n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_8200
     * @tc.name testBigInt64ArrayFive8200
     * @tc.desc Verify subarray shares the same underlying ArrayBuffer and synchronized data with
     *          the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive8200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      let sub = arr.subarray(5);
      sub[0] = 5n;
      expect(arr[5]).assertEqual(5n);
      expect(sub.buffer === arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FIVE_8300
     * @tc.name testBigInt64ArrayFive8300
     * @tc.desc Verify constructor views created with different offsets remain synchronized through
     *          the shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFive8300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let arr1 = new BigInt64Array(buf, 0, 5);
      let arr2 = new BigInt64Array(buf, 40);
      arr1[5] = 5n; // Out-of-bounds write should have no effect.
      arr2[0] = 55n;
      expect(arr2[0]).assertEqual(55n);
      let verify = new BigInt64Array(buf, 40, 1);
      expect(verify[0]).assertEqual(55n);
    });

  });
}
