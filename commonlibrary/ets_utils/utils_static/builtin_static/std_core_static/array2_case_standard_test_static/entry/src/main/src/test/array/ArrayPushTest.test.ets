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

class Person007 {
  name: string = '';
  age: number = 0;
}

class Item031 {
  value: number = 0;
}

class Payload036 {
  key: string = '';
}

function createPushPerson(name: string, age: number): Person007 {
  const person = new Person007();
  person.name = name;
  person.age = age;
  return person;
}

enum Color040 {
  Red,
  Green,
  Blue
}

function createLargePushArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.push(i);
  }
  return arr;
}

function pushOnAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  arr.push(3, 4);
  return arr.toString() + '|' + arr.length.toString();
}

export default function ArrayPushTest(): void {
  describe('ArrayPushTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_0100
     * @tc.name testArrayPush001
     * @tc.desc Verify push accepts a single argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.push(10);
      expect(result).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_0200
     * @tc.name testArrayPush002
     * @tc.desc Verify push accepts multiple arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.push(10, 20, 30);
      expect(result).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_0300
     * @tc.name testArrayPush003
     * @tc.desc Verify push without arguments returns the current length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.push();
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_0400
     * @tc.name testArrayPush004
     * @tc.desc Verify push supports number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(100);
      arr.push(-50);
      arr.push(0);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_0500
     * @tc.name testArrayPush005
     * @tc.desc Verify push supports string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      arr.push('hello');
      arr.push('');
      arr.push('world');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_0600
     * @tc.name testArrayPush006
     * @tc.desc Verify push supports boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>();
      arr.push(true);
      arr.push(false);
      expect(arr.length).assertEqual(2);
      expect(arr[1] === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_0700
     * @tc.name testArrayPush007
     * @tc.desc Verify push supports object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Person007>();
      let person = new Person007();
      person.name = 'Alice';
      person.age = 25;
      arr.push(person);
      expect(arr.length).assertEqual(1);
      expect(arr[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_0800
     * @tc.name testArrayPush008
     * @tc.desc Verify push supports char elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>();
      arr.push(c'A');
      arr.push(c'\n');
      arr.push(c'\x7F');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(c'\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_0900
     * @tc.name testArrayPush009
     * @tc.desc Verify push supports union typed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string | number>();
      arr.push(10);
      arr.push('hello');
      arr.push(20);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1000
     * @tc.name testArrayPush010
     * @tc.desc Verify spread arguments can be forwarded into push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let source = new Array<number>(10, 20, 30);
      arr.push(...source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1100
     * @tc.name testArrayPush011
     * @tc.desc Verify push supports null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>();
      arr.push(null);
      expect(arr[0]).assertNull();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1200
     * @tc.name testArrayPush012
     * @tc.desc Verify push supports undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>();
      arr.push(undefined);
      expect(arr[0]).assertUndefined();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1300
     * @tc.name testArrayPush013
     * @tc.desc Verify push supports NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(Double.NaN);
      expect(Number.isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1400
     * @tc.name testArrayPush014
     * @tc.desc Verify push supports infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(Double.POSITIVE_INFINITY);
      arr.push(-Double.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr[1]).assertEqual(-Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1500
     * @tc.name testArrayPush015
     * @tc.desc Verify push returns the new array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.push(4);
      expect(result).assertEqual(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1600
     * @tc.name testArrayPush016
     * @tc.desc Verify push returns the accumulated length after many values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      let result = arr.push(3, 4, 5);
      expect(result).assertEqual(5);
      expect(arr[4]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1700
     * @tc.name testArrayPush017
     * @tc.desc Verify pushing into an empty array returns length one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.push(100);
      expect(result).assertEqual(1);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1800
     * @tc.name testArrayPush018
     * @tc.desc Verify the push return value behaves as a number length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.push(1);
      expect(typeof result).assertEqual('int');
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_1900
     * @tc.name testArrayPush019
     * @tc.desc Verify push appends a numeric value to an empty numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.push(1);
      expect(result).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2000
     * @tc.name testArrayPush020
     * @tc.desc Verify a mutable copy created from readonly data can still use push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: ReadonlyArray<number> = [1, 2, 3];
      let arr = Array.from<number>(source);
      let result = arr.push(4);
      expect(result).assertEqual(4);
      expect(source.length).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2100
     * @tc.name testArrayPush021
     * @tc.desc Verify push increases the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalLength = arr.length;
      arr.push(4);
      expect(arr.length).assertEqual(originalLength + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2200
     * @tc.name testArrayPush022
     * @tc.desc Verify push appends elements to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.push(4);
      expect(arr[arr.length - 1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2300
     * @tc.name testArrayPush023
     * @tc.desc Verify push keeps the original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalRef = arr;
      arr.push(4);
      expect(arr === originalRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2400
     * @tc.name testArrayPush024
     * @tc.desc Verify push preserves existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.push(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2500
     * @tc.name testArrayPush025
     * @tc.desc Verify push works on empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2600
     * @tc.name testArrayPush026
     * @tc.desc Verify push can be called repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(1);
      arr.push(2);
      arr.push(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2700
     * @tc.name testArrayPush027
     * @tc.desc Verify repeated push calls support large collections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargePushArray(10000);
      expect(arr.length).assertEqual(10000);
      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2800
     * @tc.name testArrayPush028
     * @tc.desc Verify push returns a number and does not support array chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.push(1);
      expect(typeof result).assertEqual('int');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_2900
     * @tc.name testArrayPush029
     * @tc.desc Verify push and shift can implement queue behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let queue = new Array<number>();
      queue.push(1);
      queue.push(2);
      queue.push(3);
      expect(queue.shift()).assertEqual(1);
      expect(queue.shift()).assertEqual(2);
      expect(queue.shift()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3000
     * @tc.name testArrayPush030
     * @tc.desc Verify push and pop can implement stack behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stack = new Array<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      expect(stack.pop()).assertEqual(3);
      expect(stack.pop()).assertEqual(2);
      expect(stack.pop()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3100
     * @tc.name testArrayPush031
     * @tc.desc Verify push preserves object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Item031>();
      let item = new Item031();
      item.value = 100;
      arr.push(item);
      item.value = 200;
      expect(arr[0].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3200
     * @tc.name testArrayPush032
     * @tc.desc Verify push matches single-value and multi-value alias scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(10);
      arr.push(20, 30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3300
     * @tc.name testArrayPush033
     * @tc.desc Verify repeated push calls preserve length and element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      for (let i: int = 0; i < 50000; i++) {
        arr.push(i);
      }
      expect(arr.length).assertEqual(50000);
      expect(arr[0]).assertEqual(0);
      expect(arr[49999]).assertEqual(49999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3400
     * @tc.name testArrayPush034
     * @tc.desc Verify push can trigger automatic array growth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargePushArray(1000);
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3500
     * @tc.name testArrayPush035
     * @tc.desc Verify push preserves previously appended numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(1);
      arr.push(2);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3600
     * @tc.name testArrayPush036
     * @tc.desc Verify heterogeneous values can be appended with a broad union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Object | string | number | boolean>();
      let payload = new Payload036();
      payload.key = 'value';
      arr.push(1);
      arr.push('string');
      arr.push(true);
      arr.push(payload);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3700
     * @tc.name testArrayPush037
     * @tc.desc Verify push works after extendTo on arrays with undefined fill values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, 2, 3);
      arr.extendTo(10, undefined);
      expect(arr.length).assertEqual(10);
      arr.push(100);
      expect(arr.length).assertEqual(11);
      expect(arr[10]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3800
     * @tc.name testArrayPush038
     * @tc.desc Verify push works after shrinkTo shortens the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      arr.push(100);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_3900
     * @tc.name testArrayPush039
     * @tc.desc Verify push supports bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>();
      arr.push(1n);
      arr.push(2n);
      arr.push(9007199254740991n);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4000
     * @tc.name testArrayPush040
     * @tc.desc Verify push supports enum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Color040>();
      arr.push(Color040.Red);
      arr.push(Color040.Green);
      expect(arr.length).assertEqual(2);
      expect(arr[1]).assertEqual(Color040.Green);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4100
     * @tc.name testArrayPush041
     * @tc.desc Verify push updates length consistently across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(1);
      expect(arr.length).assertEqual(1);
      arr.push(2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4200
     * @tc.name testArrayPush042
     * @tc.desc Verify new elements can be accessed by index after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(10);
      expect(arr[0]).assertEqual(10);
      arr.push(20);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4300
     * @tc.name testArrayPush043
     * @tc.desc Verify push supports numeric boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(Number.MAX_VALUE);
      arr.push(Number.MIN_VALUE);
      arr.push(Number.MAX_SAFE_INTEGER);
      arr.push(Number.MIN_SAFE_INTEGER);
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(arr[3]).assertEqual(Number.MIN_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4400
     * @tc.name testArrayPush044
     * @tc.desc Verify push supports representative string boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      let longText = 'very-long-string-content-for-push-boundary-test';
      arr.push('');
      arr.push('a');
      arr.push(longText);
      arr.push('\u0000');
      arr.push('\uDC04');
      expect(arr.length).assertEqual(5);
      expect(arr[3]).assertEqual('\u0000');
      expect(arr[4]).assertEqual('\uDC04');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4500
     * @tc.name testArrayPush045
     * @tc.desc Verify push can append the pair 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.push(1, 2);
      expect(result).assertEqual(2);
      expect(arr[1]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4600
     * @tc.name testArrayPush046
     * @tc.desc Verify push can append 3 to the numeric pair 1, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.push(3);
      expect(result).assertEqual(3);
      expect(arr.toString()).assertEqual('1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4700
     * @tc.name testArrayPush047
     * @tc.desc Verify push can append multiple values to number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const length = arr.push(1, 2, 3);
      expect(length).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4800
     * @tc.name testArrayPush048
     * @tc.desc Verify push can append multiple values to string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      const length = arr.push('a', 'b', 'c');
      expect(length).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_4900
     * @tc.name testArrayPush049
     * @tc.desc Verify push can append multiple values to boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>();
      const length = arr.push(true, false, true);
      expect(length).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5000
     * @tc.name testArrayPush050
     * @tc.desc Verify push can append multiple values to bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>();
      const length = arr.push(1n, 2n, 3n);
      expect(length).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5100
     * @tc.name testArrayPush051
     * @tc.desc Verify push supports object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Person007>();
      const result = arr.push(createPushPerson('a', 1), createPushPerson('b', 2));
      expect(result).assertEqual(2);
      expect(arr[1].name).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5200
     * @tc.name testArrayPush052
     * @tc.desc Verify push works after the array was cleared through length assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      const result = arr.push(9, 10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5300
     * @tc.name testArrayPush053
     * @tc.desc Verify push works after the array was shrunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      const result = arr.push(5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5400
     * @tc.name testArrayPush054
     * @tc.desc Verify push works on arrays returned by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 3);
      const result = arr.push(9);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5500
     * @tc.name testArrayPush055
     * @tc.desc Verify push preserves insertion order for repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.push(5, 5);
      expect(arr.toString()).assertEqual('5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5600
     * @tc.name testArrayPush056
     * @tc.desc Verify push can be followed by pop to remove the newest tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3);
      const value = arr.pop();
      expect(value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5700
     * @tc.name testArrayPush057
     * @tc.desc Verify push can be followed by shift while preserving queue order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      arr.push(4);
      const value = arr.shift();
      expect(value).assertEqual(2);
      expect(arr.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5800
     * @tc.name testArrayPush058
     * @tc.desc Verify push appends correctly after reverse changes element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.reverse();
      const result = arr.push(3);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_5900
     * @tc.name testArrayPush059
     * @tc.desc Verify push works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2);
      expect(pushOnAnyNumberArray(anyValue)).assertEqual('1,2,3,4|4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_6000
     * @tc.name testArrayPush060
     * @tc.desc Verify push supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPush060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = Array.create<Any>(1, 1);
      const length = anyArr.push('two', true);
      expect(length).assertEqual(3);
      expect(anyArr.toString()).assertEqual('1,two,true');
    });
  });
}
