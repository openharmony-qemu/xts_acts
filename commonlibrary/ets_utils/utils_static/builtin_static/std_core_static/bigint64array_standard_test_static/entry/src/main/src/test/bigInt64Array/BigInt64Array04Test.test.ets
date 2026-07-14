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

const BIGINT64_MAX = 9223372036854775807n;
const BIGINT64_MIN = -9223372036854775808n;
const BIGINT64_OVERFLOW_POS = 9223372036854775808n;
const BIGINT64_OVERFLOW_NEG = -9223372036854775809n;

export default function BigInt64Array04Test(): void {
  describe('BigInt64Array04Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0010
     * @tc.name testBigInt64ArrayFour0010
     * @tc.desc Verify fill updates every element and at reads the first written value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.fill(9n);
      expect(arr.at(0)).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0020
     * @tc.name testBigInt64ArrayFour0020
     * @tc.desc Verify fill with start and end writes the selected range and at reads
     * it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.fill(9n, 1, 3);
      expect(arr.at(1)).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0030
     * @tc.name testBigInt64ArrayFour0030
     * @tc.desc Verify copyWithin with three arguments copies the tail value to index
     * zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0040
     * @tc.name testBigInt64ArrayFour0040
     * @tc.desc Verify sort without compareFn orders the values in ascending order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      arr.sort();
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0050
     * @tc.name testBigInt64ArrayFour0050
     * @tc.desc Verify sort with compareFn keeps the largest value at the last index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      arr.sort((a, b) => { if (a > b) return 1; if (a < b) return -1; return 0; });
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0060
     * @tc.name testBigInt64ArrayFour0060
     * @tc.desc Verify direct write wraps positive overflow to the BigInt64 minimum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = BIGINT64_OVERFLOW_POS;
      expect(arr[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0070
     * @tc.name testBigInt64ArrayFour0070
     * @tc.desc Verify direct write wraps negative overflow to the BigInt64 maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = BIGINT64_OVERFLOW_NEG;
      expect(arr[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0080
     * @tc.name testBigInt64ArrayFour0080
     * @tc.desc Verify fill wraps positive overflow before reading the stored value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      arr.fill(BIGINT64_OVERFLOW_POS);
      expect(arr[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0090
     * @tc.name testBigInt64ArrayFour0090
     * @tc.desc Verify fill wraps negative overflow before reading the stored value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      arr.fill(BIGINT64_OVERFLOW_NEG);
      expect(arr[1]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0100
     * @tc.name testBigInt64ArrayFour0100
     * @tc.desc Verify $_set wraps positive overflow and $_get reads the truncated
     * value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr.$_set(0, BIGINT64_OVERFLOW_POS);
      expect(arr.$_get(0)).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0110
     * @tc.name testBigInt64ArrayFour0110
     * @tc.desc Verify $_set wraps negative overflow and $_get reads the truncated
     * value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr.$_set(0, BIGINT64_OVERFLOW_NEG);
      expect(arr.$_get(0)).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0120
     * @tc.name testBigInt64ArrayFour0120
     * @tc.desc Verify copyWithin preserves wrapped overflow values after copying.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      arr[0] = BIGINT64_OVERFLOW_POS;
      arr.copyWithin(1, 0, 1);
      expect(arr[1]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0130
     * @tc.name testBigInt64ArrayFour0130
     * @tc.desc Verify set stores wrapped overflow values in the target array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      let src = new BigInt64Array([BIGINT64_OVERFLOW_POS, BIGINT64_OVERFLOW_NEG]);
      arr.set(src);
      expect(arr[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0140
     * @tc.name testBigInt64ArrayFour0140
     * @tc.desc Verify set with negative overflow writes the wrapped maximum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      let src = new BigInt64Array([BIGINT64_OVERFLOW_NEG]);
      arr.set(src, 0);
      expect(arr[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0150
     * @tc.name testBigInt64ArrayFour0150
     * @tc.desc Verify includes finds the wrapped minimum after a positive overflow
     * write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = BIGINT64_OVERFLOW_POS;
      expect(arr.includes(BIGINT64_MIN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0160
     * @tc.name testBigInt64ArrayFour0160
     * @tc.desc Verify indexOf finds the wrapped maximum after a negative overflow
     * write.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = BIGINT64_OVERFLOW_NEG;
      expect(arr.indexOf(BIGINT64_MAX)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0170
     * @tc.name testBigInt64ArrayFour0170
     * @tc.desc Verify map reads the wrapped value produced by overflow input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_OVERFLOW_POS]);
      let mapped = arr.map((v) => v);
      expect(mapped[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0180
     * @tc.name testBigInt64ArrayFour0180
     * @tc.desc Verify filter retains the wrapped negative value produced by overflow
     * input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_OVERFLOW_POS]);
      let filtered = arr.filter((v) => v < 0n);
      expect(filtered.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0190
     * @tc.name testBigInt64ArrayFour0190
     * @tc.desc Verify with writes a positive overflow value as the wrapped minimum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let newArr = arr.with(0, BIGINT64_OVERFLOW_POS);
      expect(newArr[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0200
     * @tc.name testBigInt64ArrayFour0200
     * @tc.desc Verify with writes a negative overflow value as the wrapped maximum.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let newArr = arr.with(1, BIGINT64_OVERFLOW_NEG);
      expect(newArr[1]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0210
     * @tc.name testBigInt64ArrayFour0210
     * @tc.desc Verify a child view reads parent writes from the same backing buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let parent = new BigInt64Array(buf);
      let child = new BigInt64Array(buf, 8);
      parent[1] = 42n;
      expect(child[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0220
     * @tc.name testBigInt64ArrayFour0220
     * @tc.desc Verify a parent view reads child writes from the same backing buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let parent = new BigInt64Array(buf);
      let child = new BigInt64Array(buf, 8);
      child[0] = 99n;
      expect(parent[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0230
     * @tc.name testBigInt64ArrayFour0230
     * @tc.desc Verify three sibling views expose values written into one shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let v1 = new BigInt64Array(buf, 0, 1);
      let v2 = new BigInt64Array(buf, 8, 1);
      let v3 = new BigInt64Array(buf, 16, 1);
      v1[0] = 10n;
      v2[0] = 20n;
      v3[0] = 30n;
      let all = new BigInt64Array(buf);
      expect(all[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0240
     * @tc.name testBigInt64ArrayFour0240
     * @tc.desc Verify writing one view does not affect a disjoint sibling range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let v2 = new BigInt64Array(buf, 8, 1);
      let v3 = new BigInt64Array(buf, 16, 1);
      v2[0] = 77n;
      expect(v3[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0250
     * @tc.name testBigInt64ArrayFour0250
     * @tc.desc Verify the full view reads writes performed through the tail view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let v3 = new BigInt64Array(buf, 16, 1);
      let all = new BigInt64Array(buf);
      v3[0] = 55n;
      expect(all[2]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0260
     * @tc.name testBigInt64ArrayFour0260
     * @tc.desc Verify subarray writes update the parent typed array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      sub[0] = 99n;
      expect(arr[1]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0270
     * @tc.name testBigInt64ArrayFour0270
     * @tc.desc Verify parent writes are visible through the subarray view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(2, 4);
      arr[2] = 88n;
      expect(sub[0]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0280
     * @tc.name testBigInt64ArrayFour0280
     * @tc.desc Verify overlapping views at the same offset observe identical writes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let va = new BigInt64Array(buf, 0, 1);
      let vb = new BigInt64Array(buf, 0, 1);
      va[0] = 111n;
      expect(vb[0]).assertEqual(111n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0290
     * @tc.name testBigInt64ArrayFour0290
     * @tc.desc Verify a zero-offset view reads the written maximum value correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf, 0);
      arr[0] = BIGINT64_MAX;
      expect(arr[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0300
     * @tc.name testBigInt64ArrayFour0300
     * @tc.desc Verify a nonzero-offset view reads the written minimum value correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 8);
      arr[0] = BIGINT64_MIN;
      expect(arr[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0310
     * @tc.name testBigInt64ArrayFour0310
     * @tc.desc Verify filling the parent view updates the child view contents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let parent = new BigInt64Array(buf);
      let sub = new BigInt64Array(buf, 8, 2);
      parent.fill(7n, 1, 3);
      expect(sub[0]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0320
     * @tc.name testBigInt64ArrayFour0320
     * @tc.desc Verify sorting a child view reorders the parent view contents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let parent = new BigInt64Array(buf);
      parent[0] = 3n;
      parent[1] = 1n;
      parent[2] = 2n;
      let sub = new BigInt64Array(buf, 0, 3);
      sub.sort();
      expect(parent[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0330
     * @tc.name testBigInt64ArrayFour0330
     * @tc.desc Verify copyWithin on a child view updates the parent buffer contents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let parent = new BigInt64Array(buf);
      parent[0] = 10n;
      parent[1] = 20n;
      parent[2] = 30n;
      parent[3] = 40n;
      let sub = new BigInt64Array(buf, 0, 4);
      sub.copyWithin(2, 0, 2);
      expect(parent[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0340
     * @tc.name testBigInt64ArrayFour0340
     * @tc.desc Verify descending sort changes the first element from its original
     * value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 2n, 8n, 1n]);
      let beforeZero = arr[0];
      arr.sort((a, b) => { if (a < b) return 1; if (a > b) return -1; return 0; });
      expect(beforeZero).assertEqual(5n);
      expect(arr[0]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0350
     * @tc.name testBigInt64ArrayFour0350
     * @tc.desc Verify fill keeps the typed array length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let lenBefore = arr.length;
      arr.fill(0n);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0360
     * @tc.name testBigInt64ArrayFour0360
     * @tc.desc Verify sort keeps the typed array length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let lenBefore = arr.length;
      arr.sort();
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0370
     * @tc.name testBigInt64ArrayFour0370
     * @tc.desc Verify copyWithin keeps the typed array length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let lenBefore = arr.length;
      arr.copyWithin(0, 2);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0380
     * @tc.name testBigInt64ArrayFour0380
     * @tc.desc Verify set keeps the target typed array length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let lenBefore = arr.length;
      let src = new BigInt64Array([9n, 8n]);
      arr.set(src, 1);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0390
     * @tc.name testBigInt64ArrayFour0390
     * @tc.desc Verify set updates the targeted destination position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let src = new BigInt64Array([9n, 8n]);
      arr.set(src, 1);
      expect(arr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0400
     * @tc.name testBigInt64ArrayFour0400
     * @tc.desc Verify set leaves untouched positions unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let src = new BigInt64Array([9n, 8n]);
      arr.set(src, 1);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0410
     * @tc.name testBigInt64ArrayFour0410
     * @tc.desc Verify reverse moves the original first element to the last position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let first = arr[0];
      arr.reverse();
      expect(arr[2]).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0420
     * @tc.name testBigInt64ArrayFour0420
     * @tc.desc Verify reverse keeps the typed array length unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let lenBefore = arr.length;
      arr.reverse();
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0430
     * @tc.name testBigInt64ArrayFour0430
     * @tc.desc Verify reverse keeps the middle element in the mirrored center position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.reverse();
      expect(arr[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0440
     * @tc.name testBigInt64ArrayFour0440
     * @tc.desc Verify fill keeps byteLength unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let byteLenBefore = arr.byteLength;
      arr.fill(100n);
      expect(arr.byteLength).assertEqual(byteLenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0450
     * @tc.name testBigInt64ArrayFour0450
     * @tc.desc Verify writing the maximum value preserves it on readback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = BIGINT64_MAX;
      let val = arr[0];
      expect(val).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0460
     * @tc.name testBigInt64ArrayFour0460
     * @tc.desc Verify writing the minimum value preserves it on readback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = BIGINT64_MIN;
      let val = arr[0];
      expect(val).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0470
     * @tc.name testBigInt64ArrayFour0470
     * @tc.desc Verify sort keeps the original byteOffset unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf, 0, 3);
      arr[0] = 3n;
      arr[1] = 1n;
      arr[2] = 2n;
      let offsetBefore = arr.byteOffset;
      arr.sort();
      expect(arr.byteOffset).assertEqual(offsetBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0480
     * @tc.name testBigInt64ArrayFour0480
     * @tc.desc Verify nested map calls transform the first element as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v * 2n).map((v) => v + 1n);
      expect(result[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0490
     * @tc.name testBigInt64ArrayFour0490
     * @tc.desc Verify nested map calls transform the last element as expected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v * 2n).map((v) => v + 1n);
      expect(result[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0500
     * @tc.name testBigInt64ArrayFour0500
     * @tc.desc Verify nested filter calls keep the expected number of elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.filter((v) => v > 2n).filter((v) => v < 5n);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0510
     * @tc.name testBigInt64ArrayFour0510
     * @tc.desc Verify nested filter calls preserve the expected first remaining value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.filter((v) => v > 2n).filter((v) => v < 5n);
      expect(result[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0520
     * @tc.name testBigInt64ArrayFour0520
     * @tc.desc Verify chained sort calls can reorder ascending results into descending
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let result = arr.sort().sort((a, b) => { if (a < b) return 1; if (a > b) return -1; return 0; });
      expect(result[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0530
     * @tc.name testBigInt64ArrayFour0530
     * @tc.desc Verify nested subarray calls reach the expected first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1).subarray(1);
      expect(sub[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0540
     * @tc.name testBigInt64ArrayFour0540
     * @tc.desc Verify nested subarray calls return the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(1, 4).subarray(0, 2);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0550
     * @tc.name testBigInt64ArrayFour0550
     * @tc.desc Verify nested slice calls reach the expected first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sliced = arr.slice(1).slice(1);
      expect(sliced[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0560
     * @tc.name testBigInt64ArrayFour0560
     * @tc.desc Verify nested slice calls return the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sliced = arr.slice(1, 4).slice(0, 2);
      expect(sliced.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0570
     * @tc.name testBigInt64ArrayFour0570
     * @tc.desc Verify of, filter, and map chaining produces the expected first value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n, 4n, 5n);
      let result = arr.filter((v) => v % 2n === 0n).map((v) => v * 10n);
      expect(result[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0580
     * @tc.name testBigInt64ArrayFour0580
     * @tc.desc Verify of, filter, and map chaining produces the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(1n, 2n, 3n, 4n, 5n);
      let result = arr.filter((v) => v % 2n === 0n).map((v) => v * 10n);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0590
     * @tc.name testBigInt64ArrayFour0590
     * @tc.desc Verify of, sort, and reverse chaining positions the largest value first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(3n, 1n, 2n);
      let result = arr.sort().reverse();
      expect(result[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0600
     * @tc.name testBigInt64ArrayFour0600
     * @tc.desc Verify of, sort, and reverse chaining positions the smallest value last.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(3n, 1n, 2n);
      let result = arr.sort().reverse();
      expect(result[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0610
     * @tc.name testBigInt64ArrayFour0610
     * @tc.desc Verify of, map, filter, sort, and join chaining returns the expected
     * string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(5n, 3n, 1n, 4n, 2n);
      let result = arr.filter((v) => v > 2n).sort().join(',');
      expect(result).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0620
     * @tc.name testBigInt64ArrayFour0620
     * @tc.desc Verify fill followed by sort yields the expected first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0620', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      arr.fill(0n, 1, 2);
      arr.sort();
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0630
     * @tc.name testBigInt64ArrayFour0630
     * @tc.desc Verify fill followed by copyWithin copies the filled value to the target
     * slot.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0630', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr.fill(5n, 0, 2);
      arr.copyWithin(2, 0, 2);
      expect(arr[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0640
     * @tc.name testBigInt64ArrayFour0640
     * @tc.desc Verify forEach can accumulate values into external state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0640', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0n;
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.forEach((v) => { sum += v; });
      expect(sum).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0650
     * @tc.name testBigInt64ArrayFour0650
     * @tc.desc Verify forEach can update an external counter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0650', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.forEach((_v) => { count++; });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0660
     * @tc.name testBigInt64ArrayFour0660
     * @tc.desc Verify map can read an external factor during transformation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0660', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factor = 3n;
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v * factor);
      expect(result[1]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0670
     * @tc.name testBigInt64ArrayFour0670
     * @tc.desc Verify filter can read an external threshold during filtering.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0670', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threshold = 3n;
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let result = arr.filter((v) => v > threshold);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0680
     * @tc.name testBigInt64ArrayFour0680
     * @tc.desc Verify reduce can use an externally prepared accumulator baseline.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0680', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let external = 0n;
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.forEach((v) => { external += v; });
      let result = arr.reduce((acc, v) => acc + v, external);
      expect(result).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0690
     * @tc.name testBigInt64ArrayFour0690
     * @tc.desc Verify some can record the first matching element in external state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0690', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let found = 0n;
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.some((v) => { if (v > 1n) { found = v; return true; } return false; });
      expect(found).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0700
     * @tc.name testBigInt64ArrayFour0700
     * @tc.desc Verify find can update an external call counter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls = 0;
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.find((v) => { calls++; return v === 2n; });
      expect(calls).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0710
     * @tc.name testBigInt64ArrayFour0710
     * @tc.desc Verify every can record all visited elements in external storage.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0710', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checked: Array<BigInt> = [];
      let arr = new BigInt64Array([2n, 4n, 6n]);
      arr.every((v) => { checked.push(v); return v % 2n === 0n; });
      expect(checked.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0720
     * @tc.name testBigInt64ArrayFour0720
     * @tc.desc Verify sort can update an external comparison counter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0720', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cmpCount = 0;
      let arr = new BigInt64Array([3n, 1n, 2n]);
      arr.sort((a, b) => { cmpCount++; if (a > b) return 1; if (a < b) return -1; return 0; });
      expect(cmpCount > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0730
     * @tc.name testBigInt64ArrayFour0730
     * @tc.desc Verify forEach can populate an external array from callback writes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0730', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let external: Array<BigInt> = [];
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.forEach((v) => { external.push(v * 2n); });
      expect(external[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0740
     * @tc.name testBigInt64ArrayFour0740
     * @tc.desc Verify findIndex can compare elements against an external target value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0740', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = BIGINT64_MAX;
      let arr = new BigInt64Array([1n, BIGINT64_MAX, 3n]);
      let idx = arr.findIndex((v) => v === target);
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0750
     * @tc.name testBigInt64ArrayFour0750
     * @tc.desc Verify findLast can read an external target while searching from the
     * end.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0750', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target = BIGINT64_MIN;
      let arr = new BigInt64Array([BIGINT64_MIN, 1n, BIGINT64_MIN]);
      let val = arr.findLast((v) => v === target);
      expect(val).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0760
     * @tc.name testBigInt64ArrayFour0760
     * @tc.desc Verify map can write visited indexes into an external array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0760', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let indices: Array<number> = [];
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.map((_v, i) => { indices.push(i); return _v; });
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0770
     * @tc.name testBigInt64ArrayFour0770
     * @tc.desc Verify reduceRight can update external state while iterating from right
     * to left.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0770', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtlSum = 0n;
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.reduceRight((acc, v) => { rtlSum += v; return acc + v; }, 0n);
      expect(rtlSum).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0780
     * @tc.name testBigInt64ArrayFour0780
     * @tc.desc Verify filter can update an external odd-value counter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0780', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let oddCount = 0;
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.filter((v) => { if (v % 2n !== 0n) { oddCount++; return true; } return false; });
      expect(oddCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0790
     * @tc.name testBigInt64ArrayFour0790
     * @tc.desc Verify $_get reads zero after $_set writes zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0790', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr.$_set(1, 0n);
      expect(arr.$_get(1)).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0800
     * @tc.name testBigInt64ArrayFour0800
     * @tc.desc Verify bracket access reads negative one after direct assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[2] = -1n;
      expect(arr[2]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0810
     * @tc.name testBigInt64ArrayFour0810
     * @tc.desc Verify at with a negative index reads the written maximum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0810', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, BIGINT64_MAX]);
      expect(arr.at(-1)).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0820
     * @tc.name testBigInt64ArrayFour0820
     * @tc.desc Verify at with a negative index reads the written minimum value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0820', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, BIGINT64_MIN, 3n]);
      expect(arr.at(-2)).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0830
     * @tc.name testBigInt64ArrayFour0830
     * @tc.desc Verify the last write to the same index takes effect.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0830', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(1);
      arr[0] = 1n;
      arr[0] = 2n;
      arr[0] = BIGINT64_MAX;
      expect(arr[0]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0840
     * @tc.name testBigInt64ArrayFour0840
     * @tc.desc Verify slice reads the filled value from the selected range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0840', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr.fill(-1n, 1, 3);
      let sliced = arr.slice(1, 3);
      expect(sliced[0]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0850
     * @tc.name testBigInt64ArrayFour0850
     * @tc.desc Verify indexOf finds the copied value after copyWithin.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0850', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.copyWithin(0, 2);
      expect(arr.indexOf(3n)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0860
     * @tc.name testBigInt64ArrayFour0860
     * @tc.desc Verify includes reports the filled maximum value as present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0860', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr.fill(BIGINT64_MAX);
      expect(arr.includes(BIGINT64_MAX)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0870
     * @tc.name testBigInt64ArrayFour0870
     * @tc.desc Verify entries iteration exposes the written first pair value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0870', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let entries = arr.entries();
      let first = entries.next();
      let firstValue = first.value!;
      expect(firstValue[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0880
     * @tc.name testBigInt64ArrayFour0880
     * @tc.desc Verify values iteration exposes the expected second value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0880', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n, 7n]);
      let vals = arr.values();
      vals.next();
      let second = vals.next();
      expect(second.value).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0890
     * @tc.name testBigInt64ArrayFour0890
     * @tc.desc Verify keys iteration exposes the expected second index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0890', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let src = new BigInt64Array([100n, 200n, 300n]);
      arr.set(src);
      let keys = arr.keys();
      keys.next();
      let second = keys.next();
      expect(second.value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0900
     * @tc.name testBigInt64ArrayFour0900
     * @tc.desc Verify join returns the expected comma-separated string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      expect(arr.join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0910
     * @tc.name testBigInt64ArrayFour0910
     * @tc.desc Verify toString returns the expected comma-separated string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0910', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(2);
      arr[0] = -1n;
      arr[1] = 1n;
      expect(arr.toString()).assertEqual('-1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0920
     * @tc.name testBigInt64ArrayFour0920
     * @tc.desc Verify reduce accumulates all written values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0920', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = 10n;
      arr[1] = 20n;
      arr[2] = 30n;
      let sum = arr.reduce((acc, v) => acc + v, 0n);
      expect(sum).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0930
     * @tc.name testBigInt64ArrayFour0930
     * @tc.desc Verify forEach can read the current element values during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0930', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let last = 0n;
      arr.forEach((v) => { last = v; });
      expect(last).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0940
     * @tc.name testBigInt64ArrayFour0940
     * @tc.desc Verify forEach can read neighbor values through the callback array
     * parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0940', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sumNeighbors = 0n;
      arr.forEach((v, i, a) => { if (i > 0) sumNeighbors += a[i - 1]; });
      expect(sumNeighbors).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0950
     * @tc.name testBigInt64ArrayFour0950
     * @tc.desc Verify map can read the source array by index during transformation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0950', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.map((_v, i, a) => a[a.length - 1 - i]);
      expect(result[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0960
     * @tc.name testBigInt64ArrayFour0960
     * @tc.desc Verify reduce can read the source array by index during accumulation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0960', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.reduce((acc, _v, i, a) => acc + a[i], 0n);
      expect(result).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0970
     * @tc.name testBigInt64ArrayFour0970
     * @tc.desc Verify some can inspect callback indexes while evaluating.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0970', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let hasEvenIndex = arr.some((_v, i) => i % 2 === 0);
      expect(hasEvenIndex).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0980
     * @tc.name testBigInt64ArrayFour0980
     * @tc.desc Verify every can inspect the callback array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0980', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let allShorterThanLen = arr.every((_v, _i, a) => a.length === 3);
      expect(allShorterThanLen).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_0990
     * @tc.name testBigInt64ArrayFour0990
     * @tc.desc Verify find can inspect the full array inside the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour0990', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 8n, 1n]);
      let result = arr.find((_v, i, a) => i > 0 && a[i] < a[i - 1]);
      expect(result).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1000
     * @tc.name testBigInt64ArrayFour1000
     * @tc.desc Verify filter can keep values from even indexes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let result = arr.filter((_v, i) => i % 2 === 0);
      expect(result[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1010
     * @tc.name testBigInt64ArrayFour1010
     * @tc.desc Verify filter by index returns the expected element count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let result = arr.filter((_v, i) => i % 2 === 0);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1020
     * @tc.name testBigInt64ArrayFour1020
     * @tc.desc Verify forEach can record visited indexes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idxList: Array<number> = [];
      arr.forEach((_v, i) => { idxList.push(i); });
      expect(idxList[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1030
     * @tc.name testBigInt64ArrayFour1030
     * @tc.desc Verify map returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.map((v) => v);
      expect(result instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1040
     * @tc.name testBigInt64ArrayFour1040
     * @tc.desc Verify filter returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.filter((v) => v > 0n);
      expect(result instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1050
     * @tc.name testBigInt64ArrayFour1050
     * @tc.desc Verify slice returns a BigInt64Array instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.slice(0, 2);
      expect(result instanceof BigInt64Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1060
     * @tc.name testBigInt64ArrayFour1060
     * @tc.desc Verify with returns a new array without mutating the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let newArr = arr.with(0, 99n);
      expect(arr[0]).assertEqual(1n);
      expect(newArr[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1070
     * @tc.name testBigInt64ArrayFour1070
     * @tc.desc Verify with writes the new value into the returned array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let newArr = arr.with(0, 99n);
      expect(newArr[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1080
     * @tc.name testBigInt64ArrayFour1080
     * @tc.desc Verify sort returns the receiver for chaining.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let sorted = arr.sort();
      expect(sorted === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1090
     * @tc.name testBigInt64ArrayFour1090
     * @tc.desc Verify fill returns the receiver for chaining.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let filled = arr.fill(0n);
      expect(filled === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1100
     * @tc.name testBigInt64ArrayFour1100
     * @tc.desc Verify reverse returns the receiver for chaining.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let reversed = arr.reverse();
      expect(reversed === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1110
     * @tc.name testBigInt64ArrayFour1110
     * @tc.desc Verify copyWithin returns the receiver for chaining.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let result = arr.copyWithin(0, 2);
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1120
     * @tc.name testBigInt64ArrayFour1120
     * @tc.desc Verify subarray returns a recognized array-buffer view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 2);
      expect(ArrayBuffer.isView(sub)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1130
     * @tc.name testBigInt64ArrayFour1130
     * @tc.desc Verify subarray shares the same backing buffer as the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1);
      expect(sub.buffer === arr.buffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1140
     * @tc.name testBigInt64ArrayFour1140
     * @tc.desc Verify slice creates an independent copy that does not affect the
     * source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let copy = arr.slice();
      copy[0] = 99n;
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1150
     * @tc.name testBigInt64ArrayFour1150
     * @tc.desc Verify slice creates a copy with a different backing buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let copy = arr.slice();
      expect(copy.buffer === arr.buffer).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1160
     * @tc.name testBigInt64ArrayFour1160
     * @tc.desc Verify map returns a result with the same length as the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let result = arr.map((v) => v * 2n);
      expect(result.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1170
     * @tc.name testBigInt64ArrayFour1170
     * @tc.desc Verify reduce returns a bigint result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sum = arr.reduce((acc, v) => acc + v, 0n);
      expect(typeof sum).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1180
     * @tc.name testBigInt64ArrayFour1180
     * @tc.desc Verify join returns a string result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.join(',');
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1190
     * @tc.name testBigInt64ArrayFour1190
     * @tc.desc Verify toString returns a string result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let result = arr.toString();
      expect(typeof result).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1200
     * @tc.name testBigInt64ArrayFour1200
     * @tc.desc Verify indexOf returns an int result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let idx = arr.indexOf(2n);
      expect(typeof idx).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1210
     * @tc.name testBigInt64ArrayFour1210
     * @tc.desc Verify find returns a bigint result when a match is found.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let val = arr.find((v) => v > 1n);
      expect(typeof val).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1220
     * @tc.name testBigInt64ArrayFour1220
     * @tc.desc Verify some returns a boolean result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.some((v) => v > 2n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1230
     * @tc.name testBigInt64ArrayFour1230
     * @tc.desc Verify every returns a boolean result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      let result = arr.every((v) => v % 2n === 0n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1240
     * @tc.name testBigInt64ArrayFour1240
     * @tc.desc Verify includes returns a boolean result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.includes(2n);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1250
     * @tc.name testBigInt64ArrayFour1250
     * @tc.desc Verify with throws RangeError for an index equal to the array length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.with(3, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1260
     * @tc.name testBigInt64ArrayFour1260
     * @tc.desc Verify with throws RangeError for a negative index beyond the array
     * length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.with(-4, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1270
     * @tc.name testBigInt64ArrayFour1270
     * @tc.desc Verify set throws RangeError when the target range exceeds the array
     * length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        let src = new BigInt64Array([9n, 8n, 7n]);
        arr.set(src, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1280
     * @tc.name testBigInt64ArrayFour1280
     * @tc.desc Verify the constructor throws RangeError for a misaligned byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      try {
        new BigInt64Array(buf, 4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1290
     * @tc.name testBigInt64ArrayFour1290
     * @tc.desc Verify the constructor throws RangeError for a byteOffset beyond the
     * buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      try {
        new BigInt64Array(buf, 16);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1300
     * @tc.name testBigInt64ArrayFour1300
     * @tc.desc Verify the constructor throws RangeError for a negative length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new BigInt64Array(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1310
     * @tc.name testBigInt64ArrayFour1310
     * @tc.desc Verify the constructor throws RangeError for an infinite length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new BigInt64Array(Infinity);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1320
     * @tc.name testBigInt64ArrayFour1320
     * @tc.desc Verify reduce throws TypeError for an empty array without an initial
     * value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      try {
        arr.reduce((acc, v) => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1330
     * @tc.name testBigInt64ArrayFour1330
     * @tc.desc Verify reduceRight throws TypeError for an empty array without an
     * initial value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      try {
        arr.reduceRight((acc, v) => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1340
     * @tc.name testBigInt64ArrayFour1340
     * @tc.desc Verify sort propagates an error thrown by the compare callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      try {
        arr.sort((_a, _b) => { throw new Error('sort error'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('sort error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1350
     * @tc.name testBigInt64ArrayFour1350
     * @tc.desc Verify map propagates an error thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.map((_v) => { throw new Error('map error'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('map error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1360
     * @tc.name testBigInt64ArrayFour1360
     * @tc.desc Verify filter propagates an error thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.filter((_v) => { throw new Error('filter error'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('filter error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1370
     * @tc.name testBigInt64ArrayFour1370
     * @tc.desc Verify reduce propagates an error thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.reduce((_acc: BigInt, _v: BigInt): BigInt => { throw new Error('reduce error'); }, 0n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('reduce error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1380
     * @tc.name testBigInt64ArrayFour1380
     * @tc.desc Verify forEach propagates an error thrown by the callback.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.forEach((_v) => { throw new Error('forEach error'); });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('forEach error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1390
     * @tc.name testBigInt64ArrayFour1390
     * @tc.desc Verify $_get throws RangeError for a positive out-of-bounds index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testBigInt64ArrayFour1390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.$_get(3);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1400
     * @tc.name testBigInt64ArrayFour1400
     * @tc.desc Verify $_get throws RangeError for a negative out-of-bounds index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testBigInt64ArrayFour1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.$_get(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1410
     * @tc.name testBigInt64ArrayFour1410
     * @tc.desc Verify $_set throws RangeError for an out-of-bounds index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      try {
        arr.$_set(100, 99n);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1420
     * @tc.name testBigInt64ArrayFour1420
     * @tc.desc Verify at returns undefined for a positive out-of-bounds index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let val = arr.at(2);
      expect(val).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1430
     * @tc.name testBigInt64ArrayFour1430
     * @tc.desc Verify at returns undefined when a negative index exceeds the array
     * length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let val = arr.at(-3);
      expect(val).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1440
     * @tc.name testBigInt64ArrayFour1440
     * @tc.desc Verify repeated overflow writes keep each wrapped readback value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr[0] = BIGINT64_OVERFLOW_POS;
      arr[1] = BIGINT64_OVERFLOW_NEG;
      arr[2] = BIGINT64_OVERFLOW_POS;
      expect(arr[0]).assertEqual(BIGINT64_MIN);
      expect(arr[1]).assertEqual(BIGINT64_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1450
     * @tc.name testBigInt64ArrayFour1450
     * @tc.desc Verify reduce accumulates wrapped overflow values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_OVERFLOW_POS, BIGINT64_OVERFLOW_NEG]);
      let sum = arr.reduce((acc, v) => acc + v, 0n);
      expect(sum).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1460
     * @tc.name testBigInt64ArrayFour1460
     * @tc.desc Verify sort orders wrapped overflow values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1460', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_OVERFLOW_POS, BIGINT64_OVERFLOW_NEG, 0n]);
      arr.sort();
      expect(arr[0]).assertEqual(BIGINT64_MIN);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1470
     * @tc.name testBigInt64ArrayFour1470
     * @tc.desc Verify join renders the wrapped overflow value as a string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1470', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_OVERFLOW_POS]);
      expect(arr.join(',')).assertEqual('-9223372036854775808');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1480
     * @tc.name testBigInt64ArrayFour1480
     * @tc.desc Verify indexOf finds the wrapped value produced by overflow input.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1480', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_OVERFLOW_POS, 1n]);
      expect(arr.indexOf(BIGINT64_MIN)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1490
     * @tc.name testBigInt64ArrayFour1490
     * @tc.desc Verify reduce observes wrapped overflow values written by fill.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1490', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      arr.fill(BIGINT64_OVERFLOW_POS);
      let sum = arr.reduce((acc, v) => acc + v, 0n);
      expect(sum).assertEqual(BIGINT64_MIN * 3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1500
     * @tc.name testBigInt64ArrayFour1500
     * @tc.desc Verify lastIndexOf finds the wrapped overflow value at the last
     * position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([BIGINT64_OVERFLOW_POS, 1n, BIGINT64_OVERFLOW_POS]);
      expect(arr.lastIndexOf(BIGINT64_MIN)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1510
     * @tc.name testBigInt64ArrayFour1510
     * @tc.desc Verify reversing the parent view updates the child view contents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1510', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let parent = new BigInt64Array(buf);
      parent[0] = 1n;
      parent[1] = 2n;
      parent[2] = 3n;
      let sub = new BigInt64Array(buf, 0, 3);
      parent.reverse();
      expect(sub[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1520
     * @tc.name testBigInt64ArrayFour1520
     * @tc.desc Verify filling a child view updates the parent view contents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1520', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let parent = new BigInt64Array(buf);
      let sub = new BigInt64Array(buf, 0, 1);
      sub.fill(42n);
      expect(parent[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1530
     * @tc.name testBigInt64ArrayFour1530
     * @tc.desc Verify set on a child view updates the parent view contents.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1530', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let parent = new BigInt64Array(buf);
      let sub = new BigInt64Array(buf, 8, 2);
      sub.set(new BigInt64Array([100n, 200n]));
      expect(parent[1]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1540
     * @tc.name testBigInt64ArrayFour1540
     * @tc.desc Verify overlapping views observe each other's writes on the shared
     * buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1540', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let v1 = new BigInt64Array(buf, 0, 1);
      let v2 = new BigInt64Array(buf, 0, 2);
      v1[0] = 99n;
      expect(v2[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1550
     * @tc.name testBigInt64ArrayFour1550
     * @tc.desc Verify a write in one view does not affect a disjoint sibling view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1550', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let v2 = new BigInt64Array(buf, 0, 1);
      let v3 = new BigInt64Array(buf, 8, 1);
      v2[0] = 55n;
      expect(v3[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1560
     * @tc.name testBigInt64ArrayFour1560
     * @tc.desc Verify subarray reports the expected byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1560', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1);
      expect(sub.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1570
     * @tc.name testBigInt64ArrayFour1570
     * @tc.desc Verify subarray reports the expected length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1570', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1580
     * @tc.name testBigInt64ArrayFour1580
     * @tc.desc Verify nested subarray writes update the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1580', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1);
      let sub2 = sub1.subarray(1);
      sub2[0] = 99n;
      expect(arr[2]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1590
     * @tc.name testBigInt64ArrayFour1590
     * @tc.desc Verify mutating a slice copy does not change the source byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1590', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let copy = arr.slice();
      copy.fill(0n);
      expect(arr.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1600
     * @tc.name testBigInt64ArrayFour1600
     * @tc.desc Verify three disjoint views can cross-read values from the shared
     * buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let va = new BigInt64Array(buf, 0, 1);
      let vb = new BigInt64Array(buf, 8, 1);
      let vc = new BigInt64Array(buf, 16, 1);
      va[0] = 1n;
      vb[0] = 2n;
      vc[0] = 3n;
      let all = new BigInt64Array(buf);
      expect(all[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_FOUR_1610
     * @tc.name testBigInt64ArrayFour1610
     * @tc.desc Verify child views read the values written through the full shared view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayFour1610', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let all = new BigInt64Array(buf);
      let vc = new BigInt64Array(buf, 16, 1);
      all.fill(7n);
      expect(vc[0]).assertEqual(7n);
    });
  });
}
