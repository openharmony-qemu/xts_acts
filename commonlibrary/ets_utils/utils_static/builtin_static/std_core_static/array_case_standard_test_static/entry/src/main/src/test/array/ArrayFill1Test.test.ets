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

class Item023 {
  value: number = 0;
}

class Item049 {
  value: number = 0;
}

export default function ArrayFill1Test(): void {
  describe('ArrayFill1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0100
     * @tc.name testArrayFill1001
     * @tc.desc Verify fill with one value parameter updates the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0200
     * @tc.name testArrayFill1002
     * @tc.desc Verify fill with value and start updates from start to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(0, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0300
     * @tc.name testArrayFill1003
     * @tc.desc Verify fill with value start and end updates the target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(0, 1, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0400
     * @tc.name testArrayFill1004
     * @tc.desc Verify fill accepts a value matching the element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(100);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0500
     * @tc.name testArrayFill1005
     * @tc.desc Verify the start index controls the first replaced position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(0, 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0600
     * @tc.name testArrayFill1006
     * @tc.desc Verify an undefined start defaults to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(0, undefined);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0700
     * @tc.name testArrayFill1007
     * @tc.desc Verify an undefined end defaults to the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(0, 0, undefined);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0800
     * @tc.name testArrayFill1008
     * @tc.desc Verify negative indexes are resolved from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.fill(0, -2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_0900
     * @tc.name testArrayFill1009
     * @tc.desc Verify no elements change when start is greater than end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(0, 3, 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1000
     * @tc.name testArrayFill1010
     * @tc.desc Verify out-of-range indexes are clamped to valid bounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(0, -10, 10);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1100
     * @tc.name testArrayFill1011
     * @tc.desc Verify fill returns the modified array itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.fill(0);
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1200
     * @tc.name testArrayFill1012
     * @tc.desc Verify fill supports chained calls on different ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.fill(0, 0, 2).fill(1, 2, 4);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1300
     * @tc.name testArrayFill1013
     * @tc.desc Verify fill mutates the original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalRef = arr;
      arr.fill(0);
      expect(arr === originalRef).assertTrue();
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1400
     * @tc.name testArrayFill1014
     * @tc.desc Verify fill does not change the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalLength = arr.length;
      arr.fill(0);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1500
     * @tc.name testArrayFill1015
     * @tc.desc Verify fill on an empty array keeps the length at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.fill(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1600
     * @tc.name testArrayFill1016
     * @tc.desc Verify fill works on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      arr[0] = 100;
      arr.fill(0);
      expect(arr[0]).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1700
     * @tc.name testArrayFill1017
     * @tc.desc Verify fill with one argument updates every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.fill(9);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(9);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1800
     * @tc.name testArrayFill1018
     * @tc.desc Verify fill can update only a partial range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.fill(0, 1, 4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_1900
     * @tc.name testArrayFill1019
     * @tc.desc Verify fill works with string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.fill('x');
      expect(arr[0]).assertEqual('x');
      expect(arr[1]).assertEqual('x');
      expect(arr[2]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2000
     * @tc.name testArrayFill1020
     * @tc.desc Verify fill works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      arr.fill(false);
      expect(arr[0]).assertFalse();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2100
     * @tc.name testArrayFill1021
     * @tc.desc Verify object arrays keep the same filled object reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item023>(new Item023(), new Item023());
      const item = new Item023();
      item.value = 100;
      arr.fill(item);
      expect(arr[0].value).assertEqual(100);
      expect(arr[1] === arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2200
     * @tc.name testArrayFill1022
     * @tc.desc Verify fill supports nullable element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, 2, 3);
      arr.fill(null);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertNull();
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2300
     * @tc.name testArrayFill1023
     * @tc.desc Verify fill supports empty strings as replacement values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      arr.fill('');
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual('');
      expect(arr[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2400
     * @tc.name testArrayFill1024
     * @tc.desc Verify fill supports NaN replacement values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(NaN);
      expect(Number.isNaN(arr[0])).assertTrue();
      expect(Number.isNaN(arr[1])).assertTrue();
      expect(Number.isNaN(arr[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2500
     * @tc.name testArrayFill1025
     * @tc.desc Verify fill supports Infinity replacement values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(Infinity);
      expect(arr[0]).assertEqual(Infinity);
      expect(arr[1]).assertEqual(Infinity);
      expect(arr[2]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2600
     * @tc.name testArrayFill1026
     * @tc.desc Verify start boundary values keep expected fill behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrStartZero = new Array<number>(1, 2, 3, 4, 5);
      arrStartZero.fill(0, 0, 1);
      expect(arrStartZero[0]).assertEqual(0);

      const arrStartLength = new Array<number>(1, 2, 3, 4, 5);
      arrStartLength.fill(1, arrStartLength.length);
      expect(arrStartLength[0]).assertEqual(1);
      expect(arrStartLength[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2700
     * @tc.name testArrayFill1027
     * @tc.desc Verify end boundary values keep expected fill behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arrEndZero = new Array<number>(1, 2, 3, 4, 5);
      arrEndZero.fill(9, 0, 0);
      expect(arrEndZero[0]).assertEqual(1);

      const arrEndLength = new Array<number>(1, 2, 3, 4, 5);
      arrEndLength.fill(9, 0, arrEndLength.length);
      expect(arrEndLength[0]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2800
     * @tc.name testArrayFill1028
     * @tc.desc Verify negative start and end boundaries work from the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.fill(0, -3, -1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_2900
     * @tc.name testArrayFill1029
     * @tc.desc Verify fill can initialize a pre-sized array with one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.fill(0);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3000
     * @tc.name testArrayFill1030
     * @tc.desc Verify fill can reset only part of an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.fill(0, 2, 4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3100
     * @tc.name testArrayFill1031
     * @tc.desc Verify fill can initialize each row in a matrix template
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const rows = 3;
      const matrix = new Array<Array<number>>();
      for (let i = 0; i < rows; i++) {
        const row = new Array<number>(1, 2, 3, 4);
        row.fill(0);
        matrix.pushOne(row);
      }
      expect(matrix.length).assertEqual(3);
      expect(matrix[0].length).assertEqual(4);
      expect(matrix[0][0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3200
     * @tc.name testArrayFill1032
     * @tc.desc Verify fill matches equivalent direct assignment results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.fill(0, 1, 3);

      const arr2 = new Array<number>(1, 2, 3, 4, 5);
      arr2[1] = 0;
      arr2[2] = 0;

      expect(arr[1]).assertEqual(arr2[1]);
      expect(arr[2]).assertEqual(arr2[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3300
     * @tc.name testArrayFill1033
     * @tc.desc Verify fill sets one value while map can create varied values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(10);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(10);
      expect(arr[2]).assertEqual(10);

      const arr2 = new Array<number>(1, 2, 3);
      let current = 0;
      const result = arr2.map((v: number): number => {
        const mapped = current * 10;
        current++;
        return mapped;
      });
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(10);
      expect(result[2]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3400
     * @tc.name testArrayFill1034
     * @tc.desc Verify fill updates every position in a genuinely large array created with Array.create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(10000, 1);
      arr.fill(1);
      arr.fill(0);
      expect(arr.length).assertEqual(10000);
      expect(arr[0]).assertEqual(0);
      expect(arr[5000]).assertEqual(0);
      expect(arr[arr.length - 1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3500
     * @tc.name testArrayFill1035
     * @tc.desc Verify fill works with union typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>(1, 2, 3);
      arr.fill('x');
      expect(arr[0]).assertEqual('x');
      expect(arr[1]).assertEqual('x');
      expect(arr[2]).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3600
     * @tc.name testArrayFill1036
     * @tc.desc Verify multiple chained fill calls update separate ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      arr.fill(0, 0, 2).fill(1, 2, 4).fill(2, 4, 6);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(1);
      expect(arr[4]).assertEqual(2);
      expect(arr[5]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3700
     * @tc.name testArrayFill1037
     * @tc.desc Verify other array methods can follow fill in chained scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.fill(0).map((v: number): number => v + 1);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertEqual(1);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3800
     * @tc.name testArrayFill1038
     * @tc.desc Verify omitting start behaves like using zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(0);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_3900
     * @tc.name testArrayFill1039
     * @tc.desc Verify omitting end behaves like using the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.fill(0, 1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4000
     * @tc.name testArrayFill1040
     * @tc.desc Verify later fill calls can override earlier values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(0, 0, 4);
      arr.fill(1, 1, 3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(1);
      expect(arr[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4100
     * @tc.name testArrayFill1041
     * @tc.desc Verify overlapping fill ranges keep the latest covered values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.fill(0, 2, 5);
      arr.fill(1, 4, 5);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(0);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4200
     * @tc.name testArrayFill1042
     * @tc.desc Verify floating-point indexes can be normalized before fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start = (1.5).toInt();
      const end = (3.5).toInt();
      arr.fill(0, start, end);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4300
     * @tc.name testArrayFill1043
     * @tc.desc Verify scientific notation indexes can be normalized before fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start = (1e0).toInt();
      const end = (2e0).toInt();
      arr.fill(0, start, end);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4400
     * @tc.name testArrayFill1044
     * @tc.desc Verify object fill stores the same reference in every position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = new Item049();
      obj.value = 100;

      const arr = new Array<Item049>(new Item049(), new Item049(), new Item049());
      arr.fill(obj);

      arr[0].value = 200;
      expect(arr[1].value).assertEqual(200);
      expect(arr[2].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4500
     * @tc.name testArrayFill1045
     * @tc.desc Verify fill returns the same array reference for shallow copy behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Array<number>(1, 2, 3);
      const copy = original.fill(0);

      original[0] = 100;
      expect(copy[0]).assertEqual(100);
      expect(copy === original).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4600
     * @tc.name testArrayFill1046
     * @tc.desc Verify combined negative start and end indexes resolve to the expected middle range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [1, 2, 3, 4, 5, 6];
      arr.fill(9, -4, -1);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(9);
      expect(arr[3]).assertEqual(9);
      expect(arr[4]).assertEqual(9);
      expect(arr[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4700
     * @tc.name testArrayFill1047
     * @tc.desc Verify fill becomes a no-op when start is greater than or equal to the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [4, 5, 6];
      arr.fill(7, 10);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4800
     * @tc.name testArrayFill1048
     * @tc.desc Verify fill becomes a no-op when end is clamped to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [4, 5, 6];
      arr.fill(7, 0, -10);
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(5);
      expect(arr[2]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_4900
     * @tc.name testArrayFill1049
     * @tc.desc Verify chained string fills keep the latest value on overlapping positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['a', 'b', 'c', 'd', 'e'];
      arr.fill('X', 1, 5);
      arr.fill('Y', 2, 4);
      const joined = arr.join('|');
      expect(joined).assertEqual('a|X|Y|Y|X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_5000
     * @tc.name testArrayFill1050
     * @tc.desc Verify partial object fill preserves untouched references outside the target range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const head = new Item049();
      head.value = 1;
      const middle = new Item049();
      middle.value = 2;
      const tail = new Item049();
      tail.value = 3;
      const fill = new Item049();
      fill.value = 88;
      const arr: Array<Item049> = [head, middle, tail];
      arr.fill(fill, 1, 3);
      fill.value = 99;
      expect(arr[0] === head).assertTrue();
      expect(arr[1] === fill).assertTrue();
      expect(arr[2] === fill).assertTrue();
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].value).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_5100
     * @tc.name testArrayFill1051
     * @tc.desc Verify nested array fill stores a shared reference across all covered positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared: Array<number> = [];
      const arr: Array<Array<number>> = [[1], [2], [3], [4]];
      arr.fill(shared, 1, 4);
      shared.pushOne(42);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1] === shared).assertTrue();
      expect(arr[2][0]).assertEqual(42);
      expect(arr[3][0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_5200
     * @tc.name testArrayFill1052
     * @tc.desc Verify undefined fill affects only the requested tail range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number | undefined> = [1, 2, 3, 4];
      arr.fill(undefined, 2);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertUndefined();
      expect(arr[3]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_5300
     * @tc.name testArrayFill1053
     * @tc.desc Verify boolean tail fill changes the aggregated true count predictably
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<boolean> = [true, true, false, true, false];
      arr.fill(false, 1, 4);
      let trueCount = 0;
      for (const item of arr) {
        if (item) {
          trueCount++;
        }
      }
      expect(trueCount).assertEqual(1);
      expect(arr[0]).assertTrue();
      expect(arr[4]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_5400
     * @tc.name testArrayFill1054
     * @tc.desc Verify large-range fill updates only the requested interior section
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [];
      for (let i = 0; i < 32; i++) {
        arr.pushOne(i);
      }
      arr.fill(-1, 8, 24);
      expect(arr.length).assertEqual(32);
      expect(arr[7]).assertEqual(7);
      expect(arr[8]).assertEqual(-1);
      expect(arr[23]).assertEqual(-1);
      expect(arr[24]).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_5500
     * @tc.name testArrayFill1055
     * @tc.desc Verify fill and every can be combined to validate normalized content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = [5, 4, 3, 2, 1];
      arr.fill(6, 1, 4);
      const result = arr.every((item: number): boolean => item > 0);
      expect(result).assertTrue();
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(6);
      expect(arr[3]).assertEqual(6);
      expect(arr[4]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_5600
     * @tc.name testArrayFill1056
     * @tc.desc Verify the returned array reference can participate in later updates immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['left', 'mid', 'right'];
      const result = arr.fill('core', 1, 3);
      result[0] = 'start';
      expect(result === arr).assertTrue();
      expect(arr[0]).assertEqual('start');
      expect(arr[1]).assertEqual('core');
      expect(arr[2]).assertEqual('core');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FILL_ONE_5700
     * @tc.name testArrayFill1057
     * @tc.desc Verify empty-string fill on a subrange is visible in joined output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFill1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<string> = ['A', 'B', 'C', 'D'];
      arr.fill('', 1, 3);
      const joined = arr.join('#');
      expect(joined).assertEqual('A###D');
      expect(arr[0]).assertEqual('A');
      expect(arr[1]).assertEqual('');
      expect(arr[2]).assertEqual('');
      expect(arr[3]).assertEqual('D');
    });
  });
}

