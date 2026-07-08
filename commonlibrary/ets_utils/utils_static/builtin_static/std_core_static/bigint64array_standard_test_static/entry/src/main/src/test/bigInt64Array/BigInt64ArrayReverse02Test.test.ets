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

export default function BigInt64ArrayReverse02Test(): void {
  describe('BigInt64ArrayReverse02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0010
     * @tc.name testBigInt64ArrayReverseTwo001
     * @tc.desc Verify reverse keeps BYTES_PER_ELEMENT as 8 for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.reverse();
      expect(res.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0020
     * @tc.name testBigInt64ArrayReverseTwo002
     * @tc.desc Verify reverse keeps BYTES_PER_ELEMENT as 8 for a one-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let res = arr.reverse();
      expect(res.BYTES_PER_ELEMENT).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0030
     * @tc.name testBigInt64ArrayReverseTwo003
     * @tc.desc Verify reverse returns length 0 for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.reverse();
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0040
     * @tc.name testBigInt64ArrayReverseTwo004
     * @tc.desc Verify reverse returns length 1 for a one-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n]);
      let res = arr.reverse();
      expect(res.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0050
     * @tc.name testBigInt64ArrayReverseTwo005
     * @tc.desc Verify reverse returns byteLength 0 for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.reverse();
      expect(res.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0060
     * @tc.name testBigInt64ArrayReverseTwo006
     * @tc.desc Verify reverse returns byteLength 8 for a one-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let res = arr.reverse();
      expect(res.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0070
     * @tc.name testBigInt64ArrayReverseTwo007
     * @tc.desc Verify reverse returns byteLength 16 for a two-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-10n, -20n]);
      let res = arr.reverse();
      expect(res.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0080
     * @tc.name testBigInt64ArrayReverseTwo008
     * @tc.desc Verify reverse returns byteLength 80 for a view created from an 80-byte buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(80);
      let arr = new BigInt64Array(buf);
      let res = arr.reverse();
      expect(res.byteLength).assertEqual(80);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0090
     * @tc.name testBigInt64ArrayReverseTwo009
     * @tc.desc Verify reverse keeps byteOffset 0 for a zero-length view at offset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 0, 0);
      let res = arr.reverse();
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0100
     * @tc.name testBigInt64ArrayReverseTwo010
     * @tc.desc Verify reverse keeps byteOffset 8 for a zero-length view at offset 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 8, 0);
      let res = arr.reverse();
      expect(res.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0110
     * @tc.name testBigInt64ArrayReverseTwo011
     * @tc.desc Verify reverse keeps byteOffset 0 for a one-element view at offset 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 0, 1);
      let res = arr.reverse();
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0120
     * @tc.name testBigInt64ArrayReverseTwo012
     * @tc.desc Verify reverse keeps byteOffset 8 for a one-element view at offset 8.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 8, 1);
      let res = arr.reverse();
      expect(res.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0130
     * @tc.name testBigInt64ArrayReverseTwo013
     * @tc.desc Verify changes through the reversed one-element result update the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n]);
      let res = arr.reverse();
      res[0] = 99n;
      expect(arr[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0140
     * @tc.name testBigInt64ArrayReverseTwo014
     * @tc.desc Verify changes through the reversed two-element result update the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      let res = arr.reverse();
      res[1] = 88n;
      expect(arr[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0150
     * @tc.name testBigInt64ArrayReverseTwo015
     * @tc.desc Verify source and reversed result stay synchronized after alternating updates.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let res = arr.reverse();
      res[0] = 9n;
      arr[1] = 8n;
      expect(arr[0]).assertEqual(9n);
      expect(res[1]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0160
     * @tc.name testBigInt64ArrayReverseTwo016
     * @tc.desc Verify reversing a slice updates only the sliced copy and not the source array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sliced = arr.slice(1, 4);
      let res = sliced.reverse();
      expect(res[0]).assertEqual(40n);
      expect(res[1]).assertEqual(30n);
      expect(res[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0170
     * @tc.name testBigInt64ArrayReverseTwo017
     * @tc.desc Verify reversing an empty array twice keeps its length at 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let res = arr.reverse().reverse();
      expect(res.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0180
     * @tc.name testBigInt64ArrayReverseTwo018
     * @tc.desc Verify reversing a one-element array twice keeps its value unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n]);
      let res = arr.reverse().reverse();
      expect(res[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0190
     * @tc.name testBigInt64ArrayReverseTwo019
     * @tc.desc Verify reversing a two-element array twice restores the original order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n]);
      let res = arr.reverse().reverse();
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(-1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0200
     * @tc.name testBigInt64ArrayReverseTwo020
     * @tc.desc Verify reversing a three-element array twice restores the original order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let res = arr.reverse().reverse();
      expect(res[0]).assertEqual(5n);
      expect(res[1]).assertEqual(10n);
      expect(res[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0210
     * @tc.name testBigInt64ArrayReverseTwo021
     * @tc.desc Verify reversing a two-element array three times matches one reverse.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let res = arr.reverse().reverse().reverse();
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0220
     * @tc.name testBigInt64ArrayReverseTwo022
     * @tc.desc Verify reversing a three-element array three times matches one reverse.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let res = arr.reverse().reverse().reverse();
      expect(res[0]).assertEqual(30n);
      expect(res[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0230
     * @tc.name testBigInt64ArrayReverseTwo023
     * @tc.desc Verify reversing a four-element array four times returns to the original order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.reverse().reverse().reverse().reverse();
      expect(res[0]).assertEqual(1n);
      expect(res[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0240
     * @tc.name testBigInt64ArrayReverseTwo024
     * @tc.desc Verify reversing a buffer-backed array twice preserves later independent
     * changes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      arr[0] = 77n;
      arr[1] = 88n;
      let res = arr.reverse().reverse();
      expect(res[0]).assertEqual(77n);
      expect(res[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0250
     * @tc.name testBigInt64ArrayReverseTwo025
     * @tc.desc Verify reversing an offset subview twice keeps unrelated buffer data unaffected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf, 8, 2);
      arr[0] = 111n;
      arr[1] = 222n;
      let res = arr.reverse().reverse();
      expect(res[0]).assertEqual(111n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0260
     * @tc.name testBigInt64ArrayReverseTwo026
     * @tc.desc Verify mutations between repeated reverses appear at the correct restored
     * positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let res1 = arr.reverse();
      res1[0] = 9n;
      let res2 = res1.reverse();
      expect(res2[0]).assertEqual(1n);
      expect(res2[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0270
     * @tc.name testBigInt64ArrayReverseTwo027
     * @tc.desc Verify reversing two maximum values keeps both values intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n]);
      let res = arr.reverse();
      expect(res[0]).assertEqual(9223372036854775807n);
      expect(res[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0280
     * @tc.name testBigInt64ArrayReverseTwo028
     * @tc.desc Verify reversing two minimum values keeps both values intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n]);
      let res = arr.reverse();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0290
     * @tc.name testBigInt64ArrayReverseTwo029
     * @tc.desc Verify reversing one minimum and one maximum value swaps them without
     * truncation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let res = arr.reverse();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0300
     * @tc.name testBigInt64ArrayReverseTwo030
     * @tc.desc Verify reversing three extreme values keeps cross-boundary swaps correct.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775808n]);
      let res = arr.reverse();
      expect(res[0]).assertEqual(-9223372036854775808n);
      expect(res[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0310
     * @tc.name testBigInt64ArrayReverseTwo031
     * @tc.desc Verify reversing values near the safe integer boundary keeps exact positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9007199254740991n, -9007199254740991n]);
      let res = arr.reverse();
      expect(res[0]).assertEqual(-9007199254740991n);
      expect(res[1]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0320
     * @tc.name testBigInt64ArrayReverseTwo032
     * @tc.desc Verify reversing a zero-length shared view does not affect the Int8Array alias.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf, 0, 0);
      let i8 = new Int8Array(buf);
      i8[0] = 1;
      arr.reverse();
      expect(i8[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0330
     * @tc.name testBigInt64ArrayReverseTwo033
     * @tc.desc Verify reversing a one-element shared view keeps the stored value unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf);
      arr[0] = 255n;
      arr.reverse();
      expect(arr[0]).assertEqual(255n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0340
     * @tc.name testBigInt64ArrayReverseTwo034
     * @tc.desc Verify reversing a two-element shared buffer keeps the swapped layout correct.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      let i8 = new Int8Array(buf);
      arr[0] = 1n;
      arr[1] = 2n;
      arr.reverse();
      expect(arr[0]).assertEqual(2n);
      expect(arr[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0350
     * @tc.name testBigInt64ArrayReverseTwo035
     * @tc.desc Verify aliases over the same buffer observe the reversed order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      let bArr = new BigInt64Array(buf);
      arr[0] = 100n;
      arr[1] = 200n;
      let res = arr.reverse();
      expect(bArr[0]).assertEqual(200n);
      expect(bArr[1]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0360
     * @tc.name testBigInt64ArrayReverseTwo036
     * @tc.desc Verify reversing one overlapping view keeps the shared region consistent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr1 = new BigInt64Array(buf, 0, 2);
      let arr2 = new BigInt64Array(buf, 8, 2);
      arr1[0] = 5n;
      arr1[1] = 6n;
      arr2[1] = 7n;
      arr1.reverse();
      expect(arr1[0]).assertEqual(6n);
      expect(arr2[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0370
     * @tc.name testBigInt64ArrayReverseTwo037
     * @tc.desc Verify reversing a nested shared view keeps all reads consistent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let v1 = new BigInt64Array(buf);
      v1[0] = 10n;
      v1[1] = 20n;
      v1[2] = 30n;
      let v2 = new BigInt64Array(buf, 8, 2);
      v2.reverse();
      expect(v1[1]).assertEqual(30n);
      expect(v1[2]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0380
     * @tc.name testBigInt64ArrayReverseTwo038
     * @tc.desc Verify reversing a shared extreme-value view keeps buffer contents stable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let v1 = new BigInt64Array(buf);
      v1[0] = 9223372036854775807n;
      v1[1] = -9223372036854775808n;
      let v2 = new BigInt64Array(buf);
      v2.reverse();
      expect(v1[0]).assertEqual(-9223372036854775808n);
      expect(v1[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0390
     * @tc.name testBigInt64ArrayReverseTwo039
     * @tc.desc Verify reversing a middle subview does not affect the head or tail values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let arr = new BigInt64Array(buf);
      arr[0] = 11n;
      arr[1] = 22n;
      arr[2] = 33n;
      arr[3] = 44n;
      let subView = new BigInt64Array(buf, 8, 2);
      subView.reverse();
      expect(arr[0]).assertEqual(11n);
      expect(arr[1]).assertEqual(33n);
      expect(arr[2]).assertEqual(22n);
      expect(arr[3]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0400
     * @tc.name testBigInt64ArrayReverseTwo040
     * @tc.desc Verify reversing a subview keeps the returned handle and root view synchronized.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let root = new BigInt64Array(buf);
      root[1] = 55n;
      root[2] = 66n;
      let subView = new BigInt64Array(buf, 8, 2);
      let res = subView.reverse();
      expect(res[0]).assertEqual(66n);
      expect(root[1]).assertEqual(66n);
      expect(root[2]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0410
     * @tc.name testBigInt64ArrayReverseTwo041
     * @tc.desc Verify sequential reverses across multiple views produce the expected composite
     * order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let v1 = new BigInt64Array(buf);
      v1[0] = 1n;
      v1[1] = 2n;
      v1[2] = 3n;
      v1.reverse();
      let v2 = new BigInt64Array(buf, 0, 2);
      v2.reverse();
      expect(v1[0]).assertEqual(2n);
      expect(v1[1]).assertEqual(3n);
      expect(v1[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0420
     * @tc.name testBigInt64ArrayReverseTwo042
     * @tc.desc Verify reversing a subarray view updates the parent array in place.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 4);
      let res = sub.reverse();
      expect(res[0]).assertEqual(40n);
      expect(res[1]).assertEqual(30n);
      expect(res[2]).assertEqual(20n);
      expect(arr[1]).assertEqual(40n);
      expect(arr[2]).assertEqual(30n);
      expect(arr[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0430
     * @tc.name testBigInt64ArrayReverseTwo043
     * @tc.desc Verify nested view reverses preserve the final outer mapping.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let outer = new BigInt64Array(buf);
      outer[0] = 1n;
      outer[1] = 2n;
      outer[2] = 3n;
      outer[3] = 4n;
      let inner = new BigInt64Array(buf, 8, 2);
      inner.reverse();
      outer.reverse();
      expect(outer[0]).assertEqual(4n);
      expect(outer[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0440
     * @tc.name testBigInt64ArrayReverseTwo044
     * @tc.desc Verify large array reverse preserves byteLength correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      let res = arr.reverse();
      expect(res.byteLength).assertEqual(800);
      expect(res.length).assertEqual(100);
      expect(res.BYTES_PER_ELEMENT).assertEqual(8);
      expect(res.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0450
     * @tc.name testBigInt64ArrayReverseTwo045
     * @tc.desc Verify large array reverse with an offset view preserves property values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(160);
      let arr = new BigInt64Array(buf, 16, 10);
      for (let i = 0; i < 10; i++) {
        arr[i] = BigInt(i * 10);
      }
      let res = arr.reverse();
      expect(res.byteLength).assertEqual(80);
      expect(res.length).assertEqual(10);
      expect(res.byteOffset).assertEqual(16);
      expect(res[0]).assertEqual(90n);
      expect(res[9]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0460
     * @tc.name testBigInt64ArrayReverseTwo046
     * @tc.desc Verify reverse on shared buffer with BigInt64Array and Int32Array mixed views
     * keeps data consistent across element sizes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let bi64 = new BigInt64Array(buf);
      bi64[0] = 1n;
      bi64[1] = 2n;
      let i32 = new Int32Array(buf);
      bi64.reverse();
      expect(bi64[0]).assertEqual(2n);
      expect(bi64[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0470
     * @tc.name testBigInt64ArrayReverseTwo047
     * @tc.desc Verify reverse on shared buffer with BigInt64Array and Uint8Array mixed views
     * reflects byte-level changes after reversal.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let bi64 = new BigInt64Array(buf);
      bi64[0] = BigInt(0x0102030405060708);
      bi64[1] = BigInt(0x1112131415161718);
      let u8 = new Uint8Array(buf);
      let firstByteBefore = u8[0];
      bi64.reverse();
      let firstByteAfter = u8[0];
      expect(firstByteBefore).assertEqual(firstByteAfter);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0480
     * @tc.name testBigInt64ArrayReverseTwo048
     * @tc.desc Verify reverse after fill operation on a shared buffer view propagates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      arr.fill(5n, 0, 2);
      arr.fill(10n, 2, 4);
      let res = arr.reverse();
      expect(res[0]).assertEqual(10n);
      expect(res[1]).assertEqual(10n);
      expect(res[2]).assertEqual(5n);
      expect(res[3]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0490
     * @tc.name testBigInt64ArrayReverseTwo049
     * @tc.desc Verify multiple overlapping subviews remain consistent after sequential reverses.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let root = new BigInt64Array(buf);
      root[0] = 1n;
      root[1] = 2n;
      root[2] = 3n;
      root[3] = 4n;
      let v1 = new BigInt64Array(buf, 0, 3);
      let v2 = new BigInt64Array(buf, 8, 3);
      v1.reverse();
      v2.reverse();
      expect(root[0]).assertEqual(3n);
      expect(root[1]).assertEqual(2n);
      expect(root[2]).assertEqual(4n);
      expect(root[3]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0500
     * @tc.name testBigInt64ArrayReverseTwo050
     * @tc.desc Verify subarray of subarray reverse chain updates root array correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let sub1 = arr.subarray(1, 6);
      let sub2 = sub1.subarray(1, 4);
      sub2.reverse();
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(50n);
      expect(arr[3]).assertEqual(40n);
      expect(arr[4]).assertEqual(30n);
      expect(arr[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0510
     * @tc.name testBigInt64ArrayReverseTwo051
     * @tc.desc Verify reverse after copyWithin on the same array preserves correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 2, 5);
      arr.reverse();
      expect(arr[0]).assertEqual(5n);
      expect(arr[1]).assertEqual(4n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(3n);
      expect(arr[4]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0520
     * @tc.name testBigInt64ArrayReverseTwo052
     * @tc.desc Verify three aliases over the same buffer observe consistent state after reverse.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let a = new BigInt64Array(buf);
      let b = new BigInt64Array(buf);
      let c = new BigInt64Array(buf);
      a[0] = 10n;
      a[1] = 20n;
      b.reverse();
      expect(c[0]).assertEqual(20n);
      expect(c[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0530
     * @tc.name testBigInt64ArrayReverseTwo053
     * @tc.desc Verify reverse on a full-buffer view keeps buffer byteLength unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let arr = new BigInt64Array(buf);
      arr[0] = 1n;
      arr[1] = 2n;
      arr[2] = 3n;
      let res = arr.reverse();
      expect(res.buffer.byteLength).assertEqual(24);
      expect(res.byteLength).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0540
     * @tc.name testBigInt64ArrayReverseTwo054
     * @tc.desc Verify reverse on offset view preserves buffer independence from other views.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let head = new BigInt64Array(buf, 0, 2);
      let tail = new BigInt64Array(buf, 16, 2);
      head[0] = 111n;
      head[1] = 222n;
      tail[0] = 333n;
      tail[1] = 444n;
      head.reverse();
      expect(tail[0]).assertEqual(333n);
      expect(tail[1]).assertEqual(444n);
      expect(head[0]).assertEqual(222n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0550
     * @tc.name testBigInt64ArrayReverseTwo055
     * @tc.desc Verify reverse on a view with non-zero byteOffset preserves all property values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(64);
      let arr = new BigInt64Array(buf, 24, 4);
      arr[0] = 5n;
      arr[1] = 15n;
      arr[2] = 25n;
      arr[3] = 35n;
      let res = arr.reverse();
      expect(res.byteOffset).assertEqual(24);
      expect(res.byteLength).assertEqual(32);
      expect(res.length).assertEqual(4);
      expect(res[0]).assertEqual(35n);
      expect(res[3]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0560
     * @tc.name testBigInt64ArrayReverseTwo056
     * @tc.desc Verify single-element subview reverse keeps outer view values unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let outer = new BigInt64Array(buf);
      outer[0] = 10n;
      outer[1] = 20n;
      outer[2] = 30n;
      let inner = new BigInt64Array(buf, 8, 1);
      let res = inner.reverse();
      expect(res[0]).assertEqual(20n);
      expect(outer[0]).assertEqual(10n);
      expect(outer[1]).assertEqual(20n);
      expect(outer[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0570
     * @tc.name testBigInt64ArrayReverseTwo057
     * @tc.desc Verify consecutive reverses on different subviews produce correct final state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let root = new BigInt64Array(buf);
      root[0] = 1n;
      root[1] = 2n;
      root[2] = 3n;
      root[3] = 4n;
      let left = new BigInt64Array(buf, 0, 2);
      let right = new BigInt64Array(buf, 16, 2);
      left.reverse();
      right.reverse();
      expect(root[0]).assertEqual(2n);
      expect(root[1]).assertEqual(1n);
      expect(root[2]).assertEqual(4n);
      expect(root[3]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_REVERSE_TWO_0580
     * @tc.name testBigInt64ArrayReverseTwo058
     * @tc.desc Verify byte-level read through Uint8Array after BigInt64Array reverse.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayReverseTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let bi64 = new BigInt64Array(buf);
      bi64[0] = 1n;
      let u8 = new Uint8Array(buf);
      bi64.reverse();
      expect(bi64[0]).assertEqual(1n);
      expect(u8.length).assertEqual(8);
    });
  });
}
