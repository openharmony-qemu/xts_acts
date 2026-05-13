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
  afterAll, afterEach, beforeAll, beforeEach, describe,
  expect, it, Level, Size, TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

class Item013 {
  value: int = 0;
}

class Person022 {
  name: string = '';
}

function singleNumberArray(value: int): Array<int> {
  const arr = new Array<int>();
  arr.pushOne(value);
  return arr;
}

export default function ArrayConcatTest(): void {
  describe('ArrayConcatTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0100
     * @tc.name testArrayConcat001
     * @tc.desc Verify concat without parameters returns a shallow copy of the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3);
      const result = arr1.concat();
      expect(result.length).assertEqual(3);
      expect(result == arr1).assertFalse();
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0200
     * @tc.name testArrayConcat002
     * @tc.desc Verify concat accepts a single array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0300
     * @tc.name testArrayConcat003
     * @tc.desc Verify concat accepts multiple array parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = singleNumberArray(1);
      const arr2 = singleNumberArray(2);
      const arr3 = singleNumberArray(3);
      const result = arr1.concat(arr2, arr3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0400
     * @tc.name testArrayConcat004
     * @tc.desc Verify concat handles array parameters directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0500
     * @tc.name testArrayConcat005
     * @tc.desc Verify equivalent single-value arrays can cover scalar append semantics in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const result = arr1.concat(singleNumberArray(3), singleNumberArray(4));
      expect(result.length).assertEqual(4);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0600
     * @tc.name testArrayConcat006
     * @tc.desc Verify mixed array inputs can reproduce array-plus-value concat results in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2, singleNumberArray(5), singleNumberArray(6));
      expect(result.length).assertEqual(6);
      expect(result[4]).assertEqual(5);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0700
     * @tc.name testArrayConcat007
     * @tc.desc Verify concat accepts parameters that satisfy the ConcatArray type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0800
     * @tc.name testArrayConcat008
     * @tc.desc Verify concat accepts an empty array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const empty = new Array<int>();
      const result = arr1.concat(empty);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_0900
     * @tc.name testArrayConcat009
     * @tc.desc Verify spread syntax can pass multiple concat arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const others = new Array<Array<int>>();
      others.pushOne(new Array<int>(3, 4));
      others.pushOne(singleNumberArray(5));
      const result = arr1.concat(...others);
      expect(result.length).assertEqual(5);
      expect(result[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1000
     * @tc.name testArrayConcat010
     * @tc.desc Verify concat returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const result = arr1.concat(singleNumberArray(3));
      expect(result instanceof Array).assertTrue();
      expect(result == arr1).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1100
     * @tc.name testArrayConcat011
     * @tc.desc Verify concat keeps the source element type in the returned array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const result = arr1.concat(singleNumberArray(3));
      const first: int = result[0];
      const third: int = result[2];
      expect(first).assertEqual(1);
      expect(third).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1200
     * @tc.name testArrayConcat012
     * @tc.desc Verify modifying the new concatenated array does not affect the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2, 3);
      const result = arr1.concat(singleNumberArray(4));
      result.pushOne(5);
      expect(arr1.length).assertEqual(3);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1300
     * @tc.name testArrayConcat013
     * @tc.desc Verify object elements are copied by reference during concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<Item013>();
      const item = new Item013();
      item.value = 100;
      arr1.pushOne(item);

      const result = arr1.concat();
      result[0].value = 200;

      expect(arr1[0].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1400
     * @tc.name testArrayConcat014
     * @tc.desc Verify an empty source array can concat a non-empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      const arr2 = new Array<int>(1, 2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1500
     * @tc.name testArrayConcat015
     * @tc.desc Verify concatenating two empty arrays keeps the result empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      const arr2 = new Array<int>();
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1600
     * @tc.name testArrayConcat016
     * @tc.desc Verify concat works with single-element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = singleNumberArray(100);
      const arr2 = singleNumberArray(200);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1700
     * @tc.name testArrayConcat017
     * @tc.desc Verify concat handles large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr1.pushOne(i);
      }
      const arr2 = new Array<int>();
      for (let i = 1000; i < 2000; i++) {
        arr2.pushOne(i);
      }
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2000);
      expect(result[0]).assertEqual(0);
      expect(result[1999]).assertEqual(1999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1800
     * @tc.name testArrayConcat018
     * @tc.desc Verify number arrays support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_1900
     * @tc.name testArrayConcat019
     * @tc.desc Verify string arrays support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('a', 'b');
      const arr2 = new Array<string>('c', 'd');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('a');
      expect(result[3]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2000
     * @tc.name testArrayConcat020
     * @tc.desc Verify boolean arrays support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<boolean>(true, false);
      const arr2 = new Array<boolean>(false, true);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertTrue();
      expect(result[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2100
     * @tc.name testArrayConcat021
     * @tc.desc Verify char arrays support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<char>(c'A', c'B');
      const arr2 = new Array<char>(c'C', c'D');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(c'A');
      expect(result[3]).assertEqual(c'D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2200
     * @tc.name testArrayConcat022
     * @tc.desc Verify object arrays support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<Person022>();
      const p1 = new Person022();
      p1.name = 'Alice';
      arr1.pushOne(p1);

      const arr2 = new Array<Person022>();
      const p2 = new Person022();
      p2.name = 'Bob';
      arr2.pushOne(p2);

      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(2);
      expect(result[0].name).assertEqual('Alice');
      expect(result[1].name).assertEqual('Bob');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2300
     * @tc.name testArrayConcat023
     * @tc.desc Verify union type arrays support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string | int>(1, 2);
      const arr2 = new Array<string | int>('a', 'b');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2400
     * @tc.name testArrayConcat024
     * @tc.desc Verify arrays containing null values support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int | null>(1, null);
      const arr2 = new Array<int | null>(null, 2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[1]).assertNull();
      expect(result[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2500
     * @tc.name testArrayConcat025
     * @tc.desc Verify arrays containing undefined values support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int | undefined>(1, undefined);
      const arr2 = new Array<int | undefined>(undefined, 2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2600
     * @tc.name testArrayConcat026
     * @tc.desc Verify arrays containing NaN values support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, NaN);
      const arr2 = new Array<number>(NaN, 2);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(Number.isNaN(result[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2700
     * @tc.name testArrayConcat027
     * @tc.desc Verify concat can join three arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const arr3 = new Array<int>(5, 6);
      const result = arr1.concat(arr2, arr3);
      expect(result.length).assertEqual(6);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2800
     * @tc.name testArrayConcat028
     * @tc.desc Verify concat can join multiple arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = singleNumberArray(1);
      const arr2 = singleNumberArray(2);
      const arr3 = singleNumberArray(3);
      const arr4 = singleNumberArray(4);
      const result = arr1.concat(arr2, arr3, arr4);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_2900
     * @tc.name testArrayConcat029
     * @tc.desc Verify mixed array inputs can cover array-and-value concat scenarios in ArkTS
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const result = arr1.concat(singleNumberArray(3), new Array<int>(4, 5), singleNumberArray(6));
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3000
     * @tc.name testArrayConcat030
     * @tc.desc Verify concat does not modify the source array while push does
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(1, 2);

      const concated = arr1.concat(singleNumberArray(3));
      arr2.pushOne(3);

      expect(arr1.length).assertEqual(2);
      expect(arr2.length).assertEqual(3);
      expect(concated.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3100
     * @tc.name testArrayConcat031
     * @tc.desc Verify concat matches an explicitly expanded array result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);

      const result1 = arr1.concat(arr2);
      const result2 = new Array<int>(1, 2, 3, 4);

      expect(result1.length).assertEqual(result2.length);
      expect(result1.toString()).assertEqual(result2.toString());
      expect(result1 == result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3200
     * @tc.name testArrayConcat032
     * @tc.desc Verify concat appends arrays while unshift prepends them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);

      const concated = arr1.concat(arr2);

      const arr3 = new Array<int>(1, 2);
      arr3.unshift(...arr2);

      expect(concated[0]).assertEqual(1);
      expect(arr3[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3300
     * @tc.name testArrayConcat033
     * @tc.desc Verify concat works stably for large-array timing scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      const arr2 = new Array<int>();
      for (let i = 0; i < 10000; i++) {
        arr1.pushOne(i);
        arr2.pushOne(i + 10000);
      }
      const startTime = Date.now();
      const result = arr1.concat(arr2);
      const endTime = Date.now();
      expect(result.length).assertEqual(20000);
      expect(endTime >= startTime).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3400
     * @tc.name testArrayConcat034
     * @tc.desc Verify concat handles many array parameters efficiently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Array<int>();
      const arrays = new Array<Array<int>>();
      for (let i = 0; i < 100; i++) {
        arrays.pushOne(singleNumberArray(i));
      }
      const startTime = Date.now();
      const result = base.concat(...arrays);
      const endTime = Date.now();
      expect(result.length).assertEqual(100);
      expect(endTime >= startTime).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3500
     * @tc.name testArrayConcat035
     * @tc.desc Verify concat preserves nested arrays as elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<Object>(1 as Object, 2 as Object);
      const nested = new Array<int>(3, 4);
      const arr2 = new Array<Object>();
      arr2.pushOne(nested as Object);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(3);
      const value = result[2] as Object | null;
      expect(value != null).assertTrue();
      if (value != null) {
        const nestedValue = value as Array<int>;
        expect(nestedValue[0]).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3600
     * @tc.name testArrayConcat036
     * @tc.desc Verify concat can copy arrays that contain self references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Object>();
      arr.pushOne(arr as Object);
      const result = arr.concat();
      expect(result.length).assertEqual(1);
      expect(result[0] == arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3700
     * @tc.name testArrayConcat037
     * @tc.desc Verify concat results remain usable in number operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);
      const result = arr1.concat(arr2);
      const sum = result[0] + result[3];
      expect(sum).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3800
     * @tc.name testArrayConcat038
     * @tc.desc Verify explicit union arrays can bridge mixed-type concat scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string | int>(1, 2);
      const arr2 = new Array<string | int>('a', 'b');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[2]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_3900
     * @tc.name testArrayConcat039
     * @tc.desc Verify concat supports numeric boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxValue = Number.MAX_SAFE_INTEGER.toInt();
      const minValue = Number.MIN_SAFE_INTEGER.toInt();
      const arr1 = new Array<int>(maxValue, minValue);
      const arr2 = new Array<int>(0, -0);
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(maxValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_4000
     * @tc.name testArrayConcat040
     * @tc.desc Verify concat supports string boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('', '\u0000');
      const arr2 = new Array<string>('a', '很长的字符串...');
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_4100
     * @tc.name testArrayConcat041
     * @tc.desc Verify readonly arrays support concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source1 = new Array<int>(1, 2);
      const source2 = new Array<int>(3, 4);
      const arr1: ReadonlyArray<int> = source1;
      const arr2: ReadonlyArray<int> = source2;
      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_4200
     * @tc.name testArrayConcat042
     * @tc.desc Verify concat can merge two datasets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const set1 = new Array<int>(1, 2, 3);
      const set2 = new Array<int>(4, 5, 6);
      const merged = set1.concat(set2);
      expect(merged.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_4300
     * @tc.name testArrayConcat043
     * @tc.desc Verify concat can add equivalent single-value arrays without changing the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Array<int>(1, 2, 3);
      const withNew = original.concat(singleNumberArray(4), singleNumberArray(5));
      expect(original.length).assertEqual(3);
      expect(withNew.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_4400
     * @tc.name testArrayConcat044
     * @tc.desc Verify chained concat calls keep the expected order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = singleNumberArray(1);
      const arr2 = singleNumberArray(2);
      const arr3 = singleNumberArray(3);
      const result = arr1.concat(arr2).concat(arr3);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_4500
     * @tc.name testArrayConcat045
     * @tc.desc Verify concat matches the values of an explicitly constructed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(1, 2);
      const arr2 = new Array<int>(3, 4);

      const result1 = arr1.concat(arr2);
      const result2 = new Array<int>(1, 2, 3, 4);

      expect(result1.toString()).assertEqual(result2.toString());
      expect(result1 == result2).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONCAT_4600
     * @tc.name testArrayConcat046
     * @tc.desc Verify concat preserves sparse-like undefined positions in pre-sized arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConcat046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int | undefined>(3);
      arr1[0] = 1;
      arr1[2] = 3;

      const arr2 = new Array<int | undefined>(2);
      arr2[0] = 4;
      arr2[1] = 5;

      const result = arr1.concat(arr2);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
      expect(result[3]).assertEqual(4);
      expect(result[4]).assertEqual(5);
    });
  });
}
