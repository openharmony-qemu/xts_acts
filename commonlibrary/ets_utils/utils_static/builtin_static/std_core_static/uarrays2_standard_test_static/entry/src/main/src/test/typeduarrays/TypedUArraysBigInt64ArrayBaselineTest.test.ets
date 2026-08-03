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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

export default function bigInt64ArrayBaselineTest(): void {
  describe('BigInt64ArrayBaselineTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_0100
     * @tc.name testBigInt64ArrayBaseline001
     * @tc.desc Verify BigInt64Array construction with length parameter and static properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      expect(arr.length).assertEqual(4);
      expect(BigInt64Array.BYTES_PER_ELEMENT).assertEqual(8);
      expect(arr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_0200
     * @tc.name testBigInt64ArrayBaseline002
     * @tc.desc Verify BigInt64Array construction from array and element access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, -2n, BigInt('9223372036854775807'), -BigInt('9223372036854775808')]);
      const val0 = arr[0];
      expect(val0).assertEqual(1n);
      const val1 = arr[2];
      expect(val1).assertEqual(BigInt('9223372036854775807'));
      const val2 = arr[3];
      expect(val2).assertEqual(-BigInt('9223372036854775808'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_0300
     * @tc.name testBigInt64ArrayBaseline003
     * @tc.desc Verify BigInt64Array overflow behavior with out-of-range bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new BigInt64Array([BigInt('9223372036854775808')])[0]).assertEqual(-BigInt('9223372036854775808'));
      expect(new BigInt64Array([BigInt('18446744073709551616')])[0]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_0400
     * @tc.name testBigInt64ArrayBaseline004
     * @tc.desc Verify typeof element of BigInt64Array returns bigint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(typeof new BigInt64Array([1n])[0]).assertEqual('bigint');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_0500
     * @tc.name testBigInt64ArrayBaseline005
     * @tc.desc Verify BigInt64Array elements default to 0n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);

      const val3 = arr[0];
      expect(val3).assertEqual(0n);
      const val4 = arr[1];
      expect(val4).assertEqual(0n);
      const val5 = arr[2];
      expect(val5).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_0600
     * @tc.name testBigInt64ArrayBaseline006
     * @tc.desc Verify BigInt64Array construction with ArrayBuffer and byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer = new ArrayBuffer(64);
      const arr = new BigInt64Array(buffer, 0, 4);
      expect(arr.length).assertEqual(4);
      expect(arr.byteOffset).assertEqual(0);
      expect(arr.byteLength).assertEqual(32);
      arr[0] = 42n;
      expect(arr[0]).assertEqual(42n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_0700
     * @tc.name testBigInt64ArrayBaseline007
     * @tc.desc Verify BigInt64Array element access with bracket notation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([10n, 20n, 30n]);
      expect(arr[2]).assertEqual(30n);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_0800
     * @tc.name testBigInt64ArrayBaseline008
     * @tc.desc Verify BigInt64Array entries iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, -2n, 3n]);
      const entries = Array.from(arr.entries());
      expect(entries.length).assertEqual(3);
      const entryValue = entries[0];
      expect(entryValue[0]).assertEqual(0);
      expect(entryValue[1]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_0900
     * @tc.name testBigInt64ArrayBaseline009
     * @tc.desc Verify BigInt64Array every, filter and map methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.every(v => v > 0n)).assertTrue();
      expect(arr.filter(v => v > 1n).length).assertEqual(2);
      const mapped = arr.map(v => v * 2n);
      expect(mapped[0]).assertEqual(2n);
      expect(mapped[1]).assertEqual(4n);
      expect(mapped[2]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1000
     * @tc.name testBigInt64ArrayBaseline010
     * @tc.desc Verify BigInt64Array reduce method for sum aggregation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.reduce((a, b) => a + b)).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1100
     * @tc.name testBigInt64ArrayBaseline011
     * @tc.desc Verify BigInt64Array slice method for sub-array extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      const sliced = arr.slice(1, 3);
      expect(sliced[0]).assertEqual(2n);
      expect(sliced[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1200
     * @tc.name testBigInt64ArrayBaseline012
     * @tc.desc Verify BigInt64Array from and of static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fromArr = BigInt64Array.from([1n, 2n, 3n]);
      expect(fromArr[0]).assertEqual(1n);
      expect(fromArr[1]).assertEqual(2n);
      expect(fromArr[2]).assertEqual(3n);
      const ofArr = BigInt64Array.of(BigInt('9223372036854775807'), -BigInt('9223372036854775808'));
      expect(ofArr[0]).assertEqual(BigInt('9223372036854775807'));
      expect(ofArr[1]).assertEqual(-BigInt('9223372036854775808'));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1300
     * @tc.name testBigInt64ArrayBaseline013
     * @tc.desc Verify BigInt64Array set method for copying elements from another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(4);
      arr.set([10n, 20n, 30n], 1);
      expect(arr[0]).assertEqual(0n);
      expect(arr[1]).assertEqual(10n);
      expect(arr[2]).assertEqual(20n);
      expect(arr[3]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1400
     * @tc.name testBigInt64ArrayBaseline014
     * @tc.desc Verify BigInt64Array fill method to set all elements to a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array(3);
      arr.fill(7n);
      expect(arr[0]).assertEqual(7n);
      expect(arr[1]).assertEqual(7n);
      expect(arr[2]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1500
     * @tc.name testBigInt64ArrayBaseline015
     * @tc.desc Verify BigInt64Array copyWithin method for copying sequence within array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n, 4n, 5n]);
      arr.copyWithin(0, 3, 5);
      expect(arr[0]).assertEqual(4n);
      expect(arr[1]).assertEqual(5n);
      expect(arr[2]).assertEqual(3n);
      expect(arr[3]).assertEqual(4n);
      expect(arr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1600
     * @tc.name testBigInt64ArrayBaseline016
     * @tc.desc Verify BigInt64Array includes method for checking element presence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.includes(2n)).assertTrue();
      expect(arr.includes(5n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1700
     * @tc.name testBigInt64ArrayBaseline017
     * @tc.desc Verify BigInt64Array indexOf and lastIndexOf methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n, 2n, 1n]);
      expect(arr.indexOf(2n)).assertEqual(1);
      expect(arr.lastIndexOf(2n)).assertEqual(3);
      expect(arr.indexOf(5n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1800
     * @tc.name testBigInt64ArrayBaseline018
     * @tc.desc Verify BigInt64Array find and findIndex methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([10n, 20n, 30n, 40n]);
      const found = arr.find(v => v > 25n);
      expect(found).assertEqual(30n);
      const idx = arr.findIndex(v => v > 25n);
      expect(idx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_1900
     * @tc.name testBigInt64ArrayBaseline019
     * @tc.desc Verify BigInt64Array findLast and findLastIndex methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([10n, 20n, 30n, 20n]);
      const found = arr.findLast(v => v === 20n);
      expect(found).assertEqual(20n);
      const idx = arr.findLastIndex(v => v === 20n);
      expect(idx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2000
     * @tc.name testBigInt64ArrayBaseline020
     * @tc.desc Verify BigInt64Array some method for conditional element check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      expect(arr.some(v => v > 2n)).assertTrue();
      expect(arr.some(v => v > 5n)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2100
     * @tc.name testBigInt64ArrayBaseline021
     * @tc.desc Verify BigInt64Array forEach method executes callback for each element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sum = 0n;
      const arr = new BigInt64Array([1n, 2n, 3n]);
      arr.forEach(v => {
        sum += v;
      });
      expect(sum).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2200
     * @tc.name testBigInt64ArrayBaseline022
     * @tc.desc Verify BigInt64Array reverse method reverses the array in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      arr.reverse();
      expect(arr[0]).assertEqual(3n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2300
     * @tc.name testBigInt64ArrayBaseline023
     * @tc.desc Verify BigInt64Array sort method sorts elements in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([3n, 1n, 2n]);
      arr.sort();
      expect(arr[0]).assertEqual(1n);
      expect(arr[1]).assertEqual(2n);
      expect(arr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2400
     * @tc.name testBigInt64ArrayBaseline024
     * @tc.desc Verify BigInt64Array reduceRight method for right-to-left aggregation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      const result = arr.reduceRight((a, b) => a - b);
      expect(result).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2500
     * @tc.name testBigInt64ArrayBaseline025
     * @tc.desc Verify BigInt64Array join method concatenates elements as comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      const joined = arr.join();
      expect(joined).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2600
     * @tc.name testBigInt64ArrayBaseline026
     * @tc.desc Verify BigInt64Array valueOf method returns the typed array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      const same = arr.valueOf();
      expect(same[0]).assertEqual(1n);
      expect(same[1]).assertEqual(2n);
      expect(same[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2700
     * @tc.name testBigInt64ArrayBaseline027
     * @tc.desc Verify BigInt64Array keys and values methods return iterators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      const keys = Array.from(arr.keys());
      expect(keys.length).assertEqual(3);
      expect(keys[0]).assertEqual(0);
      expect(keys[1]).assertEqual(1);
      expect(keys[2]).assertEqual(2);
      const values = Array.from(arr.values());
      expect(values[0]).assertEqual(1n);
      expect(values[1]).assertEqual(2n);
      expect(values[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2800
     * @tc.name testBigInt64ArrayBaseline028
     * @tc.desc Verify BigInt64Array subarray method creates view of portion of array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n, 4n]);
      const sub = arr.subarray(1, 3);
      expect(sub.length).assertEqual(2);
      expect(sub[0]).assertEqual(2n);
      expect(sub[1]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_2900
     * @tc.name testBigInt64ArrayBaseline029
     * @tc.desc Verify BigInt64Array toReversed method returns reversed copy without modifying original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      const reversed = arr.toReversed();
      expect(reversed[0]).assertEqual(3n);
      expect(reversed[1]).assertEqual(2n);
      expect(reversed[2]).assertEqual(1n);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_3000
     * @tc.name testBigInt64ArrayBaseline030
     * @tc.desc Verify BigInt64Array toSorted method returns sorted copy without modifying original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([3n, 1n, 2n]);
      const sorted = arr.toSorted();
      expect(sorted[0]).assertEqual(1n);
      expect(sorted[1]).assertEqual(2n);
      expect(sorted[2]).assertEqual(3n);
      expect(arr[0]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_3100
     * @tc.name testBigInt64ArrayBaseline031
     * @tc.desc Verify BigInt64Array toString method returns comma-separated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      const str = arr.toString();
      expect(str).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGINT64ARRAY_BASELINE_3200
     * @tc.name testBigInt64ArrayBaseline032
     * @tc.desc Verify BigInt64Array toLocaleString method returns locale-formatted string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testBigInt64ArrayBaseline032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new BigInt64Array([1n, 2n, 3n]);
      const str = arr.toLocaleString();
      expect(str).assertEqual('1,2,3');
    });

  });
}