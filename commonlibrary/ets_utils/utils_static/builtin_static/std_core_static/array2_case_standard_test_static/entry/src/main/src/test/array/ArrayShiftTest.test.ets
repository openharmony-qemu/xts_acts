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

class Person005 {
  name: string = '';
  age: number = 0;
}

class ShiftRefCase006 {
  value: number = 0;
}

function createLargeNumberArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.push(i);
  }
  return arr;
}

function createRangeArray(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function shiftAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  const removed = arr.shift();
  if (removed == undefined) {
    return 'undefined|' + arr.length.toString();
  }
  return removed.toString() + '|' + arr.length.toString();
}

export default function ArrayShiftTest(): void {
  describe('ArrayShiftTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_0100
     * @tc.name testArrayShift001
     * @tc.desc Verify shift accepts no arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.shift();
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_0200
     * @tc.name testArrayShift002
     * @tc.desc Verify shift removes the first element with its standard no-argument call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.shift();
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_0300
     * @tc.name testArrayShift003
     * @tc.desc Verify shift removes and returns the first numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.shift();
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_0400
     * @tc.name testArrayShift004
     * @tc.desc Verify shift returns string elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.shift();
      expect(result).assertEqual('a');
      expect(arr[0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_0500
     * @tc.name testArrayShift005
     * @tc.desc Verify shift returns object elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Person005>();
      let person = new Person005();
      person.name = 'Alice';
      person.age = 25;
      arr.push(person);
      let result = arr.shift();
      if (result === null || result === undefined) {
        expect().assertFail();
        return;
      }
      const shiftedPerson = result as Person005;
      expect(shiftedPerson.name).assertEqual('Alice');
      expect(shiftedPerson.age).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_0600
     * @tc.name testArrayShift006
     * @tc.desc Verify shift returns null when the first element is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>(null, 2, 3);
      let result = arr.shift();
      expect(result).assertNull();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_0700
     * @tc.name testArrayShift007
     * @tc.desc Verify shift returns undefined when the first element is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(undefined, 2, 3);
      let result = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_0800
     * @tc.name testArrayShift008
     * @tc.desc Verify shift returns zero correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(0, 1, 2);
      let result = arr.shift();
      expect(result).assertEqual(0);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_0900
     * @tc.name testArrayShift009
     * @tc.desc Verify shift returns false correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(false, true);
      let result = arr.shift();
      expect(result).assertFalse();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1000
     * @tc.name testArrayShift010
     * @tc.desc Verify shift returns empty strings correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('', 'b', 'c');
      let result = arr.shift();
      expect(result).assertEqual('');
      expect(arr[0]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1100
     * @tc.name testArrayShift011
     * @tc.desc Verify shift on an array with explicit undefined entries reindexes values and preserves undefined entries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[1] = 1;
      arr[3] = 3;
      let result = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertUndefined();
      expect(arr[2]).assertEqual(3);
      expect(arr.includes(undefined)).assertTrue();
      expect(arr.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1200
     * @tc.name testArrayShift012
     * @tc.desc Verify the return value can be annotated as element type or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result: number | undefined = arr.shift();
      expect(typeof result).assertEqual('number');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1300
     * @tc.name testArrayShift013
     * @tc.desc Verify type inference produces a value usable with number checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.shift();
      expect(result).assertEqual(1);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1400
     * @tc.name testArrayShift014
     * @tc.desc Verify single-element arrays become empty after shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 42);
      let result = arr.shift();
      expect(result).assertEqual(42);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1500
     * @tc.name testArrayShift015
     * @tc.desc Verify large arrays can remove the first element correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeNumberArray(10000);
      let result = arr.shift();
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(9999);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1600
     * @tc.name testArrayShift016
     * @tc.desc Verify shift does not throw for empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.shift();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1700
     * @tc.name testArrayShift017
     * @tc.desc Verify shifting a mutable copy does not change the readonly source data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: ReadonlyArray<number> = [1, 2, 3];
      let arr = Array.from<number>(source);
      let result = arr.shift();
      expect(result).assertEqual(1);
      expect(source.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1800
     * @tc.name testArrayShift018
     * @tc.desc Verify shift is an array instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(typeof arr.shift).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_1900
     * @tc.name testArrayShift019
     * @tc.desc Verify shift executes synchronously and changes length immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let beforeLength = arr.length;
      let result = arr.shift();
      let afterLength = arr.length;
      expect(result).assertEqual(1);
      expect(afterLength).assertEqual(beforeLength - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2000
     * @tc.name testArrayShift020
     * @tc.desc Verify shift decreases the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalLength = arr.length;
      arr.shift();
      expect(arr.length).assertEqual(originalLength - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2100
     * @tc.name testArrayShift021
     * @tc.desc Verify remaining elements shift forward after removing the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shift();
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(4);
      expect(arr[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2200
     * @tc.name testArrayShift022
     * @tc.desc Verify shift mutates the original array without creating a new one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalRef = arr;
      arr.shift();
      expect(arr).assertEqual(originalRef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2300
     * @tc.name testArrayShift023
     * @tc.desc Verify empty arrays remain empty after shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.shift();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2400
     * @tc.name testArrayShift024
     * @tc.desc Verify repeated shift calls can empty the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(arr.shift()).assertEqual(1);
      expect(arr.shift()).assertEqual(2);
      expect(arr.shift()).assertEqual(3);
      expect(arr.shift()).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2500
     * @tc.name testArrayShift025
     * @tc.desc Verify shift works for char arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>();
      arr.push(c'A', c'B', c'C');
      let result = arr.shift();
      expect(result).assertEqual(c'A');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2600
     * @tc.name testArrayShift026
     * @tc.desc Verify shift works for boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false, true);
      let result = arr.shift();
      expect(result).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2700
     * @tc.name testArrayShift027
     * @tc.desc Verify shift works for bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>(1n, 2n, 3n);
      let result = arr.shift();
      expect(result).assertEqual(1n);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2800
     * @tc.name testArrayShift028
     * @tc.desc Verify shift updates boundaries correctly on large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeNumberArray(10000);
      let result = arr.shift();
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(9999);
      expect(arr[0]).assertEqual(1);
      expect(arr[arr.length - 1]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_2900
     * @tc.name testArrayShift029
     * @tc.desc Verify shift works for union-typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string | number>(1, 'two', 3);
      let result = arr.shift();
      expect(result).assertEqual(1);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3000
     * @tc.name testArrayShift030
     * @tc.desc Verify shift works on heterogeneous arrays with a broad union element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Object | string | number | boolean>(1, 'two', true);
      let result = arr.shift();
      expect(result).assertEqual(1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3100
     * @tc.name testArrayShift031
     * @tc.desc Verify shift on a numeric array returns a numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.shift();
      expect(typeof result).assertEqual('number');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3200
     * @tc.name testArrayShift032
     * @tc.desc Verify shift during traversal changes the remaining iteration data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      for (let i: int = 0; i < arr.length; i++) {
        if (arr[i] === 2) {
          arr.shift();
          break;
        }
      }
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(2);
      expect(arr[3]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3300
     * @tc.name testArrayShift033
     * @tc.desc Verify shift can return NaN while exposing the next numeric head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.NaN, 1, 2);
      const value = arr.shift();
      if (value === undefined) {
        expect().assertFail();
        return;
      }
      expect(value).assertNaN();
      expect(arr[0]).assertEqual(1);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3400
     * @tc.name testArrayShift034
     * @tc.desc Verify shift can remove positive Infinity and expose negative Infinity next
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY, -Double.POSITIVE_INFINITY, 0);
      const value = arr.shift();
      expect(value).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(-Double.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3500
     * @tc.name testArrayShift035
     * @tc.desc Verify shift preserves the sign of a negative zero boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-0, 1);
      const value = arr.shift();
      if (value === undefined) {
        expect().assertFail();
        return;
      }
      expect(1.0 / value).assertEqual(-Infinity);
      expect(arr[0]).assertEqual(1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3600
     * @tc.name testArrayShift036
     * @tc.desc Verify shift removes a head value after fill rewrites the prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.fill(9, 0, 2);
      const value = arr.shift();
      expect(value).assertEqual(9);
      expect(arr.toString()).assertEqual('9,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3700
     * @tc.name testArrayShift037
     * @tc.desc Verify shift removes the copied head value after copyWithin reorders the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.copyWithin(0, 2, 4);
      const value = arr.shift();
      expect(value).assertEqual(3);
      expect(arr.toString()).assertEqual('4,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3800
     * @tc.name testArrayShift038
     * @tc.desc Verify shift removes the maximum value after a descending numeric sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2);
      arr.sort((left: number, right: number): int => {
        if (left > right) {
          return -1;
        }
        if (left < right) {
          return 1;
        }
        return 0;
      });
      const value = arr.shift();
      expect(value).assertEqual(3);
      expect(arr.toString()).assertEqual('2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_3900
     * @tc.name testArrayShift039
     * @tc.desc Verify shift returns the first nested array reference without cloning it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Array<number>(1, 2);
      const second = Array.create<number>(1, 3);
      const arr = new Array<Array<number>>(first, second);
      const value = arr.shift();
      if (value === undefined) {
        expect().assertFail();
        return;
      }
      expect(value).assertEqual(first);
      value.pushOne(9);
      expect(first.toString()).assertEqual('1,2,9');
      expect(arr[0]).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4000
     * @tc.name testArrayShift040
     * @tc.desc Verify shift removes only one entry when the same object reference appears twice at the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new ShiftRefCase006();
      shared.value = 7;
      const tail = new ShiftRefCase006();
      tail.value = 9;
      const arr = new Array<ShiftRefCase006>(shared, shared, tail);
      const value = arr.shift();
      expect(value).assertEqual(shared);
      expect(arr[0]).assertEqual(shared);
      expect(arr[1]).assertEqual(tail);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4100
     * @tc.name testArrayShift041
     * @tc.desc Verify mutating the shifted object does not affect the next distinct object instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Person005();
      first.name = 'Alice';
      const second = new Person005();
      second.name = 'Bob';
      const arr = new Array<Person005>(first, second);
      const value = arr.shift();
      if (value === undefined) {
        expect().assertFail();
        return;
      }
      expect(value).assertEqual(first);
      value.name = 'Changed';
      expect(first.name).assertEqual('Changed');
      expect(arr[0].name).assertEqual('Bob');
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4200
     * @tc.name testArrayShift042
     * @tc.desc Verify shift can remove an object boundary from a union-typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person = new Person005();
      person.name = 'Lead';
      const arr = new Array<Person005 | string | number>(person, 'next', 3);
      const value = arr.shift();
      expect(value).assertEqual(person);
      expect(arr[0]).assertEqual('next');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4300
     * @tc.name testArrayShift043
     * @tc.desc Verify shift preserves surrounding whitespace in the removed string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('  lead', 'trail  ');
      const value = arr.shift();
      expect(value).assertEqual('  lead');
      expect(arr[0]).assertEqual('trail  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4400
     * @tc.name testArrayShift044
     * @tc.desc Verify shift removes a negative bigint head and exposes the remaining bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(-1n, 0n, 1n);
      const value = arr.shift();
      expect(value).assertEqual(-1n);
      expect(arr[0]).assertEqual(0n);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4500
     * @tc.name testArrayShift045
     * @tc.desc Verify shift reindexes an array with explicit undefined entries while keeping a distant tail value present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      arr[0] = 10;
      arr[4] = 50;
      const value = arr.shift();
      expect(value).assertEqual(10);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertUndefined();
      expect(arr[3]).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4600
     * @tc.name testArrayShift046
     * @tc.desc Verify shift removes a head value inserted at index zero by splice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      arr.splice(0, 0, 1);
      const value = arr.shift();
      expect(value).assertEqual(1);
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4700
     * @tc.name testArrayShift047
     * @tc.desc Verify shift on a toSorted copy leaves the unsorted source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(4, 1, 3, 2);
      const sorted = source.toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const value = sorted.shift();
      expect(value).assertEqual(1);
      expect(sorted.toString()).assertEqual('2,3,4');
      expect(source.toString()).assertEqual('4,1,3,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4800
     * @tc.name testArrayShift048
     * @tc.desc Verify shift on a mapped copy does not change the original source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3);
      const mapped = source.map((value: number): number => value * 10);
      const value = mapped.shift();
      expect(value).assertEqual(10);
      expect(mapped.toString()).assertEqual('20,30');
      expect(source.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_4900
     * @tc.name testArrayShift049
     * @tc.desc Verify shift on an Array.from copy of a typed array leaves the typed source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const typed = new Uint8Array([5, 6, 7]);
      const arr = Array.from<number>(typed);
      const value = arr.shift();
      expect(value).assertEqual(5);
      expect(arr.toString()).assertEqual('6,7');
      expect(typed[0]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5000
     * @tc.name testArrayShift050
     * @tc.desc Verify shift on concatenated nested arrays returns the first nested reference from the left input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const left = Array.create<Array<number>>(1, Array.create<number>(1, 1));
      const right = Array.create<Array<number>>(1, new Array<number>(2, 3));
      const merged = left.concat(right);
      const value = merged.shift();
      if (value === undefined) {
        expect().assertFail();
        return;
      }
      expect(value).assertEqual(left[0]);
      expect(merged[0]).assertEqual(right[0]);
      expect(right[0].toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5100
     * @tc.name testArrayShift051
     * @tc.desc Verify shift still works after manual length truncation followed by appending a new tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.length = 2;
      arr.pushOne(9);
      const value = arr.shift();
      expect(value).assertEqual(1);
      expect(arr.toString()).assertEqual('2,9');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5200
     * @tc.name testArrayShift052
     * @tc.desc Verify shift returns undefined for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const value = arr.shift();
      expect(value).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5300
     * @tc.name testArrayShift053
     * @tc.desc Verify shift after push removes the original head and preserves the appended tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      arr.push(4, 5);
      const value = arr.shift();
      expect(value).assertEqual(2);
      expect(arr[0]).assertEqual(3);
      expect(arr[arr.length - 1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5400
     * @tc.name testArrayShift054
     * @tc.desc Verify shift removes prepended values in their inserted order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      expect(arr.shift()).assertEqual(1);
      expect(arr.shift()).assertEqual(2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5500
     * @tc.name testArrayShift055
     * @tc.desc Verify shifting a slice result does not change the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = createRangeArray(6);
      const window = source.slice(2, 5);
      expect(window.shift()).assertEqual(2);
      expect(window[0]).assertEqual(3);
      expect(source[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5600
     * @tc.name testArrayShift056
     * @tc.desc Verify shift after reverse removes the former tail value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      const value = arr.shift();
      expect(value).assertEqual(4);
      expect(arr[0]).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5700
     * @tc.name testArrayShift057
     * @tc.desc Verify shift after sort removes the sorted minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(30, 10, 20);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const value = arr.shift();
      expect(value).assertEqual(10);
      expect(arr[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5800
     * @tc.name testArrayShift058
     * @tc.desc Verify shift after splice removes the newly inserted head value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      arr.splice(0, 1, 5, 6);
      const value = arr.shift();
      expect(value).assertEqual(5);
      expect(arr[0]).assertEqual(6);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_5900
     * @tc.name testArrayShift059
     * @tc.desc Verify shift removes head value 2 from numeric triple 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const value = arr.shift();
      expect(value).assertEqual(2);
      expect(arr.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6000
     * @tc.name testArrayShift060
     * @tc.desc Verify shift removes head value 3 from numeric triple 3, 4, 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5);
      const value = arr.shift();
      expect(value).assertEqual(3);
      expect(arr.toString()).assertEqual('4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6100
     * @tc.name testArrayShift061
     * @tc.desc Verify shift removes the expected element from a three-number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const value = arr.shift();
      expect(value).assertEqual(1);
      expect(arr.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6200
     * @tc.name testArrayShift062
     * @tc.desc Verify shift empties a single-element number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 99);
      expect(arr.shift()).assertEqual(99);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6300
     * @tc.name testArrayShift063
     * @tc.desc Verify shift returns the boundary element from a string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.shift()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6400
     * @tc.name testArrayShift064
     * @tc.desc Verify shift returns the boundary element from a boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      expect(arr.shift()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6500
     * @tc.name testArrayShift065
     * @tc.desc Verify shift returns the boundary element from a bigint array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const value = arr.shift();
      if (value === undefined) {
        expect().assertFail();
        return;
      }
      expect(value.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6600
     * @tc.name testArrayShift066
     * @tc.desc Verify shift preserves object references when removing the boundary object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ShiftRefCase006();
      const second = new ShiftRefCase006();
      const arr = new Array<ShiftRefCase006>(first, second);
      const value = arr.shift();
      expect(value).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6700
     * @tc.name testArrayShift067
     * @tc.desc Verify shift returns null when the boundary element is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null, 1);
      expect(arr.shift()).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6800
     * @tc.name testArrayShift068
     * @tc.desc Verify shift returns undefined when the boundary element is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 1);
      expect(arr.shift()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_6900
     * @tc.name testArrayShift069
     * @tc.desc Verify shift returns zero when zero is the current head value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1);
      expect(arr.shift()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7000
     * @tc.name testArrayShift070
     * @tc.desc Verify shift works after push appends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      expect(arr.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7100
     * @tc.name testArrayShift071
     * @tc.desc Verify shift works after unshift prepends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      expect(arr.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7200
     * @tc.name testArrayShift072
     * @tc.desc Verify shift works after reverse changes order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      expect(arr.shift()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7300
     * @tc.name testArrayShift073
     * @tc.desc Verify shift works after sort orders numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      expect(arr.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7400
     * @tc.name testArrayShift074
     * @tc.desc Verify shift works after splice inserts middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 8, 9);
      expect(arr.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7500
     * @tc.name testArrayShift075
     * @tc.desc Verify shift after shrinkTo walks through only the retained prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      expect(arr.shift()).assertEqual(1);
      expect(arr.shift()).assertEqual(2);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7600
     * @tc.name testArrayShift076
     * @tc.desc Verify shift works on a slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 4);
      expect(arr.shift()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7700
     * @tc.name testArrayShift077
     * @tc.desc Verify shift works on a filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).filter((value: number): boolean => value >= 2);
      expect(arr.shift()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7800
     * @tc.name testArrayShift078
     * @tc.desc Verify shift works on a concat result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      expect(arr.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_7900
     * @tc.name testArrayShift079
     * @tc.desc Verify shift works on a toReversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      expect(arr.shift()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8000
     * @tc.name testArrayShift080
     * @tc.desc Verify shift works on a toSpliced copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 7, 8);
      expect(arr.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8100
     * @tc.name testArrayShift081
     * @tc.desc Verify shift works on a with replacement copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 9);
      expect(arr.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8200
     * @tc.name testArrayShift082
     * @tc.desc Verify shift updates length and exposes the next head after one removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      expect(arr.shift()).assertEqual(1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8300
     * @tc.name testArrayShift083
     * @tc.desc Verify shift can be called twice in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shift();
      const second = arr.shift();
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8400
     * @tc.name testArrayShift084
     * @tc.desc Verify shift leaves the remaining array searchable with indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shift();
      expect(arr.indexOf(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8500
     * @tc.name testArrayShift085
     * @tc.desc Verify shift leaves the remaining array joinable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.shift();
      expect(arr.join(',')).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8600
     * @tc.name testArrayShift086
     * @tc.desc Verify shift works on arrays created by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5, 6);
      expect(arr.shift()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8700
     * @tc.name testArrayShift087
     * @tc.desc Verify shift works on arrays created by Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6));
      expect(arr.shift()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8800
     * @tc.name testArrayShift088
     * @tc.desc Verify shift works on a large generated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 12; i++) {
        arr.pushOne(i);
      }
      expect(arr.shift()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_8900
     * @tc.name testArrayShift089
     * @tc.desc Verify shift preserves duplicate values remaining after boundary removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2);
      arr.shift();
      expect(arr.toString()).assertEqual('2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_9000
     * @tc.name testArrayShift090
     * @tc.desc Verify shift removes a false boundary while keeping the next boolean head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true, false);
      expect(arr.shift()).assertEqual(false);
      expect(arr[0]).assertEqual(true);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_9100
     * @tc.name testArrayShift091
     * @tc.desc Verify shift can continue after clearing length and rebuilding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      expect(arr.shift()).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_9200
     * @tc.name testArrayShift092
     * @tc.desc Verify shift can remove values after shrinkTo followed by pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      arr.pushOne(9);
      expect(arr.shift()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_9300
     * @tc.name testArrayShift093
     * @tc.desc Verify shift can remove values after reverse and push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      arr.push(4);
      expect(arr.shift()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_9400
     * @tc.name testArrayShift094
     * @tc.desc Verify shift does not change array identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const same = arr;
      arr.shift();
      expect(arr).assertEqual(same);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_9500
     * @tc.name testArrayShift095
     * @tc.desc Verify shift leaves the original array reusable for a later unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      expect(arr.shift()).assertEqual(1);
      arr.unshift(9);
      expect(arr.shift()).assertEqual(9);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_9600
     * @tc.name testArrayShift096
     * @tc.desc Verify shift works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(shiftAnyNumberArray(anyValue)).assertEqual('1|2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_SHIFT_9700
     * @tc.name testArrayShift097
     * @tc.desc Verify shift supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayShift097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const removed = anyArr.shift();
      expect(removed == 1).assertTrue();
      expect(anyArr.toString()).assertEqual('two,true');
    });

  });
}

