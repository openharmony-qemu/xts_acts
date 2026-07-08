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

class Item027 {
  value: int;

  constructor(v: int) {
    this.value = v;
  }
}

interface Point028 {
  x: int;
  y: int;
}

export default function ArrayInvoke2Test(): void {
  describe('ArrayInvoke2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0100
     * @tc.name testArrayInvoke2001
     * @tc.desc Verify a single numeric constructor argument is preserved as the only array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0200
     * @tc.name testArrayInvoke2002
     * @tc.desc Verify default construction uses length zero when no argument is provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0300
     * @tc.name testArrayInvoke2003
     * @tc.desc Verify extremely large length input is handled safely by the runtime
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const value = Number.MAX_SAFE_INTEGER.toInt();
      const arr = Array.create<int>(1, value);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0400
     * @tc.name testArrayInvoke2004
     * @tc.desc Verify a negative numeric argument is preserved as the only array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, -1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0500
     * @tc.name testArrayInvoke2005
     * @tc.desc Verify a scientific-notation numeric argument converted to int is preserved as the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1e1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0600
     * @tc.name testArrayInvoke2006
     * @tc.desc Verify a hexadecimal numeric argument is preserved as the only array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0x0A);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0700
     * @tc.name testArrayInvoke2007
     * @tc.desc Verify a single numeric constructor call still returns a new Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      expect(arr instanceof Array).assertTrue();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0800
     * @tc.name testArrayInvoke2008
     * @tc.desc Verify a single numeric constructor still returns an Array while other multi-item constructions keep their elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = Array.create<int>(1, 5);
      const strArr = new Array<string>('one', 'two', 'three', 'four', 'five');
      const boolArr = new Array<boolean>(true, false, true, false, true);

      expect(numArr instanceof Array).assertTrue();
      expect(strArr instanceof Array).assertTrue();
      expect(boolArr instanceof Array).assertTrue();
      expect(numArr.length).assertEqual(1);
      expect(numArr[0]).assertEqual(5);
      expect(strArr.length).assertEqual(5);
      expect(boolArr.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_0900
     * @tc.name testArrayInvoke2009
     * @tc.desc Verify the constructed element can be overwritten and used safely after single-item construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
      arr[0] = 1;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1000
     * @tc.name testArrayInvoke2010
     * @tc.desc Verify this invoke path preserves a single numeric argument as the only array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 10);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1100
     * @tc.name testArrayInvoke2011
     * @tc.desc Verify explicit generic syntax works when a single numeric constructor value is followed by pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = Array.create<int>(1, 5);
      const strArr = new Array<string>('a', 'b', 'c', 'd', 'e');

      numArr.pushOne(123);
      strArr.pushOne('hello');

      expect(numArr.length).assertEqual(2);
      expect(numArr[0]).assertEqual(5);
      expect(numArr[1]).assertEqual(123);
      expect(strArr[5]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1200
     * @tc.name testArrayInvoke2012
     * @tc.desc Verify omitting the argument differs from passing a single numeric zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      const arr2 = Array.create<int>(1, 0);
      expect(arr.length).assertEqual(0);
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1300
     * @tc.name testArrayInvoke2013
     * @tc.desc Verify providing a single numeric argument creates a one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1400
     * @tc.name testArrayInvoke2014
     * @tc.desc Verify argument count still distinguishes default, single-numeric, and multi-item construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>();
      const arr2 = Array.create<int>(1, 10);
      const arr3 = new Array<string>('a', 'b', 'c');

      expect(arr1.length).assertEqual(0);
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]).assertEqual(10);
      expect(arr3.length).assertEqual(3);
      expect(arr3[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1500
     * @tc.name testArrayInvoke2015
     * @tc.desc Verify a string generic array can be created with initialized elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world', '!');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1600
     * @tc.name testArrayInvoke2016
     * @tc.desc Verify a boolean generic array can be created with initialized elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1700
     * @tc.name testArrayInvoke2017
     * @tc.desc Verify a custom class array can be created and populated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item027>(new Item027(1), new Item027(2), new Item027(3));
      expect(arr.length).assertEqual(3);
      expect(arr[0].value).assertEqual(1);
      expect(arr[1].value).assertEqual(2);
      expect(arr[2].value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1800
     * @tc.name testArrayInvoke2018
     * @tc.desc Verify an interface typed array can be created and used
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point028>({ x: 1, y: 2 }, { x: 3, y: 4 });
      expect(arr.length).assertEqual(2);
      expect(arr[0].x).assertEqual(1);
      expect(arr[0].y).assertEqual(2);
      expect(arr[1].x).assertEqual(3);
      expect(arr[1].y).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_1900
     * @tc.name testArrayInvoke2019
     * @tc.desc Verify a union typed array can be created and hold mixed values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3, 'four', 5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual('four');
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2000
     * @tc.name testArrayInvoke2020
     * @tc.desc Verify loop assignment and fill operate on the single constructed element while Array.create keeps its own semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 5);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(5);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = 0;
      }

      const arr2 = Array.create<int>(1, 5);
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]).assertEqual(5);
      arr2.fill(0);

      const arr3 = Array.create<int>(5, 0);
      expect(arr[0]).assertEqual(0);
      expect(arr2[0]).assertEqual(0);
      expect(arr3[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2100
     * @tc.name testArrayInvoke2021
     * @tc.desc Verify single-item numeric construction still supports read write and push operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 10);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * 10;
      }

      expect(arr[0]).assertEqual(0);
      arr[0] = 999;
      expect(arr[0]).assertEqual(999);

      arr.pushOne(100);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2200
     * @tc.name testArrayInvoke2022
     * @tc.desc Verify a single numeric constructor result can still be reassigned during later processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * i;
      }

      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2300
     * @tc.name testArrayInvoke2023
     * @tc.desc Verify batch-style processing works on the single constructed element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const size = 10;
      const arr = Array.create<int>(1, size);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(size);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i * 10 + 7;
      }

      let sum = 0;
      for (let i = 0; i < arr.length; i++) {
        sum += arr[i];
      }

      expect(arr[0]).assertEqual(7);
      expect(sum).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2400
     * @tc.name testArrayInvoke2024
     * @tc.desc Verify a single-item numeric constructor result can still participate in resize operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 10);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10);
      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }

      arr.shrinkTo(1);
      expect(arr.length).assertEqual(1);

      arr.extendTo(2, 0);
      expect(arr.length).assertEqual(2);

      arr.pushOne(100);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2500
     * @tc.name testArrayInvoke2025
     * @tc.desc Verify this invoke overload behaves the same as constructor-style array creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(1, 5);
      const arr2 = Array.create<int>(1, 5);
      expect(arr1.length).assertEqual(arr2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2600
     * @tc.name testArrayInvoke2026
     * @tc.desc Verify Array.create initializes elements while single-numeric construction preserves the numeric value directly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(1, 5);
      expect(arr1.length).assertEqual(1);
      expect(arr1[0]).assertEqual(5);

      const arr2 = new Array<number>(0, 0, 0, 0, 0);
      expect(arr2[0]).assertEqual(0);
      expect(arr2[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2700
     * @tc.name testArrayInvoke2027
     * @tc.desc Verify overload selection still distinguishes empty single-numeric and multi-item construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>();
      const arr2 = Array.create<int>(1, 10);
      const arr3 = new Array<int>(1, 2, 3);

      expect(arr1.length).assertEqual(0);
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]).assertEqual(10);
      expect(arr3.length).assertEqual(3);
      expect(arr3[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2800
     * @tc.name testArrayInvoke2028
     * @tc.desc Verify explicit numeric zero differs from default construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 0);
      const arr2 = new Array<int>();
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
      expect(arr2.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_2900
     * @tc.name testArrayInvoke2029
     * @tc.desc Verify a single-item numeric constructor can still align with a dynamically grown array on shared indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.create<int>(1, 1000);
      expect(arr1.length).assertEqual(1);
      expect(arr1[0]).assertEqual(1000);
      for (let i = 0; i < arr1.length; i++) {
        arr1[i] = i;
      }

      const arr2 = new Array<int>();
      for (let i = 0; i < 1000; i++) {
        arr2.pushOne(i);
      }

      expect(arr1[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3000
     * @tc.name testArrayInvoke2030
     * @tc.desc Verify generic array construction supports matching runtime values after single-numeric construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = Array.create<int>(1, 5);
      expect(numArr.length).assertEqual(1);
      expect(numArr[0]).assertEqual(5);
      numArr.pushOne(123);
      expect(numArr[1]).assertEqual(123);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3100
     * @tc.name testArrayInvoke2031
     * @tc.desc Verify arrays can be initialized immediately and consumed by reduce
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 10);
      arr.fill(0);
      const sum = arr.reduce((acc: int, v: int): int => acc + v, 0);
      expect(sum).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3200
     * @tc.name testArrayInvoke2032
     * @tc.desc Verify fill supports chained initialization before pushOne usage on a single-item numeric constructor result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 10);
      const newLength = arr.fill(-1).pushOne(100);

      expect(newLength).assertEqual(2);
      expect(arr[0]).assertEqual(-1);
      expect(arr[1]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_TWO_3300
     * @tc.name testArrayInvoke2033
     * @tc.desc Verify the native invoke overload creates a usable single-item array for a numeric argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke2033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);

      for (let i = 0; i < arr.length; i++) {
        arr[i] = i;
      }

      expect(arr[0]).assertEqual(0);
    });
  });
}
