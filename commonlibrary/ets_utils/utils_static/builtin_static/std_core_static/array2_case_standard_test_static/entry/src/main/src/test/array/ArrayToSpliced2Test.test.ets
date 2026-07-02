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

class ToSplicedTwoItem040 {
  value: number = 0;
}

class ToSplicedSideEffectItem104 {
  hits: int = 0;

  toString(): string {
    this.hits++;
    return 'side';
  }
}

function createLargeNumberArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function toSplicedWithItems<T>(arr: Array<T>, start: int, deleteCount: int, items: FixedArray<T>): Array<T> {
  if (items.length == 0) {
    return arr.toSpliced(start, deleteCount);
  }
  if (items.length == 1) {
    return arr.toSpliced(start, deleteCount, items[0]);
  }
  if (items.length == 2) {
    return arr.toSpliced(start, deleteCount, items[0], items[1]);
  }
  if (items.length == 3) {
    return arr.toSpliced(start, deleteCount, items[0], items[1], items[2]);
  }
  if (items.length == 4) {
    return arr.toSpliced(start, deleteCount, items[0], items[1], items[2], items[3]);
  }
  if (items.length == 5) {
    return arr.toSpliced(start, deleteCount, items[0], items[1], items[2], items[3], items[4]);
  }

  let result = arr.toSpliced(start, deleteCount);
  for (let i: int = items.length - 1; i >= 0; i--) {
    result = result.toSpliced(start, 0, items[i]);
  }
  return result;
}

export default function ArrayToSpliced2Test(): void {
  describe('ArrayToSpliced2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_0100
     * @tc.name testArrayToSplicedTwo001
     * @tc.desc Verify toSpliced accepts start delete and items parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const items: FixedArray<string> = ['x', 'y'];
      const result = toSplicedWithItems(arr, 1, 1, items);
      expect(result.toString()).assertEqual('a,x,y,c');
      expect(arr.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_0200
     * @tc.name testArrayToSplicedTwo002
     * @tc.desc Verify start can be passed as a number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 1;
      const items: FixedArray<number> = [99, 100];
      const result = toSplicedWithItems(arr, start, 2, items);
      expect(result.toString()).assertEqual('1,99,100,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_0300
     * @tc.name testArrayToSplicedTwo003
     * @tc.desc Verify delete count can be passed as a number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const deleteCount: int = 2;
      const items: FixedArray<number> = [10];
      const result = toSplicedWithItems(arr, 1, deleteCount, items);
      expect(result.toString()).assertEqual('1,10,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_0400
     * @tc.name testArrayToSplicedTwo004
     * @tc.desc Verify items can be omitted inserted once or inserted many times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const emptyItems: FixedArray<number> = [];
      const oneItem: FixedArray<number> = [10];
      const manyItems: FixedArray<number> = [10, 20];
      const result1 = toSplicedWithItems(arr, 1, 1, emptyItems);
      const result2 = toSplicedWithItems(arr, 1, 1, oneItem);
      const result3 = toSplicedWithItems(arr, 1, 1, manyItems);
      expect(result1.toString()).assertEqual('1,3');
      expect(result2.toString()).assertEqual('1,10,3');
      expect(result3.toString()).assertEqual('1,10,20,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_0500
     * @tc.name testArrayToSplicedTwo005
     * @tc.desc Verify start parameter uses number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [100];
      const result = toSplicedWithItems(arr, 0, 1, items);
      expect(result.toString()).assertEqual('100,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_0600
     * @tc.name testArrayToSplicedTwo006
     * @tc.desc Verify delete parameter uses number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const items: FixedArray<number> = [10];
      const result = toSplicedWithItems(arr, 1, 2, items);
      expect(result.toString()).assertEqual('1,10,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_0700
     * @tc.name testArrayToSplicedTwo007
     * @tc.desc Verify items can be provided as a fixed array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10, 20];
      const result = toSplicedWithItems(arr, 0, 2, items);
      expect(result.toString()).assertEqual('10,20,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_0800
     * @tc.name testArrayToSplicedTwo008
     * @tc.desc Verify items support spread syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      const insertItems: FixedArray<string> = ['x', 'y', 'z'];
      const result = toSplicedWithItems(arr, 1, 0, insertItems);
      expect(result.toString()).assertEqual('a,x,y,z,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_0900
     * @tc.name testArrayToSplicedTwo009
     * @tc.desc Verify toSpliced returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10];
      const result = toSplicedWithItems(arr, 1, 1, items);
      expect(Array.isArray(result)).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1000
     * @tc.name testArrayToSplicedTwo010
     * @tc.desc Verify toSpliced keeps the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const originalStr = arr.toString();
      const items: FixedArray<number> = [10, 20];
      toSplicedWithItems(arr, 0, 2, items);
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1100
     * @tc.name testArrayToSplicedTwo011
     * @tc.desc Verify returned arrays contain the inserted elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10, 20];
      const result = toSplicedWithItems(arr, 1, 1, items);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(20);
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1200
     * @tc.name testArrayToSplicedTwo012
     * @tc.desc Verify toSpliced works on empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const items: FixedArray<number> = [1, 2];
      const result = toSplicedWithItems(arr, 0, 0, items);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1300
     * @tc.name testArrayToSplicedTwo013
     * @tc.desc Verify start values beyond the array length append items at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [100];
      const result = toSplicedWithItems(arr, 10, 1, items);
      expect(result.toString()).assertEqual('1,2,3,100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1400
     * @tc.name testArrayToSplicedTwo014
     * @tc.desc Verify delete counts beyond the tail remove to the end before inserting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10];
      const result = toSplicedWithItems(arr, 1, 10, items);
      expect(result.toString()).assertEqual('1,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1500
     * @tc.name testArrayToSplicedTwo015
     * @tc.desc Verify delete zero inserts without removing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10, 20];
      const result = toSplicedWithItems(arr, 1, 0, items);
      expect(result.toString()).assertEqual('1,10,20,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1600
     * @tc.name testArrayToSplicedTwo016
     * @tc.desc Verify empty fixed item arrays perform delete-only operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [];
      const result = toSplicedWithItems(arr, 1, 1, items);
      expect(result.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1700
     * @tc.name testArrayToSplicedTwo017
     * @tc.desc Verify toSpliced differs from splice by keeping the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const arr2 = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10];
      const toSplicedResult = toSplicedWithItems(arr1, 1, 1, items);
      const splicedResult = arr2.splice(1, 1, 10);
      expect(arr1.toString()).assertEqual('1,2,3');
      expect(arr2.toString()).assertEqual('1,10,3');
      expect(toSplicedResult.toString()).assertEqual('1,10,3');
      expect(splicedResult.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1800
     * @tc.name testArrayToSplicedTwo018
     * @tc.desc Verify toSpliced replaces a middle segment when start and deleteCount are provided directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 1, 10);
      expect(result.length).assertEqual(4);
      expect(result.toString()).assertEqual('1,10,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_1900
     * @tc.name testArrayToSplicedTwo019
     * @tc.desc Verify toSpliced can replace multiple removed elements with a single inserted value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(1, 2, 10);
      expect(result.length).assertEqual(4);
      expect(result.toString()).assertEqual('1,10,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2000
     * @tc.name testArrayToSplicedTwo020
     * @tc.desc Verify negative start values count from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const items: FixedArray<number> = [10];
      const result = toSplicedWithItems(arr, -2, 1, items);
      expect(result.toString()).assertEqual('1,2,10,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2100
     * @tc.name testArrayToSplicedTwo021
     * @tc.desc Verify toSpliced can replace the first element when start is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(0, 1, 10);
      expect(result[0]).assertEqual(10);
      expect(result.toString()).assertEqual('10,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2200
     * @tc.name testArrayToSplicedTwo022
     * @tc.desc Verify a single inserted item is placed at the target index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10];
      const result = toSplicedWithItems(arr, 1, 1, items);
      expect(result.toString()).assertEqual('1,10,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2300
     * @tc.name testArrayToSplicedTwo023
     * @tc.desc Verify multiple inserted items preserve their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10, 20, 30];
      const result = toSplicedWithItems(arr, 1, 0, items);
      expect(result.toString()).assertEqual('1,10,20,30,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2400
     * @tc.name testArrayToSplicedTwo024
     * @tc.desc Verify many inserted items expand the returned array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const items: FixedArray<number> = [10, 20, 30, 40, 50];
      const result = toSplicedWithItems(arr, 1, 0, items);
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2500
     * @tc.name testArrayToSplicedTwo025
     * @tc.desc Verify toSpliced keeps original length and boundaries unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const originalLast = arr[arr.length - 1];
      const items: FixedArray<number> = [100, 200];
      toSplicedWithItems(arr, 0, 2, items);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[3]).assertEqual(originalLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2600
     * @tc.name testArrayToSplicedTwo026
     * @tc.desc Verify returned arrays are independent instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10];
      const result = toSplicedWithItems(arr, 1, 1, items);
      result[0] = 999;
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2700
     * @tc.name testArrayToSplicedTwo027
     * @tc.desc Verify toSpliced can replace elements without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const items: FixedArray<number> = [10, 20];
      const result = toSplicedWithItems(arr, 1, 2, items);
      expect(result.toString()).assertEqual('1,10,20,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2800
     * @tc.name testArrayToSplicedTwo028
     * @tc.desc Verify toSpliced can delete elements and insert replacements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const items: FixedArray<number> = [10];
      const result = toSplicedWithItems(arr, 1, 3, items);
      expect(result.toString()).assertEqual('1,10,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_2900
     * @tc.name testArrayToSplicedTwo029
     * @tc.desc Verify toSpliced can append items at the end when start equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10, 20];
      const result = toSplicedWithItems(arr, 3, 0, items);
      expect(result.toString()).assertEqual('1,2,3,10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3000
     * @tc.name testArrayToSplicedTwo030
     * @tc.desc Verify chained toSpliced calls can be composed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const firstItems: FixedArray<number> = [100];
      const secondItems: FixedArray<number> = [200];
      const result = toSplicedWithItems(toSplicedWithItems(arr, 0, 1, firstItems), 2, 1, secondItems);
      expect(result.toString()).assertEqual('100,2,200,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3100
     * @tc.name testArrayToSplicedTwo031
     * @tc.desc Verify generic result arrays preserve element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10];
      const result: Array<number> = toSplicedWithItems(arr, 1, 1, items);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3200
     * @tc.name testArrayToSplicedTwo032
     * @tc.desc Verify floating-point inserted values keep numeric element typing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [1.5, 2.5];
      const result = toSplicedWithItems(arr, 1, 1, items);
      expect(result[1]).assertEqual(1.5);
      expect(result[2]).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3300
     * @tc.name testArrayToSplicedTwo033
     * @tc.desc Verify object arrays support toSpliced with fixed-array inserts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new ToSplicedTwoItem040();
      item1.value = 100;
      let item2 = new ToSplicedTwoItem040();
      item2.value = 200;
      const arr = Array.create<ToSplicedTwoItem040>(1, item1);
      const items: FixedArray<ToSplicedTwoItem040> = [item2];
      const result = toSplicedWithItems(arr, 1, 0, items);
      expect(result.length).assertEqual(2);
      expect(result[1].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3400
     * @tc.name testArrayToSplicedTwo034
     * @tc.desc Verify toSpliced can remove all elements from an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [];
      const result = toSplicedWithItems(arr, 0, 3, items);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3500
     * @tc.name testArrayToSplicedTwo035
     * @tc.desc Verify toSpliced can replace all elements with new values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10, 20, 30];
      const result = toSplicedWithItems(arr, 0, 3, items);
      expect(result.toString()).assertEqual('10,20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3600
     * @tc.name testArrayToSplicedTwo036
     * @tc.desc Verify toSpliced can insert elements at the beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [100, 200];
      const result = toSplicedWithItems(arr, 0, 0, items);
      expect(result.toString()).assertEqual('100,200,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3700
     * @tc.name testArrayToSplicedTwo037
     * @tc.desc Verify toSpliced can be combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const items: FixedArray<number> = [10, 20];
      const result = toSplicedWithItems(arr, 1, 2, items).map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('2,20,40,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3800
     * @tc.name testArrayToSplicedTwo038
     * @tc.desc Verify toSpliced can be combined with filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const items: FixedArray<number> = [5];
      const result = toSplicedWithItems(arr, 0, 1, items).filter((v: number): boolean => v > 2);
      expect(result.toString()).assertEqual('5,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_3900
     * @tc.name testArrayToSplicedTwo039
     * @tc.desc Verify mapped arrays can call toSpliced afterward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [999];
      const result = toSplicedWithItems(
        arr.map((v: number): number => v * 10),
        1,
        1,
        items
      );
      expect(result.toString()).assertEqual('10,999,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4000
     * @tc.name testArrayToSplicedTwo040
     * @tc.desc Verify large arrays support delete and insert operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(10000);
      const items: FixedArray<number> = [99999];
      const result = toSplicedWithItems(arr, 1000, 1000, items);
      expect(result.length).assertEqual(9001);
      expect(result[999]).assertEqual(999);
      expect(result[1000]).assertEqual(99999);
      expect(result[1001]).assertEqual(2000);
      expect(result[9000]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4100
     * @tc.name testArrayToSplicedTwo041
     * @tc.desc Verify toSpliced allocates a new array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<number> = [10, 20, 30];
      const result = toSplicedWithItems(arr, 1, 1, items);
      expect(result !== arr).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4200
     * @tc.name testArrayToSplicedTwo042
     * @tc.desc Verify different start positions can be combined with the same delete count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const items: FixedArray<number> = [0];
      expect(toSplicedWithItems(arr, 0, 1, items).toString()).assertEqual('0,2,3,4,5');
      expect(toSplicedWithItems(arr, 2, 1, items).toString()).assertEqual('1,2,0,4,5');
      expect(toSplicedWithItems(arr, 4, 1, items).toString()).assertEqual('1,2,3,4,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4300
     * @tc.name testArrayToSplicedTwo043
     * @tc.desc Verify different delete counts can be combined with the same start position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const items: FixedArray<number> = [9];
      expect(toSplicedWithItems(arr, 0, 0, items).toString()).assertEqual('9,1,2,3,4,5');
      expect(toSplicedWithItems(arr, 0, 1, items).toString()).assertEqual('9,2,3,4,5');
      expect(toSplicedWithItems(arr, 0, 5, items).toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4400
     * @tc.name testArrayToSplicedTwo044
     * @tc.desc Verify inserting at the head preserves an explicit undefined middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(0, 0, 9);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4500
     * @tc.name testArrayToSplicedTwo045
     * @tc.desc Verify inserting before an explicit undefined element keeps the inserted item before that undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(1, 0, 9);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(9);
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4600
     * @tc.name testArrayToSplicedTwo046
     * @tc.desc Verify replacing the tail with many items preserves an earlier explicit undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(2, 1, 4, 5);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(4);
      expect(result[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4700
     * @tc.name testArrayToSplicedTwo047
     * @tc.desc Verify appending beyond length preserves an explicit undefined middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(100, 0, 4);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4800
     * @tc.name testArrayToSplicedTwo048
     * @tc.desc Verify far negative insertion clamps to the head and preserves explicit undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(-100, 0, 9);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(9);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_4900
     * @tc.name testArrayToSplicedTwo049
     * @tc.desc Verify negative start insertion counts from the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(-2, 0, 9);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(9);
      expect(result[2]).assertUndefined();
      expect(result[3]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5000
     * @tc.name testArrayToSplicedTwo050
     * @tc.desc Verify negative delete count inserts without removing original elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, -100, 9);
      expect(result.toString()).assertEqual('1,9,2,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5100
     * @tc.name testArrayToSplicedTwo051
     * @tc.desc Verify oversized delete count replaces the whole tail with inserted items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 100, 9);
      expect(result.toString()).assertEqual('1,9');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5200
     * @tc.name testArrayToSplicedTwo052
     * @tc.desc Verify object references are shallow-copied when new items are inserted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const kept = new ToSplicedTwoItem040();
      const inserted = new ToSplicedTwoItem040();
      kept.value = 1;
      inserted.value = 2;
      const arr = Array.create<ToSplicedTwoItem040>(1, kept);
      const result = arr.toSpliced(0, 0, inserted);
      expect(result.length).assertEqual(2);
      expect(result[0] === inserted).assertTrue();
      expect(result[1] === kept).assertTrue();
      expect(arr[0] === kept).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5300
     * @tc.name testArrayToSplicedTwo053
     * @tc.desc Verify inserting into a dense array with undefined keeps the source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(1, 0, 2);
      expect(result.toString()).assertEqual('1,2,,3');
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5400
     * @tc.name testArrayToSplicedTwo054
     * @tc.desc Verify deleting a sparse slot while inserting removes that hole from the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(1, 1, 2);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,2,3');
      expect(result.lastIndexOf(undefined)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5500
     * @tc.name testArrayToSplicedTwo055
     * @tc.desc Verify appending to a fully sparse array creates dense undefined prefix values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const result = arr.toSpliced(2, 0, 7);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(7);
      expect(arr.indexOf(undefined)).assertEqual(0);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5600
     * @tc.name testArrayToSplicedTwo056
     * @tc.desc Verify large-array head insertion preserves length and boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(10000);
      const result = arr.toSpliced(0, 0, -3, -2, -1);
      expect(result.length).assertEqual(10003);
      expect(result[0]).assertEqual(-3);
      expect(result[3]).assertEqual(0);
      expect(result[10002]).assertEqual(9999);
      expect(arr.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5700
     * @tc.name testArrayToSplicedTwo057
     * @tc.desc Verify large-array far positive insertion appends after cloning the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(10000);
      const result = arr.toSpliced(1000000, 0, 10000, 10001);
      expect(result.length).assertEqual(10002);
      expect(result[0]).assertEqual(0);
      expect(result[9999]).assertEqual(9999);
      expect(result[10000]).assertEqual(10000);
      expect(result[10001]).assertEqual(10001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5800
     * @tc.name testArrayToSplicedTwo058
     * @tc.desc Verify large-array oversized tail deletion leaves only the prefix and inserted value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(10000);
      const result = arr.toSpliced(1, 1000000, 99999);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(99999);
      expect(arr.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_5900
     * @tc.name testArrayToSplicedTwo059
     * @tc.desc Verify inserting many literal values returns the expected copied array and leaves the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.toSpliced(0, 0, 10, 20, 30, 40, 50);
      expect(result.length).assertEqual(6);
      expect(result.toString()).assertEqual('10,20,30,40,50,1');
      expect(arr.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6000
     * @tc.name testArrayToSplicedTwo060
     * @tc.desc Verify toSpliced with inserted values can replace middle value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.toSpliced(1, 1, 14, 15);
      expect(result.toString()).assertEqual('2,14,15,4');
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6100
     * @tc.name testArrayToSplicedTwo061
     * @tc.desc Verify toSpliced with number start delete and items can replace one middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 1, 7, 8);
      expect(result.toString()).assertEqual('1,7,8,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6200
     * @tc.name testArrayToSplicedTwo062
     * @tc.desc Verify toSpliced with number start delete and items can insert without deleting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 0, 7, 8);
      expect(result.toString()).assertEqual('1,7,8,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6300
     * @tc.name testArrayToSplicedTwo063
     * @tc.desc Verify toSpliced with number start delete and items can append at array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(arr.length, 0, 7, 8);
      expect(result.toString()).assertEqual('1,2,3,7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6400
     * @tc.name testArrayToSplicedTwo064
     * @tc.desc Verify toSpliced with number start delete and items can replace the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(0, arr.length, 7, 8);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6500
     * @tc.name testArrayToSplicedTwo065
     * @tc.desc Verify toSpliced with number start delete and items can use a negative start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(-2, 1, 7, 8);
      expect(result.toString()).assertEqual('1,2,7,8,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6600
     * @tc.name testArrayToSplicedTwo066
     * @tc.desc Verify toSpliced with number start delete and items can use spread values from a fixed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const items: FixedArray<int> = [7, 8];
      const result = arr.toSpliced(1, 1, ...items);
      expect(result.toString()).assertEqual('1,7,8,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6700
     * @tc.name testArrayToSplicedTwo067
     * @tc.desc Verify toSpliced with number start delete and items returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 1, 7);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6800
     * @tc.name testArrayToSplicedTwo068
     * @tc.desc Verify toSpliced with number start delete and items preserves the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const before = arr.toString();
      arr.toSpliced(1, 1, 7);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_6900
     * @tc.name testArrayToSplicedTwo069
     * @tc.desc Verify toSpliced with number start delete and items can operate on Array.of results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5, 6);
      const result = arr.toSpliced(1, 1, 7, 8);
      expect(result.toString()).assertEqual('4,7,8,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7000
     * @tc.name testArrayToSplicedTwo070
     * @tc.desc Verify toSpliced with number start delete and items can operate on Array.from results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6));
      const result = arr.toSpliced(1, 1, 7, 8);
      expect(result.toString()).assertEqual('2,7,8,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7100
     * @tc.name testArrayToSplicedTwo071
     * @tc.desc Verify toSpliced with number start delete and items can operate after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      const result = arr.toSpliced(1, 1, 7);
      expect(result.toString()).assertEqual('3,7,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7200
     * @tc.name testArrayToSplicedTwo072
     * @tc.desc Verify toSpliced with number start delete and items can operate after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      const result = arr.toSpliced(1, 1, 7);
      expect(result.toString()).assertEqual('1,7,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7300
     * @tc.name testArrayToSplicedTwo073
     * @tc.desc Verify toSpliced with number start delete and items can operate after shrinkTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      const result = arr.toSpliced(1, 1, 7);
      expect(result.toString()).assertEqual('1,7,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7400
     * @tc.name testArrayToSplicedTwo074
     * @tc.desc Verify toSpliced with number start delete and items can operate on duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2);
      const result = arr.toSpliced(1, 1, 7);
      expect(result.toString()).assertEqual('2,7,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7500
     * @tc.name testArrayToSplicedTwo075
     * @tc.desc Verify toSpliced with number start delete and items can operate on negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 0, 3);
      const result = arr.toSpliced(1, 1, -9, -8);
      expect(result.toString()).assertEqual('-3,-9,-8,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7600
     * @tc.name testArrayToSplicedTwo076
     * @tc.desc Verify toSpliced with number start delete and items can chain with join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 1, 7, 8);
      expect(result.join('-')).assertEqual('1-7-8-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7700
     * @tc.name testArrayToSplicedTwo077
     * @tc.desc Verify toSpliced with number start delete and items can chain with with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 1, 7, 8).with(2, 9);
      expect(result.toString()).assertEqual('1,7,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7800
     * @tc.name testArrayToSplicedTwo078
     * @tc.desc Verify toSpliced with number start delete and items can chain with slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 1, 7, 8).slice(1, 3);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_7900
     * @tc.name testArrayToSplicedTwo079
     * @tc.desc Verify toSpliced with number start delete and items can operate on a large generated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 10; i++) {
        arr.pushOne(i);
      }
      const result = arr.toSpliced(4, 2, 70, 80);
      expect(result.slice(3, 7).toString()).assertEqual('3,70,80,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8000
     * @tc.name testArrayToSplicedTwo080
     * @tc.desc Verify toSpliced with number start delete and items can operate after length reset and rebuild
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      arr.pushOne(9);
      const result = arr.toSpliced(1, 1, 70);
      expect(result.toString()).assertEqual('7,70,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8100
     * @tc.name testArrayToSplicedTwo081
     * @tc.desc Verify toSpliced with number start delete and items can operate on an empty array for insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.toSpliced(0, 0, 7, 8);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8200
     * @tc.name testArrayToSplicedTwo082
     * @tc.desc Verify toSpliced with number start delete and items can operate on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      const result = arr.toSpliced(0, 1, 7, 8);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8300
     * @tc.name testArrayToSplicedTwo083
     * @tc.desc Verify toSpliced with number start delete and items keeps array identity separate from the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 1, 7);
      expect(arr === result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8400
     * @tc.name testArrayToSplicedTwo084
     * @tc.desc Verify negative zero start behaves like zero when replacing at the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = -0;
      const result = arr.toSpliced(start, 1, 9);
      expect(result.toString()).assertEqual('9,2,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8500
     * @tc.name testArrayToSplicedTwo085
     * @tc.desc Verify inserting explicit undefined keeps the slot in the returned array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 2);
      const result = arr.toSpliced(1, 0, undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(2);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8600
     * @tc.name testArrayToSplicedTwo086
     * @tc.desc Verify spread fixed-array items can include explicit undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>();
      const items: FixedArray<number | undefined> = [1, undefined, 3];
      const result = arr.toSpliced(0, 0, ...items);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8700
     * @tc.name testArrayToSplicedTwo087
     * @tc.desc Verify string array insertion preserves character order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'c');
      const result = arr.toSpliced(1, 0, 'b');
      expect(result.join('')).assertEqual('abc');
      expect(arr.join('')).assertEqual('ac');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8800
     * @tc.name testArrayToSplicedTwo088
     * @tc.desc Verify values prepared through Set de-duplication can be inserted in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const unique = Array.from<number>(new Set<number>(new Array<number>(1, 1, 2)));
      const result = Array.create<number>(1, 0).toSpliced(1, 0, unique[0], unique[1]);
      expect(result.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_8900
     * @tc.name testArrayToSplicedTwo089
     * @tc.desc Verify inserted objects are not coerced to string during toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = new ToSplicedSideEffectItem104();
      const right = new ToSplicedSideEffectItem104();
      const inserted = new ToSplicedSideEffectItem104();
      const arr = new Array<ToSplicedSideEffectItem104>(left, right);
      const result = arr.toSpliced(1, 0, inserted);
      expect(inserted.hits).assertEqual(0);
      expect(result[1] === inserted).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9000
     * @tc.name testArrayToSplicedTwo090
     * @tc.desc Verify inserting undefined before a negative start target keeps tail values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 3);
      const result = arr.toSpliced(-1, 0, undefined);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9100
     * @tc.name testArrayToSplicedTwo091
     * @tc.desc Verify replacing explicit undefined with a value keeps the source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      const result = arr.toSpliced(1, 1, 2);
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9200
     * @tc.name testArrayToSplicedTwo092
     * @tc.desc Verify deleting all values and inserting undefined returns one dense slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, 2, 3);
      const result = arr.toSpliced(0, arr.length, undefined);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertUndefined();
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9300
     * @tc.name testArrayToSplicedTwo093
     * @tc.desc Verify mutating the returned array does not modify the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.toSpliced(1, 0, 9);
      result[0] = 100;
      expect(result.toString()).assertEqual('100,9,2');
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9400
     * @tc.name testArrayToSplicedTwo094
     * @tc.desc Verify deleting from a toReversed result leaves the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed().toSpliced(1, 1, 9);
      expect(result.toString()).assertEqual('3,9,1');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9500
     * @tc.name testArrayToSplicedTwo095
     * @tc.desc Verify deleting from a sorted copy preserves the unsorted source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      const result = arr.toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      }).toSpliced(1, 1, 9);
      expect(result.toString()).assertEqual('1,9,3');
      expect(arr.toString()).assertEqual('3,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9600
     * @tc.name testArrayToSplicedTwo096
     * @tc.desc Verify insertion after slice uses the narrowed copy only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const narrowed = arr.slice(1, 4);
      const result = narrowed.toSpliced(1, 0, 9);
      expect(result.toString()).assertEqual('2,9,3,4');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9700
     * @tc.name testArrayToSplicedTwo097
     * @tc.desc Verify filtered data can be spliced without restoring removed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter((value: number): boolean => value >= 2);
      const result = filtered.toSpliced(1, 2, 9);
      expect(result.toString()).assertEqual('2,9,5');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9800
     * @tc.name testArrayToSplicedTwo098
     * @tc.desc Verify toSpliced result can be assigned with the explicit array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Array<number> = new Array<number>(1, 2, 3).toSpliced(1, 1, 9);
      expect(result[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_TWO_9900
     * @tc.name testArrayToSplicedTwo099
     * @tc.desc Verify toSpliced with item helper supports consecutive chained calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const firstItems: FixedArray<number> = [9, 8];
      const secondItems: FixedArray<number> = [7];
      const result = toSplicedWithItems(arr, 1, 2, firstItems);
      const chained = toSplicedWithItems(result, 2, 1, secondItems);
      expect(chained.toString()).assertEqual('1,9,7,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

  });
}
