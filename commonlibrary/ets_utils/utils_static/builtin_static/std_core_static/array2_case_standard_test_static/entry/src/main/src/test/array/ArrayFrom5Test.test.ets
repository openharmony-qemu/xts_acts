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

class Point011 {
  x: number = 0;
  y: number = 0;
}

class Data023 {
  id: number = 0;
  value: string = '';
}

class Item028 {
  id: number = 0;
  data: string = '';
}

class Container034 {
  value: number = 0;

  constructor(v: number) {
    this.value = v;
  }
}

class FromFixedObjB {
  value: number = 0;
}

function createIntFixedArray(size: int): FixedArray<int> {
  let source = new FixedArray<int>(size, 0);
  for (let i: int = 0; i < size; i++) {
    source[i] = i;
  }
  return source;
}

function createIntFixedArrayFromValues(values: Array<int>): FixedArray<int> {
  let source = new FixedArray<int>(values.length, 0);
  for (let i: int = 0; i < values.length; i++) {
    source[i] = values[i];
  }
  return source;
}

function createCharFixedArrayFromValues(values: Array<char>): FixedArray<char> {
  let source = new FixedArray<char>(values.length, c'\0');
  for (let i: int = 0; i < values.length; i++) {
    source[i] = values[i];
  }
  return source;
}

export default function ArrayFrom5Test(): void {
  const invokeArrayFromFixedArray = (source: Any): Array<int> => {
    return Array.from<int>(source as FixedArray<int>);
  };
  const invokeArrayFromNumberArray = (source: Any): Array<number> => {
    return Array.from<number>(source as Array<number>);
  };

  describe('ArrayFrom5Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_0100
     * @tc.name testArrayFromFive001
     * @tc.desc Verify Array from accepts the required fixed array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(0, 1));
      let arr = Array.from<int>(sourceArray);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_0200
     * @tc.name testArrayFromFive002
     * @tc.desc Verify Array from uses a standard fixed array source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int>(sourceArray);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_0300
     * @tc.name testArrayFromFive003
     * @tc.desc Verify Array from supports empty fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: FixedArray<int> = [];
      let arr = Array.from<int>(sourceArray);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_0400
     * @tc.name testArrayFromFive004
     * @tc.desc Verify Array from supports single element fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: FixedArray<int> = [42];
      let arr = Array.from<int>(sourceArray);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_0500
     * @tc.name testArrayFromFive005
     * @tc.desc Verify Array from supports large fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(1000);
      let arr = Array.from<int>(sourceArray);
      expect(arr.length).assertEqual(1000);
      expect(arr[0]).assertEqual(0);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_0600
     * @tc.name testArrayFromFive006
     * @tc.desc Verify Array from preserves zero values in fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(0, 1, 0));
      let arr = Array.from<int>(sourceArray);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(1);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_0700
     * @tc.name testArrayFromFive007
     * @tc.desc Verify Array from preserves negative values in fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(-100, 0, 100));
      let arr = Array.from<int>(sourceArray);
      expect(arr[0]).assertEqual(-100);
      expect(arr[1]).assertEqual(0);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_0800
     * @tc.name testArrayFromFive008
     * @tc.desc Verify Array from preserves maximum and minimum int values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray: FixedArray<int> = [2147483647, -2147483648];
      let arr = Array.from<int>(sourceArray);
      expect(arr[0]).assertEqual(2147483647);
      expect(arr[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_0900
     * @tc.name testArrayFromFive009
     * @tc.desc Verify Array from supports char fixed array sources
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createCharFixedArrayFromValues(
        new Array<char>(c'H', c'e', c'l', c'l', c'o')
      );
      let arr = Array.from<char>(sourceArray);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(c'H');
      expect(arr[4]).assertEqual(c'o');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1000
     * @tc.name testArrayFromFive010
     * @tc.desc Verify Array from preserves escaped char values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createCharFixedArrayFromValues(
        new Array<char>(c'\n', c'\t', c'\x7F')
      );
      let arr = Array.from<char>(sourceArray);
      expect(arr[0]).assertEqual(c'\n');
      expect(arr[1]).assertEqual(c'\t');
      expect(arr[2]).assertEqual(c'\x7F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1100
     * @tc.name testArrayFromFive011
     * @tc.desc Verify Array from supports custom fixed array element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let point1 = new Point011();
      point1.x = 1;
      point1.y = 2;
      let point2 = new Point011();
      point2.x = 3;
      point2.y = 4;
      let sourceArray: FixedArray<Point011> = [point1, point2];
      let arr = Array.from<Point011>(sourceArray);
      expect(arr.length).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[0].y).assertEqual(2);
      expect(arr[1].x).assertEqual(3);
      expect(arr[1].y).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1200
     * @tc.name testArrayFromFive012
     * @tc.desc Verify Array.from returns a mutable copy independent of the fixed source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(3, 1, 4, 1, 5));
      let arr = Array.from<int>(sourceArray);
      arr[1] = 9;
      expect(arr.toString()).assertEqual('3,9,4,1,5');
      expect(sourceArray[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1300
     * @tc.name testArrayFromFive013
     * @tc.desc Verify normal arrays are handled by a different Array from overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let normalArray = new Array<number>(1, 2, 3);
      let arr = Array.from<number>(normalArray);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1400
     * @tc.name testArrayFromFive014
     * @tc.desc Verify Array from returns a new array containing fixed array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(10, 20, 30));
      let arr = Array.from<int>(sourceArray);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1500
     * @tc.name testArrayFromFive015
     * @tc.desc Verify Array from returns a new array instead of the source reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int>(sourceArray);
      arr[0] = 999;
      expect(sourceArray[0]).assertEqual(1);
      expect(arr[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1600
     * @tc.name testArrayFromFive016
     * @tc.desc Verify Array from returns arrays of the requested generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int>(sourceArray);
      let val: int = arr[0];
      expect(val).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1700
     * @tc.name testArrayFromFive017
     * @tc.desc Verify fixed arrays can be converted into dynamic arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int>(sourceArray);
      expect(sourceArray.length).assertEqual(3);
      expect(arr.length).assertEqual(3);
      arr.pushOne(100);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1800
     * @tc.name testArrayFromFive018
     * @tc.desc Verify Array from can be called as a static method on Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int>(sourceArray);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_1900
     * @tc.name testArrayFromFive019
     * @tc.desc Verify Array from supports explicit generic syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let charArray = createCharFixedArrayFromValues(new Array<char>(c'A', c'B', c'C'));
      let intResult = Array.from<int>(intArray);
      let charResult = Array.from<char>(charArray);
      expect(intResult[0]).assertEqual(1);
      expect(charResult[0]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2000
     * @tc.name testArrayFromFive020
     * @tc.desc Verify Array from copies int fixed array values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3, 4, 5));
      let arr = Array.from<int>(sourceArray);
      expect(arr.length).assertEqual(5);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2100
     * @tc.name testArrayFromFive021
     * @tc.desc Verify Array from converts char fixed arrays into char arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createCharFixedArrayFromValues(
        new Array<char>(c'H', c'e', c'l', c'l', c'o')
      );
      let arr = Array.from<char>(sourceArray);
      let str = arr.join('');
      expect(arr.length).assertEqual(5);
      expect(str).assertEqual('Hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2200
     * @tc.name testArrayFromFive022
     * @tc.desc Verify char fixed arrays can be converted into string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createCharFixedArrayFromValues(new Array<char>(c'A', c'B', c'C'));
      let arr = Array.from<char, string>(sourceArray, (c: char): string => c.toString());
      expect(arr[0]).assertEqual('A');
      expect(arr[1]).assertEqual('B');
      expect(arr[2]).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2300
     * @tc.name testArrayFromFive023
     * @tc.desc Verify Array from supports custom data fixed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first = new Data023();
      first.id = 1;
      first.value = 'first';
      let second = new Data023();
      second.id = 2;
      second.value = 'second';
      let sourceArray: FixedArray<Data023> = [first, second];
      let arr = Array.from<Data023>(sourceArray);
      expect(arr.length).assertEqual(2);
      expect(arr[0].id).assertEqual(1);
      expect(arr[0].value).assertEqual('first');
      expect(arr[1].id).assertEqual(2);
      expect(arr[1].value).assertEqual('second');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2400
     * @tc.name testArrayFromFive024
     * @tc.desc Verify fixed arrays can become mutable arrays after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(5);
      let arr = Array.from<int>(sourceArray);
      expect(sourceArray.length).assertEqual(5);
      arr.pushOne(100);
      arr.pushOne(200);
      expect(arr.length).assertEqual(7);
      expect(arr[5]).assertEqual(100);
      expect(arr[6]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2500
     * @tc.name testArrayFromFive025
     * @tc.desc Verify converted arrays can use standard array methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(5);
      let arr = Array.from<int>(sourceArray);
      let doubled = arr.map((v: int): int => v * 2);
      let filtered = arr.filter((v: int): boolean => v > 2);
      expect(doubled[0]).assertEqual(0);
      expect(doubled[4]).assertEqual(8);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0]).assertEqual(3);
      expect(filtered[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2600
     * @tc.name testArrayFromFive026
     * @tc.desc Verify char fixed arrays can be joined into strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let charArray = createCharFixedArrayFromValues(
        new Array<char>(c'W', c'o', c'r', c'l', c'd')
      );
      let arr = Array.from<char>(charArray);
      let str = arr.join('');
      expect(str).assertEqual('World');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2700
     * @tc.name testArrayFromFive027
     * @tc.desc Verify Array from handles large fixed array conversions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArray(10000);
      let arr = Array.from<int>(sourceArray);
      expect(arr.length).assertEqual(10000);
      expect(arr[0]).assertEqual(0);
      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2800
     * @tc.name testArrayFromFive028
     * @tc.desc Verify Array from supports large fixed arrays of complex types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let defaultItem = new Item028();
      let sourceArray = new FixedArray<Item028>(1000, defaultItem);
      for (let i: int = 0; i < 1000; i++) {
        let item = new Item028();
        item.id = i;
        item.data = 'item' + i;
        sourceArray[i] = item;
      }
      let arr = Array.from<Item028>(sourceArray);
      expect(arr.length).assertEqual(1000);
      expect(arr[0].id).assertEqual(0);
      expect(arr[999].id).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_2900
     * @tc.name testArrayFromFive029
     * @tc.desc Verify Array.from result can be reversed without mutating the fixed source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(8, 6, 7, 5));
      let arr = Array.from<int>(sourceArray);
      arr.reverse();
      expect(arr.toString()).assertEqual('5,7,6,8');
      expect(sourceArray[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3000
     * @tc.name testArrayFromFive030
     * @tc.desc Verify Array.from copies values from a fixed int array with an explicit generic element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr = Array.from<int>(sourceArray);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3100
     * @tc.name testArrayFromFive031
     * @tc.desc Verify this overload differs from other Array from overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fixedArray = createIntFixedArrayFromValues(new Array<int>(1, 2, 3));
      let arr1 = Array.from<int>(fixedArray);
      let arrayLike = new Array<number>(3, (index: int): number => index + 1);
      let arr2 = Array.from<number>(arrayLike);
      expect(Array.isArray(arr1)).assertTrue();
      expect(Array.isArray(arr2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3200
     * @tc.name testArrayFromFive032
     * @tc.desc Verify fixed arrays should use this Array from overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let intArray = createIntFixedArray(5);
      let arr1 = Array.from<int>(intArray);
      let normalArray = new Array<number>(1, 2, 3);
      let arr2 = Array.from<number>(normalArray);
      expect(arr1.length).assertEqual(5);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3300
     * @tc.name testArrayFromFive033
     * @tc.desc Verify Array from preserves source order after conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = createIntFixedArrayFromValues(new Array<int>(10, 20, 30, 40, 50));
      let arr = Array.from<int>(sourceArray);
      for (let i: int = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual((i + 1) * 10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3400
     * @tc.name testArrayFromFive034
     * @tc.desc Verify Array from performs a shallow copy for nested reference objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nested: FixedArray<Container034> = [new Container034(100), new Container034(200)];
      let arr = Array.from<Container034>(nested);
      arr[0].value = 999;
      expect(nested[0].value).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3500
     * @tc.name testArrayFromFive035
     * @tc.desc Verify Array.from can copy fixed-array numeric data 1, 2, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const arr = Array.from<int>(source);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3600
     * @tc.name testArrayFromFive036
     * @tc.desc Verify Array.from can copy fixed-array pair 2, 3 after truncation-style data selection
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [2, 3];
      const arr = Array.from<int>(source);
      expect(arr.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3700
     * @tc.name testArrayFromFive037
     * @tc.desc Verify Array.from can copy fixed-array numeric triple 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [2, 3, 4];
      const arr = Array.from<int>(source);
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3800
     * @tc.name testArrayFromFive038
     * @tc.desc Verify Array.from can copy fixed-array numeric triple 3, 4, 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [3, 4, 5];
      const arr = Array.from<int>(source);
      expect(arr.toString()).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_3900
     * @tc.name testArrayFromFive039
     * @tc.desc Verify Array.from can copy a fixed-array of positive ints into a mutable array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4000
     * @tc.name testArrayFromFive040
     * @tc.desc Verify Array.from can copy an empty fixed-array into an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [];
      const result = Array.from<int>(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4100
     * @tc.name testArrayFromFive041
     * @tc.desc Verify Array.from can copy a single fixed-array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [9];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4200
     * @tc.name testArrayFromFive042
     * @tc.desc Verify Array.from can copy fixed-array values containing negative and zero ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [-3, 0, 5];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('-3,0,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4300
     * @tc.name testArrayFromFive043
     * @tc.desc Verify Array.from can copy fixed-array values containing duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [2, 2, 2];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4400
     * @tc.name testArrayFromFive044
     * @tc.desc Verify Array.from can copy fixed-array char values into strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'A', c'B', c'C'];
      const result = Array.from<char, string>(source, (value: char): string => value.toString());
      expect(result.toString()).assertEqual('A,B,C');
      expect(result[0]).assertEqual('A');
      expect(result[2]).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4500
     * @tc.name testArrayFromFive045
     * @tc.desc Verify Array.from can copy fixed-array char values containing escape characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'\n', c'\t'];
      const result = Array.from<char>(source);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(c'\n');
      expect(result[1]).assertEqual(c'\t');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4600
     * @tc.name testArrayFromFive046
     * @tc.desc Verify Array.from can copy fixed-array values into a mutable array that can be pushed to later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2];
      const result = Array.from<int>(source);
      result.pushOne(3);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4700
     * @tc.name testArrayFromFive047
     * @tc.desc Verify Array.from can copy fixed-array values into a mutable array that can be reversed later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int>(source);
      result.reverse();
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4800
     * @tc.name testArrayFromFive048
     * @tc.desc Verify Array.from can copy fixed-array values into a mutable array that can be sorted later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [3, 1, 2];
      const result = Array.from<int>(source);
      result.sort((left: int, right: int): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_4900
     * @tc.name testArrayFromFive049
     * @tc.desc Verify Array.from can copy fixed-array values into a mutable array that can be shrunk later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3, 4];
      const result = Array.from<int>(source);
      result.shrinkTo(2);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5000
     * @tc.name testArrayFromFive050
     * @tc.desc Verify Array.from can copy fixed-array values into a mutable array that can be spliced later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int>(source);
      result.splice(1, 1, 8, 9);
      expect(result.toString()).assertEqual('1,8,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5100
     * @tc.name testArrayFromFive051
     * @tc.desc Verify Array.from can copy fixed-array values into a mutable array that can be shifted later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int>(source);
      expect(result.shift()).assertEqual(1);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5200
     * @tc.name testArrayFromFive052
     * @tc.desc Verify Array.from can copy fixed-array values into a mutable array that can be popped later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int>(source);
      expect(result.pop()).assertEqual(3);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5300
     * @tc.name testArrayFromFive053
     * @tc.desc Verify Array.from can copy fixed-array values after selecting a prefix literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [8, 9, 10, 11];
      const prefix: FixedArray<int> = [source[0], source[1], source[2]];
      const result = Array.from<int>(prefix);
      expect(result.toString()).assertEqual('8,9,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5400
     * @tc.name testArrayFromFive054
     * @tc.desc Verify Array.from can copy fixed-array values with boundary ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0x7fffffff, -0x80000000];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('2147483647,-2147483648');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5500
     * @tc.name testArrayFromFive055
     * @tc.desc Verify Array.from can copy fixed-array whitespace and visible chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c' ', c'Z'];
      const result = Array.from<char>(source);
      expect(result.toString()).assertEqual(' ,Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5600
     * @tc.name testArrayFromFive056
     * @tc.desc Verify Array.from can copy fixed-array object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new FromFixedObjB();
      const second = new FromFixedObjB();
      const source: FixedArray<FromFixedObjB> = [first, second];
      const result = Array.from<FromFixedObjB>(source);
      expect(result[0] === first).assertTrue();
      expect(result[1] === second).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5700
     * @tc.name testArrayFromFive057
     * @tc.desc Verify Array.from can copy fixed-array boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<boolean> = [true, false, true];
      const result = Array.from<boolean>(source);
      expect(result.toString()).assertEqual('true,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5800
     * @tc.name testArrayFromFive058
     * @tc.desc Verify Array.from can copy fixed-array bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<bigint> = [1n, 3n];
      const result = Array.from<bigint>(source);
      expect(result.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_5900
     * @tc.name testArrayFromFive059
     * @tc.desc Verify Array.from can copy fixed-array union values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<number | string> = [1, 'two', 3];
      const result = Array.from<number | string>(source);
      expect(result.toString()).assertEqual('1,two,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6000
     * @tc.name testArrayFromFive060
     * @tc.desc Verify Array.from can copy fixed-array values into an array comparable with Array.of output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7, 8, 9];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual(Array.of<number>(7, 8, 9).toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6100
     * @tc.name testArrayFromFive061
     * @tc.desc Verify Array.from can copy fixed-array values created from standard array indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      const source: FixedArray<int> = [arr[0].toInt(), arr[1].toInt(), arr[2].toInt()];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6200
     * @tc.name testArrayFromFive062
     * @tc.desc Verify Array.from can copy fixed-array values and leave the original literal unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [4, 5, 6];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('4,5,6');
      expect(source[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6300
     * @tc.name testArrayFromFive063
     * @tc.desc Verify Array.from can copy fixed-array values with many generated ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0, 1, 2, 3, 4, 5];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('0,1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6400
     * @tc.name testArrayFromFive064
     * @tc.desc Verify Array.from can copy fixed-array values after array output is rebuilt through pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [3, 6, 9];
      const result = Array.from<int>(source);
      result.length = 0;
      result.pushOne(1);
      result.pushOne(2);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6500
     * @tc.name testArrayFromFive065
     * @tc.desc Verify Array.from can copy fixed-array values containing descending ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [5, 4, 3, 2];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('5,4,3,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6600
     * @tc.name testArrayFromFive066
     * @tc.desc Verify Array.from can copy fixed-array values containing alternating parity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3, 4];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6700
     * @tc.name testArrayFromFive067
     * @tc.desc Verify Array.from can copy fixed-array values containing repeated max-ish ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1024, 1024, 512];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('1024,1024,512');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6800
     * @tc.name testArrayFromFive068
     * @tc.desc Verify Array.from can copy fixed-array values containing unicode chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'A', c'B'];
      const result = Array.from<char>(source);
      expect(result.toString()).assertEqual('A,B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_6900
     * @tc.name testArrayFromFive069
     * @tc.desc Verify Array.from can copy fixed-array values containing repeated chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<char> = [c'A', c'A', c'B'];
      const result = Array.from<char>(source);
      expect(result.toString()).assertEqual('A,A,B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7000
     * @tc.name testArrayFromFive070
     * @tc.desc Verify Array.from can copy fixed-array values containing zero entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0, 1, 0];
      const result = Array.from<int>(source);
      expect(result.toString()).assertEqual('0,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7100
     * @tc.name testArrayFromFive071
     * @tc.desc Verify Array.from can copy fixed-array values into a result usable with join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int>(source);
      expect(result.join('-')).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7200
     * @tc.name testArrayFromFive072
     * @tc.desc Verify Array.from can copy fixed-array values into a result usable with with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int>(source).with(1, 9);
      expect(result.toString()).assertEqual('1,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7300
     * @tc.name testArrayFromFive073
     * @tc.desc Verify Array.from can copy fixed-array values into a result usable with toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3, 4];
      const result = Array.from<int>(source).toSpliced(1, 2);
      expect(result.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7400
     * @tc.name testArrayFromFive074
     * @tc.desc Verify Array.from can copy fixed-array values into a result usable with toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [1, 2, 3];
      const result = Array.from<int>(source).toReversed();
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7500
     * @tc.name testArrayFromFive075
     * @tc.desc Verify Array.from can copy fixed-array values into a result usable with toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [3, 1, 2];
      const result = Array.from<int>(source).toSorted((left: int, right: int): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7600
     * @tc.name testArrayFromFive076
     * @tc.desc Verify Array.from throws ClassCastError when the fixed-array source is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeArrayFromFixedArray(null);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7700
     * @tc.name testArrayFromFive077
     * @tc.desc Verify Array.from throws ClassCastError when the fixed-array source is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        invokeArrayFromFixedArray(undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7800
     * @tc.name testArrayFromFive078
     * @tc.desc Verify Array.from throws ClassCastError when the fixed-array source is a non-iterable object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const invalid = new FromFixedObjB();
      try {
        invokeArrayFromFixedArray(invalid);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_7900
     * @tc.name testArrayFromFive079
     * @tc.desc Verify Array.from works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      const result = invokeArrayFromNumberArray(anyValue);
      expect(result.toString()).assertEqual('1,2,3');
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_FROM_FIVE_8000
     * @tc.name testArrayFromFive080
     * @tc.desc Verify Array.from supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayFromFive080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const result = Array.from<Any>(anyArr);
      expect(result.toString()).assertEqual('1,two,true');
      expect(result.length).assertEqual(3);
    });

  });
}


