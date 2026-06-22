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
import Utils from '../Util.test';

class ToSplicedThreeItem {
  value: number = 0;
}

class ToSplicedThreeNestedArrayItem {
  values: Array<number> = new Array<number>();

  constructor(values: Array<number>) {
    this.values = values;
  }
}

function createLargeIntArray(size: int): Array<int> {
  let arr = new Array<int>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

export default function ArrayToSpliced3Test(): void {
  describe('ArrayToSpliced3Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_0100
     * @tc.name testArrayToSplicedThree001
     * @tc.desc Verify toSpliced accepts int start int delete and fixed-array items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const start: int = 1;
      const deleteCount: int = 2;
      const items: FixedArray<int> = [10, 20];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,10,20,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_0200
     * @tc.name testArrayToSplicedThree002
     * @tc.desc Verify start uses int typing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const start: int = 0;
      const items: FixedArray<int> = [100];
      const result = arr.toSpliced(start, 1, ...items);
      expect(result.toString()).assertEqual('100,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_0300
     * @tc.name testArrayToSplicedThree003
     * @tc.desc Verify delete count uses int typing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const deleteCount: int = 2;
      const items: FixedArray<int> = [10];
      const result = arr.toSpliced(0, deleteCount, ...items);
      expect(result.toString()).assertEqual('10,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_0400
     * @tc.name testArrayToSplicedThree004
     * @tc.desc Verify items can be passed as FixedArray<int>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const items: FixedArray<int> = [10, 20, 30];
      const result = arr.toSpliced(1, 1, ...items);
      expect(result.toString()).assertEqual('1,10,20,30,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_0500
     * @tc.name testArrayToSplicedThree005
     * @tc.desc Verify int parameters operate with integer-only semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const result = arr.toSpliced(start, deleteCount, ...([10] as FixedArray<int>));
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,10,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_0600
     * @tc.name testArrayToSplicedThree006
     * @tc.desc Verify int boundary values can cover the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const start: int = 0;
      const deleteCount: int = arr.length;
      const result = arr.toSpliced(start, deleteCount, ...([0] as FixedArray<int>));
      expect(result.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_0700
     * @tc.name testArrayToSplicedThree007
     * @tc.desc Verify inserted items match the array generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const items: FixedArray<int> = [10, 20];
      const result = arr.toSpliced(1, 1, ...items);
      expect(result[1]).assertEqual(10);
      expect(result[1] > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_0800
     * @tc.name testArrayToSplicedThree008
     * @tc.desc Verify toSpliced returns a new Array<T> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.toSpliced(1, 1, ...([10] as FixedArray<int>));
      expect(Array.isArray(result)).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_0900
     * @tc.name testArrayToSplicedThree009
     * @tc.desc Verify toSpliced leaves the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const original = arr.toString();
      arr.toSpliced(0, 2, ...([100, 200] as FixedArray<int>));
      expect(arr.toString()).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1000
     * @tc.name testArrayToSplicedThree010
     * @tc.desc Verify returned arrays contain the expected elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 2, ...([10, 20] as FixedArray<int>));
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(20);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1100
     * @tc.name testArrayToSplicedThree011
     * @tc.desc Verify toSpliced works with empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const result = arr.toSpliced(0, 0, ...([1, 2] as FixedArray<int>));
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1200
     * @tc.name testArrayToSplicedThree012
     * @tc.desc Verify start zero operates from the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.toSpliced(0, 1, ...([100] as FixedArray<int>));
      expect(result.toString()).assertEqual('100,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1300
     * @tc.name testArrayToSplicedThree013
     * @tc.desc Verify start equal to array length appends items at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const len: int = arr.length;
      const result = arr.toSpliced(len, 0, ...([10] as FixedArray<int>));
      expect(result.toString()).assertEqual('1,2,3,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1400
     * @tc.name testArrayToSplicedThree014
     * @tc.desc Verify delete zero inserts items without removing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.toSpliced(1, 0, ...([10, 20] as FixedArray<int>));
      expect(result.toString()).assertEqual('1,10,20,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1500
     * @tc.name testArrayToSplicedThree015
     * @tc.desc Verify delete equal to array length removes all source elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const len: int = arr.length;
      const result = arr.toSpliced(0, len, ...([0] as FixedArray<int>));
      expect(result.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1600
     * @tc.name testArrayToSplicedThree016
     * @tc.desc Verify empty items arrays perform delete-only behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const items: FixedArray<int> = [];
      const result = arr.toSpliced(1, 2, ...items);
      expect(result.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1700
     * @tc.name testArrayToSplicedThree017
     * @tc.desc Verify int-typed parameters keep strict integer semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const result = arr.toSpliced(start, deleteCount, ...([10] as FixedArray<int>));
      expect(result.toString()).assertEqual('1,10,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1800
     * @tc.name testArrayToSplicedThree018
     * @tc.desc Verify int-parameter calls match equivalent integer-literal behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3);
      const arr2 = new Array<int>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [10];
      const r1 = arr1.toSpliced(start, deleteCount, ...items);
      const r2 = arr2.toSpliced(1, 1, ...items);
      expect(r1.toString()).assertEqual('1,10,3');
      expect(r1.toString()).assertEqual(r2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_1900
     * @tc.name testArrayToSplicedThree019
     * @tc.desc Verify items can be omitted by spreading an empty fixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const items: FixedArray<int> = [];
      const result = arr.toSpliced(1, 1, ...items);
      expect(result.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2000
     * @tc.name testArrayToSplicedThree020
     * @tc.desc Verify a single inserted item is placed at the target index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.toSpliced(1, 1, ...([99] as FixedArray<int>));
      expect(result.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2100
     * @tc.name testArrayToSplicedThree021
     * @tc.desc Verify multiple inserted items preserve their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.toSpliced(0, 0, ...([10, 20, 30] as FixedArray<int>));
      expect(result.toString()).assertEqual('10,20,30,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2200
     * @tc.name testArrayToSplicedThree022
     * @tc.desc Verify toSpliced has no side effects on source length and boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const originalLast = arr[arr.length - 1];
      arr.toSpliced(0, 2, ...([100, 200] as FixedArray<int>));
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[3]).assertEqual(originalLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2300
     * @tc.name testArrayToSplicedThree023
     * @tc.desc Verify returned arrays remain independent from the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result = arr.toSpliced(1, 1, ...([10] as FixedArray<int>));
      result[0] = 999;
      expect(arr[0]).assertEqual(1);
      expect(result[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2400
     * @tc.name testArrayToSplicedThree024
     * @tc.desc Verify toSpliced can replace middle elements in a practical scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(2, 1, ...([99] as FixedArray<int>));
      expect(result.toString()).assertEqual('1,2,99,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2500
     * @tc.name testArrayToSplicedThree025
     * @tc.desc Verify toSpliced supports batch insertion at a fixed position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 5);
      const items: FixedArray<int> = [2, 3, 4];
      const result = arr.toSpliced(1, 0, ...items);
      expect(result.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2600
     * @tc.name testArrayToSplicedThree026
     * @tc.desc Verify toSpliced can delete all items without inserting new ones
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const len: int = arr.length;
      const items: FixedArray<int> = [];
      const result = arr.toSpliced(0, len, ...items);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2700
     * @tc.name testArrayToSplicedThree027
     * @tc.desc Verify chained toSpliced calls can be composed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const r1 = arr.toSpliced(0, 1, ...([0] as FixedArray<int>));
      const r2 = r1.toSpliced(1, 1, ...([99] as FixedArray<int>));
      const r3 = r2.toSpliced(2, 1, ...([100] as FixedArray<int>));
      expect(r3.toString()).assertEqual('0,99,100,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2800
     * @tc.name testArrayToSplicedThree028
     * @tc.desc Verify positive int start values target the expected position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const start: int = 2;
      const result = arr.toSpliced(start, 1, ...([10] as FixedArray<int>));
      expect(result.toString()).assertEqual('1,2,10,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_2900
     * @tc.name testArrayToSplicedThree029
     * @tc.desc Verify positive int delete counts remove the expected range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const deleteCount: int = 3;
      const result = arr.toSpliced(0, deleteCount, ...([0] as FixedArray<int>));
      expect(result.toString()).assertEqual('0,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3000
     * @tc.name testArrayToSplicedThree030
     * @tc.desc Verify zero-valued int parameters work for both insertion and deletion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const r1 = arr.toSpliced(0, 0, ...([10] as FixedArray<int>));
      const r2 = arr.toSpliced(0, 1, ...([] as FixedArray<int>));
      expect(r1.toString()).assertEqual('10,1,2,3');
      expect(r2.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3100
     * @tc.name testArrayToSplicedThree031
     * @tc.desc Verify generic result arrays preserve int element typing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const result: Array<int> = arr.toSpliced(1, 1, ...([10] as FixedArray<int>));
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3200
     * @tc.name testArrayToSplicedThree032
     * @tc.desc Verify item element types match the numeric array element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const items: FixedArray<int> = [10, 20];
      const result = arr.toSpliced(0, 1, ...items);
      expect(result[0]).assertEqual(10);
      expect(typeof result[0]).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3300
     * @tc.name testArrayToSplicedThree033
     * @tc.desc Verify readonly-style fixed arrays can be spread into toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const items: FixedArray<int> = [10];
      const result = arr.toSpliced(1, 0, ...items);
      expect(result.toString()).assertEqual('1,10,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3400
     * @tc.name testArrayToSplicedThree034
     * @tc.desc Verify toSpliced can be combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 2, ...([10, 20] as FixedArray<int>)).map((v: int): int => v + 100);
      expect(result.toString()).assertEqual('101,110,120,104');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3500
     * @tc.name testArrayToSplicedThree035
     * @tc.desc Verify toSpliced can be combined with filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(0, 2, ...([0] as FixedArray<int>)).filter((v: int): boolean => v > 2);
      expect(result.toString()).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3600
     * @tc.name testArrayToSplicedThree036
     * @tc.desc Verify sliced arrays can call toSpliced afterward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      const sliced = arr.slice(0, 3);
      const result = sliced.toSpliced(1, 1, ...([99] as FixedArray<int>));
      expect(result.toString()).assertEqual('1,99,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3700
     * @tc.name testArrayToSplicedThree037
     * @tc.desc Verify large arrays support int delete and insert operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeIntArray(10000);
      const start: int = 1000;
      const deleteCount: int = 1000;
      const result = arr.toSpliced(start, deleteCount, ...([99999] as FixedArray<int>));
      expect(result.length).assertEqual(9001);
      expect(result[1000]).assertEqual(99999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3800
     * @tc.name testArrayToSplicedThree038
     * @tc.desc Verify start boundary values behave as expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const r1 = arr.toSpliced(0, 1, ...([0] as FixedArray<int>));
      const r2 = arr.toSpliced(2, 1, ...([0] as FixedArray<int>));
      const r3 = arr.toSpliced(3, 0, ...([4] as FixedArray<int>));
      expect(r1.toString()).assertEqual('0,2,3');
      expect(r2.toString()).assertEqual('1,2,0');
      expect(r3.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_3900
     * @tc.name testArrayToSplicedThree039
     * @tc.desc Verify delete boundary values behave as expected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const r1 = arr.toSpliced(0, 0, ...([10] as FixedArray<int>));
      const r2 = arr.toSpliced(0, 4, ...([10] as FixedArray<int>));
      const r3 = arr.toSpliced(0, arr.length, ...([] as FixedArray<int>));
      expect(r1.toString()).assertEqual('10,1,2,3,4');
      expect(r2.toString()).assertEqual('10');
      expect(r3.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4000
     * @tc.name testArrayToSplicedThree040
     * @tc.desc Verify int start parameters produce the expected replacement result for toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const start: int = 1;
      const result = arr.toSpliced(start, 1, ...([10] as FixedArray<int>));
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,10,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4100
     * @tc.name testArrayToSplicedThree041
     * @tc.desc Verify far negative start clamps to the head when replacing items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const start: int = -99;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [1, 2];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,20,30');
      expect(arr.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4200
     * @tc.name testArrayToSplicedThree042
     * @tc.desc Verify far positive start appends items and ignores deletion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const start: int = 999;
      const deleteCount: int = 999;
      const items: FixedArray<int> = [40, 50];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('10,20,30,40,50');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4300
     * @tc.name testArrayToSplicedThree043
     * @tc.desc Verify oversized deleteCount removes only the available tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = 2;
      const deleteCount: int = 999;
      const items: FixedArray<int> = [9];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,9');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4400
     * @tc.name testArrayToSplicedThree044
     * @tc.desc Verify empty FixedArray items with zero delete creates an unchanged copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 0;
      const items: FixedArray<int> = [];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,3');
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4500
     * @tc.name testArrayToSplicedThree045
     * @tc.desc Verify more than six inserted items preserve their spread order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 9);
      const start: int = 1;
      const deleteCount: int = 0;
      const items: FixedArray<int> = [2, 3, 4, 5, 6, 7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,3,4,5,6,7,8,9');
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4600
     * @tc.name testArrayToSplicedThree046
     * @tc.desc Verify null and undefined items are inserted into union arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<number | null | undefined> = [null, undefined];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4700
     * @tc.name testArrayToSplicedThree047
     * @tc.desc Verify explicit undefined in the source is preserved outside the deleted range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 1, 2);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<number | undefined> = [3];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(2);
      expect(arr[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4800
     * @tc.name testArrayToSplicedThree048
     * @tc.desc Verify an explicit undefined value in the copied prefix is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[0] = 5;
      arr[2] = 7;
      arr[3] = 9;
      const start: int = 2;
      const deleteCount: int = 0;
      const items: FixedArray<number | undefined> = [];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(7);
      expect(arr.indexOf(undefined)).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_4900
     * @tc.name testArrayToSplicedThree049
     * @tc.desc Verify explicit undefined values in a deleted span are not copied into the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      arr[0] = 1;
      arr[3] = 4;
      arr[4] = 5;
      const start: int = 1;
      const deleteCount: int = 2;
      const items: FixedArray<number | undefined> = [2, 3];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,3,4,5');
      expect(arr.indexOf(undefined)).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5000
     * @tc.name testArrayToSplicedThree050
     * @tc.desc Verify object references are reused for kept and inserted elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToSplicedThreeItem();
      first.value = 1;
      const second = new ToSplicedThreeItem();
      second.value = 2;
      const third = new ToSplicedThreeItem();
      third.value = 3;
      const replacement = new ToSplicedThreeItem();
      replacement.value = 9;
      const arr = new Array<ToSplicedThreeItem>(first, second, third);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<ToSplicedThreeItem> = [replacement];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result[0] === first).assertTrue();
      expect(result[1] === replacement).assertTrue();
      expect(result[2] === third).assertTrue();
      result[0].value = 99;
      expect(arr[0].value).assertEqual(99);
      expect(arr[1] === second).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5100
     * @tc.name testArrayToSplicedThree051
     * @tc.desc Verify nested array references remain shallow after insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToSplicedThreeNestedArrayItem(new Array<number>(1));
      const second = new ToSplicedThreeNestedArrayItem(new Array<number>(2));
      const inserted = new ToSplicedThreeNestedArrayItem(new Array<number>(3));
      const arr = new Array<ToSplicedThreeNestedArrayItem>(first, second);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<ToSplicedThreeNestedArrayItem> = [inserted];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result[0] === first).assertTrue();
      expect(result[1] === inserted).assertTrue();
      result[0].values[0] = 8;
      expect(arr[0].values[0]).assertEqual(8);
      expect(second.values[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5200
     * @tc.name testArrayToSplicedThree052
     * @tc.desc Verify start equal to length appends despite oversized deleteCount
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const start: int = arr.length;
      const deleteCount: int = 99;
      const items: FixedArray<int> = [3];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5300
     * @tc.name testArrayToSplicedThree053
     * @tc.desc Verify negative start equal to negative length targets the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = -3;
      const deleteCount: int = 2;
      const items: FixedArray<int> = [8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('8,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5400
     * @tc.name testArrayToSplicedThree054
     * @tc.desc Verify negative start beyond length clamps before a head insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20);
      const start: int = -3;
      const deleteCount: int = 0;
      const items: FixedArray<int> = [1];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5500
     * @tc.name testArrayToSplicedThree055
     * @tc.desc Verify oversized deleteCount from a negative start preserves the prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = -2;
      const deleteCount: int = 999;
      const items: FixedArray<int> = [8, 9];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,3,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5600
     * @tc.name testArrayToSplicedThree056
     * @tc.desc Verify string arrays can replace one element with fixed-array items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<string> = ['x', 'y'];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('a,x,y,c');
      expect(arr.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5700
     * @tc.name testArrayToSplicedThree057
     * @tc.desc Verify boolean arrays preserve inserted boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const start: int = 2;
      const deleteCount: int = 1;
      const items: FixedArray<boolean> = [false, false];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('true,false,false,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5800
     * @tc.name testArrayToSplicedThree058
     * @tc.desc Verify bigint arrays keep bigint insertions and result length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const start: int = 1;
      const deleteCount: int = 2;
      const items: FixedArray<bigint> = [9n, 8n];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result[0]).assertEqual(1n);
      expect(result[1]).assertEqual(9n);
      expect(result[2]).assertEqual(8n);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_5900
     * @tc.name testArrayToSplicedThree059
     * @tc.desc Verify duplicate source and inserted values are retained independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 2, 3);
      const start: int = 2;
      const deleteCount: int = 0;
      const items: FixedArray<int> = [2, 2];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,2,2,2,3');
      expect(arr.toString()).assertEqual('1,2,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6000
     * @tc.name testArrayToSplicedThree060
     * @tc.desc Verify toSpliced with negative int start can insert fixed-array items before the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4, 5);
      const start: int = -1;
      const deleteCount: int = 0;
      const items: FixedArray<int> = [14, 15];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('2,3,4,14,15,5');
      expect(arr.toString()).assertEqual('2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6100
     * @tc.name testArrayToSplicedThree061
     * @tc.desc Verify result mutation after primitive replacement does not mutate the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7];
      const result = arr.toSpliced(start, deleteCount, ...items);
      result[0] = 99;
      expect(result.toString()).assertEqual('99,7,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6200
     * @tc.name testArrayToSplicedThree062
     * @tc.desc Verify int start delete and fixed-array items can insert without deleting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 0;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,7,8,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6300
     * @tc.name testArrayToSplicedThree063
     * @tc.desc Verify int start delete and fixed-array items can replace the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 0;
      const deleteCount: int = arr.length;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6400
     * @tc.name testArrayToSplicedThree064
     * @tc.desc Verify int start delete and fixed-array items can append at array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = arr.length;
      const deleteCount: int = 0;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,3,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6500
     * @tc.name testArrayToSplicedThree065
     * @tc.desc Verify int start delete and fixed-array items can use a negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = -2;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,2,7,8,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6600
     * @tc.name testArrayToSplicedThree066
     * @tc.desc Verify int start delete and fixed-array items can preserve the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const before = arr.toString();
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7];
      arr.toSpliced(start, deleteCount, ...items);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6700
     * @tc.name testArrayToSplicedThree067
     * @tc.desc Verify int start delete and fixed-array items return a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6800
     * @tc.name testArrayToSplicedThree068
     * @tc.desc Verify int start delete and fixed-array items can operate on Array.of results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5, 6);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('4,7,8,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_6900
     * @tc.name testArrayToSplicedThree069
     * @tc.desc Verify int start delete and fixed-array items can operate on Array.from results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6));
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('2,7,8,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7000
     * @tc.name testArrayToSplicedThree070
     * @tc.desc Verify int start delete and fixed-array items can operate after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('3,7,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7100
     * @tc.name testArrayToSplicedThree071
     * @tc.desc Verify int start delete and fixed-array items can operate after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,7,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7200
     * @tc.name testArrayToSplicedThree072
     * @tc.desc Verify int start delete and fixed-array items can operate after shrinkTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('1,7,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7300
     * @tc.name testArrayToSplicedThree073
     * @tc.desc Verify int start delete and fixed-array items can operate on duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('2,7,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7400
     * @tc.name testArrayToSplicedThree074
     * @tc.desc Verify int start delete and fixed-array items can operate on negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 0, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [-9, -8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('-3,-9,-8,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7500
     * @tc.name testArrayToSplicedThree075
     * @tc.desc Verify int start delete and fixed-array items can chain with join after replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.join('-')).assertEqual('1-7-8-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7600
     * @tc.name testArrayToSplicedThree076
     * @tc.desc Verify int start delete and fixed-array items can chain with with after replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items).with(2, 9);
      expect(result.toString()).assertEqual('1,7,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7700
     * @tc.name testArrayToSplicedThree077
     * @tc.desc Verify int start delete and fixed-array items can chain with slice after replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items).slice(1, 3);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7800
     * @tc.name testArrayToSplicedThree078
     * @tc.desc Verify int start delete and fixed-array items keep the result typed as Array number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7];
      const result: Array<number> = arr.toSpliced(start, deleteCount, ...items);
      expect(result[1]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_7900
     * @tc.name testArrayToSplicedThree079
     * @tc.desc Verify int start delete and fixed-array items can operate on a large generated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 10; i++) {
        arr.pushOne(i);
      }
      const start: int = 4;
      const deleteCount: int = 2;
      const items: FixedArray<int> = [70, 80];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.slice(3, 7).toString()).assertEqual('3,70,80,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8000
     * @tc.name testArrayToSplicedThree080
     * @tc.desc Verify int start delete and fixed-array items can operate after length reset and rebuild
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      arr.pushOne(9);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [70];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('7,70,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8100
     * @tc.name testArrayToSplicedThree081
     * @tc.desc Verify int start delete and fixed-array items can operate on an empty array for insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const start: int = 0;
      const deleteCount: int = 0;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8200
     * @tc.name testArrayToSplicedThree082
     * @tc.desc Verify int start delete and fixed-array items can operate on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      const start: int = 0;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8300
     * @tc.name testArrayToSplicedThree083
     * @tc.desc Verify int start delete and fixed-array items keep array identity separate from the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const deleteCount: int = 1;
      const items: FixedArray<int> = [7];
      const result = arr.toSpliced(start, deleteCount, ...items);
      expect(arr === result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8400
     * @tc.name testArrayToSplicedThree084
     * @tc.desc Verify toSpliced kind 3 can delete nothing at the head and prepend new values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3);
        const start: int = 0;
        const deleteCount: int = 0;
        const items: FixedArray<int> = [9, 8];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('9,8,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8500
     * @tc.name testArrayToSplicedThree085
     * @tc.desc Verify toSpliced kind 3 can delete nothing at the tail and append new values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3);
        const start: int = 3;
        const deleteCount: int = 0;
        const items: FixedArray<int> = [9, 8];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('1,2,3,9,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8600
     * @tc.name testArrayToSplicedThree086
     * @tc.desc Verify toSpliced kind 3 can replace the first element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3);
        const start: int = 0;
        const deleteCount: int = 1;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('9,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8700
     * @tc.name testArrayToSplicedThree087
     * @tc.desc Verify toSpliced kind 3 can replace the last element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3);
        const start: int = 2;
        const deleteCount: int = 1;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('1,2,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8800
     * @tc.name testArrayToSplicedThree088
     * @tc.desc Verify toSpliced kind 3 can replace the middle with a longer insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3, 4);
        const start: int = 1;
        const deleteCount: int = 2;
        const items: FixedArray<int> = [9, 8, 7];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('1,9,8,7,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_8900
     * @tc.name testArrayToSplicedThree089
     * @tc.desc Verify toSpliced kind 3 can replace the middle with a shorter insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3, 4);
        const start: int = 1;
        const deleteCount: int = 2;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('1,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9000
     * @tc.name testArrayToSplicedThree090
     * @tc.desc Verify toSpliced kind 3 can operate on duplicate number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(4, 4, 4, 4);
        const start: int = 1;
        const deleteCount: int = 2;
        const items: FixedArray<int> = [9, 9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('4,9,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9100
     * @tc.name testArrayToSplicedThree091
     * @tc.desc Verify toSpliced kind 3 can operate on arrays that already contain inserted values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(7, 8, 9, 10);
        const start: int = 2;
        const deleteCount: int = 1;
        const items: FixedArray<int> = [70, 80];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('7,8,70,80,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9200
     * @tc.name testArrayToSplicedThree092
     * @tc.desc Verify toSpliced kind 3 can operate after concat and reverse are combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
        arr.reverse();
        const start: int = 1;
        const deleteCount: int = 2;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('4,9,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9300
     * @tc.name testArrayToSplicedThree093
     * @tc.desc Verify toSpliced kind 3 can operate after toReversed and with are combined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3, 4).toReversed().with(1, 6);
        const start: int = 2;
        const deleteCount: int = 1;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('4,6,9,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9400
     * @tc.name testArrayToSplicedThree094
     * @tc.desc Verify toSpliced kind 3 can operate after toSorted produces ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(4, 1, 3, 2).toSorted((left: number, right: number): int => {
          if (left < right) {
            return -1;
          }
          if (left > right) {
            return 1;
          }
          return 0;
        });
        const start: int = 1;
        const deleteCount: int = 2;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('1,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9500
     * @tc.name testArrayToSplicedThree095
     * @tc.desc Verify toSpliced kind 3 can operate after slice narrows the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3, 4, 5).slice(1, 5);
        const start: int = 1;
        const deleteCount: int = 2;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('2,9,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9600
     * @tc.name testArrayToSplicedThree096
     * @tc.desc Verify toSpliced kind 3 can operate after filter narrows the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value >= 2);
        const start: int = 1;
        const deleteCount: int = 2;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('2,9,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9700
     * @tc.name testArrayToSplicedThree097
     * @tc.desc Verify toSpliced kind 3 can operate after shift and pop have both changed bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3, 4, 5);
        arr.shift();
        arr.pop();
        const start: int = 1;
        const deleteCount: int = 1;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result.toString()).assertEqual('2,9,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9800
     * @tc.name testArrayToSplicedThree098
     * @tc.desc Verify toSpliced kind 3 can preserve array type when assigned explicitly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Array<number> = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3);
        const start: int = 1;
        const deleteCount: int = 1;
        const items: FixedArray<int> = [9];
        return arr.toSpliced(start, deleteCount, ...items);
      })();
      expect(result[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_THREE_9900
     * @tc.name testArrayToSplicedThree099
     * @tc.desc Verify spread-item toSpliced supports consecutive chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedThree099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const firstItems: FixedArray<int> = [9, 8];
      const secondItems: FixedArray<int> = [7];
      const result = arr.toSpliced(1, 2, ...firstItems).toSpliced(2, 1, ...secondItems);
      expect(result.toString()).assertEqual('1,9,7,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

  });
}
