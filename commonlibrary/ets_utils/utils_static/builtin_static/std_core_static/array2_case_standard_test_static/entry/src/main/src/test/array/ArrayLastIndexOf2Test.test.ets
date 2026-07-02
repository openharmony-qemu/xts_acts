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

class Item003 {
  value: number = 0;
}

function createRangeArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function lastIndexOfInAnyNumberArrayTwo(value: Any, target: number, fromIndex: int): int {
  const arr = value as Array<number>;
  return arr.lastIndexOf(target, fromIndex);
}

export default function ArrayLastIndexOf2Test(): void {
  describe('ArrayLastIndexOf2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_0100
     * @tc.name testArrayLastIndexOfTwo001
     * @tc.desc Verify lastIndexOf finds the final matching bigint value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>(1n, 2n, 1n, 4n);
      let result = arr.lastIndexOf(1n);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_0200
     * @tc.name testArrayLastIndexOfTwo002
     * @tc.desc Verify lastIndexOf supports multiple element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      let arr2 = new Array<string>('a', 'b', 'c');
      let arr3 = new Array<boolean>(true, false, true);
      expect(arr1.lastIndexOf(2)).assertEqual(1);
      expect(arr2.lastIndexOf('b')).assertEqual(1);
      expect(arr3.lastIndexOf(true)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_0300
     * @tc.name testArrayLastIndexOfTwo003
     * @tc.desc Verify objects are compared by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Item003();
      item1.value = 100;
      let item2 = new Item003();
      item2.value = 200;
      let arr = new Array<Item003>(item1, item2);
      expect(arr.lastIndexOf(item1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_0400
     * @tc.name testArrayLastIndexOfTwo004
     * @tc.desc Verify lastIndexOf can find null and undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number | null>(1, null, 2, null);
      let arr2 = new Array<number | undefined>(1, undefined, 2);
      expect(arr1.lastIndexOf(null)).assertEqual(3);
      expect(arr2.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_0500
     * @tc.name testArrayLastIndexOfTwo005
     * @tc.desc Verify lastIndexOf returns an int compatible result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result: int = arr.lastIndexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_0600
     * @tc.name testArrayLastIndexOfTwo006
     * @tc.desc Verify found values return their last matching indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 1);
      expect(arr.lastIndexOf(1)).assertEqual(4);
      expect(arr.lastIndexOf(2)).assertEqual(3);
      expect(arr.lastIndexOf(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_0700
     * @tc.name testArrayLastIndexOfTwo007
     * @tc.desc Verify absent values return minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(arr.lastIndexOf(99)).assertEqual(-1);
      expect(arr.lastIndexOf(-1)).assertEqual(-1);
      expect(arr.lastIndexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_0800
     * @tc.name testArrayLastIndexOfTwo008
     * @tc.desc Verify empty arrays always return minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null | undefined>();
      expect(arr.lastIndexOf(1)).assertEqual(-1);
      expect(arr.lastIndexOf(null)).assertEqual(-1);
      expect(arr.lastIndexOf(undefined)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_0900
     * @tc.name testArrayLastIndexOfTwo009
     * @tc.desc Verify lastIndexOf returns the last occurrence position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c', 'b', 'a');
      expect(arr.lastIndexOf('a')).assertEqual(4);
      expect(arr.lastIndexOf('b')).assertEqual(3);
      expect(arr.lastIndexOf('c')).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1000
     * @tc.name testArrayLastIndexOfTwo010
     * @tc.desc Verify lastIndexOf and indexOf can return different indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(5, 10, 15, 10, 5);
      let firstIndex = arr.indexOf(10);
      let lastIndex = arr.lastIndexOf(10);
      expect(firstIndex).assertEqual(1);
      expect(lastIndex).assertEqual(3);
      expect(lastIndex === firstIndex).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1100
     * @tc.name testArrayLastIndexOfTwo011
     * @tc.desc Verify arrays of repeated values return the last duplicate index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 1, 1, 1);
      expect(arr.lastIndexOf(1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1200
     * @tc.name testArrayLastIndexOfTwo012
     * @tc.desc Verify spaced duplicate values return the final matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(0, 1, 0, 2, 0, 3, 0);
      expect(arr.lastIndexOf(0)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1300
     * @tc.name testArrayLastIndexOfTwo013
     * @tc.desc Verify interleaved duplicates each return their last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 10, 30, 10);
      expect(arr.lastIndexOf(10)).assertEqual(4);
      expect(arr.lastIndexOf(20)).assertEqual(1);
      expect(arr.lastIndexOf(30)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1400
     * @tc.name testArrayLastIndexOfTwo014
     * @tc.desc Verify lastIndexOf can find zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 0, 2, 0, 3);
      expect(arr.lastIndexOf(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1500
     * @tc.name testArrayLastIndexOfTwo015
     * @tc.desc Verify lastIndexOf can find empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', '', 'b', '');
      expect(arr.lastIndexOf('')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1600
     * @tc.name testArrayLastIndexOfTwo016
     * @tc.desc Verify lastIndexOf can find false and true values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false, true, false);
      expect(arr.lastIndexOf(false)).assertEqual(3);
      expect(arr.lastIndexOf(true)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1700
     * @tc.name testArrayLastIndexOfTwo017
     * @tc.desc Verify lastIndexOf can find negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(-1, 0, -1, 1);
      expect(arr.lastIndexOf(-1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1800
     * @tc.name testArrayLastIndexOfTwo018
     * @tc.desc Verify lastIndexOf can find extreme positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(100, -100, 200, -200);
      expect(arr.lastIndexOf(200)).assertEqual(2);
      expect(arr.lastIndexOf(-200)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_1900
     * @tc.name testArrayLastIndexOfTwo019
     * @tc.desc Verify single element arrays find their only value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 42);
      expect(arr.lastIndexOf(42)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2000
     * @tc.name testArrayLastIndexOfTwo020
     * @tc.desc Verify single element arrays return minus one for absent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<string>(1, 'only');
      expect(arr.lastIndexOf('other')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2100
     * @tc.name testArrayLastIndexOfTwo021
     * @tc.desc Verify single special values such as null and zero are found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.create<number | null>(1, null);
      let arr2 = Array.create<number>(1, 0);
      expect(arr1.lastIndexOf(null)).assertEqual(0);
      expect(arr2.lastIndexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2200
     * @tc.name testArrayLastIndexOfTwo022
     * @tc.desc Verify generic inference keeps the result usable as int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.lastIndexOf(2);
      let idx: int = result;
      expect(idx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2300
     * @tc.name testArrayLastIndexOfTwo023
     * @tc.desc Verify union typed arrays support searching different members
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, 'a', 2, 'a', 3);
      expect(arr.lastIndexOf('a')).assertEqual(3);
      expect(arr.lastIndexOf(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2400
     * @tc.name testArrayLastIndexOfTwo024
     * @tc.desc Verify lastIndexOf finds the final matching char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>(c'a', c'b', c'a', c'c');
      let result = arr.lastIndexOf(c'a');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2500
     * @tc.name testArrayLastIndexOfTwo025
     * @tc.desc Verify only the same object reference matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item = new Item003();
      let arr = Array.create<Item003>(1, item);
      let other = new Item003();
      expect(arr.lastIndexOf(item)).assertEqual(0);
      expect(arr.lastIndexOf(other)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2600
     * @tc.name testArrayLastIndexOfTwo026
     * @tc.desc Verify nested arrays are compared by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested1 = new Array<number>(1, 2);
      let nested2 = new Array<number>(3, 4);
      let arr = new Array<Array<number>>(nested1, nested2);
      expect(arr.lastIndexOf(nested1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2700
     * @tc.name testArrayLastIndexOfTwo027
     * @tc.desc Verify lastIndexOf can locate the final matching config entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let configs = new Array<string>('debug', 'release', 'debug');
      let lastDebug = configs.lastIndexOf('debug');
      expect(lastDebug).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2800
     * @tc.name testArrayLastIndexOfTwo028
     * @tc.desc Verify lastIndexOf can confirm the last position in a sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sequence = new Array<number>(1, 2, 3, 4, 5);
      let lastPos = sequence.lastIndexOf(5);
      expect(lastPos).assertEqual(sequence.length - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_2900
     * @tc.name testArrayLastIndexOfTwo029
     * @tc.desc Verify lastIndexOf can find the most recent history action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let history = new Array<string>('save', 'edit', 'save', 'close', 'save');
      let lastSave = history.lastIndexOf('save');
      expect(lastSave).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3000
     * @tc.name testArrayLastIndexOfTwo030
     * @tc.desc Verify two element arrays handle found and absent cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      expect(arr.lastIndexOf(1)).assertEqual(0);
      expect(arr.lastIndexOf(2)).assertEqual(1);
      expect(arr.lastIndexOf(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3100
     * @tc.name testArrayLastIndexOfTwo031
     * @tc.desc Verify arrays with all identical elements return the final index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(7, 7, 7, 7, 7);
      expect(arr.lastIndexOf(7)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3200
     * @tc.name testArrayLastIndexOfTwo032
     * @tc.desc Verify unique arrays return each value own index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30, 40, 50);
      expect(arr.lastIndexOf(30)).assertEqual(2);
      expect(arr.lastIndexOf(50)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3300
     * @tc.name testArrayLastIndexOfTwo033
     * @tc.desc Verify lastIndexOf handles large sequential arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createRangeArray(10000);
      let result = arr.lastIndexOf(9999);
      expect(result).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3400
     * @tc.name testArrayLastIndexOfTwo034
     * @tc.desc Verify lastIndexOf can find the first element at index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.lastIndexOf(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3500
     * @tc.name testArrayLastIndexOfTwo035
     * @tc.desc Verify lastIndexOf can find the last element at the final index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.lastIndexOf(5)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3600
     * @tc.name testArrayLastIndexOfTwo036
     * @tc.desc Verify multiple NaN values still produce minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(Double.NaN, Double.NaN, Double.NaN);
      let result = arr.lastIndexOf(Double.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3700
     * @tc.name testArrayLastIndexOfTwo037
     * @tc.desc Verify lastIndexOf finds a middle duplicate using the default tail scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2, 1);
      const result = arr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3800
     * @tc.name testArrayLastIndexOfTwo038
     * @tc.desc Verify lastIndexOf finds a restricted fromIndex that excludes the final duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 7, 8, 7, 9);
      const result = arr.lastIndexOf(7, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_3900
     * @tc.name testArrayLastIndexOfTwo039
     * @tc.desc Verify lastIndexOf finds arrays of identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 5, 5);
      const result = arr.lastIndexOf(5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4000
     * @tc.name testArrayLastIndexOfTwo040
     * @tc.desc Verify lastIndexOf finds missing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.lastIndexOf(40);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4100
     * @tc.name testArrayLastIndexOfTwo041
     * @tc.desc Verify lastIndexOf finds negative fromIndex values near the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.lastIndexOf(20, -2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4200
     * @tc.name testArrayLastIndexOfTwo042
     * @tc.desc Verify lastIndexOf finds negative fromIndex values that still include the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.lastIndexOf(10, -3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4300
     * @tc.name testArrayLastIndexOfTwo043
     * @tc.desc Verify lastIndexOf finds the first position when fromIndex equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 10, 30);
      const result = arr.lastIndexOf(10, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4400
     * @tc.name testArrayLastIndexOfTwo044
     * @tc.desc Verify lastIndexOf can locate the repeated tail value in numeric series 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2, 1);
      const result = arr.lastIndexOf(1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4500
     * @tc.name testArrayLastIndexOfTwo045
     * @tc.desc Verify lastIndexOf handles first position in a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4600
     * @tc.name testArrayLastIndexOfTwo046
     * @tc.desc Verify lastIndexOf handles last position in a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4700
     * @tc.name testArrayLastIndexOfTwo047
     * @tc.desc Verify lastIndexOf handles missing values in a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4800
     * @tc.name testArrayLastIndexOfTwo048
     * @tc.desc Verify lastIndexOf handles string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'b');
      const result = arr.lastIndexOf('b');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_4900
     * @tc.name testArrayLastIndexOfTwo049
     * @tc.desc Verify lastIndexOf handles boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.lastIndexOf(false);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5000
     * @tc.name testArrayLastIndexOfTwo050
     * @tc.desc Verify lastIndexOf handles bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 2n);
      const result = arr.lastIndexOf(2n);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5100
     * @tc.name testArrayLastIndexOfTwo051
     * @tc.desc Verify lastIndexOf handles negative fromIndex normalization near the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 30, 40);
      const result = arr.lastIndexOf(30, -2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5200
     * @tc.name testArrayLastIndexOfTwo052
     * @tc.desc Verify lastIndexOf handles very large positive fromIndex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 20);
      const result = arr.lastIndexOf(20, 100);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5300
     * @tc.name testArrayLastIndexOfTwo053
     * @tc.desc Verify lastIndexOf handles single-element matching arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 77);
      const result = arr.lastIndexOf(77);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5400
     * @tc.name testArrayLastIndexOfTwo054
     * @tc.desc Verify lastIndexOf handles single-element non-matching arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 77);
      const result = arr.lastIndexOf(78);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5500
     * @tc.name testArrayLastIndexOfTwo055
     * @tc.desc Verify lastIndexOf handles arrays produced by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2, 3, 4).slice(1, 4);
      const result = arr.lastIndexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5600
     * @tc.name testArrayLastIndexOfTwo056
     * @tc.desc Verify lastIndexOf handles arrays produced by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value > 2);
      const result = arr.lastIndexOf(4);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5700
     * @tc.name testArrayLastIndexOfTwo057
     * @tc.desc Verify lastIndexOf handles arrays produced by toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      const result = arr.lastIndexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5800
     * @tc.name testArrayLastIndexOfTwo058
     * @tc.desc Verify lastIndexOf handles arrays produced by toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = arr.lastIndexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_5900
     * @tc.name testArrayLastIndexOfTwo059
     * @tc.desc Verify lastIndexOf handles arrays rebuilt after clearing and repopulating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = ((): Array<number> => { const arr = new Array<number>(1, 2, 3); arr.length = 0; arr.push(8, 9, 10); return arr; })();
      const result = arr.lastIndexOf(9);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6000
     * @tc.name testArrayLastIndexOfTwo060
     * @tc.desc Verify lastIndexOf works on object arrays when the same reference is searched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item003();
      first.value = 1;
      const second = new Item003();
      second.value = 2;
      const arr = new Array<Item003>(first, second);
      const target = arr[0];
      const result = arr.lastIndexOf(target);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6100
     * @tc.name testArrayLastIndexOfTwo061
     * @tc.desc Verify lastIndexOf rejects object arrays when a different reference is searched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item003();
      first.value = 1;
      const second = new Item003();
      second.value = 2;
      const arr = new Array<Item003>(first, second);
      const target = new Item003();
      target.value = 1;
      const result = arr.lastIndexOf(target);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6200
     * @tc.name testArrayLastIndexOfTwo062
     * @tc.desc Verify a bounded positive fromIndex can skip a later duplicate and find the earlier one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 1);
      const result = arr.lastIndexOf(1, 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6300
     * @tc.name testArrayLastIndexOfTwo063
     * @tc.desc Verify fromIndex can hit the matching element at the search starting point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 1);
      const result = arr.lastIndexOf(1, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6400
     * @tc.name testArrayLastIndexOfTwo064
     * @tc.desc Verify values to the right of fromIndex are excluded from the backward search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(3, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6500
     * @tc.name testArrayLastIndexOfTwo065
     * @tc.desc Verify fromIndex equal to array length is normalized to the last valid index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(3, 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6600
     * @tc.name testArrayLastIndexOfTwo066
     * @tc.desc Verify very large positive fromIndex values are clamped to the array tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(3, 100);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6700
     * @tc.name testArrayLastIndexOfTwo067
     * @tc.desc Verify a negative fromIndex can narrow the search and still reach an earlier duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 1);
      const result = arr.lastIndexOf(1, -2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6800
     * @tc.name testArrayLastIndexOfTwo068
     * @tc.desc Verify a negative fromIndex equal to negative length still includes index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(1, -3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_6900
     * @tc.name testArrayLastIndexOfTwo069
     * @tc.desc Verify a negative fromIndex that moves left of index zero returns minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(1, -4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7000
     * @tc.name testArrayLastIndexOfTwo070
     * @tc.desc Verify severely negative fromIndex values also terminate the search safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(1, -100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7100
     * @tc.name testArrayLastIndexOfTwo071
     * @tc.desc Verify positive zero and negative zero compare as the same value at the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, -0);
      const result = arr.lastIndexOf(-0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7200
     * @tc.name testArrayLastIndexOfTwo072
     * @tc.desc Verify floating point values use strict numeric equality during backward scans
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1.1, 1, 1.1);
      const result = arr.lastIndexOf(1.1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7300
     * @tc.name testArrayLastIndexOfTwo073
     * @tc.desc Verify a single explicit undefined element can be found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number | undefined>(1, undefined);
      const result = arr.lastIndexOf(undefined);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7400
     * @tc.name testArrayLastIndexOfTwo074
     * @tc.desc Verify lastIndexOf finds the numeric 10 in a mixed bigint and number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | bigint>(10n, 10);
      const result = arr.lastIndexOf(10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7500
     * @tc.name testArrayLastIndexOfTwo075
     * @tc.desc Verify dense arrays find the last explicit undefined between assigned values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      arr[4] = 5;
      const result = arr.lastIndexOf(undefined);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7600
     * @tc.name testArrayLastIndexOfTwo076
     * @tc.desc Verify the last explicit undefined value is found in a dense array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = undefined;
      const result = arr.lastIndexOf(undefined);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7700
     * @tc.name testArrayLastIndexOfTwo077
     * @tc.desc Verify a fromIndex of negative one can hit the tail element itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(3, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7800
     * @tc.name testArrayLastIndexOfTwo078
     * @tc.desc Verify a fromIndex of negative one can still find earlier elements while scanning left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(2, -1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_7900
     * @tc.name testArrayLastIndexOfTwo079
     * @tc.desc Verify dense arrays initialized with undefined expose those values to lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      const result = arr.lastIndexOf(undefined);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_8000
     * @tc.name testArrayLastIndexOfTwo080
     * @tc.desc Verify trailing explicit undefined values are found after assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[1] = undefined;
      const result = arr.lastIndexOf(undefined);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_8100
     * @tc.name testArrayLastIndexOfTwo081
     * @tc.desc Verify lastIndexOf with fromIndex works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 1);
      expect(lastIndexOfInAnyNumberArrayTwo(anyValue, 1, 1)).assertEqual(0);
      expect(lastIndexOfInAnyNumberArrayTwo(anyValue, 9, 2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_TWO_8200
     * @tc.name testArrayLastIndexOfTwo082
     * @tc.desc Verify lastIndexOf with fromIndex supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true, 'two');
      expect(anyArr.lastIndexOf('two', 2)).assertEqual(1);
      expect(anyArr.lastIndexOf(1, 0)).assertEqual(0);
    });

  });
}

