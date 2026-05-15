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

class Item012 {
  value: int;

  constructor(v: int) {
    this.value = v;
  }
}

interface Point013 {
  x: int;
  y: int;
}

class Item031 {
  value: int;
  name: string;

  constructor(v: int, n: string) {
    this.value = v;
    this.name = n;
  }
}

interface Point032 {
  x: int;
  y: int;
}

interface Config041 {
  name: string;
  value: int;
}

class Item045 {
  value: int;

  constructor(v: int) {
    this.value = v;
  }
}

class ComplexItem049 {
  data: int;

  constructor(d: int) {
    this.data = d;
  }
}

export default function ArrayInvoke3Test(): void {
  describe('ArrayInvoke3Test', (): void => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll((): void => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    });

    beforeEach(async (): Promise<void> => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    });

    afterEach((): void => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    });

    afterAll((): void => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0100
     * @tc.name testArrayInvoke001
     * @tc.desc Verify varargs overload supports zero and multiple item inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>();
      expect(arr1.length).assertEqual(0);

      const arr2 = new Array<string>('single');
      expect(arr2.length).assertEqual(1);

      const arr3 = new Array<int>(1, 2, 3);
      expect(arr3.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0200
     * @tc.name testArrayInvoke002
     * @tc.desc Verify varargs overload accepts element values of multiple basic types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>(1, 2, 3, 4, 5);
      expect(numArr.length).assertEqual(5);

      const strArr = new Array<string>('hello', 'world', '!');
      expect(strArr.length).assertEqual(3);

      const boolArr = new Array<boolean>(true, false, true);
      expect(boolArr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0300
     * @tc.name testArrayInvoke003
     * @tc.desc Verify varargs overload preserves zero values in the created array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 1, 0);
      expect(arr[0]).assertEqual(0);
      expect(arr[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0400
     * @tc.name testArrayInvoke004
     * @tc.desc Verify varargs overload preserves empty string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'a', '');
      expect(arr[0]).assertEqual('');
      expect(arr[2]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0500
     * @tc.name testArrayInvoke005
     * @tc.desc Verify varargs overload preserves false boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true, false);
      expect(arr[0]).assertFalse();
      expect(arr[2]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0600
     * @tc.name testArrayInvoke006
     * @tc.desc Verify varargs overload preserves negative number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(-100, -200, -300);
      expect(arr[0]).assertEqual(-100);
      expect(arr[2]).assertEqual(-300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0700
     * @tc.name testArrayInvoke007
     * @tc.desc Verify varargs overload preserves max and min number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const maxValue = Number.MAX_SAFE_INTEGER.toInt();
      const minValue = Number.MIN_SAFE_INTEGER.toInt();
      const arr = new Array<int>(maxValue, minValue);
      expect(arr[0]).assertEqual(maxValue);
      expect(arr[1]).assertEqual(minValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0800
     * @tc.name testArrayInvoke008
     * @tc.desc Verify varargs overload preserves null values in union arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(1, null, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_0900
     * @tc.name testArrayInvoke009
     * @tc.desc Verify varargs overload preserves undefined values in union arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, undefined, 3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1000
     * @tc.name testArrayInvoke010
     * @tc.desc Verify varargs overload preserves NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, NaN, 3);
      expect(arr[0]).assertEqual(1);
      expect(Number.isNaN(arr[1])).assertTrue();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1100
     * @tc.name testArrayInvoke011
     * @tc.desc Verify varargs overload preserves infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, Infinity, -Infinity);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(Infinity);
      expect(arr[2]).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1200
     * @tc.name testArrayInvoke012
     * @tc.desc Verify varargs overload accepts custom object values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item012>(
        new Item012(1),
        new Item012(2),
        new Item012(3)
      );
      expect(arr[0].value).assertEqual(1);
      expect(arr[2].value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1300
     * @tc.name testArrayInvoke013
     * @tc.desc Verify varargs overload accepts interface values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point013>(
        { x: 1, y: 2 },
        { x: 3, y: 4 },
        { x: 5, y: 6 }
      );
      expect(arr[0].x).assertEqual(1);
      expect(arr[2].y).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1400
     * @tc.name testArrayInvoke014
     * @tc.desc Verify varargs overload accepts nested array values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int[]>([1, 2], [3, 4], [5, 6]);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
      expect(arr[2][0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1500
     * @tc.name testArrayInvoke015
     * @tc.desc Verify varargs overload preserves script-like string inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('<script>alert(1)</script>', 'safe');
      expect(arr[0]).assertEqual('<script>alert(1)</script>');
      expect(arr[1]).assertEqual('safe');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1600
     * @tc.name testArrayInvoke016
     * @tc.desc Verify varargs overload preserves Unicode string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('你好', '世界', '🌍');
      expect(arr[0]).assertEqual('你好');
      expect(arr[1]).assertEqual('世界');
      expect(arr[2]).assertEqual('🌍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1700
     * @tc.name testArrayInvoke017
     * @tc.desc Verify varargs overload preserves zero-width space values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('visible', '\u200B', 'visible');
      expect(arr[1]).assertEqual('\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1800
     * @tc.name testArrayInvoke018
     * @tc.desc Verify varargs overload preserves extra long strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const longStr = 'a'.repeat(10000);
      const arr = new Array<string>(longStr);
      expect(arr[0].length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_1900
     * @tc.name testArrayInvoke019
     * @tc.desc Verify varargs overload supports construction without passing parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2000
     * @tc.name testArrayInvoke020
     * @tc.desc Verify omitting parameters is the runtime-safe way to represent an empty item list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2100
     * @tc.name testArrayInvoke021
     * @tc.desc Verify varargs overload returns an array containing all passed items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      expect(arr.length).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2200
     * @tc.name testArrayInvoke022
     * @tc.desc Verify argument count determines the returned array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('one');
      expect(arr1.length).assertEqual(1);

      const arr2 = new Array<int>(1, 2);
      expect(arr2.length).assertEqual(2);

      const arr3 = new Array<int>(1, 2, 3, 4, 5);
      expect(arr3.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2300
     * @tc.name testArrayInvoke023
     * @tc.desc Verify generic array construction returns proper array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>(1, 2, 3);
      const strArr = new Array<string>('a', 'b', 'c');
      const boolArr = new Array<boolean>(true, false);

      expect(numArr.length).assertEqual(3);
      expect(strArr.length).assertEqual(3);
      expect(boolArr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2400
     * @tc.name testArrayInvoke024
     * @tc.desc Verify single-parameter construction follows runtime overload behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strArr = new Array<string>('single');
      expect(strArr.length).assertEqual(1);
      expect(strArr[0]).assertEqual('single');

      const numArr = new Array<int>(42);
      expect(numArr.length).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2500
     * @tc.name testArrayInvoke025
     * @tc.desc Verify varargs overload accepts mixed values under a union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3, 'four');
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual('four');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2600
     * @tc.name testArrayInvoke026
     * @tc.desc Verify varargs overload supports arrays whose elements are all the same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 5, 5, 5, 5);
      expect(arr.length).assertEqual(5);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2700
     * @tc.name testArrayInvoke027
     * @tc.desc Verify varargs overload can initialize arrays from many values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25
      );
      expect(arr.length).assertEqual(25);
      expect(arr[0]).assertEqual(1);
      expect(arr[24]).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2800
     * @tc.name testArrayInvoke028
     * @tc.desc Verify varargs overload creates number arrays with the expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i]).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_2900
     * @tc.name testArrayInvoke029
     * @tc.desc Verify varargs overload creates string arrays with the expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('hello', 'world', '!');
      expect(arr[0]).assertEqual('hello');
      expect(arr[1]).assertEqual('world');
      expect(arr[2]).assertEqual('!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3000
     * @tc.name testArrayInvoke030
     * @tc.desc Verify varargs overload creates boolean arrays with the expected values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
      expect(arr[2]).assertTrue();
      expect(arr[3]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3100
     * @tc.name testArrayInvoke031
     * @tc.desc Verify varargs overload creates arrays of custom class instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item031>(
        new Item031(1, 'one'),
        new Item031(2, 'two'),
        new Item031(3, 'three')
      );

      expect(arr[0].value).assertEqual(1);
      expect(arr[1].name).assertEqual('two');
      expect(arr[2].value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3200
     * @tc.name testArrayInvoke032
     * @tc.desc Verify varargs overload creates arrays of interface values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Point032>(
        { x: 1, y: 2 },
        { x: 3, y: 4 },
        { x: 5, y: 6 }
      );

      expect(arr[0].x).assertEqual(1);
      expect(arr[1].y).assertEqual(4);
      expect(arr[2].x).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3300
     * @tc.name testArrayInvoke033
     * @tc.desc Verify varargs overload creates arrays under a union element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string>(1, 'two', 3, 'four', 5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('two');
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual('four');
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3400
     * @tc.name testArrayInvoke034
     * @tc.desc Verify varargs overload creates arrays of arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(
        new Array<int>(1, 2),
        new Array<int>(3, 4),
        new Array<int>(5, 6)
      );

      expect(arr.length).assertEqual(3);
      expect(arr[0][0]).assertEqual(1);
      expect(arr[1][1]).assertEqual(4);
      expect(arr[2][0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3500
     * @tc.name testArrayInvoke035
     * @tc.desc Verify varargs overload creates three-dimensional arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<Array<int>>>(
        new Array<Array<int>>(
          new Array<int>(1, 2),
          new Array<int>(3, 4)
        ),
        new Array<Array<int>>(
          new Array<int>(5, 6),
          new Array<int>(7, 8)
        )
      );

      expect(arr[0][0][0]).assertEqual(1);
      expect(arr[1][1][1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3600
     * @tc.name testArrayInvoke036
     * @tc.desc Verify varargs overload handles argument counts from zero to many
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr0 = new Array<int>();
      expect(arr0.length).assertEqual(0);

      const arr1 = new Array<string>('one');
      expect(arr1.length).assertEqual(1);

      const arr2 = new Array<int>(1, 2);
      expect(arr2.length).assertEqual(2);

      const arr5 = new Array<int>(1, 2, 3, 4, 5);
      expect(arr5.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3700
     * @tc.name testArrayInvoke037
     * @tc.desc Verify spread syntax can reuse existing array items as constructor inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<int>(1, 2, 3);
      const arr = new Array<int>(source[0], source[1], source[2], 4, 5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3800
     * @tc.name testArrayInvoke038
     * @tc.desc Verify spread syntax can be mixed with directly passed items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const part1 = new Array<int>(1, 2);
      const arr = new Array<int>(part1[0], part1[1], 3, 4, 5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[2]).assertEqual(3);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_3900
     * @tc.name testArrayInvoke039
     * @tc.desc Verify varargs overload suits initialization with known element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const weekDays = new Array<string>(
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
      );

      expect(weekDays.length).assertEqual(7);
      expect(weekDays[0]).assertEqual('Monday');
      expect(weekDays[6]).assertEqual('Sunday');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4000
     * @tc.name testArrayInvoke040
     * @tc.desc Verify varargs overload can quickly build test data sets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testData = new Array<int>(
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10
      );

      let sum = 0;
      testData.forEach((v: int): void => {
        sum += v;
      });
      expect(sum).assertEqual(55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4100
     * @tc.name testArrayInvoke041
     * @tc.desc Verify varargs overload can create configuration item arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const configs = new Array<Config041>(
        { name: 'config1', value: 100 },
        { name: 'config2', value: 200 },
        { name: 'config3', value: 300 }
      );

      expect(configs[0].name).assertEqual('config1');
      expect(configs[1].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4200
     * @tc.name testArrayInvoke042
     * @tc.desc Verify constructor arguments select the expected Array overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr0 = new Array<string>();
      expect(arr0.length).assertEqual(0);

      const arr1 = new Array<int>(5);
      expect(arr1.length).assertEqual(5);

      const arr2 = new Array<int>(1, 2, 3);
      expect(arr2.length).assertEqual(3);
      expect(arr2[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4300
     * @tc.name testArrayInvoke043
     * @tc.desc Verify explicit generic types influence single-parameter array behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strArr = new Array<string>('hello');
      expect(strArr.length).assertEqual(1);
      expect(strArr[0]).assertEqual('hello');

      const boolArr = new Array<boolean>(true);
      expect(boolArr.length).assertEqual(1);
      expect(boolArr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4400
     * @tc.name testArrayInvoke044
     * @tc.desc Verify compile-time type checks reject mismatched varargs element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>(1, 2, 3);
      const strArr = new Array<string>('a', 'b', 'c');

      // const wrongArr = new Array<number>(1, "string", 3);
      // const wrongArr2 = new Array<string>("a", 2, "c");

      expect(numArr.length).assertEqual(3);
      expect(strArr[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4500
     * @tc.name testArrayInvoke045
     * @tc.desc Verify all varargs items must conform to the declared generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>(1, 2, 3, 4, 5);

      const itemArr = new Array<Item045>(
        new Item045(1),
        new Item045(2),
        new Item045(3)
      );
      expect(numArr.length).assertEqual(5);
      expect(itemArr[1].value).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4600
     * @tc.name testArrayInvoke046
     * @tc.desc Verify a single number argument follows the length overload while other types stay as items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numArr = new Array<int>(5);
      expect(numArr.length).assertEqual(5);

      const strArr = new Array<string>('hello');
      expect(strArr.length).assertEqual(1);
      expect(strArr[0]).assertEqual('hello');

      const numArr2 = new Array<int>(1, 2, 3);
      expect(numArr2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4700
     * @tc.name testArrayInvoke047
     * @tc.desc Verify omitting all arguments is equivalent to default construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4800
     * @tc.name testArrayInvoke048
     * @tc.desc Verify varargs overload can accept many explicit initial values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(
        1, 2, 3, 4, 5, 6, 7, 8, 9, 10,
        11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
        21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
        31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50,
        51, 52, 53, 54, 55, 56, 57, 58, 59, 60,
        61, 62, 63, 64, 65, 66, 67, 68, 69, 70,
        71, 72, 73, 74, 75, 76, 77, 78, 79, 80,
        81, 82, 83, 84, 85, 86, 87, 88, 89, 90,
        91, 92, 93, 94, 95, 96, 97, 98, 99, 100
      );
      expect(arr.length).assertEqual(100);
      expect(arr[0]).assertEqual(1);
      expect(arr[99]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_4900
     * @tc.name testArrayInvoke049
     * @tc.desc Verify varargs overload supports constructing arrays of complex objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<ComplexItem049>(
        new ComplexItem049(1),
        new ComplexItem049(2),
        new ComplexItem049(3)
      );

      expect(arr.length).assertEqual(3);
      for (let i = 0; i < arr.length; i++) {
        expect(arr[i].data).assertEqual(i + 1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_5000
     * @tc.name testArrayInvoke050
     * @tc.desc Verify the native varargs overload creates usable array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('x', 'y', 'z');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('y');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_5100
     * @tc.name testArrayInvoke051
     * @tc.desc Verify varargs-style construction is functionally equivalent for item initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<string>('a', 'b', 'c');

      expect(arr1.length).assertEqual(3);
      expect(arr1[0]).assertEqual('a');
      expect(arr1[2]).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INVOKE_THREE_5200
     * @tc.name testArrayInvoke052
     * @tc.desc Verify arrays created by the varargs overload support immediate chained operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayInvoke052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4, 5);

      const filtered = arr.filter((v: int): boolean => v > 2);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0]).assertEqual(3);

      const mapped = arr.map((v: int): int => v * 2);
      expect(mapped[0]).assertEqual(2);
      expect(mapped[4]).assertEqual(10);
    });
  });
}
