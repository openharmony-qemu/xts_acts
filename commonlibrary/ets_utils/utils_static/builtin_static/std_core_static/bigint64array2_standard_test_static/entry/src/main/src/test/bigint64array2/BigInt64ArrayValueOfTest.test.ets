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

export default function BigInt64ArrayValueOfTest(): void {
  describe('BigInt64ArrayValueOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0010
     * @tc.name testBigInt64ArrayValueOf001
     * @tc.desc Verify valueOf on a single-element [0n] array returns the same object reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0020
     * @tc.name testBigInt64ArrayValueOf002
     * @tc.desc Verify valueOf on a multi-element array returns the same object reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0030
     * @tc.name testBigInt64ArrayValueOf003
     * @tc.desc Verify valueOf on an empty array returns the same object reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0040
     * @tc.name testBigInt64ArrayValueOf004
     * @tc.desc Verify valueOf on array with MAX and MIN boundary values returns the same object reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0050
     * @tc.name testBigInt64ArrayValueOf005
     * @tc.desc Verify valueOf on array created by BigInt64Array.from() returns the same object reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([5n, 6n, 7n]);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0060
     * @tc.name testBigInt64ArrayValueOf006
     * @tc.desc Verify valueOf on array created with a length argument returns the same object reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0070
     * @tc.name testBigInt64ArrayValueOf007
     * @tc.desc Verify valueOf on array from an ArrayBuffer returns the same object reference.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      arr[0] = 1n;
      expect(arr.valueOf()).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0080
     * @tc.name testBigInt64ArrayValueOf008
     * @tc.desc Verify reading elements via valueOf on a multi-element array returns correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let val = arr.valueOf();
      expect(val[0]).assertEqual(10n);
      expect(val[1]).assertEqual(20n);
      expect(val[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0090
     * @tc.name testBigInt64ArrayValueOf009
     * @tc.desc Verify valueOf() on an array with boundary values MAX, MIN, and 0n reads all three values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775808n]);
      expect(arr.valueOf()[0]).assertEqual(9223372036854775807n);
      expect(arr.valueOf()[1]).assertEqual(0n);
      expect(arr.valueOf()[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0100
     * @tc.name testBigInt64ArrayValueOf010
     * @tc.desc Verify reading valueOf[0] with MIN returns correct value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      expect(arr.valueOf()[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0110
     * @tc.name testBigInt64ArrayValueOf011
     * @tc.desc Verify reading valueOf[0] with 0n returns correct value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      expect(arr.valueOf()[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0120
     * @tc.name testBigInt64ArrayValueOf012
     * @tc.desc Verify at(-1) on valueOf result returns the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.valueOf().at(-1)).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0130
     * @tc.name testBigInt64ArrayValueOf013
     * @tc.desc Verify at(0) on valueOf result returns the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n, 7n]);
      expect(arr.valueOf().at(0)).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0140
     * @tc.name testBigInt64ArrayValueOf014
     * @tc.desc Verify reading via valueOf on a zero-filled constructed array returns 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let val = arr.valueOf();
      expect(val[0]).assertEqual(0n);
      expect(val[1]).assertEqual(0n);
      expect(val[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0150
     * @tc.name testBigInt64ArrayValueOf015
     * @tc.desc Verify reading all elements via valueOf in a for loop returns correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      for (let i = 0; i < 4; i++) {
        arr[i] = BigInt(i * 10);
      }
      let val = arr.valueOf();
      let ok = true;
      for (let i = 0; i < 4; i++) {
        if (val[i] !== BigInt(i * 10)) { ok = false; }
      }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0160
     * @tc.name testBigInt64ArrayValueOf016
     * @tc.desc Verify writing 20n (positive middle value) via valueOf updates the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      arr.valueOf()[0] = 20n;
      expect(arr[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0170
     * @tc.name testBigInt64ArrayValueOf017
     * @tc.desc Verify writing MAX via valueOf updates the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      arr.valueOf()[0] = 9223372036854775807n;
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0180
     * @tc.name testBigInt64ArrayValueOf018
     * @tc.desc Verify writing MIN via valueOf updates the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      arr.valueOf()[0] = -9223372036854775808n;
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0190
     * @tc.name testBigInt64ArrayValueOf019
     * @tc.desc Verify overflow write via valueOf wraps correctly (MAX + 1n becomes MIN).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let maxVal: bigint = 9223372036854775807n;
      arr.valueOf()[0] = maxVal + 1n;
      expect(arr[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0200
     * @tc.name testBigInt64ArrayValueOf020
     * @tc.desc Verify underflow write via valueOf wraps correctly (MIN - 1n becomes MAX).
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      let minVal: bigint = -9223372036854775808n;
      arr.valueOf()[0] = minVal - 1n;
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0210
     * @tc.name testBigInt64ArrayValueOf021
     * @tc.desc Verify writing 0n via valueOf updates the original array element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n]);
      arr.valueOf()[0] = 0n;
      expect(arr[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0220
     * @tc.name testBigInt64ArrayValueOf022
     * @tc.desc Verify writing multiple elements via valueOf updates all corresponding original elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let val = arr.valueOf();
      val[0] = 10n;
      val[1] = 20n;
      val[2] = 30n;
      expect(arr[0]).assertEqual(10n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0230
     * @tc.name testBigInt64ArrayValueOf023
     * @tc.desc Verify writing -100n (negative middle value) via valueOf updates the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      arr.valueOf()[0] = -100n;
      expect(arr[0]).assertEqual(-100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0240
     * @tc.name testBigInt64ArrayValueOf024
     * @tc.desc Verify writing Number.MAX_SAFE_INTEGER as bigint via valueOf updates the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n]);
      arr.valueOf()[0] = 9007199254740991n;
      expect(arr[0]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0250
     * @tc.name testBigInt64ArrayValueOf025
     * @tc.desc Verify valueOf() returns the same array reference and elements are accessible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(1n);
      expect(val[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0260
     * @tc.name testBigInt64ArrayValueOf026
     * @tc.desc Verify valueOf().byteLength equals the original array byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.valueOf().byteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0270
     * @tc.name testBigInt64ArrayValueOf027
     * @tc.desc Verify valueOf().byteOffset equals the original array byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.valueOf().byteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0280
     * @tc.name testBigInt64ArrayValueOf028
     * @tc.desc Verify valueOf().buffer is the same buffer reference as the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      expect(arr.valueOf().buffer).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0290
     * @tc.name testBigInt64ArrayValueOf029
     * @tc.desc Verify valueOf() on a subarray preserves the correct length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      let val = sub.valueOf();
      expect(val).assertEqual(sub);
      expect(val[0]).assertEqual(20n);
      expect(val[1]).assertEqual(30n);
      expect(val.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0300
     * @tc.name testBigInt64ArrayValueOf030
     * @tc.desc Verify fill() called on valueOf result updates the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.valueOf().fill(9n);
      expect(arr[0]).assertEqual(9n);
      expect(arr[1]).assertEqual(9n);
      expect(arr[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0310
     * @tc.name testBigInt64ArrayValueOf031
     * @tc.desc Verify reverse() called on valueOf result updates the original array order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.valueOf().reverse();
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0320
     * @tc.name testBigInt64ArrayValueOf032
     * @tc.desc Verify sort() called on valueOf result updates the original array order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      arr.valueOf().sort();
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0330
     * @tc.name testBigInt64ArrayValueOf033
     * @tc.desc Verify set() called on valueOf result updates the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.valueOf().set([9n, 8n]);
      expect(arr[0]).assertEqual(9n);
      expect(arr[1]).assertEqual(8n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0340
     * @tc.name testBigInt64ArrayValueOf034
     * @tc.desc Verify copyWithin() called on valueOf result updates the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.valueOf().copyWithin(0, 2);
      expect(arr[0]).assertEqual(30n);
      expect(arr[1]).assertEqual(20n);
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0350
     * @tc.name testBigInt64ArrayValueOf035
     * @tc.desc Verify fill() with range called on valueOf result updates the specified range in the original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.valueOf().fill(0n, 1, 3);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(0n);
      expect(arr[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0360
     * @tc.name testBigInt64ArrayValueOf036
     * @tc.desc Verify set() with offset called on valueOf result writes at the target position in the original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      arr.valueOf().set([9n, 8n], 1);
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(9n);
      expect(arr[2]).assertEqual(8n);
      expect(arr[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0370
     * @tc.name testBigInt64ArrayValueOf037
     * @tc.desc Verify reverse() via valueOf on a 2-element array swaps the two elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      arr.valueOf().reverse();
      expect(arr[0]).assertEqual(200n);
      expect(arr[1]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0380
     * @tc.name testBigInt64ArrayValueOf038
     * @tc.desc Verify sort() via valueOf on a reverse-sorted array restores ascending order in the original.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 4n, 3n, 2n, 1n]);
      arr.valueOf().sort();
      expect(arr[0]).assertEqual(1n);
      expect(arr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0390
     * @tc.name testBigInt64ArrayValueOf039
     * @tc.desc Verify sort() via valueOf on boundary values sorts MIN before MAX.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      arr.valueOf().sort();
      expect(arr[0]).assertEqual(-9223372036854775808n);
      expect(arr[1]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0400
     * @tc.name testBigInt64ArrayValueOf040
     * @tc.desc Verify includes() on valueOf result correctly detects an existing element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      expect(arr.valueOf().includes(10n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0410
     * @tc.name testBigInt64ArrayValueOf041
     * @tc.desc Verify includes() on valueOf result correctly reports false for a non-existing element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      expect(arr.valueOf().includes(99n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0420
     * @tc.name testBigInt64ArrayValueOf042
     * @tc.desc Verify indexOf() on valueOf result returns the correct index of an element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.valueOf().indexOf(2n)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0430
     * @tc.name testBigInt64ArrayValueOf043
     * @tc.desc Verify lastIndexOf() on valueOf result returns the last occurrence index.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 1n]);
      expect(arr.valueOf().lastIndexOf(1n)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0440
     * @tc.name testBigInt64ArrayValueOf044
     * @tc.desc Verify join() on valueOf result produces the correct comma-separated string.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.valueOf().join(',')).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0450
     * @tc.name testBigInt64ArrayValueOf045
     * @tc.desc Verify map() on valueOf result returns a new array with transformed elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let res = arr.valueOf().map((x: bigint) => x * 2n);
      expect(res[0]).assertEqual(2n);
      expect(res[1]).assertEqual(4n);
      expect(res[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0460
     * @tc.name testBigInt64ArrayValueOf046
     * @tc.desc Verify filter() on valueOf result returns a new array with only matching elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n]);
      let res = arr.valueOf().filter((x: bigint) => x > 0n);
      expect(res[0]).assertEqual(1n);
      expect(res[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0470
     * @tc.name testBigInt64ArrayValueOf047
     * @tc.desc Verify reduce() on valueOf result correctly accumulates the sum of all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.valueOf().reduce((s: bigint, v: bigint) => s + v, 0n);
      expect(res).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0480
     * @tc.name testBigInt64ArrayValueOf048
     * @tc.desc Verify some() on valueOf result returns true when an element satisfies the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.valueOf().some((x: bigint) => x > 2n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0490
     * @tc.name testBigInt64ArrayValueOf049
     * @tc.desc Verify every() on valueOf result returns false when not all elements satisfy the predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.valueOf().every((x: bigint) => x > 1n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0500
     * @tc.name testBigInt64ArrayValueOf050
     * @tc.desc Verify valueOf on BigInt64Array.of() result returns the same instance with correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(5n, 6n, 7n);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[1]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0510
     * @tc.name testBigInt64ArrayValueOf051
     * @tc.desc Verify valueOf on BigInt64Array.from() result returns the same instance with correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([10n, 20n, 30n]);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(10n);
      expect(val[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0520
     * @tc.name testBigInt64ArrayValueOf052
     * @tc.desc Verify valueOf on array created by constructor copy of another BigInt64Array returns the same instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([10n, 20n]);
      let arr = new BigInt64Array(src);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0530
     * @tc.name testBigInt64ArrayValueOf053
     * @tc.desc Verify valueOf on BigInt64Array.from() with a mapping function returns the same instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([1n, 2n, 3n], (x: bigint) => x * 10n);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0540
     * @tc.name testBigInt64ArrayValueOf054
     * @tc.desc Verify valueOf on array created from an ArrayBuffer with DataView returns the same instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let dv = new DataView(buf);
      dv.setBigInt64(0, 100n, true);
      dv.setBigInt64(8, 200n, true);
      let arr = new BigInt64Array(buf);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0550
     * @tc.name testBigInt64ArrayValueOf055
     * @tc.desc Verify valueOf on array constructed from another array's valueOf result preserves element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n, 7n]);
      let copy = new BigInt64Array(arr.valueOf());
      expect(copy[0]).assertEqual(5n);
      expect(copy[1]).assertEqual(6n);
      expect(copy[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0560
     * @tc.name testBigInt64ArrayValueOf056
     * @tc.desc Verify valueOf comparison between BigInt64Array.of and BigInt64Array.from yields consistent identity behavior.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ofArr = BigInt64Array.of(1n);
      let fromArr = BigInt64Array.from([1n]);
      expect(ofArr.valueOf()).assertEqual(ofArr);
      expect(fromArr.valueOf()).assertEqual(fromArr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0570
     * @tc.name testBigInt64ArrayValueOf057
     * @tc.desc Verify valueOf on array created with BigInt64Array.from() using a generic iterable returns the same instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([7n, 8n, 9n]);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(7n);
      expect(val[2]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0580
     * @tc.name testBigInt64ArrayValueOf058
     * @tc.desc Verify valueOf on a subarray shares the buffer with the parent — write through parent affects subarray.valueOf().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = parent.subarray(1, 3);
      parent[1] = 99n;
      expect(sub.valueOf()[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0590
     * @tc.name testBigInt64ArrayValueOf059
     * @tc.desc Verify valueOf on a subarray shares the buffer with the parent — write through subarray.valueOf() affects parent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new BigInt64Array([1n, 2n, 3n, 4n]);
      let sub = parent.subarray(1, 3);
      sub.valueOf()[0] = 88n;
      expect(parent[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0600
     * @tc.name testBigInt64ArrayValueOf060
     * @tc.desc Verify valueOf on a buffer-offset view preserves the correct byteOffset and element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let full = new BigInt64Array(buf);
      full[0] = 1n;
      full[1] = 2n;
      full[2] = 3n;
      full[3] = 4n;
      let arr = new BigInt64Array(buf, 8, 2);
      let val = arr.valueOf();
      expect(val.byteOffset).assertEqual(8);
      expect(val[0]).assertEqual(2n);
      expect(val[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0610
     * @tc.name testBigInt64ArrayValueOf061
     * @tc.desc Verify valueOf on a zero-length buffer-offset view returns the same instance with length 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf, 16, 0);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      try {
        let v = val[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0620
     * @tc.name testBigInt64ArrayValueOf062
     * @tc.desc Verify valueOf on a BigInt64Array sharing buffer with Uint8Array reflects byte-level modifications.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let arr = new BigInt64Array(buf);
      arr[0] = 0n;
      let u8 = new Uint8Array(buf);
      u8[0] = 1;
      expect(arr.valueOf()[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0630
     * @tc.name testBigInt64ArrayValueOf063
     * @tc.desc Verify multi-level subarray valueOf preserves buffer sharing through all levels.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let parent = new BigInt64Array(buf);
      parent[0] = 10n;
      parent[1] = 20n;
      parent[2] = 30n;
      let sub = parent.subarray(1, 3);
      parent[1] = 99n;
      expect(sub.valueOf()[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0640
     * @tc.name testBigInt64ArrayValueOf064
     * @tc.desc Verify slice() result valueOf has an independent buffer from the source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sli = arr.slice(0, 2);
      let val = sli.valueOf();
      expect(val).assertEqual(sli);
      expect(val[0]).assertEqual(10n);
      expect(val[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0650
     * @tc.name testBigInt64ArrayValueOf065
     * @tc.desc Verify valueOf on subarray at different byteOffsets correctly reports byteOffset.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(24);
      let a1 = new BigInt64Array(buf, 0, 2);
      let a2 = new BigInt64Array(buf, 8, 1);
      expect(a1.valueOf().byteOffset).assertEqual(0);
      expect(a2.valueOf().byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0660
     * @tc.name testBigInt64ArrayValueOf066
     * @tc.desc Verify valueOf on an array constructed from an empty buffer returns the same instance with zero length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(0);
      let arr = new BigInt64Array(buf);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      try {
        let v = val[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0670
     * @tc.name testBigInt64ArrayValueOf067
     * @tc.desc Verify valueOf still returns the same object after fill() mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.fill(9n);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf()[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0680
     * @tc.name testBigInt64ArrayValueOf068
     * @tc.desc Verify valueOf still returns the same object after reverse() mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.reverse();
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf()[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0690
     * @tc.name testBigInt64ArrayValueOf069
     * @tc.desc Verify valueOf still returns the same object after sort() mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      arr.sort();
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf()[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0700
     * @tc.name testBigInt64ArrayValueOf070
     * @tc.desc Verify valueOf still returns the same object after copyWithin() mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr.copyWithin(0, 2);
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf()[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0710
     * @tc.name testBigInt64ArrayValueOf071
     * @tc.desc Verify valueOf still returns the same object after set() mutation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.set([9n, 8n], 0);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0720
     * @tc.name testBigInt64ArrayValueOf072
     * @tc.desc Verify valueOf still returns the same object after direct element assignment.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr[0] = 100n;
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf()[0]).assertEqual(100n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0730
     * @tc.name testBigInt64ArrayValueOf073
     * @tc.desc Verify valueOf still returns the same object after multiple sequential mutations.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 1n, 4n, 2n]);
      arr.sort();
      arr.reverse();
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf()[0]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0740
     * @tc.name testBigInt64ArrayValueOf074
     * @tc.desc Verify valueOf on a with()-modified array returns the new array instance with the modified value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let modified = arr.with(0, 99n);
      expect(modified.valueOf()).assertEqual(modified);
      expect(modified.valueOf()[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0750
     * @tc.name testBigInt64ArrayValueOf075
     * @tc.desc Verify valueOf on a toReversed() result returns the reversed copy instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let rev = arr.toReversed();
      let val = rev.valueOf();
      expect(val).assertEqual(rev);
      expect(val[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0760
     * @tc.name testBigInt64ArrayValueOf076
     * @tc.desc Verify valueOf on a toSorted() result returns the sorted copy instance.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let sorted = arr.toSorted();
      expect(sorted.valueOf()).assertEqual(sorted);
      expect(sorted.valueOf()[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0770
     * @tc.name testBigInt64ArrayValueOf077
     * @tc.desc Verify valueOf().toString() produces the same string as arr.toString().
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      expect(arr.valueOf().toString()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0780
     * @tc.name testBigInt64ArrayValueOf078
     * @tc.desc Verify values() iterator on valueOf result yields all elements of the original array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let val = arr.valueOf();
      let iter = val.values();
      let nxt = iter.next();
      expect(nxt.value).assertEqual(10n);
      nxt = iter.next();
      expect(nxt.value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0790
     * @tc.name testBigInt64ArrayValueOf079
     * @tc.desc Verify chaining non-mutating methods on valueOf result: filter().map() produces correct output.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let res = arr.valueOf().filter((x: bigint) => x > 1n).map((x: bigint) => x * 10n);
      expect(res[0]).assertEqual(20n);
      expect(res[1]).assertEqual(30n);
      expect(res[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0800
     * @tc.name testBigInt64ArrayValueOf080
     * @tc.desc Verify valueOf after setting elements through a DataView on the shared buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      arr[0] = 1n;
      let dv = new DataView(buf);
      dv.setBigInt64(0, 999n, true);
      expect(arr.valueOf()[0]).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0810
     * @tc.name testBigInt64ArrayValueOf081
     * @tc.desc Verify valueOf result used in a conditional expression returns the correct branch.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let val = arr.valueOf();
      let ok = false;
      if (val[0] === 1n) { ok = true; }
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0820
     * @tc.name testBigInt64ArrayValueOf082
     * @tc.desc Verify writing to valueOf() result modifies the original array, then reading back reflects the write for MAX and MIN values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n]);
      arr.valueOf()[0] = 9223372036854775807n;
      arr.valueOf()[1] = -9223372036854775808n;
      expect(arr[0]).assertEqual(9223372036854775807n);
      expect(arr[1]).assertEqual(-9223372036854775808n);
      expect(arr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0830
     * @tc.name testBigInt64ArrayValueOf083
     * @tc.desc Verify valueOf on array modified via set() from another typed array reflects changes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let src = new BigInt64Array([9n, 8n]);
      arr.set(src, 0);
      expect(arr.valueOf()[0]).assertEqual(9n);
      expect(arr.valueOf()[1]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0840
     * @tc.name testBigInt64ArrayValueOf084
     * @tc.desc Verify valueOf on a zero-length array returns the same instance with length 0 and byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(0);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      try {
        let v = val[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0850
     * @tc.name testBigInt64ArrayValueOf085
     * @tc.desc Verify valueOf on a single-element MAX array preserves the value and identity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0860
     * @tc.name testBigInt64ArrayValueOf086
     * @tc.desc Verify valueOf on a single-element MIN array preserves the value and identity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0870
     * @tc.name testBigInt64ArrayValueOf087
     * @tc.desc Verify valueOf on array with both MAX and MIN boundary values preserves correct element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, -9223372036854775808n]);
      let val = arr.valueOf();
      expect(val[0]).assertEqual(9223372036854775807n);
      expect(val[1]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0880
     * @tc.name testBigInt64ArrayValueOf088
     * @tc.desc Verify valueOf on a large array (100 elements) preserves length and identity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(0n);
      expect(val[99]).assertEqual(99n);
      expect(val.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0890
     * @tc.name testBigInt64ArrayValueOf089
     * @tc.desc Verify valueOf on array with all identical elements returns the same instance with correct repeated values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 7n, 7n, 7n]);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(7n);
      expect(val[3]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0900
     * @tc.name testBigInt64ArrayValueOf090
     * @tc.desc Verify valueOf on array with alternating signs preserves all element values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n, 3n, -3n]);
      let val = arr.valueOf();
      expect(val[0]).assertEqual(1n);
      expect(val[1]).assertEqual(-1n);
      expect(val[5]).assertEqual(-3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0910
     * @tc.name testBigInt64ArrayValueOf091
     * @tc.desc Verify valueOf identity is preserved after being stored in an intermediate variable.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let val = arr.valueOf();
      let val2 = val;
      expect(val2).assertEqual(arr);
      expect(val2[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0920
     * @tc.name testBigInt64ArrayValueOf092
     * @tc.desc Verify valueOf on array with all negative values preserves all element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n, -4n]);
      let val = arr.valueOf();
      expect(val[0]).assertEqual(-1n);
      expect(val[3]).assertEqual(-4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0930
     * @tc.name testBigInt64ArrayValueOf093
     * @tc.desc Verify valueOf on array with sequential index-equals-value pattern preserves values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      for (let i = 0; i < 4; i++) {
        arr[i] = BigInt(i);
      }
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0940
     * @tc.name testBigInt64ArrayValueOf094
     * @tc.desc Verify valueOf result has the same length and byteLength as the original for a 5-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(0n);
      expect(val[2]).assertEqual(0n);
      expect(val[4]).assertEqual(0n);
      expect(val.length).assertEqual(5);
      expect(val.byteLength).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0950
     * @tc.name testBigInt64ArrayValueOf095
     * @tc.desc Verify valueOf result's buffer.byteLength matches the original buffer's byteLength.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(3);
      let val = arr.valueOf();
      expect(val.buffer.byteLength).assertEqual(arr.buffer.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0960
     * @tc.name testBigInt64ArrayValueOf096
     * @tc.desc Verify valueOf after chained mutating methods (fill then reverse) returns the same instance with correct values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.fill(5n, 0, 1);
      arr.reverse();
      expect(arr.valueOf()).assertEqual(arr);
      expect(arr.valueOf()[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0970
     * @tc.name testBigInt64ArrayValueOf097
     * @tc.desc Verify valueOf result can be iterated in a for-of loop yielding correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let val = arr.valueOf();
      let sum = 0n;
      for (let x of val) {
        sum += x;
      }
      expect(sum).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0980
     * @tc.name testBigInt64ArrayValueOf098
     * @tc.desc Verify valueOf on subarray of subarray preserves the shared buffer chain.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(1, 2);
      expect(sub2.valueOf()[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_0990
     * @tc.name testBigInt64ArrayValueOf099
     * @tc.desc Verify valueOf identity when assigned to variables and compared across multiple references.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let ref1 = arr.valueOf();
      let ref2 = arr;
      expect(ref1).assertEqual(ref2);
      ref1[0] = 99n;
      expect(ref2[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_1000
     * @tc.name testBigInt64ArrayValueOf100
     * @tc.desc Verify valueOf on array from ArrayBuffer offset view preserves the subarray's view window values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(40);
      let full = new BigInt64Array(buf);
      for (let i = 0; i < 5; i++) {
        full[i] = BigInt(i * 10);
      }
      let view = new BigInt64Array(buf, 8, 3);
      let val = view.valueOf();
      expect(val[0]).assertEqual(10n);
      expect(val[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_1010
     * @tc.name testBigInt64ArrayValueOf101
     * @tc.desc Verify valueOf on array created with BigInt64Array.of() with spread-like multiple arguments.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(100n, 200n, 300n, 400n);
      let val = arr.valueOf();
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(100n);
      expect(val[3]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_1020
     * @tc.name testBigInt64ArrayValueOf102
     * @tc.desc Verify valueOf on a deeply chained subarray-of-subarray preserves correct reference and values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub1 = arr.subarray(1, 4);
      let sub2 = sub1.subarray(1, 3);
      let val = sub2.valueOf();
      expect(val).assertEqual(sub2);
      expect(val[0]).assertEqual(3n);
      expect(val[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUE_OF_1030
     * @tc.name testBigInt64ArrayValueOf103
     * @tc.desc Verify valueOf still returns a usable BigInt64Array reference after source array elements are overwritten.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValueOf103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 5n]);
      let val = arr.valueOf();
      arr.fill(0n);
      expect(val).assertEqual(arr);
      expect(val[0]).assertEqual(0n);
      expect(val[2]).assertEqual(0n);
    });

  });
}
