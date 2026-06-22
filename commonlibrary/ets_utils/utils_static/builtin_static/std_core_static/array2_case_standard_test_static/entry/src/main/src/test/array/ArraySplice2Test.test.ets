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
import Utils from '../Util.test';

class SpliceItem032 {
  value: number = 0;
}

class SplicePerson036 {
  name: string = '';
}

function createRangeArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function spliceAnyNumberArrayTwo(value: Any, start: int): string {
  const arr = value as Array<number>;
  return arr.splice(start).toString() + '|' + arr.toString();
}

export default function ArraySplice2Test(): void {
  describe('ArraySplice2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_0100
     * @tc.name testArraySpliceTwo001
     * @tc.desc Verify splice with one start argument removes all elements from start to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.splice(1);
      expect(arr.length).assertEqual(1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('b');
      expect(result[1]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_0200
     * @tc.name testArraySpliceTwo002
     * @tc.desc Verify splice with start index 0 removes all elements and returns the removed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(0);
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_0300
     * @tc.name testArraySpliceTwo003
     * @tc.desc Verify a positive start index keeps the prefix before the start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.splice(2);
      expect(arr.length).assertEqual(2);
      expect(result.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_0400
     * @tc.name testArraySpliceTwo004
     * @tc.desc Verify start zero removes all elements from the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(0);
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_0500
     * @tc.name testArraySpliceTwo005
     * @tc.desc Verify start one removes every element except the first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.splice(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_0600
     * @tc.name testArraySpliceTwo006
     * @tc.desc Verify splice at array length returns an independent empty result array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(3);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(0);
      result.pushOne(99);
      expect(result.toString()).assertEqual('99');
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_0700
     * @tc.name testArraySpliceTwo007
     * @tc.desc Verify a start index beyond the length leaves string arrays unchanged and returns an empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta');
      const result = arr.splice(10);
      expect(arr.length).assertEqual(2);
      expect(arr.toString()).assertEqual('alpha,beta');
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_0800
     * @tc.name testArraySpliceTwo008
     * @tc.desc Verify a negative start index counts from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.splice(-2);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(40);
      expect(result[1]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_0900
     * @tc.name testArraySpliceTwo009
     * @tc.desc Verify start minus one removes only the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.splice(-1);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1000
     * @tc.name testArraySpliceTwo010
     * @tc.desc Verify start minus three removes the last three elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const result = arr.splice(-3);
      expect(arr.length).assertEqual(2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1100
     * @tc.name testArraySpliceTwo011
     * @tc.desc Verify a negative start beyond the array length removes all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(-10);
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1200
     * @tc.name testArraySpliceTwo012
     * @tc.desc Verify the Infinity start example is represented by a large positive boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const maxStart: int = 2147483647;
      const result = arr.splice(maxStart);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(0);
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1300
     * @tc.name testArraySpliceTwo013
     * @tc.desc Verify the NaN start example is represented by a zero-equivalent boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(0);
      expect(typeof result.length).assertEqual('int');
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1400
     * @tc.name testArraySpliceTwo014
     * @tc.desc Verify the null start example is represented by a zero-equivalent boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(0);
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1500
     * @tc.name testArraySpliceTwo015
     * @tc.desc Verify splice returns all elements from start to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.splice(1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(20);
      expect(result[2]).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1600
     * @tc.name testArraySpliceTwo016
     * @tc.desc Verify an out-of-range start on an empty array still returns an empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.splice(10);
      expect(result.length).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1700
     * @tc.name testArraySpliceTwo017
     * @tc.desc Verify splice zero removes all string elements while preserving their order in the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta', 'gamma');
      const result = arr.splice(0);
      expect(result.length).assertEqual(3);
      expect(arr.length).assertEqual(0);
      expect(result.toString()).assertEqual('alpha,beta,gamma');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1800
     * @tc.name testArraySpliceTwo018
     * @tc.desc Verify splice returns an Array of the element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.splice(1);
      expect(Array.isArray(result)).assertTrue();
      expect(typeof result[0]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_1900
     * @tc.name testArraySpliceTwo019
     * @tc.desc Verify the returned array is newly created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(1);
      result.push(100);
      expect(arr.length).assertEqual(1);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2000
     * @tc.name testArraySpliceTwo020
     * @tc.desc Verify changing the returned array does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.splice(1);
      result[0] = 999;
      expect(arr[0]).assertEqual(10);
      expect(result[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2100
     * @tc.name testArraySpliceTwo021
     * @tc.desc Verify splice removes all elements from start to the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.splice(2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2200
     * @tc.name testArraySpliceTwo022
     * @tc.desc Verify splice N keeps the first N elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.splice(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2300
     * @tc.name testArraySpliceTwo023
     * @tc.desc Verify splice mutates the original array rather than creating a new one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const originalRef = arr;
      arr.splice(1);
      expect(arr === originalRef).assertTrue();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2400
     * @tc.name testArraySpliceTwo024
     * @tc.desc Verify splice on an empty array returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.splice(0);
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2500
     * @tc.name testArraySpliceTwo025
     * @tc.desc Verify splice zero clears a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(100);
      const result = arr.splice(0);
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2600
     * @tc.name testArraySpliceTwo026
     * @tc.desc Verify splice one removes nothing from a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(100);
      const result = arr.splice(1);
      expect(arr.length).assertEqual(1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2700
     * @tc.name testArraySpliceTwo027
     * @tc.desc Verify different negative starts can be applied sequentially
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const r1 = arr.splice(-1);
      expect(arr.length).assertEqual(3);
      expect(r1[0]).assertEqual(40);

      const r2 = arr.splice(-2);
      expect(arr.length).assertEqual(1);
      expect(r2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2800
     * @tc.name testArraySpliceTwo028
     * @tc.desc Verify splice with one start argument can be called repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.splice(3);
      arr.splice(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_2900
     * @tc.name testArraySpliceTwo029
     * @tc.desc Verify splice can be used to truncate arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.splice(3);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3000
     * @tc.name testArraySpliceTwo030
     * @tc.desc Verify a negative start can remove trailing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      arr.splice(-2);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3100
     * @tc.name testArraySpliceTwo031
     * @tc.desc Verify splice can both obtain and remove elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const removed = arr.splice(1);
      expect(removed.length).assertEqual(3);
      expect(removed[0]).assertEqual(20);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3200
     * @tc.name testArraySpliceTwo032
     * @tc.desc Verify splice preserves object references in the returned array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<SpliceItem032>();
      const item1 = new SpliceItem032();
      item1.value = 100;
      const item2 = new SpliceItem032();
      item2.value = 200;
      arr.push(item1, item2);
      const result = arr.splice(1);
      expect(result[0] === item2).assertTrue();
      expect(result[0].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3300
     * @tc.name testArraySpliceTwo033
     * @tc.desc Verify splice with one start argument returns the removed suffix and updates remaining boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(10000);
      const removed = arr.splice(5000);
      expect(arr.length).assertEqual(5000);
      expect(arr[4999]).assertEqual(4999);
      expect(removed.length).assertEqual(5000);
      expect(removed[0]).assertEqual(5000);
      expect(removed[4999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3400
     * @tc.name testArraySpliceTwo034
     * @tc.desc Verify splice can remove a large suffix of elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(10000);
      arr.splice(1000);
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3500
     * @tc.name testArraySpliceTwo035
     * @tc.desc Verify splice works with string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const result = arr.splice(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('a');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3600
     * @tc.name testArraySpliceTwo036
     * @tc.desc Verify splice works with object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<SplicePerson036>();
      const p1 = new SplicePerson036();
      p1.name = 'Alice';
      const p2 = new SplicePerson036();
      p2.name = 'Bob';
      arr.push(p1, p2);
      const result = arr.splice(0);
      expect(arr.length).assertEqual(0);
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3700
     * @tc.name testArraySpliceTwo037
     * @tc.desc Verify splice works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.splice(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3800
     * @tc.name testArraySpliceTwo038
     * @tc.desc Verify splice works with char arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>();
      arr.push(c'A', c'B', c'C', c'D');
      const result = arr.splice(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(c'A');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_3900
     * @tc.name testArraySpliceTwo039
     * @tc.desc Verify splice can be followed by push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      arr.splice(2);
      arr.push(100);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4000
     * @tc.name testArraySpliceTwo040
     * @tc.desc Verify splice can be followed by unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(1);
      arr.unshift(100);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4100
     * @tc.name testArraySpliceTwo041
     * @tc.desc Verify splice updates the length property after truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const beforeLength = arr.length;
      arr.splice(2);
      const afterLength = arr.length;
      expect(afterLength).assertEqual(2);
      expect(afterLength < beforeLength).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4200
     * @tc.name testArraySpliceTwo042
     * @tc.desc Verify splice start and pop can produce the same removal result at the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(10, 20, 30, 40);
      arr1.splice(3);
      const arr2 = new Array<number>(10, 20, 30, 40);
      arr2.pop();
      expect(arr1.length).assertEqual(arr2.length);
      expect(arr1.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4300
     * @tc.name testArraySpliceTwo043
     * @tc.desc Verify splicing a mutable copy leaves the readonly source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ReadonlyArray<number> = [1, 2, 3];
      const arr = Array.from<number>(source);
      const removed = arr.splice(1);
      expect(removed.toString()).assertEqual('2,3');
      expect(source.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4400
     * @tc.name testArraySpliceTwo044
     * @tc.desc Verify a maximum int start index removes no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const maxStart: int = 2147483647;
      const result = arr.splice(maxStart);
      expect(arr.length).assertEqual(3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4500
     * @tc.name testArraySpliceTwo045
     * @tc.desc Verify one-argument splice uses a start value captured before the source array grows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const start: int = arr.length;
      arr.pushOne(40);
      const result = arr.splice(start);
      expect(arr.toString()).assertEqual('10,20,30');
      expect(result.toString()).assertEqual('40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4600
     * @tc.name testArraySpliceTwo046
     * @tc.desc Verify one-argument splice snapshots the start variable before later reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      let start: int = 2;
      const result = arr.splice(start);
      start = 0;
      expect(arr.toString()).assertEqual('1,2');
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4700
     * @tc.name testArraySpliceTwo047
     * @tc.desc Verify one-argument splice from negative length removes the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const start: int = -3;
      const result = arr.splice(start);
      expect(arr.length).assertEqual(0);
      expect(result.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4800
     * @tc.name testArraySpliceTwo048
     * @tc.desc Verify one-argument splice can truncate after the last matching marker
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('header', 'body', 'marker', 'body', 'marker', 'tail');
      const start = arr.lastIndexOf('marker');
      const result = arr.splice(start);
      expect(start).assertEqual(4);
      expect(arr.toString()).assertEqual('header,body,marker,body');
      expect(result.toString()).assertEqual('marker,tail');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_4900
     * @tc.name testArraySpliceTwo049
     * @tc.desc Verify repeated object references removed by splice remain shared in the returned suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new SpliceItem032();
      shared.value = 5;
      const arr = new Array<SpliceItem032>(shared, shared);
      const result = arr.splice(0);
      result[1].value = 12;
      expect(arr.length).assertEqual(0);
      expect(result[0] === result[1]).assertTrue();
      expect(shared.value).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5000
     * @tc.name testArraySpliceTwo050
     * @tc.desc Verify a missing lastIndexOf result is interpreted as negative one by one-argument splice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta');
      const start = arr.lastIndexOf('missing');
      const result = arr.splice(start);
      expect(start).assertEqual(-1);
      expect(arr.toString()).assertEqual('alpha');
      expect(result.toString()).assertEqual('beta');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5100
     * @tc.name testArraySpliceTwo051
     * @tc.desc Verify one-argument splice returns a suffix independent from later source pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.splice(2);
      arr.pushOne(9);
      expect(arr.toString()).assertEqual('1,2,9');
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5200
     * @tc.name testArraySpliceTwo052
     * @tc.desc Verify mutating a returned splice suffix does not append back into the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.splice(1);
      result.pushOne(4);
      expect(arr.toString()).assertEqual('1');
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5300
     * @tc.name testArraySpliceTwo053
     * @tc.desc Verify one-argument splice preserves null and undefined values in the removed suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(1, null, undefined, 4);
      const result = arr.splice(1);
      expect(arr.toString()).assertEqual('1');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertNull();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5400
     * @tc.name testArraySpliceTwo054
     * @tc.desc Verify one-argument splice from explicit undefined preserves it in the returned suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const removed = arr.splice(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
      expect(removed.length).assertEqual(2);
      expect(removed[1]).assertEqual(3);
      expect(removed.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5500
     * @tc.name testArraySpliceTwo055
     * @tc.desc Verify splice zero on a dense undefined array returns all elements and clears the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[1] = 2;
      const removed = arr.splice(0);
      expect(arr.length).assertEqual(0);
      expect(removed.length).assertEqual(3);
      expect(removed[1]).assertEqual(2);
      expect(removed.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5600
     * @tc.name testArraySpliceTwo056
     * @tc.desc Verify one-argument splice keeps explicit undefined values searchable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[1] = undefined;
      const removed = arr.splice(1);
      expect(arr.toString()).assertEqual('1');
      expect(removed.length).assertEqual(2);
      expect(removed[0]).assertUndefined();
      expect(removed.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5700
     * @tc.name testArraySpliceTwo057
     * @tc.desc Verify negative start with one-argument splice preserves explicit undefined tail values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const removed = arr.splice(-2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
      expect(removed.length).assertEqual(2);
      expect(removed[0]).assertEqual(3);
      expect(removed.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5800
     * @tc.name testArraySpliceTwo058
     * @tc.desc Verify a negative start beyond the array length clamps to zero for dense undefined arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[2] = 3;
      const removed = arr.splice(-100);
      expect(arr.length).assertEqual(0);
      expect(removed.length).assertEqual(3);
      expect(removed[2]).assertEqual(3);
      expect(removed.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_5900
     * @tc.name testArraySpliceTwo059
     * @tc.desc Verify start equal to length returns an independent empty array for a source containing explicit undefined entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const removed = arr.splice(3);
      removed.pushOne(4);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
      expect(arr.indexOf(undefined)).assertEqual(1);
      expect(removed.toString()).assertEqual('4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_6000
     * @tc.name testArraySpliceTwo060
     * @tc.desc Verify splice supports consecutive chained calls on the removed subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.splice(1).splice(1);
      expect(result.toString()).assertEqual('30,40');
      expect(arr.toString()).assertEqual('10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_6100
     * @tc.name testArraySpliceTwo061
     * @tc.desc Verify one-argument splice works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3, 4);
      expect(spliceAnyNumberArrayTwo(anyValue, 2)).assertEqual('3,4|1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SPLICE_TWO_6200
     * @tc.name testArraySpliceTwo062
     * @tc.desc Verify one-argument splice supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySpliceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const removed = anyArr.splice(1);
      expect(removed.toString()).assertEqual('two,true');
      expect(anyArr.toString()).assertEqual('1');
    });

  });
}
