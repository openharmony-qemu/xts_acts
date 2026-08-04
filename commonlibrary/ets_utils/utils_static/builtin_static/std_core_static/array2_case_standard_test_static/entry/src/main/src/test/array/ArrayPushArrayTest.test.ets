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

class Person009 {
  name: string = '';
  age: number = 0;
}

class RefItem031 {
  value: number = 0;
}

class Payload036 {
  key: string = '';
}

function createPushArrayPerson(name: string, age: number): Person009 {
  const person = new Person009();
  person.name = name;
  person.age = age;
  return person;
}

enum Color040 {
  Red,
  Green,
  Blue
}

function createLargeNumberArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function pushArrayOnAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  arr.pushArray(3, 4);
  return arr.toString() + '|' + arr.length.toString();
}

export default function ArrayPushArrayTest(): void {
  describe('ArrayPushArrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_0100
     * @tc.name testArrayPushArray001
     * @tc.desc Verify pushArray accepts a single argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      let result = arr.pushArray('A');
      expect(result).assertEqual(1);
      expect(arr[0]).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_0200
     * @tc.name testArrayPushArray002
     * @tc.desc Verify pushArray accepts multiple arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      let result = arr.pushArray('A', 'B', 'C');
      expect(result).assertEqual(3);
      expect(arr[0]).assertEqual('A');
      expect(arr[1]).assertEqual('B');
      expect(arr[2]).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_0300
     * @tc.name testArrayPushArray003
     * @tc.desc Verify pushArray without arguments returns the current length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.pushArray();
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_0400
     * @tc.name testArrayPushArray004
     * @tc.desc Verify spread arguments can be forwarded into pushArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let source = new Array<number>(10, 20, 30);
      arr.pushArray(...source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_0500
     * @tc.name testArrayPushArray005
     * @tc.desc Verify direct arguments and spread arguments can be mixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let part1 = new Array<number>(10, 20);
      let part2 = new Array<number>(50, 60);
      arr.pushArray(...part1, 30, 40, ...part2);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
      expect(arr[5]).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_0600
     * @tc.name testArrayPushArray006
     * @tc.desc Verify pushArray supports number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushArray(100, -50, 0);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_0700
     * @tc.name testArrayPushArray007
     * @tc.desc Verify pushArray supports string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      arr.pushArray('hello', '', 'world');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_0800
     * @tc.name testArrayPushArray008
     * @tc.desc Verify pushArray supports boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>();
      arr.pushArray(true, false, true);
      expect(arr.length).assertEqual(3);
      expect(arr[1] === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_0900
     * @tc.name testArrayPushArray009
     * @tc.desc Verify pushArray supports object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Person009>();
      let p1 = new Person009();
      p1.name = 'Alice';
      p1.age = 25;
      let p2 = new Person009();
      p2.name = 'Bob';
      p2.age = 30;
      arr.pushArray(p1, p2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1000
     * @tc.name testArrayPushArray010
     * @tc.desc Verify pushArray supports char elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>();
      arr.pushArray(c'A', c'\n', c'\x7F');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(c'\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1100
     * @tc.name testArrayPushArray011
     * @tc.desc Verify pushArray supports union typed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string | number>();
      arr.pushArray(10, 'hello', 20, 'world');
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1200
     * @tc.name testArrayPushArray012
     * @tc.desc Verify pushArray supports null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>();
      arr.pushArray(null, 1, null);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertNull();
      expect(arr[2]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1300
     * @tc.name testArrayPushArray013
     * @tc.desc Verify pushArray supports undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>();
      arr.pushArray(undefined, 1, undefined);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertUndefined();
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1400
     * @tc.name testArrayPushArray014
     * @tc.desc Verify pushArray supports NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushArray(Double.NaN, 1, Double.NaN);
      expect(Number.isNaN(arr[0])).assertTrue();
      expect(Number.isNaN(arr[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1500
     * @tc.name testArrayPushArray015
     * @tc.desc Verify pushArray supports infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushArray(Double.POSITIVE_INFINITY, -Double.POSITIVE_INFINITY, 100);
      expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr[1]).assertEqual(-Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1600
     * @tc.name testArrayPushArray016
     * @tc.desc Verify pushArray returns the new array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b');
      let result = arr.pushArray('C', 'D');
      expect(result).assertEqual(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1700
     * @tc.name testArrayPushArray017
     * @tc.desc Verify pushArray returns the accumulated length after many values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pushArray(1, 2, 3, 4, 5);
      expect(result).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1800
     * @tc.name testArrayPushArray018
     * @tc.desc Verify pushArray can append multiple values to an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pushArray(100, 200);
      expect(result).assertEqual(2);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_1900
     * @tc.name testArrayPushArray019
     * @tc.desc Verify the pushArray return value behaves as an integer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      let result = arr.pushArray('test');
      expect(typeof result).assertEqual('int');
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2000
     * @tc.name testArrayPushArray020
     * @tc.desc Verify pushArray appends multiple numeric values to an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pushArray(1, 2);
      expect(result).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2100
     * @tc.name testArrayPushArray021
     * @tc.desc Verify a mutable copy created from readonly data can still use pushArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: ReadonlyArray<number> = [1, 2, 3];
      let arr = Array.from<number>(source);
      let result = arr.pushArray(4, 5);
      expect(result).assertEqual(5);
      expect(source.length).assertEqual(3);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2200
     * @tc.name testArrayPushArray022
     * @tc.desc Verify pushArray increases the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      let originalLength = arr.length;
      arr.pushArray(3, 4);
      expect(arr.length).assertEqual(originalLength + 2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2300
     * @tc.name testArrayPushArray023
     * @tc.desc Verify pushArray appends values to the end in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b');
      arr.pushArray('c', 'd');
      expect(arr[2]).assertEqual('c');
      expect(arr[3]).assertEqual('d');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2400
     * @tc.name testArrayPushArray024
     * @tc.desc Verify pushArray keeps the original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      let originalRef = arr;
      arr.pushArray(3, 4);
      expect(arr === originalRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2500
     * @tc.name testArrayPushArray025
     * @tc.desc Verify pushArray preserves existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      arr.pushArray(3, 4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2600
     * @tc.name testArrayPushArray026
     * @tc.desc Verify pushArray works on empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushArray(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2700
     * @tc.name testArrayPushArray027
     * @tc.desc Verify pushArray can be called repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushArray(1, 2);
      arr.pushArray(3, 4);
      arr.pushArray(5);
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2800
     * @tc.name testArrayPushArray028
     * @tc.desc Verify pushArray handles large element collections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let largeArray = createLargeNumberArray(10000);
      arr.pushArray(...largeArray);
      expect(arr.length).assertEqual(10000);
      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_2900
     * @tc.name testArrayPushArray029
     * @tc.desc Verify pushArray is the multi-argument counterpart of push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>();
      let arr2 = new Array<number>();
      arr1.push(1, 2, 3);
      arr2.pushArray(1, 2, 3);
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(3);
      expect(arr1.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3000
     * @tc.name testArrayPushArray030
     * @tc.desc Verify pushOne and pushArray serve single and multiple value scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>();
      let arr2 = new Array<number>();
      arr1.pushOne(10);
      arr2.pushArray(10, 20);
      expect(arr1.length).assertEqual(1);
      expect(arr2.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3100
     * @tc.name testArrayPushArray031
     * @tc.desc Verify pushArray preserves object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<RefItem031>();
      let item1 = new RefItem031();
      item1.value = 100;
      let item2 = new RefItem031();
      item2.value = 200;
      arr.pushArray(item1, item2);
      item1.value = 300;
      expect(arr[0].value).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3200
     * @tc.name testArrayPushArray032
     * @tc.desc Verify spreading an empty array adds no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      let empty = new Array<number>();
      arr.pushArray(...empty);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3300
     * @tc.name testArrayPushArray033
     * @tc.desc Verify repeated pushArray calls preserve element order across appends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      for (let i: int = 0; i < 100; i++) {
        arr.pushArray(i, i + 1, i + 2, i + 3, i + 4);
      }
      expect(arr.length).assertEqual(500);
      expect(arr.slice(0, 5).toString()).assertEqual('0,1,2,3,4');
      expect(arr.slice(250, 255).toString()).assertEqual('50,51,52,53,54');
      expect(arr.slice(495, 500).toString()).assertEqual('99,100,101,102,103');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3400
     * @tc.name testArrayPushArray034
     * @tc.desc Verify pushArray preserves existing string elements after valid string appends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      arr.pushArray('a', 'b');
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3500
     * @tc.name testArrayPushArray035
     * @tc.desc Verify heterogeneous values can be appended with a broad union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Object | string | number | boolean>();
      let payload = new Payload036();
      payload.key = 'value';
      arr.pushArray(1, 'string', true, payload);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3600
     * @tc.name testArrayPushArray036
     * @tc.desc Verify pushArray works after extendTo on arrays with undefined fill values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, 2, 3);
      arr.extendTo(10, undefined);
      expect(arr.length).assertEqual(10);
      arr.pushArray(100, 200);
      expect(arr.length).assertEqual(12);
      expect(arr[10]).assertEqual(100);
      expect(arr[11]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3700
     * @tc.name testArrayPushArray037
     * @tc.desc Verify pushArray works after shrinkTo shortens the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      arr.pushArray(100, 200, 300);
      expect(arr.length).assertEqual(5);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3800
     * @tc.name testArrayPushArray038
     * @tc.desc Verify pushArray supports bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>();
      arr.pushArray(1n, 2n, 9007199254740991n);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_3900
     * @tc.name testArrayPushArray039
     * @tc.desc Verify pushArray supports enum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Color040>();
      arr.pushArray(Color040.Red, Color040.Green, Color040.Blue);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(Color040.Green);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4000
     * @tc.name testArrayPushArray040
     * @tc.desc Verify pushArray updates length consistently across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushArray(1, 2, 3);
      expect(arr.length).assertEqual(3);
      arr.pushArray(4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4100
     * @tc.name testArrayPushArray041
     * @tc.desc Verify new elements can be accessed by index after pushArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushArray(10, 20, 30);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4200
     * @tc.name testArrayPushArray042
     * @tc.desc Verify pushArray mutates the original array while concat returns a new one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2);
      let arr2 = new Array<number>(1, 2);
      let newLength = arr1.pushArray(3, 4);
      expect(newLength).assertEqual(4);
      expect(arr1.length).assertEqual(4);

      let arr4 = arr2.concat(new Array<number>(3, 4));
      expect(arr2.length).assertEqual(2);
      expect(arr4.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4300
     * @tc.name testArrayPushArray043
     * @tc.desc Verify pushArray supports numeric boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushArray(Number.MAX_VALUE, Number.MIN_VALUE);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4400
     * @tc.name testArrayPushArray044
     * @tc.desc Verify pushArray supports representative string boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      arr.pushArray('', '\u0000', 'very-long-string-value');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4500
     * @tc.name testArrayPushArray045
     * @tc.desc Verify pushArray without arguments does not change array contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.pushArray();
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4600
     * @tc.name testArrayPushArray046
     * @tc.desc Verify nested arrays can be flattened into pushArray arguments with spread
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let nested = [[1, 2], [3, 4], [5, 6]];
      arr.pushArray(...nested[0], ...nested[1], ...nested[2]);
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(1);
      expect(arr[5]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4700
     * @tc.name testArrayPushArray047
     * @tc.desc Verify pushArray can merge multiple arrays with spread arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let arr1 = new Array<number>(1, 2, 3);
      let arr2 = new Array<number>(4, 5, 6);
      let arr3 = new Array<number>(7, 8, 9);
      arr.pushArray(...arr1, ...arr2, ...arr3);
      expect(arr.length).assertEqual(9);
      expect(arr[8]).assertEqual(9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4800
     * @tc.name testArrayPushArray048
     * @tc.desc Verify an array argument is stored as a single element without flattening
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(1, 2);
      const arr = new Array<Array<number>>();
      const result = arr.pushArray(inner);
      expect(result).assertEqual(1);
      expect(arr[0] === inner).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_4900
     * @tc.name testArrayPushArray049
     * @tc.desc Verify a stored nested array reference remains shared after later mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = Array.create<number>(1, 1);
      const arr = new Array<Array<number>>();
      arr.pushArray(inner);
      inner.pushOne(2);
      expect(arr[0][1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5000
     * @tc.name testArrayPushArray050
     * @tc.desc Verify pushArray can append explicit undefined and null values in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined | null>();
      const result = arr.pushArray(undefined, null);
      expect(result).assertEqual(2);
      expect(arr[0]).assertUndefined();
      expect(arr[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5100
     * @tc.name testArrayPushArray051
     * @tc.desc Verify pushArray can store a self reference without expanding it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Object>();
      const self = arr as Object;
      const result = arr.pushArray(self);
      expect(result).assertEqual(1);
      expect(arr[0] === self).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5200
     * @tc.name testArrayPushArray052
     * @tc.desc Verify duplicate object references remain identical after one pushArray call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new RefItem031();
      const arr = new Array<RefItem031>();
      const result = arr.pushArray(ref, ref);
      expect(result).assertEqual(2);
      expect(arr[0] === arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5300
     * @tc.name testArrayPushArray053
     * @tc.desc Verify duplicate nested array references remain identical after one pushArray call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inner = new Array<number>(3, 4);
      const arr = new Array<Array<number>>();
      const result = arr.pushArray(inner, inner);
      expect(result).assertEqual(2);
      expect(arr[0] === arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5400
     * @tc.name testArrayPushArray054
     * @tc.desc Verify pushArray can append function values that remain callable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = (): int => 1;
      const second = (): int => 2;
      const arr = new Array<() => int>();
      const result = arr.pushArray(first, second);
      expect(result).assertEqual(2);
      expect(arr[1]()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5500
     * @tc.name testArrayPushArray055
     * @tc.desc Verify pushArray preserves max safe and min safe integer values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.pushArray(Number.MAX_SAFE_INTEGER, Number.MIN_SAFE_INTEGER);
      expect(result).assertEqual(2);
      expect(arr[0]).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(arr[1]).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5600
     * @tc.name testArrayPushArray056
     * @tc.desc Verify pushArray preserves emoji strings and ZWJ sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      const result = arr.pushArray('🌍', '👩‍');
      expect(result).assertEqual(2);
      expect(arr[0]).assertEqual('🌍');
      expect(arr[1]).assertEqual('👩‍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5700
     * @tc.name testArrayPushArray057
     * @tc.desc Verify spreading the same array into pushArray reads values before the append starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.pushArray(...arr);
      expect(result).assertEqual(2);
      expect(arr.toString()).assertEqual('1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5800
     * @tc.name testArrayPushArray058
     * @tc.desc Verify nested pushArray evaluation can append the inner returned length as a value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.pushArray(arr.pushArray(2));
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('1,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_5900
     * @tc.name testArrayPushArray059
     * @tc.desc Verify nested pushArray evaluation preserves left to right argument order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.pushArray(arr.pushArray(2), 3);
      expect(result).assertEqual(4);
      expect(arr.toString()).assertEqual('1,2,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6000
     * @tc.name testArrayPushArray060
     * @tc.desc Verify mapped spread values are appended after they are fully computed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const mapped = new Array<number>(2, 3).map((value: number): number => value * 2);
      const result = arr.pushArray(...mapped);
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('1,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6100
     * @tc.name testArrayPushArray061
     * @tc.desc Verify pushArray preserves exact argument order for a mixed union payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const payload = new Payload036();
      payload.key = 'value';
      const nested = new Array<number>(7, 8) as Object;
      const obj = payload as Object;
      const arr = new Array<Object | string | number | boolean>();
      const result = arr.pushArray(1, 'a', false, nested, obj);
      expect(result).assertEqual(5);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertEqual(false);
      expect(arr[3] === nested).assertTrue();
      expect(arr[4] === obj).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6200
     * @tc.name testArrayPushArray062
     * @tc.desc Verify pushed object references still reflect external mutations after storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new RefItem031();
      const arr = new Array<RefItem031>();
      arr.pushArray(ref);
      ref.value = 42;
      expect(arr[0].value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6300
     * @tc.name testArrayPushArray063
     * @tc.desc Verify pushArray works after the array was cleared through length assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      const result = arr.pushArray(9, 10);
      expect(result).assertEqual(2);
      expect(arr.toString()).assertEqual('9,10');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6400
     * @tc.name testArrayPushArray064
     * @tc.desc Verify pushArray works after the array was shrunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      const result = arr.pushArray(5);
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('1,2,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6500
     * @tc.name testArrayPushArray065
     * @tc.desc Verify pushArray works on arrays returned by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 3);
      const result = arr.pushArray(9);
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('2,3,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6600
     * @tc.name testArrayPushArray066
     * @tc.desc Verify pushArray can be followed by pop to remove the newest tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.pushArray(3);
      const value = arr.pop();
      expect(value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6700
     * @tc.name testArrayPushArray067
     * @tc.desc Verify pushArray can be followed by shift after a head insertion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      arr.pushArray(4);
      arr.unshift(1);
      const value = arr.shift();
      expect(value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6800
     * @tc.name testArrayPushArray068
     * @tc.desc Verify pushArray appends to the tail of a toReversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      const result = arr.pushArray(4);
      expect(result).assertEqual(4);
      expect(arr.toString()).assertEqual('3,2,1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_6900
     * @tc.name testArrayPushArray069
     * @tc.desc Verify pushArray appends to arrays created by concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1).concat(new Array<number>(2, 3));
      const result = arr.pushArray(4);
      expect(result).assertEqual(4);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_7000
     * @tc.name testArrayPushArray070
     * @tc.desc Verify pushArray appends to arrays created by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5);
      const result = arr.pushArray(6, 7);
      expect(result).assertEqual(4);
      expect(arr.toString()).assertEqual('4,5,6,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_7100
     * @tc.name testArrayPushArray071
     * @tc.desc Verify pushArray works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2);
      expect(pushArrayOnAnyNumberArray(anyValue)).assertEqual('1,2,3,4|4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ARRAY_7200
     * @tc.name testArrayPushArray072
     * @tc.desc Verify pushArray supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushArray072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = Array.create<Any>(1, 1);
      const length = anyArr.pushArray('two', true);
      expect(length).assertEqual(3);
      expect(anyArr.toString()).assertEqual('1,two,true');
    });

  });
}
