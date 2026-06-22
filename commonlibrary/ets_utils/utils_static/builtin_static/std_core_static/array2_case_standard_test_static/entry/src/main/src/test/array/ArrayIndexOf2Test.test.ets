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

class Item008 {
  value: number = 0;
}

function createRangeArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function indexOfInAnyNumberArrayTwo(value: Any, target: number, fromIndex: int): int {
  const arr = value as Array<number>;
  return arr.indexOf(target, fromIndex);
}

export default function ArrayIndexOf2Test(): void {
  describe('ArrayIndexOf2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_0100
     * @tc.name testArrayIndexOfTwo001
     * @tc.desc Verify indexOf has one required value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let val = 3;
      let result = arr.indexOf(val);
      expect(result).assertEqual(2);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_0200
     * @tc.name testArrayIndexOfTwo002
     * @tc.desc Verify generic arrays of different element types are supported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      let arr2 = new Array<string>('a', 'b', 'c');
      expect(arr1.indexOf(2)).assertEqual(1);
      expect(arr2.indexOf('b')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_0300
     * @tc.name testArrayIndexOfTwo003
     * @tc.desc Verify single element arrays return zero when the element exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(42);
      let result = arr.indexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_0400
     * @tc.name testArrayIndexOfTwo004
     * @tc.desc Verify single element arrays return minus one when the element is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(42);
      let result = arr.indexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_0500
     * @tc.name testArrayIndexOfTwo005
     * @tc.desc Verify duplicated bigint values still return the first matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>(1n, 2n, 2n, 3n);
      let result = arr.indexOf(2n);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_0600
     * @tc.name testArrayIndexOfTwo006
     * @tc.desc Verify identical arrays return zero for the repeated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(5, 5, 5);
      let result = arr.indexOf(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_0700
     * @tc.name testArrayIndexOfTwo007
     * @tc.desc Verify dispersed duplicates return the earliest matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 4, 2);
      let result = arr.indexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_0800
     * @tc.name testArrayIndexOfTwo008
     * @tc.desc Verify indexOf compares nested arrays by reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested1 = new Array<number>(1, 2);
      let nested2 = new Array<number>(1, 2);
      let arr = new Array<Array<number>>(nested1, nested2);
      expect(arr.indexOf(nested1)).assertEqual(0);
      expect(arr.indexOf(nested2)).assertEqual(1);
      expect(arr.indexOf(new Array<number>(1, 2))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_0900
     * @tc.name testArrayIndexOfTwo009
     * @tc.desc Verify indexOf works with bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>(1n, 2n, 3n);
      expect(arr.indexOf(2n)).assertEqual(1);
      expect(arr.indexOf(99n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1000
     * @tc.name testArrayIndexOfTwo010
     * @tc.desc Verify indexOf can search for negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, -2, 3);
      expect(arr.indexOf(-2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1100
     * @tc.name testArrayIndexOfTwo011
     * @tc.desc Verify indexOf can search for Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, Double.POSITIVE_INFINITY, 3);
      expect(arr.indexOf(Double.POSITIVE_INFINITY)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1200
     * @tc.name testArrayIndexOfTwo012
     * @tc.desc Verify indexOf does not affect other array method behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.indexOf(2);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1300
     * @tc.name testArrayIndexOfTwo013
     * @tc.desc Verify conditional logic can use indexOf results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('apple', 'banana', 'cherry');
      let index = arr.indexOf('banana');
      let flag = index !== -1;
      expect(flag).assertTrue();
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1400
     * @tc.name testArrayIndexOfTwo014
     * @tc.desc Verify indexOf can validate whether a dataset contains a specific value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let validValues = new Array<string>('admin', 'user', 'guest');
      let role = 'admin';
      let isValid = validValues.indexOf(role) !== -1;
      expect(isValid).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1500
     * @tc.name testArrayIndexOfTwo015
     * @tc.desc Verify indexOf can be used to find an element before follow up processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let target = 3;
      let index = arr.indexOf(target);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1600
     * @tc.name testArrayIndexOfTwo016
     * @tc.desc Verify indexOf traverses the whole array when the value is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.indexOf(999);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1700
     * @tc.name testArrayIndexOfTwo017
     * @tc.desc Verify the overload without fromIndex differs from the overload with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2);
      let r1 = arr.indexOf(2);
      let r2 = arr.indexOf(2, 2);
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1800
     * @tc.name testArrayIndexOfTwo018
     * @tc.desc Verify indexOf can find values at every position in an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(0, 1, 2, 3, 4);
      expect(arr.indexOf(0)).assertEqual(0);
      expect(arr.indexOf(1)).assertEqual(1);
      expect(arr.indexOf(2)).assertEqual(2);
      expect(arr.indexOf(3)).assertEqual(3);
      expect(arr.indexOf(4)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_1900
     * @tc.name testArrayIndexOfTwo019
     * @tc.desc Verify large arrays handle boundary searches correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createRangeArray(1000);
      expect(arr.indexOf(0)).assertEqual(0);
      expect(arr.indexOf(999)).assertEqual(999);
      expect(arr.indexOf(1000)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2000
     * @tc.name testArrayIndexOfTwo020
     * @tc.desc Verify indexOf can be used to deduplicate arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(1, 2, 2, 3, 1);
      let unique = new Array<number>();
      for (let i: int = 0; i < source.length; i++) {
        if (unique.indexOf(source[i]) === -1) {
          unique.pushOne(source[i]);
        }
      }
      expect(unique.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2100
     * @tc.name testArrayIndexOfTwo021
     * @tc.desc Verify indexOf can be used to compute intersections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      let arr2 = new Array<number>(2, 3, 4);
      let intersection = new Array<number>();
      for (let i: int = 0; i < arr1.length; i++) {
        if (arr2.indexOf(arr1[i]) !== -1) {
          intersection.pushOne(arr1[i]);
        }
      }
      expect(intersection.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2200
     * @tc.name testArrayIndexOfTwo022
     * @tc.desc Verify indexOf can be used to compute differences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      let arr2 = new Array<number>(2, 3, 4);
      let difference = new Array<number>();
      for (let i: int = 0; i < arr1.length; i++) {
        if (arr2.indexOf(arr1[i]) === -1) {
          difference.pushOne(arr1[i]);
        }
      }
      expect(difference.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2300
     * @tc.name testArrayIndexOfTwo023
     * @tc.desc Verify indexOf matches at the first position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2400
     * @tc.name testArrayIndexOfTwo024
     * @tc.desc Verify indexOf matches at the final position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2500
     * @tc.name testArrayIndexOfTwo025
     * @tc.desc Verify indexOf returns the negative case for missing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2600
     * @tc.name testArrayIndexOfTwo026
     * @tc.desc Verify indexOf works with arrays of identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 5, 5);
      const result = arr.indexOf(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2700
     * @tc.name testArrayIndexOfTwo027
     * @tc.desc Verify indexOf distinguishes first and last duplicate positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2, 1);
      const result = arr.indexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2800
     * @tc.name testArrayIndexOfTwo028
     * @tc.desc Verify indexOf works on empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.indexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_2900
     * @tc.name testArrayIndexOfTwo029
     * @tc.desc Verify indexOf supports string arrays with duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B', 'C', 'B');
      const result = arr.indexOf('B');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3000
     * @tc.name testArrayIndexOfTwo030
     * @tc.desc Verify indexOf supports boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.indexOf(false);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3100
     * @tc.name testArrayIndexOfTwo031
     * @tc.desc Verify indexOf supports bigint arrays with repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(9n, 8n, 7n, 8n);
      const result = arr.indexOf(8n);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3200
     * @tc.name testArrayIndexOfTwo032
     * @tc.desc Verify indexOf can search a three-value numeric window starting at 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(20).slice(0, 3);
      const result = arr.indexOf(1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3300
     * @tc.name testArrayIndexOfTwo033
     * @tc.desc Verify indexOf leaves the source array length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 6, 9, 12);
      const result = arr.indexOf(9);
      expect(result).assertEqual(2);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3400
     * @tc.name testArrayIndexOfTwo034
     * @tc.desc Verify indexOf can search values after reversing a copied array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toReversed();
      const result = arr.indexOf(2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3500
     * @tc.name testArrayIndexOfTwo035
     * @tc.desc Verify indexOf can search across values produced by map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).map((value: number): number => value * 10);
      const result = arr.indexOf(30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3600
     * @tc.name testArrayIndexOfTwo036
     * @tc.desc Verify indexOf does not support partial string matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('abc', 'bcd');
      expect(arr.indexOf('b')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3700
     * @tc.name testArrayIndexOfTwo037
     * @tc.desc Verify indexOf returns minus one for absent empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 2, 3);
      expect(arr.indexOf('')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3800
     * @tc.name testArrayIndexOfTwo038
     * @tc.desc Verify indexOf matches empty strings when they exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'a');
      expect(arr.indexOf('')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_3900
     * @tc.name testArrayIndexOfTwo039
     * @tc.desc Verify indexOf matches strings that contain only a space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(' ', 'a');
      expect(arr.indexOf(' ')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4000
     * @tc.name testArrayIndexOfTwo040
     * @tc.desc Verify indexOf distinguishes number and string values with the same text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, '1');
      expect(arr.indexOf(1)).assertEqual(0);
      expect(arr.indexOf('1')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4100
     * @tc.name testArrayIndexOfTwo041
     * @tc.desc Verify indexOf keeps boolean and numeric zero or one values strictly separated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean | number>(true, 1, false, 0);
      expect(arr.indexOf(true)).assertEqual(0);
      expect(arr.indexOf(1)).assertEqual(1);
      expect(arr.indexOf(false)).assertEqual(2);
      expect(arr.indexOf(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4200
     * @tc.name testArrayIndexOfTwo042
     * @tc.desc Verify indexOf treats plus zero and minus zero as equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(new Array<number>(0, 1, 2).indexOf(-0)).assertEqual(0);
      expect(new Array<number>(-0, 1, 2).indexOf(+0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4300
     * @tc.name testArrayIndexOfTwo043
     * @tc.desc Verify indexOf can search for negative Infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-Double.POSITIVE_INFINITY, 1, 2);
      expect(arr.indexOf(-Double.POSITIVE_INFINITY)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4400
     * @tc.name testArrayIndexOfTwo044
     * @tc.desc Verify indexOf strictly distinguishes Infinity from negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY, 1);
      expect(arr.indexOf(-Double.POSITIVE_INFINITY)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4500
     * @tc.name testArrayIndexOfTwo045
     * @tc.desc Verify indexOf matches Number.MAX_VALUE exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Number.MAX_VALUE);
      expect(arr.indexOf(Number.MAX_VALUE)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4600
     * @tc.name testArrayIndexOfTwo046
     * @tc.desc Verify indexOf matches Number.MIN_VALUE exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Number.MIN_VALUE);
      expect(arr.indexOf(Number.MIN_VALUE)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4700
     * @tc.name testArrayIndexOfTwo047
     * @tc.desc Verify indexOf does not consider bigint and number values equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number | bigint>(10n, 2);
      const arr2 = new Array<number | bigint>(10, 2n);
      expect(arr1.indexOf(10)).assertEqual(-1);
      expect(arr2.indexOf(10n)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4800
     * @tc.name testArrayIndexOfTwo048
     * @tc.desc Verify indexOf exposes floating point precision loss during strict comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0.1 + 0.2);
      expect(arr.indexOf(0.3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_4900
     * @tc.name testArrayIndexOfTwo049
     * @tc.desc Verify indexOf strictly distinguishes null and undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(null, undefined, 1);
      expect(arr.indexOf(null)).assertEqual(0);
      expect(arr.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_5000
     * @tc.name testArrayIndexOfTwo050
     * @tc.desc Verify indexOf can match a function by the same reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (): number => 1;
      const arr = new Array<() => number>(fn);
      expect(arr.indexOf(fn)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_5100
     * @tc.name testArrayIndexOfTwo051
     * @tc.desc Verify indexOf rejects a different function closure with the same body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (): number => 1;
      const arr = new Array<() => number>(fn);
      expect(arr.indexOf((): number => 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_5200
     * @tc.name testArrayIndexOfTwo052
     * @tc.desc Verify indexOf matches emoji strings as complete values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('🌍', '👩‍');
      expect(arr.indexOf('🌍')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_5300
     * @tc.name testArrayIndexOfTwo053
     * @tc.desc Verify indexOf does not partially match inside a ZWJ emoji sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('👩‍');
      expect(arr.indexOf('👩')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_5400
     * @tc.name testArrayIndexOfTwo054
     * @tc.desc Verify indexOf matches surrogate-pair escape sequences exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('😀');
      expect(arr.indexOf('😀')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_5500
     * @tc.name testArrayIndexOfTwo055
     * @tc.desc Verify indexOf treats hexadecimal escape sequences as their decoded characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.indexOf('\x62')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_5600
     * @tc.name testArrayIndexOfTwo056
     * @tc.desc Verify indexOf can search dynamically transformed strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b');
      expect(arr.indexOf('B'.toLowerCase())).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_5700
     * @tc.name testArrayIndexOfTwo057
     * @tc.desc Verify indexOf with fromIndex works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 1);
      expect(indexOfInAnyNumberArrayTwo(anyValue, 1, 1)).assertEqual(2);
      expect(indexOfInAnyNumberArrayTwo(anyValue, 3, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_TWO_5800
     * @tc.name testArrayIndexOfTwo058
     * @tc.desc Verify indexOf with fromIndex supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true, 'two');
      expect(anyArr.indexOf('two', 2)).assertEqual(3);
      expect(anyArr.indexOf(1, 1)).assertEqual(-1);
    });

  });
}

