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

export default function BigInt64ArraySome02Test(): void {
  describe('BigInt64ArraySome02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_0100
     * @tc.name testBigInt64ArraySomeTwo001
     * @tc.desc Verify some returns true when the maximum bigint value matches exactly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 9223372036854775807n]);
      expect(arr.some((e: bigint) => e === 9223372036854775807n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_0200
     * @tc.name testBigInt64ArraySomeTwo002
     * @tc.desc Verify some returns true when a large positive value satisfies the range check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1000000000000n, 2n]);
      expect(arr.some((e: bigint) => e > 500000000000n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_0300
     * @tc.name testBigInt64ArraySomeTwo003
     * @tc.desc Verify some returns true when a large negative value satisfies the range check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1000000000000n]);
      expect(arr.some((e: bigint) => e < -500000000000n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_0400
     * @tc.name testBigInt64ArraySomeTwo004
     * @tc.desc Verify some returns true when the literal -0n matches 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-0n]);
      expect(arr.some((e: bigint) => e === 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_0500
     * @tc.name testBigInt64ArraySomeTwo005
     * @tc.desc Verify some returns true for a multi-condition predicate with modulo.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 5n]);
      expect(arr.some((e: bigint) => e % 2n !== 0n)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_0600
     * @tc.name testBigInt64ArraySomeTwo006
     * @tc.desc Verify some returns false when no value exceeds the maximum bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      expect(arr.some((e: bigint) => e > 9223372036854775807n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_0700
     * @tc.name testBigInt64ArraySomeTwo007
     * @tc.desc Verify some returns false when no value is below the minimum bigint.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      expect(arr.some((e: bigint) => e < -9223372036854775808n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_0800
     * @tc.name testBigInt64ArraySomeTwo008
     * @tc.desc Verify some returns false when callback always returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      expect(arr.some((_e: bigint) => false)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_0900
     * @tc.name testBigInt64ArraySomeTwo009
     * @tc.desc Verify some returns false when the callback checks index >= length.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n]);
      expect(arr.some((e: bigint, i: int, a: BigInt64Array) => i >= 2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1000
     * @tc.name testBigInt64ArraySomeTwo010
     * @tc.desc Verify some returns false when a non-empty array is checked for byteLength 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9n]);
      expect(arr.some((e: bigint, i: int, a: BigInt64Array) => a.byteLength === 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1100
     * @tc.name testBigInt64ArraySomeTwo011
     * @tc.desc Verify some returns false when all values are negative and the predicate checks > 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, -2n, -3n]);
      expect(arr.some((e: bigint) => e > 0n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1200
     * @tc.name testBigInt64ArraySomeTwo012
     * @tc.desc Verify some returns true when the callback checks byteOffset equals 0.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n]);
      expect(arr.some((e: bigint, i: int, a: BigInt64Array) => a.byteOffset === 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1300
     * @tc.name testBigInt64ArraySomeTwo013
     * @tc.desc Verify some returns true when the callback checks BYTES_PER_ELEMENT.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 8n]);
      expect(arr.some((e: bigint, i: int, a: BigInt64Array) => a.BYTES_PER_ELEMENT === 8)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1400
     * @tc.name testBigInt64ArraySomeTwo014
     * @tc.desc Verify some on a length-constructed zero-filled array returns true for e === 0n.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      let res = arr.some((e: bigint) => e === 0n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1500
     * @tc.name testBigInt64ArraySomeTwo015
     * @tc.desc Verify some does not modify the first element when it returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      arr.some((e: bigint) => e === 10n);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1600
     * @tc.name testBigInt64ArraySomeTwo016
     * @tc.desc Verify some does not alter the maximum bigint element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      arr.some((e: bigint) => e > 0n);
      expect(arr[0]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1700
     * @tc.name testBigInt64ArraySomeTwo017
     * @tc.desc Verify some does not alter mixed extreme and zero elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 0n, -9223372036854775808n]);
      arr.some((e: bigint) => e === 1n);
      expect(arr[1]).assertEqual(0n);
      expect(arr[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1800
     * @tc.name testBigInt64ArraySomeTwo018
     * @tc.desc Verify Int8Array byte modification on shared buffer does not affect BigInt64Array some result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n]);
      let i8 = new Int8Array(arr.buffer);
      i8[0] = 55;
      let res = arr.some((e: bigint) => e === 100n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_1900
     * @tc.name testBigInt64ArraySomeTwo019
     * @tc.desc Verify some on a slice result returns correct value and does not affect source.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sliced = arr.slice(1, 3);
      let res = sliced.some((e: bigint) => e === 30n);
      expect(res).assertTrue();
      expect(arr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2000
     * @tc.name testBigInt64ArraySomeTwo020
     * @tc.desc Verify some on two independent subarrays gives correct and independent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 20n]);
      let sub1 = arr.subarray(0, 2);
      let sub2 = arr.subarray(2, 4);
      let res1 = sub1.some((e: bigint) => e === 10n);
      let res2 = sub2.some((e: bigint) => e === 20n);
      expect(res1).assertTrue();
      expect(res2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2100
     * @tc.name testBigInt64ArraySomeTwo021
     * @tc.desc Verify some preserves element values in a large array after full iteration with no match.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        arr[i] = BigInt(i);
      }
      arr.some((e: bigint) => e === -1n);
      expect(arr[0]).assertEqual(0n);
      expect(arr[25]).assertEqual(25n);
      expect(arr[49]).assertEqual(49n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2200
     * @tc.name testBigInt64ArraySomeTwo022
     * @tc.desc Verify some on a large array with a matching element returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i + 1);
      }
      let res = arr.some((e: bigint) => e === 100n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2300
     * @tc.name testBigInt64ArraySomeTwo023
     * @tc.desc Verify some after fill() correctly detects the filled value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      arr.fill(88n);
      let res = arr.some((e: bigint) => e === 88n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2400
     * @tc.name testBigInt64ArraySomeTwo024
     * @tc.desc Verify some after set() detects the newly set value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let other = new BigInt64Array([99n]);
      arr.set(other, 1);
      let res = arr.some((e: bigint) => e === 99n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2500
     * @tc.name testBigInt64ArraySomeTwo025
     * @tc.desc Verify some() result can be used in an if-else conditional statement.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n]);
      let found = false;
      if (arr.some((e: bigint) => e === 10n)) {
        found = true;
      }
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2600
     * @tc.name testBigInt64ArraySomeTwo026
     * @tc.desc Verify some() result can be negated with the logical NOT operator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let noMatch = !arr.some((e: bigint) => e === 99n);
      expect(noMatch).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2700
     * @tc.name testBigInt64ArraySomeTwo027
     * @tc.desc Verify some() result can be used in a ternary expression.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n]);
      let label = arr.some((e: bigint) => e > 10n) ? 1 : 0;
      expect(label).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2800
     * @tc.name testBigInt64ArraySomeTwo028
     * @tc.desc Verify some and every on the same array produce consistent results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([2n, 4n, 6n]);
      let hasEven = arr.some((e: bigint) => e % 2n === 0n);
      let allEven = arr.every((e: bigint) => e % 2n === 0n);
      expect(hasEven).assertTrue();
      expect(allEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_2900
     * @tc.name testBigInt64ArraySomeTwo029
     * @tc.desc Verify some and includes on the same array give consistent membership results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let has = arr.some((e: bigint) => e === 20n);
      let included = arr.includes(20n);
      expect(has).assertTrue();
      expect(included).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3000
     * @tc.name testBigInt64ArraySomeTwo030
     * @tc.desc Verify some with predicate e >= 0n matches the first non-negative element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, -3n, 0n, 2n]);
      let res = arr.some((e: bigint) => e >= 0n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3100
     * @tc.name testBigInt64ArraySomeTwo031
     * @tc.desc Verify some with predicate e <= 0n matches the first non-positive element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 3n, 0n, -2n]);
      let res = arr.some((e: bigint) => e <= 0n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3200
     * @tc.name testBigInt64ArraySomeTwo032
     * @tc.desc Verify some with compound AND condition matches correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 5n, 10n, 15n]);
      let res = arr.some((e: bigint) => e > 5n && e < 12n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3300
     * @tc.name testBigInt64ArraySomeTwo033
     * @tc.desc Verify some with compound OR condition matches correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 7n, 11n]);
      let res = arr.some((e: bigint) => e === 1n || e === 7n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3400
     * @tc.name testBigInt64ArraySomeTwo034
     * @tc.desc Verify some with e !== 0n matches the first non-zero element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 5n, 0n]);
      let res = arr.some((e: bigint) => e !== 0n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3500
     * @tc.name testBigInt64ArraySomeTwo035
     * @tc.desc Verify some with index-based predicate matches only even indices.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let res = arr.some((e: bigint, i: int) => i % 2 === 0 && e === 30n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3600
     * @tc.name testBigInt64ArraySomeTwo036
     * @tc.desc Verify some with predicate comparing element to the first array element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 5n, 10n]);
      let res = arr.some((e: bigint, i: int, a: BigInt64Array) => e === a[0] && i > 0);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3700
     * @tc.name testBigInt64ArraySomeTwo037
     * @tc.desc Verify some on a 10-element array with no match executes callback for all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        arr[i] = BigInt(i);
      }
      let callCount = 0;
      let res = arr.some((e: bigint): boolean => { callCount++; return false; });
      expect(res).assertFalse();
      expect(callCount).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3800
     * @tc.name testBigInt64ArraySomeTwo038
     * @tc.desc Verify some with BigInt multiplication predicate matches the computed target.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let res = arr.some((e: bigint) => e * 2n === 6n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_3900
     * @tc.name testBigInt64ArraySomeTwo039
     * @tc.desc Verify some on array created from ArrayBuffer with byteOffset correctly finds element in viewed range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(32);
      let full = new BigInt64Array(buf);
      full[1] = 11n;
      full[2] = 22n;
      full[3] = 33n;
      let arr = new BigInt64Array(buf, 8, 3);
      let res = arr.some((e: bigint) => e === 22n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4000
     * @tc.name testBigInt64ArraySomeTwo040
     * @tc.desc Verify some with predicate checking near-MAX value returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775806n]);
      let res = arr.some((e: bigint) => e === 9223372036854775806n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4100
     * @tc.name testBigInt64ArraySomeTwo041
     * @tc.desc Verify some with predicate checking near-MIN value returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775807n]);
      let res = arr.some((e: bigint) => e === -9223372036854775807n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4200
     * @tc.name testBigInt64ArraySomeTwo042
     * @tc.desc Verify some with predicate checking for non-zero in an all-zero array returns false.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n]);
      let res = arr.some((e: bigint) => e > 0n || e < 0n);
      expect(res).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4300
     * @tc.name testBigInt64ArraySomeTwo043
     * @tc.desc Verify some with e + 1n arithmetic predicate matches the target value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n, 100n, 101n]);
      let res = arr.some((e: bigint) => e + 1n === 100n);
      expect(res).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4400
     * @tc.name testBigInt64ArraySomeTwo044
     * @tc.desc Verify some() result can be stored in a variable and reused correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let hasFive = arr.some((e: bigint) => e === 5n);
      let hasTwenty = arr.some((e: bigint) => e === 20n);
      expect(hasFive).assertTrue();
      expect(hasTwenty).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4500
     * @tc.name testBigInt64ArraySomeTwo045
     * @tc.desc Verify some after toReversed() on the result checks values in correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let rev = arr.toReversed();
      let res = rev.some((e: bigint) => e === 3n);
      expect(res).assertTrue();
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4600
     * @tc.name testBigInt64ArraySomeTwo046
     * @tc.desc Verify two different arrays produce independent and correct some() results.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new BigInt64Array([1n, 2n]);
      let arr2 = new BigInt64Array([3n, 4n]);
      let res1 = arr1.some((e: bigint) => e === 2n);
      let res2 = arr2.some((e: bigint) => e === 3n);
      expect(res1).assertTrue();
      expect(res2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4700
     * @tc.name testBigInt64ArraySomeTwo047
     * @tc.desc Verify some on array after comprehensive multi-method mutation chain.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 2, 4);
      arr.fill(10n, 3, 5);
      let res = arr.some((e: bigint) => e === 10n);
      expect(res).assertTrue();
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4800
     * @tc.name testBigInt64ArraySomeTwo048
     * @tc.desc Verify some callback indices remain correct after mutation of a later element during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let indices: int[] = [];
      arr.some((v: bigint, i: int): boolean => {
        indices.push(i);
        if (i === 0) {
          arr[2] = 99n;
        }
        return false;
      });
      expect(indices[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_4900
     * @tc.name testBigInt64ArraySomeTwo049
     * @tc.desc Verify some returns false when no element matches the search condition.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let found = false;
      let result = arr.some((v: bigint): boolean => {
        if (v === 99n) found = true;
        return v === 99n;
      });
      expect(found).assertFalse();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5000
     * @tc.name testBigInt64ArraySomeTwo050
     * @tc.desc Verify some callback receives the modified value after a prior write to a later index during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let receivedValue: bigint = 0n;
      arr.some((v: bigint, i: int): boolean => {
        if (i === 0) {
          arr[2] = 99n;
        }
        if (i === 2) {
          receivedValue = v;
        }
        return false;
      });
      expect(receivedValue).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5100
     * @tc.name testBigInt64ArraySomeTwo051
     * @tc.desc Verify some does not see mutations to already-visited elements during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let result = arr.some((v: bigint, i: int): boolean => {
        if (i === 1) {
          arr[0] = 99n;
        }
        return v === 99n;
      });
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5200
     * @tc.name testBigInt64ArraySomeTwo052
     * @tc.desc Verify some callback checking both element value and index parity.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 3n, 5n, 7n]);
      let result = arr.some((e: bigint, i: int): boolean => i % 2 === 1 && e > 0n);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5300
     * @tc.name testBigInt64ArraySomeTwo053
     * @tc.desc Verify some callback modifies external counter and verifies side effects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let counter = 0;
      arr.some((e: bigint): boolean => {
        counter++;
        return false;
      });
      expect(counter).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5400
     * @tc.name testBigInt64ArraySomeTwo054
     * @tc.desc Verify some with callback using BigInt arithmetic e*e in predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 5n, 10n]);
      let result = arr.some((e: bigint): boolean => e * e === 100n);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5500
     * @tc.name testBigInt64ArraySomeTwo055
     * @tc.desc Verify some callback receives the original array as the third parameter.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let result = arr.some((e: bigint, i: int, a: BigInt64Array): boolean => {
        return a === arr && a[2] === 3n;
      });
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5600
     * @tc.name testBigInt64ArraySomeTwo056
     * @tc.desc Verify some result consistent with includes for same membership predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 15n, 25n, 35n]);
      let hasValue = arr.some((e: bigint): boolean => e === 15n);
      let includesValue = arr.includes(15n);
      expect(hasValue).assertEqual(includesValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5700
     * @tc.name testBigInt64ArraySomeTwo057
     * @tc.desc Verify some returns true and find returns the matching element for the same predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n]);
      let found = arr.some((e: bigint): boolean => e > 150n);
      let match = arr.find((e: bigint): boolean => e > 150n);
      expect(found).assertTrue();
      expect(match).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5800
     * @tc.name testBigInt64ArraySomeTwo058
     * @tc.desc Verify some and every are NOT equivalent on the same array with the same predicate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let someEven = arr.some((e: bigint): boolean => e % 2n === 0n);
      let everyEven = arr.every((e: bigint): boolean => e % 2n === 0n);
      expect(someEven).assertTrue();
      expect(everyEven).assertFalse();
      expect(someEven !== everyEven).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_5900
     * @tc.name testBigInt64ArraySomeTwo059
     * @tc.desc Verify if some returns true, filter with same predicate returns non-empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 6n, 9n, 12n]);
      let hasMatch = arr.some((e: bigint): boolean => e % 3n === 0n);
      let filtered = arr.filter((e: bigint): boolean => e % 3n === 0n);
      expect(hasMatch).assertTrue();
      expect(filtered[0]).assertEqual(3n);
      expect(filtered[3]).assertEqual(12n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_6000
     * @tc.name testBigInt64ArraySomeTwo060
     * @tc.desc Verify some on subarray only iterates subarray elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let sub = arr.subarray(2, 5);
      let elements: bigint[] = [];
      sub.some((e: bigint): boolean => {
        elements.push(e);
        return false;
      });
      expect(elements[0]).assertEqual(3n);
      expect(elements[1]).assertEqual(4n);
      expect(elements[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_6100
     * @tc.name testBigInt64ArraySomeTwo061
     * @tc.desc Verify some callback comparing with MAX returns true when MAX is present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 9223372036854775807n, 3n]);
      let result = arr.some((e: bigint): boolean => e === 9223372036854775807n);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_6200
     * @tc.name testBigInt64ArraySomeTwo062
     * @tc.desc Verify some callback comparing with MIN returns true when MIN is present.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -9223372036854775808n, 3n]);
      let result = arr.some((e: bigint): boolean => e === -9223372036854775808n);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_6300
     * @tc.name testBigInt64ArraySomeTwo063
     * @tc.desc Verify some callback e > MAX-1n on [MAX] returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n]);
      let result = arr.some((e: bigint): boolean => e > 9223372036854775807n - 1n);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_6400
     * @tc.name testBigInt64ArraySomeTwo064
     * @tc.desc Verify some callback e < MIN+1n on [MIN] returns true.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n]);
      let result = arr.some((e: bigint): boolean => e < -9223372036854775808n + 1n);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_SOME_TWO_6500
     * @tc.name testBigInt64ArraySomeTwo065
     * @tc.desc Verify the number of iterations of some on a length-constructed zero-padded array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArraySomeTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(5);
      arr[2] = 99n;
      let callCount = 0;
      arr.some((v: bigint, i: int): boolean => {
        callCount++;
        return v === 99n;
      });
      expect(callCount).assertEqual(3);
    });

  });
}
