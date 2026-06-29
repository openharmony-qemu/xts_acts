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

class SliceItem008 {
  value: number = 0;
}

class SliceRefCase009 {
  value: number = 0;
}

function createOneBasedArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 1; i <= size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function getFirstN(arr: Array<number>, n: int): Array<number> {
  let end: int = n;
  if (end < 0) {
    end = 0;
  } else if (end > arr.length) {
    end = arr.length;
  }
  return arr.slice(0, end);
}

export default function ArraySlice2Test(): void {
  describe('ArraySlice2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_0100
     * @tc.name testArraySliceTwo001
     * @tc.desc Verify slice with no arguments copies the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.slice();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result == arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_0200
     * @tc.name testArraySliceTwo002
     * @tc.desc Verify slice with only start returns elements from start to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.slice(2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_0300
     * @tc.name testArraySliceTwo003
     * @tc.desc Verify slice with start and end extracts the requested range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_0400
     * @tc.name testArraySliceTwo004
     * @tc.desc Verify undefined parameters use the default slice boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result1 = arr.slice(undefined);
      let result2 = arr.slice(1, undefined);
      expect(result1.length).assertEqual(5);
      expect(result2.length).assertEqual(4);
      expect(result2[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_0500
     * @tc.name testArraySliceTwo005
     * @tc.desc Verify slice with only start works for bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>(1n, 2n, 3n);
      let result = arr.slice(1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_0600
     * @tc.name testArraySliceTwo006
     * @tc.desc Verify slice with an end boundary can extract a string prefix without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c', 'd');
      let result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('a,b,c');
      expect(arr.toString()).assertEqual('a,b,c,d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_0700
     * @tc.name testArraySliceTwo007
     * @tc.desc Verify slice returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.slice();
      expect(Array.isArray(result)).assertTrue();
      expect(result == arr).assertFalse();
      expect(result.toString()).assertEqual(arr.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_0800
     * @tc.name testArraySliceTwo008
     * @tc.desc Verify slice performs a shallow copy for object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<SliceItem008>();
      let item = new SliceItem008();
      item.value = 100;
      arr.pushOne(item);
      let result = arr.slice();
      result[0].value = 200;
      expect(arr[0].value).assertEqual(200);
      expect(result[0] == arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_0900
     * @tc.name testArraySliceTwo009
     * @tc.desc Verify slicing an empty array returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.slice();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1000
     * @tc.name testArraySliceTwo010
     * @tc.desc Verify an out-of-range start index returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.slice(10);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1100
     * @tc.name testArraySliceTwo011
     * @tc.desc Verify an out-of-range end index is clamped to the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.slice(0, 10);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1200
     * @tc.name testArraySliceTwo012
     * @tc.desc Verify a negative start index counts from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.slice(-3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1300
     * @tc.name testArraySliceTwo013
     * @tc.desc Verify a negative end index can trim trailing string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c', 'd', 'e');
      let result = arr.slice(0, -2);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1400
     * @tc.name testArraySliceTwo014
     * @tc.desc Verify negative start and negative end can be combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.slice(-4, -2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1500
     * @tc.name testArraySliceTwo015
     * @tc.desc Verify start greater than end returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let result = arr.slice(3, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1600
     * @tc.name testArraySliceTwo016
     * @tc.desc Verify start equal to end returns an independent empty result array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.slice(1, 1);
      expect(result.length).assertEqual(0);
      result.pushOne(99);
      expect(result.toString()).assertEqual('99');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1700
     * @tc.name testArraySliceTwo017
     * @tc.desc Verify start zero preserves object references in the sliced prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first = new SliceItem008();
      first.value = 10;
      let second = new SliceItem008();
      second.value = 20;
      let third = new SliceItem008();
      third.value = 30;
      let arr = new Array<SliceItem008>(first, second, third);
      let result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0] === first).assertTrue();
      expect(result[1] === second).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1800
     * @tc.name testArraySliceTwo018
     * @tc.desc Verify end equal to the length copies all union-typed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, 'two', 3);
      let result = arr.slice(0, arr.length);
      expect(result.length).assertEqual(3);
      expect(result[1]).assertEqual('two');
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_1900
     * @tc.name testArraySliceTwo019
     * @tc.desc Verify slice does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let originalLength = arr.length;
      let originalFirst = arr[0];
      arr.slice(1, 3);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2000
     * @tc.name testArraySliceTwo020
     * @tc.desc Verify slice creates a new reference instead of reusing the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalRef = arr;
      let result = arr.slice();
      expect(result == originalRef).assertFalse();
      expect(result.toString()).assertEqual(originalRef.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2100
     * @tc.name testArraySliceTwo021
     * @tc.desc Verify slicing a single object element preserves its reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new SliceItem008();
      item1.value = 10;
      let item2 = new SliceItem008();
      item2.value = 20;
      let item3 = new SliceItem008();
      item3.value = 30;
      let arr = new Array<SliceItem008>(item1, item2, item3);
      let result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0] === item2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2200
     * @tc.name testArraySliceTwo022
     * @tc.desc Verify a negative start can copy the last char elements in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>(c'a', c'b', c'c', c'd');
      let result = arr.slice(-2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(c'c');
      expect(result[1]).assertEqual(c'd');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2300
     * @tc.name testArraySliceTwo023
     * @tc.desc Verify modifying a sliced result does not mutate the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.slice(2);
      result[0] = 99;
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(99);
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2400
     * @tc.name testArraySliceTwo024
     * @tc.desc Verify slice keeps the source array while splice changes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3, 4, 5);
      let arr2 = new Array<number>(1, 2, 3, 4, 5);
      let sliced = arr1.slice(1, 3);
      let spliced = arr2.splice(1, 2);
      expect(arr1.length).assertEqual(5);
      expect(arr2.length).assertEqual(3);
      expect(sliced.length).assertEqual(2);
      expect(spliced.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2500
     * @tc.name testArraySliceTwo025
     * @tc.desc Verify slice creates a new array while copyWithin mutates the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3, 4);
      let arr2 = new Array<number>(1, 2, 3, 4);
      let sliced = arr1.slice(1, 3);
      arr2.copyWithin(0, 1, 3);
      expect(sliced.toString()).assertEqual('2,3');
      expect(arr1.toString()).assertEqual('1,2,3,4');
      expect(arr2.toString()).assertEqual('2,3,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2600
     * @tc.name testArraySliceTwo026
     * @tc.desc Verify slicing a large array returns the expected subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createOneBasedArray(10000);
      let result = arr.slice(1000, 9000);
      expect(result.length).assertEqual(8000);
      expect(result[0]).assertEqual(1001);
      expect(result[7999]).assertEqual(9000);
      expect(arr[0]).assertEqual(1);
      expect(arr.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2700
     * @tc.name testArraySliceTwo027
     * @tc.desc Verify slice can be used to paginate array data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createOneBasedArray(100);
      let pageSize = 10;
      let page = 2;
      let start = (page - 1) * pageSize;
      let end = start + pageSize;
      let pageData = arr.slice(start, end);
      expect(pageData.length).assertEqual(10);
      expect(pageData[0]).assertEqual(11);
      expect(pageData[9]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2800
     * @tc.name testArraySliceTwo028
     * @tc.desc Verify slice can take the first N elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let first3 = arr.slice(0, 3);
      expect(first3.length).assertEqual(3);
      expect(first3[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_2900
     * @tc.name testArraySliceTwo029
     * @tc.desc Verify slice can return the remaining elements after skipping a prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let rest = arr.slice(2);
      expect(rest.length).assertEqual(3);
      expect(rest[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3000
     * @tc.name testArraySliceTwo030
     * @tc.desc Verify floating-point indices follow numeric conversion semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.slice((1.5).toInt(), (3.5).toInt());
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3100
     * @tc.name testArraySliceTwo031
     * @tc.desc Verify zero slice boundaries return an empty array that can be modified independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
      result.pushOne(7);
      expect(result[0]).assertEqual(7);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3200
     * @tc.name testArraySliceTwo032
     * @tc.desc Verify an infinite end index is clamped to the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.slice(0, arr.length + 100);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3300
     * @tc.name testArraySliceTwo033
     * @tc.desc Verify slice results can be chained with another slice call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.slice(0, 3).slice(1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3400
     * @tc.name testArraySliceTwo034
     * @tc.desc Verify a slice result can be mapped by a later array operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.slice(1, 4).map((v: number): number => v * 2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(4);
      expect(result[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3500
     * @tc.name testArraySliceTwo035
     * @tc.desc Verify destructuring works on the array returned by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      const sliced = arr.slice(0, 3);
      const first = sliced[0];
      const second = sliced[1];
      const third = sliced[2];
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(third).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3600
     * @tc.name testArraySliceTwo036
     * @tc.desc Verify slice can be called on a readonly array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyArray<number> = [1, 2, 3, 4, 5];
      let result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3700
     * @tc.name testArraySliceTwo037
     * @tc.desc Verify omitting start uses zero as the default start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let result = arr.slice();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3800
     * @tc.name testArraySliceTwo038
     * @tc.desc Verify omitting end uses the array length as the default end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let result = arr.slice(1);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_3900
     * @tc.name testArraySliceTwo039
     * @tc.desc Verify boundary start values at zero and at the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result1 = arr.slice(0, 1);
      let result2 = arr.slice(3, 3);
      expect(result1.length).assertEqual(1);
      expect(result1[0]).assertEqual(1);
      expect(result2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4000
     * @tc.name testArraySliceTwo040
     * @tc.desc Verify multiple start and end combinations produce the expected lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.slice(0, 5).length).assertEqual(5);
      expect(arr.slice(1, 4).length).assertEqual(3);
      expect(arr.slice(2, 3).length).assertEqual(1);
      expect(arr.slice(3, 2).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4100
     * @tc.name testArraySliceTwo041
     * @tc.desc Verify slice can be used to implement a safe first-N helper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(getFirstN(arr, 5).length).assertEqual(3);
      expect(getFirstN(arr, 2).length).assertEqual(2);
      expect(getFirstN(arr, 2)[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4200
     * @tc.name testArraySliceTwo042
     * @tc.desc Verify slice can split an array into fixed-size chunks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5, 6, 7, 8, 9);
      let chunks = new Array<Array<number>>();
      let size = 3;

      for (let i: int = 0; i < arr.length; i += size) {
        chunks.pushOne(arr.slice(i, i + size));
      }

      expect(chunks.length).assertEqual(3);
      expect(chunks[0].length).assertEqual(3);
      expect(chunks[2][2]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4300
     * @tc.name testArraySliceTwo043
     * @tc.desc Verify slice with no arguments returns a whole-array copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.slice();
      expect(result.toString()).assertEqual('1,2,3');
      expect(result === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4400
     * @tc.name testArraySliceTwo044
     * @tc.desc Verify slice with only start returns the tail of a number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.slice(2);
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4500
     * @tc.name testArraySliceTwo045
     * @tc.desc Verify slice with a negative start returns the last elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.slice(-2);
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4600
     * @tc.name testArraySliceTwo046
     * @tc.desc Verify slice with start equal to length returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.slice(arr.length);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4700
     * @tc.name testArraySliceTwo047
     * @tc.desc Verify slice with start beyond length returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.slice(10);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4800
     * @tc.name testArraySliceTwo048
     * @tc.desc Verify slice with only start works for string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('b,c,d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_4900
     * @tc.name testArraySliceTwo049
     * @tc.desc Verify slice with only start works for boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5000
     * @tc.name testArraySliceTwo050
     * @tc.desc Verify slice with only start works for bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5100
     * @tc.name testArraySliceTwo051
     * @tc.desc Verify slice with only start preserves object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new SliceRefCase009();
      const second = new SliceRefCase009();
      const arr = new Array<SliceRefCase009>(first, second);
      const result = arr.slice(1);
      expect(result[0] === second).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5200
     * @tc.name testArraySliceTwo052
     * @tc.desc Verify slice with only start can copy a tail after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5300
     * @tc.name testArraySliceTwo053
     * @tc.desc Verify slice with only start can copy a tail after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 1, 3, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5400
     * @tc.name testArraySliceTwo054
     * @tc.desc Verify slice with only start can copy a tail after shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shift();
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5500
     * @tc.name testArraySliceTwo055
     * @tc.desc Verify slice with only start can copy a tail after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.pop();
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5600
     * @tc.name testArraySliceTwo056
     * @tc.desc Verify slice with only start can copy a tail after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      const result = arr.slice(2);
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5700
     * @tc.name testArraySliceTwo057
     * @tc.desc Verify slice with only start can copy a tail after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      const result = arr.slice(2);
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5800
     * @tc.name testArraySliceTwo058
     * @tc.desc Verify slice with only start can copy a tail after splice insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 8, 9);
      const result = arr.slice(2);
      expect(result.toString()).assertEqual('9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_5900
     * @tc.name testArraySliceTwo059
     * @tc.desc Verify slice with only start can copy a tail after shrinkTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6000
     * @tc.name testArraySliceTwo060
     * @tc.desc Verify slice with only start works on Array.of results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(5, 6, 7, 8);
      const result = arr.slice(2);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6100
     * @tc.name testArraySliceTwo061
     * @tc.desc Verify slice with only start works on Array.from results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6, 8));
      const result = arr.slice(2);
      expect(result.toString()).assertEqual('6,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6200
     * @tc.name testArraySliceTwo062
     * @tc.desc Verify slice with only start can copy from a rebuilt array after length reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      arr.pushOne(9);
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6300
     * @tc.name testArraySliceTwo063
     * @tc.desc Verify slice with only start leaves the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const before = arr.toString();
      arr.slice(1);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6400
     * @tc.name testArraySliceTwo064
     * @tc.desc Verify slice with only start returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const result = arr.slice(1);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6500
     * @tc.name testArraySliceTwo065
     * @tc.desc Verify slice with only start can return a single tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const result = arr.slice(2);
      expect(result.toString()).assertEqual('6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6600
     * @tc.name testArraySliceTwo066
     * @tc.desc Verify slice with only start can return the whole array when start is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const result = arr.slice(0);
      expect(result.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6700
     * @tc.name testArraySliceTwo067
     * @tc.desc Verify slice with only start handles duplicate values in the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 2, 2);
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6800
     * @tc.name testArraySliceTwo068
     * @tc.desc Verify slice with only start handles negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 0, 3, 6);
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('0,3,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_6900
     * @tc.name testArraySliceTwo069
     * @tc.desc Verify slice with only start works after concat and with are combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4)).with(1, 9);
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('9,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7000
     * @tc.name testArraySliceTwo070
     * @tc.desc Verify slice with only start works on a toReversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toReversed();
      const result = arr.slice(1);
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7100
     * @tc.name testArraySliceTwo071
     * @tc.desc Verify slice preserves explicit undefined middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.slice();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7200
     * @tc.name testArraySliceTwo072
     * @tc.desc Verify slice from an explicit undefined index preserves it at the head of the copied tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.slice(1);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7300
     * @tc.name testArraySliceTwo073
     * @tc.desc Verify slice preserves multiple explicit undefined values in the copied result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      const result = arr.slice();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
      expect(result.indexOf(undefined)).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7400
     * @tc.name testArraySliceTwo074
     * @tc.desc Verify primitive elements are copied by value when the source is reassigned later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.slice(0, 2);
      arr[0] = 9;
      expect(result.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('9,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7500
     * @tc.name testArraySliceTwo075
     * @tc.desc Verify extending the source array later does not change an earlier slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.slice(0, 1);
      arr.pushOne(3);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7600
     * @tc.name testArraySliceTwo076
     * @tc.desc Verify nested arrays remain shared by reference in a sliced window
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Array<number>(1);
      const second = new Array<number>(2);
      const third = new Array<number>(3);
      const arr = new Array<Array<number>>(first, second, third);
      const result = arr.slice(1, 3);
      result[0].pushOne(9);
      expect(arr[1].toString()).assertEqual('2,9');
      expect(result[0] === second).assertTrue();
      expect(result[1] === third).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7700
     * @tc.name testArraySliceTwo077
     * @tc.desc Verify slice with a start of minus one returns only the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7800
     * @tc.name testArraySliceTwo078
     * @tc.desc Verify a very negative start is clamped to zero and returns the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.slice(-100);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_7900
     * @tc.name testArraySliceTwo079
     * @tc.desc Verify a very negative end is clamped to zero and produces an empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.slice(0, -100);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_8000
     * @tc.name testArraySliceTwo080
     * @tc.desc Verify a very negative start can still combine with a negative end boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.slice(-100, -2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_TWO_8100
     * @tc.name testArraySliceTwo081
     * @tc.desc Verify a negative second parameter trims elements from the end when start uses a positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.slice(1, -1);
      expect(result.toString()).assertEqual('2,3,4');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

  });
}

