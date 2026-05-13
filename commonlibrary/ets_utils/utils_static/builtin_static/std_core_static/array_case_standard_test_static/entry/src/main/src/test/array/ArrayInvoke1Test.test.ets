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

class Item017 {
  value: int;

  constructor(v: int) {
    this.value = v;
  }
}

interface Point018 {
  x: int;
  y: int;
}

function processItems1022(): Array<int> {
  const items = new Array<int>();
  items.pushOne(100);
  items.pushOne(200);
  items.pushOne(300);
  return items;
}

function fillArray1023(arr: Array<int>, count: int): void {
  for (let i = 0; i < count; i++) {
    arr.pushOne(i);
  }
}

function createArray1030(): Array<int> {
  return new Array<int>();
}

function collectData1038(): Array<string> {
  const data = new Array<string>();
  data.pushOne('item1');
  data.pushOne('item2');
  return data;
}

export default function ArrayInvoke1Test(): void {
  describe('ArrayInvoke1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0100
     * @tc.name testArrayInvoke1001
     * @tc.desc Verify this invoke overload accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0200
     * @tc.name testArrayInvoke1002
     * @tc.desc Verify passing parameters selects other array overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>();
      expect(arr1.length).assertEqual(0);

      const arr2 = new Array<string>(5);
      expect(arr2.length).assertEqual(5);

      const arr3 = new Array<string>('a', 'b', 'c');
      expect(arr3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0300
     * @tc.name testArrayInvoke1003
     * @tc.desc Verify array invoke returns a new empty array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0400
     * @tc.name testArrayInvoke1004
     * @tc.desc Verify array invoke returns empty arrays for different generic types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>();
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0500
     * @tc.name testArrayInvoke1005
     * @tc.desc Verify the return value is an array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0600
     * @tc.name testArrayInvoke1006
     * @tc.desc Verify the generic array keeps the expected element type usage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>();
      const strArr = new Array<string>();
      let numVal: int = 0;
      let strVal: string = '';

      numArr.pushOne(123);
      strArr.pushOne('hello');

      numVal = numArr[0];
      strVal = strArr[0];

      expect(numVal).assertEqual(123);
      expect(strVal).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0700
     * @tc.name testArrayInvoke1007
     * @tc.desc Verify the static invoke form can be reached through array construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      expect(arr1.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0800
     * @tc.name testArrayInvoke1008
     * @tc.desc Verify explicit generic syntax creates empty arrays as objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>();
      const strArr = new Array<string>();
      const boolArr = new Array<boolean>();

      expect(typeof numArr).assertEqual('object');
      expect(typeof strArr).assertEqual('object');
      expect(typeof boolArr).assertEqual('object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_0900
     * @tc.name testArrayInvoke1009
     * @tc.desc Verify a newly created array starts with length zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1000
     * @tc.name testArrayInvoke1010
     * @tc.desc Verify empty array element access keeps safe behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>();
      try {
        const val = arr[0];
        expect(val).assertUndefined();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1100
     * @tc.name testArrayInvoke1011
     * @tc.desc Verify push can add elements into an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);

      arr.pushOne(2);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1200
     * @tc.name testArrayInvoke1012
     * @tc.desc Verify unshift inserts elements at the beginning of an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.unshift(10);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);

      arr.unshift(20);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(20);
      expect(arr[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1300
     * @tc.name testArrayInvoke1013
     * @tc.desc Verify an empty array can grow dynamically by push operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();

      for (let i = 0; i < 10; i++) {
        arr.pushOne(i * 10);
      }

      expect(arr.length).assertEqual(10);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i * 10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1400
     * @tc.name testArrayInvoke1014
     * @tc.desc Verify an empty number array can be created and used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(42);
      expect(arr[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1500
     * @tc.name testArrayInvoke1015
     * @tc.desc Verify an empty string array can be created and used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      expect(arr.length).assertEqual(0);

      arr.pushOne('hello');
      expect(arr[0]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1600
     * @tc.name testArrayInvoke1016
     * @tc.desc Verify an empty boolean array can be created and used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(true);
      expect(arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1700
     * @tc.name testArrayInvoke1017
     * @tc.desc Verify an empty array of a custom class type can be created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item017>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(new Item017(100));
      expect(arr[0].value).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1800
     * @tc.name testArrayInvoke1018
     * @tc.desc Verify an empty interface typed array can be created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point018>();
      expect(arr.length).assertEqual(0);

      arr.pushOne({ x: 1, y: 2 });
      expect(arr[0].x).assertEqual(1);
      expect(arr[0].y).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_1900
     * @tc.name testArrayInvoke1019
     * @tc.desc Verify an empty union typed array can be created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(1);
      arr.pushOne('two');
      arr.pushOne(3);

      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2000
     * @tc.name testArrayInvoke1020
     * @tc.desc Verify an empty nested array can be created
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>();
      expect(arr.length).assertEqual(0);

      arr.pushOne(new Array<int>(1, 2));
      arr.pushOne(new Array<int>(3, 4));

      expect(arr.length).assertEqual(2);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2100
     * @tc.name testArrayInvoke1021
     * @tc.desc Verify an empty array supports unknown size collection scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = new Array<int>();

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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2200
     * @tc.name testArrayInvoke1022
     * @tc.desc Verify an empty array can be used as a temporary container
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = processItems1022();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2300
     * @tc.name testArrayInvoke1023
     * @tc.desc Verify an empty array can be passed into a function and filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      fillArray1023(arr, 5);

      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(0);
      expect(arr[4]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2400
     * @tc.name testArrayInvoke1024
     * @tc.desc Verify common methods behave correctly on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();

      arr.pushOne(1);
      expect(arr.length).assertEqual(1);

      const val = arr.pop();
      expect(val).assertEqual(1);
      expect(arr.length).assertEqual(0);

      const shifted = arr.shift();
      expect(shifted).assertUndefined();

      arr.unshift(10);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2500
     * @tc.name testArrayInvoke1025
     * @tc.desc Verify iterator style methods behave correctly on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();

      let count = 0;
      arr.forEach((v: int): void => {
        count++;
      });
      expect(count).assertEqual(0);

      const mapped = arr.map((v: int): int => v * 2);
      expect(mapped.length).assertEqual(0);

      const filtered = arr.filter((v: int): boolean => v > 0);
      expect(filtered.length).assertEqual(0);

      try {
        arr.reduce((acc: int, v: int): int => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }

      const sum = arr.reduce((acc: int, v: int): int => acc + v, 0);
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2600
     * @tc.name testArrayInvoke1026
     * @tc.desc Verify search methods behave correctly on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();

      expect(arr.indexOf(1)).assertEqual(-1);
      expect(arr.lastIndexOf(1)).assertEqual(-1);
      expect(arr.includes(1)).assertFalse();
      expect(arr.find((v: int): boolean => v > 0)).assertUndefined();
      expect(arr.findIndex((v: int): boolean => v > 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2700
     * @tc.name testArrayInvoke1027
     * @tc.desc Verify predicate methods behave correctly on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.every((v: int): boolean => v > 0)).assertTrue();
      expect(arr.some((v: int): boolean => v > 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2800
     * @tc.name testArrayInvoke1028
     * @tc.desc Verify invoke without parameters matches constructor behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>();
      expect(arr1.length).assertEqual(0);

      const arr2 = new Array<string>();
      expect(arr2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_2900
     * @tc.name testArrayInvoke1029
     * @tc.desc Verify parameter count selects the expected array overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>();
      expect(arr1.length).assertEqual(0);

      const arr2 = new Array<int>(5);
      expect(arr2.length).assertEqual(5);

      const arr3 = new Array<string>('x', 'y', 'z');
      expect(arr3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3000
     * @tc.name testArrayInvoke1030
     * @tc.desc Verify explicit usage supports expected type inference scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      arr1.pushOne(1);

      const arr2 = createArray1030();
      arr2.pushOne(2);
      expect(arr1[0]).assertEqual(1);
      expect(arr2[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3100
     * @tc.name testArrayInvoke1031
     * @tc.desc Verify sequential push operations can start from an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);
      arr.pushOne(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3200
     * @tc.name testArrayInvoke1032
     * @tc.desc Verify empty arrays can be created repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 100; i++) {
        const arr = new Array<int>();
        expect(arr.length).assertEqual(0);
        arr.pushOne(i);
        expect(arr.length).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3300
     * @tc.name testArrayInvoke1033
     * @tc.desc Verify an empty array keeps the smallest initialized length state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyArr = new Array<int>();
      const sizedArr = new Array<int>(100);

      expect(emptyArr.length).assertEqual(0);
      expect(sizedArr.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3400
     * @tc.name testArrayInvoke1034
     * @tc.desc Verify the native invoke path creates a usable empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      expect(arr.length).assertEqual(0);

      arr.pushOne('test');
      expect(arr[0]).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3500
     * @tc.name testArrayInvoke1035
     * @tc.desc Verify number arrays accept matching generic values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>();
      numArr.pushOne(123);
      expect(numArr[0]).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3600
     * @tc.name testArrayInvoke1036
     * @tc.desc Verify empty array operations remain safe at runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>();

      expect(arr.length).assertEqual(0);
      expect(arr.length > 0).assertFalse();

      try {
        const val = arr[0];
        expect(val).assertUndefined();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3700
     * @tc.name testArrayInvoke1037
     * @tc.desc Verify new Array with no arguments behaves like invoke with no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      expect(arr.length).assertEqual(0);

      arr.pushOne('hello');
      expect(arr[0]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_ONE_3800
     * @tc.name testArrayInvoke1038
     * @tc.desc Verify empty array construction suits dynamic and temporary container scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const dynamicArr = new Array<int>();
      for (let i = 0; i < 100; i++) {
        dynamicArr.pushOne(i);
      }

      const result = collectData1038();
      expect(dynamicArr.length).assertEqual(100);
      expect(result.length).assertEqual(2);
    });
  });
}
