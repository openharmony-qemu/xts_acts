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

class Item010 {
  value: number;

  constructor(v: number) {
    this.value = v;
  }
}

interface Point011 {
  x: number;
  y: number;
}

function processItems012(): Array<number> {
  const items = new Array<number>();
  items.pushOne(100);
  items.pushOne(200);
  items.pushOne(300);
  return items;
}

function fillArray013(arr: Array<number>, count: number): void {
  for (let i = 0; i < count; i++) {
    arr.pushOne(i);
  }
}

function createArray014(): Array<number> {
  return new Array<number>();
}

export default function ArrayConstructor2Test(): void {
  describe('ArrayConstructor2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0100
     * @tc.name testArrayConstructor2001
     * @tc.desc Verify the no-argument constructor creates an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0200
     * @tc.name testArrayConstructor2002
     * @tc.desc Verify different constructor argument counts create number arrays with matching lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr2 = new Array<number>(10, 20, 30, 40, 50);
      expect(arr2.length).assertEqual(5);

      const arr3 = new Array<number>(1, 2, 3);
      expect(arr3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0300
     * @tc.name testArrayConstructor2003
     * @tc.desc Verify the no-argument constructor returns a new empty Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0400
     * @tc.name testArrayConstructor2004
     * @tc.desc Verify the no-argument constructor supports different generic empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>();
      const strArr = new Array<string>();
      const boolArr = new Array<boolean>();

      expect(numArr instanceof Array).assertTrue();
      expect(strArr instanceof Array).assertTrue();
      expect(boolArr instanceof Array).assertTrue();

      expect(numArr.length).assertEqual(0);
      expect(strArr.length).assertEqual(0);
      expect(boolArr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0500
     * @tc.name testArrayConstructor2005
     * @tc.desc Verify the returned value from the no-argument constructor is an Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0600
     * @tc.name testArrayConstructor2006
     * @tc.desc Verify the declared generic type controls what values can be pushed into empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>();
      const strArr = new Array<string>();

      let numVal: number = 0;
      let strVal: string = '';

      numArr.pushOne(123);
      strArr.pushOne('hello');

      numVal = numArr[0];
      strVal = strArr[0];
      expect(numVal).assertEqual(123);
      expect(strVal).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0700
     * @tc.name testArrayConstructor2007
     * @tc.desc Verify empty arrays throw RangeError for indexed access before elements are added
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      try {
        arr[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0800
     * @tc.name testArrayConstructor2008
     * @tc.desc Verify push operations grow an initially empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);

      arr.pushOne(2);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_0900
     * @tc.name testArrayConstructor2009
     * @tc.desc Verify unshift inserts elements at the front of an initially empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.unshift(10);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);

      arr.unshift(20);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1000
     * @tc.name testArrayConstructor2010
     * @tc.desc Verify an empty array can be built dynamically with repeated pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i = 0; i < 10; i++) {
        arr.pushOne(i * 10);
      }

      expect(arr.length).assertEqual(10);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i * 10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1100
     * @tc.name testArrayConstructor2011
     * @tc.desc Verify Array<number> starts empty and accepts numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(42);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1200
     * @tc.name testArrayConstructor2012
     * @tc.desc Verify Array<boolean> starts empty and accepts boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(true);
      expect(arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1300
     * @tc.name testArrayConstructor2013
     * @tc.desc Verify empty arrays of custom class instances accept pushed objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item010>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(new Item010(100));
      expect(arr[0].value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1400
     * @tc.name testArrayConstructor2014
     * @tc.desc Verify empty arrays of interface-based objects accept pushed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point011>();
      expect(arr.length).assertEqual(0);

      arr.pushOne({ x: 1, y: 2 });
      expect(arr[0].x).assertEqual(1);
      expect(arr[0].y).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1500
     * @tc.name testArrayConstructor2015
     * @tc.desc Verify empty arrays with union element types accept mixed valid values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(1);
      arr.pushOne('two');
      arr.pushOne(3);

      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1600
     * @tc.name testArrayConstructor2016
     * @tc.desc Verify nested empty arrays can collect array elements dynamically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<number>>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(new Array<number>(1, 2));
      arr.pushOne(new Array<number>(3, 4));

      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1700
     * @tc.name testArrayConstructor2017
     * @tc.desc Verify empty arrays are suitable for dynamically sized collections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<number>();
      for (let i = 0; i < 10; i++) {
        if (i % 2 == 0) {
          result.pushOne(i);
        }
      }

      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(0);
      expect(result[4]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1800
     * @tc.name testArrayConstructor2018
     * @tc.desc Verify empty arrays can be used as temporary data containers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = processItems012();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_1900
     * @tc.name testArrayConstructor2019
     * @tc.desc Verify an empty array can be passed to a function and filled there
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      fillArray013(arr, 5);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2000
     * @tc.name testArrayConstructor2020
     * @tc.desc Verify common array methods keep an initially empty array usable after push pop shift and unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();

      arr.pushOne(1);
      expect(arr.length).assertEqual(1);

      const val = arr.pop();
      expect(val).assertEqual(1);
      expect(arr.length).assertEqual(0);

      const shifted = arr.shift();
      expect(shifted).assertUndefined();

      arr.unshift(10);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2100
     * @tc.name testArrayConstructor2021
     * @tc.desc Verify iterator-style methods on an empty array return empty or neutral results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();

      let count = 0;
      arr.forEach((v: number): void => {
        count++;
      });
      expect(count).assertEqual(0);

      const mapped = arr.map((v: number): number => v * 2);
      expect(mapped.length).assertEqual(0);

      const filtered = arr.filter((v: number): boolean => v > 0);
      expect(filtered.length).assertEqual(0);

      try {
        arr.reduce((acc: number, v: number): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }

      const sum = arr.reduce((acc: number, v: number): number => acc + v, 0);
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2200
     * @tc.name testArrayConstructor2022
     * @tc.desc Verify search methods return empty-array defaults when no elements exist
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();

      expect(arr.indexOf(1)).assertEqual(-1);
      expect(arr.lastIndexOf(1)).assertEqual(-1);
      expect(arr.includes(1)).assertFalse();
      expect(arr.find((v: number): boolean => v > 0)).assertUndefined();
      expect(arr.findIndex((v: number): boolean => v > 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2300
     * @tc.name testArrayConstructor2023
     * @tc.desc Verify predicate methods on an empty array follow standard vacuous truth behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.every((v: number): boolean => v > 0)).assertTrue();
      expect(arr.some((v: number): boolean => v > 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2400
     * @tc.name testArrayConstructor2024
     * @tc.desc Verify empty arrays can be populated step by step instead of chaining pushOne calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2500
     * @tc.name testArrayConstructor2025
     * @tc.desc Verify generic empty arrays work with helper functions that return the same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>();
      arr1.pushOne(1);

      const arr2 = createArray014();
      arr2.pushOne(2);

      expect(arr1[0]).assertEqual(1);
      expect(arr2[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2600
     * @tc.name testArrayConstructor2026
     * @tc.desc Verify repeated empty-array creation remains valid across many iterations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        const arr = new Array<number>();
        expect(arr.length).assertEqual(0);
        arr.pushOne(i);
        expect(arr.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2700
     * @tc.name testArrayConstructor2027
     * @tc.desc Verify default construction differs from passing a single numeric argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArr = new Array<number>();
      const sizedArr = Array.create<number>(1, 100);
      expect(sizedArr.length).assertEqual(1);
      expect(sizedArr[0]).assertEqual(100);
      for (let i = 0; i < sizedArr.length; i++) {
        sizedArr[i] = i;
      }
      expect(emptyArr.length).assertEqual(0);
      expect(sizedArr.length).assertEqual(1);
      expect(sizedArr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2800
     * @tc.name testArrayConstructor2028
     * @tc.desc Verify different array constructor overloads serve empty and initialized number-array use cases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>();
      expect(arr1.length).assertEqual(0);

      const arr2 = new Array<number>(5, 10, 15, 20, 25);
      expect(arr2.length).assertEqual(5);

      const arr3 = new Array<number>(1, 2, 3);
      expect(arr3.length).assertEqual(3);
      expect(arr3[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_2900
     * @tc.name testArrayConstructor2029
     * @tc.desc Verify constructor choice still distinguishes dynamic growth single-numeric and multi-item scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dynamicArr = new Array<number>();
      for (let i = 0; i < 100; i++) {
        dynamicArr.pushOne(i);
      }

      const fixedArr = Array.create<number>(1, 100);
      expect(fixedArr.length).assertEqual(1);
      expect(fixedArr[0]).assertEqual(100);
      for (let i = 0; i < fixedArr.length; i++) {
        fixedArr[i] = i;
      }

      const initArr = new Array<number>(1, 2, 3, 4, 5);
      expect(dynamicArr.length).assertEqual(100);
      expect(fixedArr.length).assertEqual(1);
      expect(fixedArr[0]).assertEqual(0);
      expect(initArr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3000
     * @tc.name testArrayConstructor2030
     * @tc.desc Verify generic type safety is preserved for empty arrays before and after pushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<number>();
      numArr.pushOne(123);
      expect(numArr[0]).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_CONSTRUCTOR_TWO_3100
     * @tc.name testArrayConstructor2031
     * @tc.desc Verify basic operations on an empty array throw RangeError for direct indexed access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayConstructor2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.length).assertEqual(0);
      expect(arr.length > 0).assertFalse();

      try {
        arr[0];
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });
  });
}
