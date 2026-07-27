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

export default function BigInt64ArrayValues02Test(): void {
  describe('BigInt64ArrayValues02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_0100
     * @tc.name testBigInt64ArrayValuesTwo001
     * @tc.desc Verify first next().done is true for a empty-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array();
      let iter = arr.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_0200
     * @tc.name testBigInt64ArrayValuesTwo002
     * @tc.desc Verify next().done is true after a two-element iterator is exhausted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.values();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_0300
     * @tc.name testBigInt64ArrayValuesTwo003
     * @tc.desc Verify second next().done is false for a two-element array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.values();
      iter.next();
      expect(iter.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_0400
     * @tc.name testBigInt64ArrayValuesTwo004
     * @tc.desc Verify done progression: three false then true, with first value check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 6n, 7n]);
      let iter = arr.values();
      let r1 = iter.next();
      expect(r1.done).assertFalse();
      expect(r1.value).assertEqual(5n);
      let r2 = iter.next();
      expect(r2.done).assertFalse();
      let r3 = iter.next();
      expect(r3.done).assertFalse();
      let r4 = iter.next();
      expect(r4.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_0500
     * @tc.name testBigInt64ArrayValuesTwo005
     * @tc.desc Verify values() on BigInt64Array.from() with mapping function yields mapped values via for-of.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([5n, 10n, 15n], (x: bigint): bigint => x * 2n);
      let results: bigint[] = [];
      for (let v of arr.values()) {
        results.push(v);
      }
      expect(results[0]).assertEqual(10n);
      expect(results[1]).assertEqual(20n);
      expect(results[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_0600
     * @tc.name testBigInt64ArrayValuesTwo006
     * @tc.desc Verify exhausting one iterator early does not affect another from the same array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n]);
      let iter1 = arr.values();
      let iter2 = arr.values();
      iter1.next();
      iter1.next();
      expect(iter2.next().done).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_0700
     * @tc.name testBigInt64ArrayValuesTwo007
     * @tc.desc Verify multiple iterators from the same empty array are independent and all report done.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([]);
      let iter1 = arr.values();
      let iter2 = arr.values();
      let iter3 = arr.values();
      expect(iter1.next().done).assertTrue();
      expect(iter2.next().done).assertTrue();
      expect(iter3.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_0800
     * @tc.name testBigInt64ArrayValuesTwo008
     * @tc.desc Verify three values() calls on the same array return distinct iterator objects.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let iter1 = arr.values();
      let iter2 = arr.values();
      let iter3 = arr.values();
      expect(iter1 !== iter2).assertTrue();
      expect(iter2 !== iter3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_0900
     * @tc.name testBigInt64ArrayValuesTwo009
     * @tc.desc Verify two iterators from different arrays with shared buffer keep independent values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(16);
      let arr1 = new BigInt64Array(buffer, 0, 1);
      let arr2 = new BigInt64Array(buffer, 8, 1);
      arr1[0] = 1n;
      arr2[0] = 2n;
      let it1 = arr1.values();
      let it2 = arr2.values();
      expect(it1.next().value).assertEqual(1n);
      expect(it2.next().value).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1000
     * @tc.name testBigInt64ArrayValuesTwo010
     * @tc.desc Verify iterator reflects a modified remaining element after advancing once.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let iter = arr.values();
      iter.next();
      arr[1] = 9223372036854775807n;
      expect(iter.next().value).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1100
     * @tc.name testBigInt64ArrayValuesTwo011
     * @tc.desc Verify iterator reflects MIN plus one written to an element before iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let iter = arr.values();
      arr[0] = -9223372036854775808n + 1n;
      expect(iter.next().value).assertEqual(-9223372036854775808n + 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1200
     * @tc.name testBigInt64ArrayValuesTwo012
     * @tc.desc Verify iterator reflects MAX minus one written to an element before iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n]);
      let iter = arr.values();
      arr[0] = 9223372036854775807n - 1n;
      expect(iter.next().value).assertEqual(9223372036854775807n - 1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1300
     * @tc.name testBigInt64ArrayValuesTwo013
     * @tc.desc Verify iterator reflects 0n after the element is updated to zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([99n]);
      let iter = arr.values();
      arr[0] = 0n;
      expect(iter.next().value).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1400
     * @tc.name testBigInt64ArrayValuesTwo014
     * @tc.desc Verify iterator does not reflect writes after exhaustion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n]);
      let iter = arr.values();
      iter.next();
      arr[0] = 99n;
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1500
     * @tc.name testBigInt64ArrayValuesTwo015
     * @tc.desc Verify values on an out-of-range subarray returns an empty iterator.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(10, 20);
      let iter = sub.values();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1600
     * @tc.name testBigInt64ArrayValuesTwo016
     * @tc.desc Verify values on a subarray(1, 2) yields exactly one element then done.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(1, 2);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1700
     * @tc.name testBigInt64ArrayValuesTwo017
     * @tc.desc Verify values on a subarray(-3, -1) traverses the expected two-element view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-3, -1);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(1n);
      expect(iter.next().value).assertEqual(2n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1800
     * @tc.name testBigInt64ArrayValuesTwo018
     * @tc.desc Verify changes through a subarray view are reflected by an iterator from the parent.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let sub = arr.subarray(0);
      let iter = arr.values();
      sub[0] = 55n;
      expect(iter.next().value).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_1900
     * @tc.name testBigInt64ArrayValuesTwo019
     * @tc.desc Verify changes through the parent array are reflected by an iterator from the subarray.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let sub = arr.subarray(0);
      let iter = sub.values();
      arr[0] = 66n;
      expect(iter.next().value).assertEqual(66n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2000
     * @tc.name testBigInt64ArrayValuesTwo020
     * @tc.desc Verify write through subarray is reflected in parent values iterator for a future element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(1, 3);
      let iter = arr.values();
      iter.next();
      sub[0] = 99n;
      expect(iter.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2100
     * @tc.name testBigInt64ArrayValuesTwo021
     * @tc.desc Verify iterator from offset view reflects write through the full-array view.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let full = new BigInt64Array(buffer);
      full[0] = 1n;
      full[1] = 2n;
      let offset = new BigInt64Array(buffer, 8);
      let iter = offset.values();
      full[1] = 99n;
      expect(iter.next().value).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2200
     * @tc.name testBigInt64ArrayValuesTwo022
     * @tc.desc Verify two independent subarray iterators over separate buffer regions keep values separate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer = new ArrayBuffer(24);
      let arr1 = new BigInt64Array(buffer, 0, 2);
      let arr2 = new BigInt64Array(buffer, 16, 1);
      arr1[0] = 10n;
      arr2[0] = 20n;
      let it1 = arr1.values();
      let it2 = arr2.values();
      expect(it1.next().value).assertEqual(10n);
      expect(it2.next().value).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2300
     * @tc.name testBigInt64ArrayValuesTwo023
     * @tc.desc Verify repeated next() on exhausted subarray iterator stays done.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 1);
      let iter = sub.values();
      iter.next();
      iter.next();
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2400
     * @tc.name testBigInt64ArrayValuesTwo024
     * @tc.desc Verify for-of over values() traverses all elements with correct count and last value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let count = 0;
      let last = 0n;
      for (let v of arr.values()) {
        last = v;
        count++;
      }
      expect(count).assertEqual(3);
      expect(last).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2500
     * @tc.name testBigInt64ArrayValuesTwo025
     * @tc.desc Verify for-of over values() stops early when break is triggered mid-iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let count = 0;
      for (let v of arr.values()) {
        count++;
        if (v === 20n) {
          break;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2600
     * @tc.name testBigInt64ArrayValuesTwo026
     * @tc.desc Verify chained values().next().done is true for an empty array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let done = new BigInt64Array([]).values().next().done;
      expect(done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2700
     * @tc.name testBigInt64ArrayValuesTwo027
     * @tc.desc Verify for-of over values() on a BigInt64Array.of() result yields all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(7n, 14n, 21n);
      let count = 0;
      for (let v of arr.values()) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2800
     * @tc.name testBigInt64ArrayValuesTwo028
     * @tc.desc Verify for-of over values() on a length-only array yields 0n for each element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(4);
      let count = 0;
      for (let v of arr.values()) {
        expect(v).assertEqual(0n);
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_2900
     * @tc.name testBigInt64ArrayValuesTwo029
     * @tc.desc Verify values on a subarray of all-zero array returns 0n for each viewed element with done check.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n]);
      let sub = arr.subarray(1, 3);
      let iter = sub.values();
      expect(iter.next().value).assertEqual(0n);
      expect(iter.next().value).assertEqual(0n);
      expect(iter.next().done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_TWO_3000
     * @tc.name testBigInt64ArrayValuesTwo030
     * @tc.desc Verify values on array of mixed signs iterates correctly with state verification at each step.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, 0n, 5n]);
      let iter = arr.values();
      let r1 = iter.next();
      expect(r1.value).assertEqual(-5n);
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.value).assertEqual(0n);
      expect(r2.done).assertFalse();
      let r3 = iter.next();
      expect(r3.value).assertEqual(5n);
      expect(r3.done).assertFalse();
      let r4 = iter.next();
      expect(r4.done).assertTrue();
    });

  });
}

