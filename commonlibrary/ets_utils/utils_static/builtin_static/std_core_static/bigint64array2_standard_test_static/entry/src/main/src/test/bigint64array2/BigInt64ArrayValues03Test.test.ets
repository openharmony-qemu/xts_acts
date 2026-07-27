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

export default function BigInt64ArrayValues03Test(): void {
  describe('BigInt64ArrayValues03Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_0100
     * @tc.name testBigInt64ArrayValuesThree001
     * @tc.desc Verify for-of over values() yields elements in insertion order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n]);
      let vals: bigint[] = [];
      for (let v of arr.values()) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(100n);
      expect(vals[1]).assertEqual(200n);
      expect(vals[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_0200
     * @tc.name testBigInt64ArrayValuesThree002
     * @tc.desc Verify for-of over values() on a 5-element array yields correct last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let last = 0n;
      for (let v of arr.values()) {
        last = v;
      }
      expect(last).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_0300
     * @tc.name testBigInt64ArrayValuesThree003
     * @tc.desc Verify break in for-of over values() stops iteration at the first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n, 33n]);
      let first = 0n;
      for (let val of arr.values()) {
        first = val;
        break;
      }
      expect(first).assertEqual(11n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_0400
     * @tc.name testBigInt64ArrayValuesThree004
     * @tc.desc Verify break before any counting keeps count at zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n]);
      let count = 0;
      for (let val of arr.values()) {
        if (val === 11n) {
          break;
        }
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_0500
     * @tc.name testBigInt64ArrayValuesThree005
     * @tc.desc Verify break on the fourth element yields count equal to four.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let count = 0;
      for (let v of arr.values()) {
        count++;
        if (v === 4n) {
          break;
        }
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_0600
     * @tc.name testBigInt64ArrayValuesThree006
     * @tc.desc Verify break on first element of a mixed-sign array preserves the first value only.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-5n, 10n, -15n]);
      let first = 0n;
      for (let v of arr.values()) {
        first = v;
        break;
      }
      expect(first).assertEqual(-5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_0700
     * @tc.name testBigInt64ArrayValuesThree007
     * @tc.desc Verify continue skips the first value and collects the second.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([11n, 22n]);
      let collected = 0n;
      for (let val of arr.values()) {
        if (val === 11n) {
          continue;
        }
        collected = val;
      }
      expect(collected).assertEqual(22n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_0800
     * @tc.name testBigInt64ArrayValuesThree008
     * @tc.desc Verify continue skips zero values and counts only non-zero.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 5n, 0n, 10n]);
      let count = 0;
      for (let v of arr.values()) {
        if (v === 0n) {
          continue;
        }
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_0900
     * @tc.name testBigInt64ArrayValuesThree009
     * @tc.desc Verify values() iterator next() returns both value and done=false for non-exhausted elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([55n, 66n]);
      let iter = arr.values();
      let r1 = iter.next();
      expect(r1.value).assertEqual(55n);
      expect(r1.done).assertFalse();
      let r2 = iter.next();
      expect(r2.value).assertEqual(66n);
      expect(r2.done).assertFalse();
      let r3 = iter.next();
      expect(r3.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1000
     * @tc.name testBigInt64ArrayValuesThree010
     * @tc.desc Verify continue skips negative values and sums only positive values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-1n, 3n, -2n, 4n]);
      let sum = 0n;
      for (let v of arr.values()) {
        if (v < 0n) {
          continue;
        }
        sum += v;
      }
      expect(sum).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1100
     * @tc.name testBigInt64ArrayValuesThree011
     * @tc.desc Verify continue with break combination skips and then stops.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let count = 0;
      for (let v of arr.values()) {
        if (v === 1n) {
          continue;
        }
        count++;
        if (v === 3n) {
          break;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1200
     * @tc.name testBigInt64ArrayValuesThree012
     * @tc.desc Verify continue on all but last element yields only the last element counted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let last = 0n;
      let count = 0;
      for (let v of arr.values()) {
        if (v !== 3n) {
          continue;
        }
        last = v;
        count++;
      }
      expect(last).assertEqual(3n);
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1300
     * @tc.name testBigInt64ArrayValuesThree013
     * @tc.desc Verify values() for-of iteration order matches direct index access and visits all elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n]);
      let idx = 0;
      for (let v of arr.values()) {
        expect(v).assertEqual(arr[idx]);
        idx++;
      }
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1400
     * @tc.name testBigInt64ArrayValuesThree014
     * @tc.desc Verify mutating the current element during for-of does not retroactively change the current value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let collected: bigint[] = [];
      for (let v of arr) {
        collected.push(v);
        arr[0] = 99n;
      }
      expect(collected[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1500
     * @tc.name testBigInt64ArrayValuesThree015
     * @tc.desc Verify mutating a future element to MAX is reflected during for-of.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let vals: bigint[] = [];
      for (let v of arr) {
        vals.push(v);
        if (v === 2n) {
          arr[2] = 9223372036854775807n;
        }
      }
      expect(vals[2]).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1600
     * @tc.name testBigInt64ArrayValuesThree016
     * @tc.desc Verify mutating a future element to MIN is reflected during for-of.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let vals: bigint[] = [];
      for (let v of arr) {
        vals.push(v);
        if (v === 2n) {
          arr[2] = -9223372036854775808n;
        }
      }
      expect(vals[2]).assertEqual(-9223372036854775808n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1700
     * @tc.name testBigInt64ArrayValuesThree017
     * @tc.desc Verify for-of over a 30-element array with mutation of a far future element reflects the change.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(30);
      for (let i = 0; i < 30; i++) {
        arr[i] = BigInt(i);
      }
      let captured = 0n;
      let idx = 0;
      for (let v of arr) {
        if (idx === 25) {
          captured = v;
        }
        if (idx === 0) {
          arr[25] = 999n;
        }
        idx++;
      }
      expect(captured).assertEqual(999n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1800
     * @tc.name testBigInt64ArrayValuesThree018
     * @tc.desc Verify values() iterator created after modifying the array reflects the updated element value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      arr[0] = 99n;
      let iter = arr.values();
      expect(iter.next().value).assertEqual(99n);
      expect(iter.next().value).assertEqual(20n);
      expect(iter.next().value).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_1900
     * @tc.name testBigInt64ArrayValuesThree019
     * @tc.desc Verify for-of over values() on BigInt64Array.of() yields all constructed elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.of(7n, 14n, 21n, 28n);
      let count = 0;
      for (let v of arr.values()) {
        count++;
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2000
     * @tc.name testBigInt64ArrayValuesThree020
     * @tc.desc Verify for-of over BigInt64Array.from() with mapping function yields mapped values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = BigInt64Array.from([1n, 2n, 3n], (x: bigint) => x * 10n);
      let sum = 0n;
      for (let v of arr) {
        sum += v;
      }
      expect(sum).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2100
     * @tc.name testBigInt64ArrayValuesThree021
     * @tc.desc Verify for-of over array from ArrayBuffer with pre-set values iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(16);
      let arr = new BigInt64Array(buf);
      arr[0] = 100n;
      arr[1] = 200n;
      let vals: bigint[] = [];
      for (let v of arr) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(100n);
      expect(vals[1]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2200
     * @tc.name testBigInt64ArrayValuesThree022
     * @tc.desc Verify for-of over array created by copying another BigInt64Array iterates the copied values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new BigInt64Array([9n, 8n, 7n]);
      let arr = new BigInt64Array(src);
      let idx = 0;
      let expected = [9n, 8n, 7n];
      for (let v of arr) {
        expect(v).assertEqual(expected[idx]);
        idx++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2300
     * @tc.name testBigInt64ArrayValuesThree023
     * @tc.desc Verify for-of over values() on a subarray traverses only the viewed elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sub = arr.subarray(1, 3);
      let count = 0;
      for (let v of sub.values()) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2400
     * @tc.name testBigInt64ArrayValuesThree024
     * @tc.desc Verify for-of directly on a subarray yields correct element values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(1, 3);
      let vals: bigint[] = [];
      for (let v of sub) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(2n);
      expect(vals[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2500
     * @tc.name testBigInt64ArrayValuesThree025
     * @tc.desc Verify for-of directly on a subarray(-1) yields only the last element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(-1);
      let count = 0;
      let val = 0n;
      for (let v of sub) {
        val = v;
        count++;
      }
      expect(count).assertEqual(1);
      expect(val).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2600
     * @tc.name testBigInt64ArrayValuesThree026
     * @tc.desc Verify for-of over values() on a zero-length subarray runs zero times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let sub = arr.subarray(0, 0);
      let count = 0;
      for (let v of sub.values()) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2700
     * @tc.name testBigInt64ArrayValuesThree027
     * @tc.desc Verify for-of over subarray reflects mutation through the parent array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let sub = arr.subarray(1, 3);
      arr[1] = 99n;
      let vals: bigint[] = [];
      for (let v of sub) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2800
     * @tc.name testBigInt64ArrayValuesThree028
     * @tc.desc Verify for-of over subarray after parent mutation to MAX boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n]);
      let sub = arr.subarray(0);
      arr[0] = 9223372036854775807n;
      let val = 0n;
      for (let v of sub) {
        val = v;
        break;
      }
      expect(val).assertEqual(9223372036854775807n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_2900
     * @tc.name testBigInt64ArrayValuesThree029
     * @tc.desc Verify for-of over subarray on an all-zero parent yields zeros for the viewed range.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([0n, 0n, 0n, 0n]);
      let sub = arr.subarray(1, 3);
      let sum = 0n;
      for (let v of sub) {
        sum += v;
      }
      expect(sum).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3000
     * @tc.name testBigInt64ArrayValuesThree030
     * @tc.desc Verify for-of directly on BigInt64Array (implicit iterator) yields all elements into new array.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n]);
      let result: bigint[] = [];
      for (let val of arr) {
        result.push(val);
      }
      expect(result[0]).assertEqual(5n);
      expect(result[1]).assertEqual(10n);
      expect(result[2]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3100
     * @tc.name testBigInt64ArrayValuesThree031
     * @tc.desc Verify for-of over a partially consumed iterator yields only remaining elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let iter = arr.values();
      iter.next();
      let count = 0;
      for (let val of iter) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3200
     * @tc.name testBigInt64ArrayValuesThree032
     * @tc.desc Verify for-of over partially consumed iterator with two pre-consumed elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      let iter = arr.values();
      iter.next();
      iter.next();
      let count = 0;
      for (let val of iter) {
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3300
     * @tc.name testBigInt64ArrayValuesThree033
     * @tc.desc Verify for-of over exhausted iterator (all consumed beforehand) runs zero times.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n]);
      let iter = arr.values();
      iter.next();
      iter.next();
      let count = 0;
      for (let val of iter) {
        count++;
      }
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3400
     * @tc.name testBigInt64ArrayValuesThree034
     * @tc.desc Verify for-of over values() breaking at a MAX value collects elements up to that point.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 9223372036854775807n, 4n]);
      let count = 0;
      for (let v of arr.values()) {
        count++;
        if (v === 9223372036854775807n) {
          break;
        }
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3500
     * @tc.name testBigInt64ArrayValuesThree035
     * @tc.desc Verify for-of over toSorted() result iterates all sorted elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([3n, 1n, 2n]);
      let sorted = arr.toSorted();
      let prev = sorted[0];
      let isAscending = true;
      for (let v of sorted) {
        if (v < prev) { isAscending = false; }
        prev = v;
      }
      expect(isAscending).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3600
     * @tc.name testBigInt64ArrayValuesThree036
     * @tc.desc Verify for-of over toReversed() result iterates in reversed order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let rev = arr.toReversed();
      let vals: bigint[] = [];
      for (let v of rev) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(3n);
      expect(vals[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3700
     * @tc.name testBigInt64ArrayValuesThree037
     * @tc.desc Verify for-of over slice() result iterates only the sliced elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let sli = arr.slice(1, 3);
      let count = 0;
      for (let v of sli) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3800
     * @tc.name testBigInt64ArrayValuesThree038
     * @tc.desc Verify for-of over with() result iterates with the modified element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let modified = arr.with(0, 99n);
      let first = 0n;
      for (let v of modified) {
        first = v;
        break;
      }
      expect(first).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_3900
     * @tc.name testBigInt64ArrayValuesThree039
     * @tc.desc Verify for-of over filter() result iterates only the matching elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n]);
      let filtered = arr.filter((x: bigint) => x > 0n);
      let count = 0;
      for (let v of filtered) {
        expect(v > 0n).assertTrue();
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4000
     * @tc.name testBigInt64ArrayValuesThree040
     * @tc.desc Verify for-of over map() result iterates transformed values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let mapped = arr.map((x: bigint) => x * 10n);
      let sum = 0n;
      for (let v of mapped) {
        sum += v;
      }
      expect(sum).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4100
     * @tc.name testBigInt64ArrayValuesThree041
     * @tc.desc Verify for-of over fill() result iterates with the filled value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let filled = arr.fill(99n, 0, 2);
      let count = 0;
      for (let v of filled) {
        if (count < 2) { expect(v).assertEqual(99n); }
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4200
     * @tc.name testBigInt64ArrayValuesThree042
     * @tc.desc Verify for-of over copyWithin() result iterates with copied values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let copied = arr.copyWithin(0, 2);
      let vals: bigint[] = [];
      for (let v of copied) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(3n);
      expect(vals[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4300
     * @tc.name testBigInt64ArrayValuesThree043
     * @tc.desc Verify for-of over subarray from indexOf location iterates from the found position.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let idx = arr.indexOf(30n);
      let sub = arr.subarray(idx);
      let count = 0;
      for (let v of sub) {
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4400
     * @tc.name testBigInt64ArrayValuesThree044
     * @tc.desc Verify for-of with values() breaks at last element and counts all four elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 20n]);
      let count = 0;
      for (let v of arr.values()) {
        count++;
        if (v === 20n) {
          break;
        }
      }
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4500
     * @tc.name testBigInt64ArrayValuesThree045
     * @tc.desc Verify for-of over a 50-element array counts all elements correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(50);
      for (let i = 0; i < 50; i++) {
        arr[i] = BigInt(i);
      }
      let count = 0;
      for (let v of arr) {
        count++;
      }
      expect(count).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4600
     * @tc.name testBigInt64ArrayValuesThree046
     * @tc.desc Verify for-of over a 100-element reverse-sorted array yields correct first element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(99 - i);
      }
      let first = 0n;
      let count = 0;
      for (let v of arr) {
        if (count === 0) { first = v; }
        count++;
      }
      expect(first).assertEqual(99n);
      expect(count).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4700
     * @tc.name testBigInt64ArrayValuesThree047
     * @tc.desc Verify for-of over values() with all-MAX array yields correct count and values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([9223372036854775807n, 9223372036854775807n, 9223372036854775807n]);
      let count = 0;
      for (let v of arr.values()) {
        expect(v).assertEqual(9223372036854775807n);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4800
     * @tc.name testBigInt64ArrayValuesThree048
     * @tc.desc Verify for-of over values() with all-MIN array yields correct count and values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([-9223372036854775808n, -9223372036854775808n, -9223372036854775808n]);
      let count = 0;
      for (let v of arr.values()) {
        expect(v).assertEqual(-9223372036854775808n);
        count++;
      }
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_4900
     * @tc.name testBigInt64ArrayValuesThree049
     * @tc.desc Verify for-of with alternating signs preserves all six elements in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n, 3n, -3n]);
      let vals: bigint[] = [];
      for (let v of arr) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(1n);
      expect(vals[5]).assertEqual(-3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5000
     * @tc.name testBigInt64ArrayValuesThree050
     * @tc.desc Verify for-of over values() with sequential powers of 2 iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 4n, 8n, 16n, 32n]);
      let product = 1n;
      for (let v of arr.values()) {
        product *= v;
      }
      expect(product).assertEqual(32768n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5100
     * @tc.name testBigInt64ArrayValuesThree051
     * @tc.desc Verify for-of with both break and continue in the same loop counts correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, -1n, 2n, -2n, 3n]);
      let count = 0;
      for (let v of arr) {
        if (v < 0n) { continue; }
        if (v === 3n) { break; }
        count++;
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5200
     * @tc.name testBigInt64ArrayValuesThree052
     * @tc.desc Verify for-of on large array with step tracking validates every 10th element.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(100);
      for (let i = 0; i < 100; i++) {
        arr[i] = BigInt(i);
      }
      let index = 0;
      let match = true;
      for (let v of arr) {
        if (index % 10 === 0 && v !== BigInt(index)) { match = false; }
        index++;
      }
      expect(match).assertTrue();
      expect(index).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5300
     * @tc.name testBigInt64ArrayValuesThree053
     * @tc.desc Verify for-of over manual collection preserves all 10 elements in correct order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array(10);
      for (let i = 0; i < 10; i++) {
        arr[i] = BigInt(i * 10);
      }
      let vals: bigint[] = [];
      for (let v of arr) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(0n);
      expect(vals[5]).assertEqual(50n);
      expect(vals[9]).assertEqual(90n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5400
     * @tc.name testBigInt64ArrayValuesThree054
     * @tc.desc Verify spread operator [...arr.values()] produces correct array of bigint values.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([5n, 10n, 15n, 20n]);
      let vals: bigint[] = [...arr.values()];
      expect(vals[0]).assertEqual(5n);
      expect(vals[1]).assertEqual(10n);
      expect(vals[2]).assertEqual(15n);
      expect(vals[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5500
     * @tc.name testBigInt64ArrayValuesThree055
     * @tc.desc Verify Array.from(arr.values()) collects all bigint values correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([7n, 14n, 21n, 28n]);
      let vals: bigint[] = Array.from(arr.values());
      expect(vals[0]).assertEqual(7n);
      expect(vals[1]).assertEqual(14n);
      expect(vals[2]).assertEqual(21n);
      expect(vals[3]).assertEqual(28n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5600
     * @tc.name testBigInt64ArrayValuesThree056
     * @tc.desc Verify for-of over values() with manual index tracking matches element positions.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([100n, 200n, 300n, 400n]);
      let idx = 0;
      let expected = [100n, 200n, 300n, 400n];
      let allMatch = true;
      for (let v of arr.values()) {
        if (v !== expected[idx]) {
          allMatch = false;
        }
        idx++;
      }
      expect(allMatch).assertTrue();
      expect(idx).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5700
     * @tc.name testBigInt64ArrayValuesThree057
     * @tc.desc Verify nested for-of on two independent iterators simultaneously iterates correctly.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n]);
      let outerCount = 0;
      for (let v1 of arr.values()) {
        let iter2 = arr.values();
        let innerCount = 0;
        for (let v2 of iter2) {
          innerCount++;
        }
        expect(innerCount).assertEqual(3);
        outerCount++;
      }
      expect(outerCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5800
     * @tc.name testBigInt64ArrayValuesThree058
     * @tc.desc Verify for-of over values() with conditional break based on value content.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 99n, 4n, 5n]);
      let count = 0;
      let found = false;
      for (let v of arr.values()) {
        count++;
        if (v > 50n) {
          found = true;
          break;
        }
      }
      expect(found).assertTrue();
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_5900
     * @tc.name testBigInt64ArrayValuesThree059
     * @tc.desc Verify subarray(-1).values() iterator yields only the last element and then done.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      let iter = arr.subarray(-1).values();
      let first = iter.next();
      expect(first.value).assertEqual(40n);
      expect(first.done).assertFalse();
      let second = iter.next();
      expect(second.done).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_6000
     * @tc.name testBigInt64ArrayValuesThree060
     * @tc.desc Verify subarray with negative begin and positive end values() yields correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n, 40n, 50n]);
      let sub = arr.subarray(-3, 4);
      let vals: bigint[] = [];
      for (let v of sub.values()) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(30n);
      expect(vals[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_6100
     * @tc.name testBigInt64ArrayValuesThree061
     * @tc.desc Verify nested subarray values (subarray of subarray) iteration yields correct elements.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let outer = arr.subarray(1, 5);
      let inner = outer.subarray(1, 3);
      let vals: bigint[] = [];
      for (let v of inner.values()) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(3n);
      expect(vals[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_6200
     * @tc.name testBigInt64ArrayValuesThree062
     * @tc.desc Verify values() iteration reflects parent array element modification mid-iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let vals: bigint[] = [];
      let idx = 0;
      for (let v of arr.values()) {
        vals.push(v);
        if (idx === 1) {
          arr[2] = 99n;
          arr[3] = 88n;
        }
        idx++;
      }
      expect(vals[2]).assertEqual(99n);
      expect(vals[3]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_6300
     * @tc.name testBigInt64ArrayValuesThree063
     * @tc.desc Verify values() iterator created before array mutation reflects mutations during iteration.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([10n, 20n, 30n]);
      let iter = arr.values();
      arr[0] = 99n;
      arr[1] = 88n;
      arr[2] = 77n;
      let vals: bigint[] = [];
      for (let v of iter) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(99n);
      expect(vals[1]).assertEqual(88n);
      expect(vals[2]).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_6400
     * @tc.name testBigInt64ArrayValuesThree064
     * @tc.desc Verify values() iterator captures values lazily by mutating the array between next() calls.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      let iter = arr.values();
      let first = iter.next();
      arr[1] = 99n;
      let second = iter.next();
      arr[2] = 88n;
      let third = iter.next();
      arr[3] = 77n;
      let fourth = iter.next();
      expect(first.value).assertEqual(1n);
      expect(second.value).assertEqual(99n);
      expect(third.value).assertEqual(88n);
      expect(fourth.value).assertEqual(77n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIG_INT64_ARRAY_VALUES_THREE_6500
     * @tc.name testBigInt64ArrayValuesThree065
     * @tc.desc Verify values() on array with alternating MAX and MIN values yields correct sequence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayValuesThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxVal = 9223372036854775807n;
      let minVal = -9223372036854775808n;
      let arr = new BigInt64Array([maxVal, minVal, maxVal, minVal]);
      let vals: bigint[] = [];
      for (let v of arr.values()) {
        vals.push(v);
      }
      expect(vals[0]).assertEqual(maxVal);
      expect(vals[1]).assertEqual(minVal);
      expect(vals[2]).assertEqual(maxVal);
      expect(vals[3]).assertEqual(minVal);
    });

  });
}
