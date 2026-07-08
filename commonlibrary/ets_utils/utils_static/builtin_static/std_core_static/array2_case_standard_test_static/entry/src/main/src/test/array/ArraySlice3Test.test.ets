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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

class SliceRefCase {
  value: number = 0;
}

function createOneBasedArray(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 1; i <= size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function sliceAnyNumberArrayThree(value: Any, start: int, end: int): string {
  const arr = value as Array<number>;
  return arr.slice(start, end).toString();
}

export default function ArraySlice3Test(): void {
  describe('ArraySlice3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_0100
     * @tc.name testArraySliceThree001
     * @tc.desc Verify slice with int parameters returns an independent copy of the selected range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let start: int = 1;
      let end: int = 4;
      let result = arr.slice(start, end);
      result[0] = 99;
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(99);
      expect(result[2]).assertEqual(4);
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_0200
     * @tc.name testArraySliceThree002
     * @tc.desc Verify start and end can be provided through int variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let start: int = 1;
      let end: int = 2;
      let result = arr.slice(start, end);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_0300
     * @tc.name testArraySliceThree003
     * @tc.desc Verify the int overload returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.slice(0, 2 as int);
      expect(Array.isArray(result)).assertTrue();
      expect(result == arr).assertFalse();
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_0400
     * @tc.name testArraySliceThree004
     * @tc.desc Verify int boundaries work for normal and full-length ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result1 = arr.slice(0, 2);
      let result2 = arr.slice(0, 3);
      expect(result1.length).assertEqual(2);
      expect(result2.length).assertEqual(3);
      expect(result2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_0500
     * @tc.name testArraySliceThree005
     * @tc.desc Verify start greater than end returns an empty array for int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.slice(2, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_0600
     * @tc.name testArraySliceThree006
     * @tc.desc Verify int and Number slice parameters produce the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let startValue: number = 1;
      let endValue: number = 4;
      let result1 = arr.slice(startValue.toInt(), endValue.toInt());
      let result2 = arr.slice(1, 4);
      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_0700
     * @tc.name testArraySliceThree007
     * @tc.desc Verify slice accepts int variables for extracting the tail subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let start: int = 2;
      let end: int = 4;
      let result = arr.slice(start, end);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_0800
     * @tc.name testArraySliceThree008
     * @tc.desc Verify int slice ranges can be computed from variables and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3, 4, 5, 6);
      let start: int = 1;
      let end: int = 4;
      let result1 = arr1.slice(start, end);
      expect(result1.length).assertEqual(3);
      expect(result1[0]).assertEqual(2);
      expect(result1[2]).assertEqual(4);

      let arr2 = new Array<number>(1, 2, 3, 4);
      let len: int = arr2.length;
      let result2 = arr2.slice(0, len - 1);
      expect(result2.length).assertEqual(3);
      expect(result2[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_0900
     * @tc.name testArraySliceThree009
     * @tc.desc Verify slice with int boundaries can return a middle subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = 1;
      const end: int = 3;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1000
     * @tc.name testArraySliceThree010
     * @tc.desc Verify slice with int boundaries can return the tail subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = 3;
      const end: int = 5;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1100
     * @tc.name testArraySliceThree011
     * @tc.desc Verify slice with int boundaries can return the full-length subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = 0;
      const end: int = 5;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(5);
      expect(result.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1200
     * @tc.name testArraySliceThree012
     * @tc.desc Verify slice with int boundaries can return equal int boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = 2;
      const end: int = 2;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(0);
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1300
     * @tc.name testArraySliceThree013
     * @tc.desc Verify slice with int boundaries can return a start index that exceeds the end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = 4;
      const end: int = 2;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(0);
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1400
     * @tc.name testArraySliceThree014
     * @tc.desc Verify slice with int boundaries can return out-of-range positive boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 5;
      const end: int = 7;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(0);
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1500
     * @tc.name testArraySliceThree015
     * @tc.desc Verify slice with int boundaries can return negative boundaries that normalize inside the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = -3;
      const end: int = -1;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1600
     * @tc.name testArraySliceThree016
     * @tc.desc Verify slice with int boundaries can return very negative starts that normalize to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = -10;
      const end: int = 3;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1700
     * @tc.name testArraySliceThree017
     * @tc.desc Verify slice with int boundaries can return end boundaries beyond the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 1;
      const end: int = 10;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1800
     * @tc.name testArraySliceThree018
     * @tc.desc Verify slice with int boundaries can extract a three-value range from offset 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createOneBasedArray(28);
      const start: int = 24;
      const end: int = 27;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_1900
     * @tc.name testArraySliceThree019
     * @tc.desc Verify slice with int boundaries returns a new array that can be mutated independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.slice(1, 3);
      result[0] = 99;
      expect(result.toString()).assertEqual('99,3');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2000
     * @tc.name testArraySliceThree020
     * @tc.desc Verify slice with int boundaries performs a shallow copy for object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new SliceRefCase();
      first.value = 1;
      const second = new SliceRefCase();
      second.value = 2;
      const arr = new Array<SliceRefCase>(first, second);
      const result = arr.slice(0, 2);
      result[0].value = 88;
      expect(arr[0].value).assertEqual(88);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2100
     * @tc.name testArraySliceThree021
     * @tc.desc Verify slice with int boundaries supports string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const result = arr.slice(1, 3);
      expect(result.toString()).assertEqual('b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2200
     * @tc.name testArraySliceThree022
     * @tc.desc Verify slice with int boundaries supports bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n, 20n, 30n, 40n);
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2300
     * @tc.name testArraySliceThree023
     * @tc.desc Verify slice with int boundaries can be chained with join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createOneBasedArray(6);
      const result = arr.slice(2, 5).join('-');
      expect(result).assertEqual('3-4-5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2400
     * @tc.name testArraySliceThree024
     * @tc.desc Verify slice with int boundaries on an empty array returns an empty copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2500
     * @tc.name testArraySliceThree025
     * @tc.desc Verify slice with int boundaries can omit the tail by using a negative end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const start: int = 1;
      const end: int = -1;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('20,30,40');
      expect(arr.toString()).assertEqual('10,20,30,40,50');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2600
     * @tc.name testArraySliceThree026
     * @tc.desc Verify slice with int boundaries clamps a very large end after a negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7, 8, 9);
      const start: int = -2;
      const end: int = 99;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2700
     * @tc.name testArraySliceThree027
     * @tc.desc Verify slice with int boundaries copies a zero-based prefix without sharing top-level slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      const start: int = 0;
      const end: int = arr.length;
      const result = arr.slice(start, end);
      result[1] = 88;
      expect(result.toString()).assertEqual('7,88,9');
      expect(arr.toString()).assertEqual('7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2800
     * @tc.name testArraySliceThree028
     * @tc.desc Verify slice with int boundaries can stringify an empty result from normalized equal bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('left', 'middle', 'right');
      const start: int = -1;
      const end: int = 2;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(0);
      expect(result.toString()).assertEqual('');
      expect(arr.toString()).assertEqual('left,middle,right');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_2900
     * @tc.name testArraySliceThree029
     * @tc.desc Verify slice with int boundaries can extract the final pair using negative start and omitted tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(11, 22, 33, 44);
      const start: int = -2;
      const end: int = arr.length;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(33);
      expect(result[1]).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3000
     * @tc.name testArraySliceThree030
     * @tc.desc Verify slice with int boundaries clamps a positive start beyond length to an empty toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      const start: int = 4;
      const end: int = arr.length;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(0);
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3100
     * @tc.name testArraySliceThree031
     * @tc.desc Verify slice with int boundaries supports negative start with a positive end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40, 50);
      const start: int = -4;
      const end: int = 4;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3200
     * @tc.name testArraySliceThree032
     * @tc.desc Verify slice with int boundaries keeps object references shallow-copied in a negative range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new SliceRefCase();
      first.value = 10;
      const second = new SliceRefCase();
      second.value = 20;
      const third = new SliceRefCase();
      third.value = 30;
      const arr = new Array<SliceRefCase>(first, second, third);
      const start: int = -2;
      const end: int = 3;
      const result = arr.slice(start, end);
      result[0].value = 77;
      expect(result.length).assertEqual(2);
      expect(arr[1].value).assertEqual(77);
      expect(result[1] === third).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3300
     * @tc.name testArraySliceThree033
     * @tc.desc Verify slice with int boundaries returns an independent copy when end is computed from length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 3, 5, 7, 9);
      const start: int = 2;
      const end: int = arr.length;
      const result = arr.slice(start, end);
      arr[2] = 55;
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('5,7,9');
      expect(arr.toString()).assertEqual('1,3,55,7,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3400
     * @tc.name testArraySliceThree034
     * @tc.desc Verify int boundaries can extract only the last element when the start is minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = -1;
      const end: int = 4;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3500
     * @tc.name testArraySliceThree035
     * @tc.desc Verify int boundaries return an empty array when the normalized start exceeds the normalized end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = -1;
      const end: int = -2;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3600
     * @tc.name testArraySliceThree036
     * @tc.desc Verify a very negative end boundary is clamped to zero for int parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 0;
      const end: int = -100;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3700
     * @tc.name testArraySliceThree037
     * @tc.desc Verify a very negative start can still combine with a negative end boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = -100;
      const end: int = -2;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3800
     * @tc.name testArraySliceThree038
     * @tc.desc Verify explicit undefined middle elements remain searchable after slicing an int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const start: int = 0;
      const end: int = 3;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_3900
     * @tc.name testArraySliceThree039
     * @tc.desc Verify slicing from an explicit undefined index preserves it in the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const start: int = 1;
      const end: int = 3;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4000
     * @tc.name testArraySliceThree040
     * @tc.desc Verify explicit undefined values remain searchable after slicing an int range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[1] = undefined;
      const start: int = 0;
      const end: int = 3;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(3);
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4100
     * @tc.name testArraySliceThree041
     * @tc.desc Verify primitive values in an int-range slice remain independent after source reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 1;
      const end: int = 3;
      const result = arr.slice(start, end);
      arr[1] = 99;
      expect(result.toString()).assertEqual('2,3');
      expect(arr.toString()).assertEqual('1,99,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4200
     * @tc.name testArraySliceThree042
     * @tc.desc Verify nested arrays remain shared by reference in an int-range slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = Array.create<number>(1, 1);
      const second = Array.create<number>(1, 2);
      const third = Array.create<number>(1, 3);
      const arr = new Array<Array<number>>(first, second, third);
      const start: int = 1;
      const end: int = 3;
      const result = arr.slice(start, end);
      result[0].pushOne(9);
      expect(arr[1].toString()).assertEqual('2,9');
      expect(result[0] === second).assertTrue();
      expect(result[1] === third).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4300
     * @tc.name testArraySliceThree043
     * @tc.desc Verify pushing into the source later does not change an earlier int-range slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 1;
      const end: int = 3;
      const result = arr.slice(start, end);
      arr.pushOne(5);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4400
     * @tc.name testArraySliceThree044
     * @tc.desc Verify the returned int-range slice stays independently mutable at the top level
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 1;
      const end: int = 3;
      const result = arr.slice(start, end);
      result[0] = 88;
      expect(result.toString()).assertEqual('88,3');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4500
     * @tc.name testArraySliceThree045
     * @tc.desc Verify an empty int-range slice returns a new array that can be mutated independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 2;
      const end: int = 1;
      const result = arr.slice(start, end);
      result.pushOne(99);
      expect(result.toString()).assertEqual('99');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4600
     * @tc.name testArraySliceThree046
     * @tc.desc Verify slicing across null and undefined preserves both explicit nullish elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(1, null, undefined, 4);
      const start: int = 1;
      const end: int = 3;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertNull();
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4700
     * @tc.name testArraySliceThree047
     * @tc.desc Verify start equal to negative length includes the first element in the copied range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const start: int = -4;
      const end: int = 2;
      const result = arr.slice(start, end);
      expect(result.toString()).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4800
     * @tc.name testArraySliceThree048
     * @tc.desc Verify a negative end equal to negative length clamps the slice to an empty prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const start: int = 0;
      const end: int = -4;
      const result = arr.slice(start, end);
      expect(result.length).assertEqual(0);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_4900
     * @tc.name testArraySliceThree049
     * @tc.desc Verify modifying the sliced copy of reference elements does not replace source slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new SliceRefCase();
      first.value = 1;
      const second = new SliceRefCase();
      second.value = 2;
      const third = new SliceRefCase();
      third.value = 3;
      const arr = new Array<SliceRefCase>(first, second, third);
      const start: int = 0;
      const end: int = 2;
      const result = arr.slice(start, end);
      const replacement = new SliceRefCase();
      replacement.value = 99;
      result[0] = replacement;
      expect(result[0].value).assertEqual(99);
      expect(arr[0].value).assertEqual(1);
      expect(result[1] === arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_5000
     * @tc.name testArraySliceThree050
     * @tc.desc Verify mutating the source after slicing does not alter primitive values in the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('red', 'green', 'blue');
      const start: int = 0;
      const end: int = 2;
      const result = arr.slice(start, end);
      arr[0] = 'cyan';
      expect(result.toString()).assertEqual('red,green');
      expect(arr.toString()).assertEqual('cyan,green,blue');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_5100
     * @tc.name testArraySliceThree051
     * @tc.desc Verify a result made from a negative tail range can be extended independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7, 8);
      const start: int = -2;
      const end: int = 4;
      const result = arr.slice(start, end);
      result.pushOne(9);
      expect(result.toString()).assertEqual('7,8,9');
      expect(arr.toString()).assertEqual('5,6,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_5200
     * @tc.name testArraySliceThree052
     * @tc.desc Verify slice supports consecutive chained calls on returned copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const result = arr.slice(1, 5).slice(1, 3);
      expect(result.toString()).assertEqual('3,4');
      expect(arr.toString()).assertEqual('1,2,3,4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_5300
     * @tc.name testArraySliceThree053
     * @tc.desc Verify slice works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3, 4);
      expect(sliceAnyNumberArrayThree(anyValue, 1, 3)).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SLICE_THREE_5400
     * @tc.name testArraySliceThree054
     * @tc.desc Verify slice supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArraySliceThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true, 4);
      const result = anyArr.slice(1, 3);
      expect(result.toString()).assertEqual('two,true');
      expect(result.length).assertEqual(2);
    });

  });
}
