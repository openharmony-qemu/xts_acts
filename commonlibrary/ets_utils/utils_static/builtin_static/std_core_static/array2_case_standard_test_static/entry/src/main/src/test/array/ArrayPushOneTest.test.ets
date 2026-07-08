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

class Person007 {
  name: string = '';
  age: number = 0;
}

class Item032 {
  value: number = 0;
}

class Payload037 {
  label: string = '';
}

function createPushOnePerson(name: string, age: number): Person007 {
  const person = new Person007();
  person.name = name;
  person.age = age;
  return person;
}

class Stack049<T> {
  private items = new Array<T>();

  push(item: T): void {
    this.items.pushOne(item);
  }

  pop(): T | undefined {
    return this.items.pop();
  }

  size(): int {
    return this.items.length;
  }
}

enum Color041 {
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

function pushOneOnAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  arr.pushOne(3);
  return arr.toString() + '|' + arr.length.toString();
}

export default function ArrayPushOneTest(): void {
  describe('ArrayPushOneTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_0100
     * @tc.name testArrayPushOne001
     * @tc.desc Verify pushOne accepts a single argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pushOne(10);
      expect(result).assertEqual(1);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_0200
     * @tc.name testArrayPushOne002
     * @tc.desc Verify pushOne returns the updated length after multiple appends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let first = arr.pushOne(10);
      let second = arr.pushOne(20);
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
      expect(arr.toString()).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_0300
     * @tc.name testArrayPushOne003
     * @tc.desc Verify pushOne appends after existing elements and returns the new length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.pushOne(4);
      expect(result).assertEqual(4);
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_0400
     * @tc.name testArrayPushOne004
     * @tc.desc Verify pushOne supports number elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(100);
      arr.pushOne(-50);
      arr.pushOne(0);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_0500
     * @tc.name testArrayPushOne005
     * @tc.desc Verify pushOne supports string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      arr.pushOne('hello');
      arr.pushOne('');
      arr.pushOne('world');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_0600
     * @tc.name testArrayPushOne006
     * @tc.desc Verify pushOne supports boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>();
      arr.pushOne(true);
      arr.pushOne(false);
      expect(arr.length).assertEqual(2);
      expect(arr[1] === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_0700
     * @tc.name testArrayPushOne007
     * @tc.desc Verify pushOne supports object elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Person007>();
      let p1 = new Person007();
      p1.name = 'Alice';
      p1.age = 25;
      arr.pushOne(p1);
      expect(arr.length).assertEqual(1);
      expect(arr[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_0800
     * @tc.name testArrayPushOne008
     * @tc.desc Verify pushOne supports char elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>();
      arr.pushOne(c'A');
      arr.pushOne(c'\n');
      arr.pushOne(c'\x7F');
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(c'\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_0900
     * @tc.name testArrayPushOne009
     * @tc.desc Verify pushOne supports union typed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string | number>();
      arr.pushOne(10);
      arr.pushOne('hello');
      arr.pushOne(20);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1000
     * @tc.name testArrayPushOne010
     * @tc.desc Verify pushOne supports null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>();
      arr.pushOne(null);
      expect(arr[0]).assertNull();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1100
     * @tc.name testArrayPushOne011
     * @tc.desc Verify pushOne supports undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>();
      arr.pushOne(undefined);
      expect(arr[0]).assertUndefined();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1200
     * @tc.name testArrayPushOne012
     * @tc.desc Verify pushOne supports NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(Double.NaN);
      expect(Number.isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1300
     * @tc.name testArrayPushOne013
     * @tc.desc Verify pushOne supports infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(Double.POSITIVE_INFINITY);
      arr.pushOne(-Double.POSITIVE_INFINITY);
      expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr[1]).assertEqual(-Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1400
     * @tc.name testArrayPushOne014
     * @tc.desc Verify pushOne supports zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(0);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1500
     * @tc.name testArrayPushOne015
     * @tc.desc Verify pushOne supports empty string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      arr.pushOne('');
      expect(arr[0]).assertEqual('');
      expect(arr[0].length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1600
     * @tc.name testArrayPushOne016
     * @tc.desc Verify pushOne supports false values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>();
      arr.pushOne(false);
      expect(arr[0] === false).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1700
     * @tc.name testArrayPushOne017
     * @tc.desc Verify pushOne returns the new array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.pushOne(4);
      expect(result).assertEqual(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1800
     * @tc.name testArrayPushOne018
     * @tc.desc Verify pushing into a single-element array returns length two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 100);
      let result = arr.pushOne(200);
      expect(result).assertEqual(2);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_1900
     * @tc.name testArrayPushOne019
     * @tc.desc Verify the first pushOne on an empty array creates a single readable tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pushOne(100);
      expect(result).assertEqual(1);
      expect(arr[result - 1]).assertEqual(100);
      expect(arr.join()).assertEqual('100');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2000
     * @tc.name testArrayPushOne020
     * @tc.desc Verify the pushOne return value behaves as an integer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pushOne(1);
      expect(typeof result).assertEqual('int');
      expect(Number.isInteger(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2100
     * @tc.name testArrayPushOne021
     * @tc.desc Verify pushOne appends a numeric value to a number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pushOne(1);
      expect(result).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2200
     * @tc.name testArrayPushOne022
     * @tc.desc Verify a mutable copy created from readonly data can still use pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: ReadonlyArray<number> = [1, 2, 3];
      let arr = Array.from<number>(source);
      let result = arr.pushOne(4);
      expect(result).assertEqual(4);
      expect(source.length).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2300
     * @tc.name testArrayPushOne023
     * @tc.desc Verify pushOne increases the array length by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalLength = arr.length;
      arr.pushOne(4);
      expect(arr.length).assertEqual(originalLength + 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2400
     * @tc.name testArrayPushOne024
     * @tc.desc Verify pushOne appends the element to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.pushOne(4);
      expect(arr[arr.length - 1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2500
     * @tc.name testArrayPushOne025
     * @tc.desc Verify pushOne keeps the original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalRef = arr;
      arr.pushOne(4);
      expect(arr === originalRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2600
     * @tc.name testArrayPushOne026
     * @tc.desc Verify pushOne preserves existing elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.pushOne(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2700
     * @tc.name testArrayPushOne027
     * @tc.desc Verify pushOne works on empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(1);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2800
     * @tc.name testArrayPushOne028
     * @tc.desc Verify pushOne can be called repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(1);
      arr.pushOne(2);
      arr.pushOne(3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_2900
     * @tc.name testArrayPushOne029
     * @tc.desc Verify repeated pushOne calls support large collections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeNumberArray(10000);
      expect(arr.length).assertEqual(10000);
      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3000
     * @tc.name testArrayPushOne030
     * @tc.desc Verify pushOne is equivalent to pushArray for a single value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>();
      let arr2 = new Array<number>();
      arr1.pushOne(10);
      arr2.pushArray(10);
      expect(arr1.length).assertEqual(arr2.length);
      expect(arr1[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3100
     * @tc.name testArrayPushOne031
     * @tc.desc Verify pushOne push and pushArray behave consistently for one value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>();
      let arr2 = new Array<number>();
      let arr3 = new Array<number>();
      arr1.pushOne(10);
      arr2.push(10);
      arr3.pushArray(10);
      expect(arr1.length).assertEqual(arr2.length);
      expect(arr2.length).assertEqual(arr3.length);
      expect(arr1[0]).assertEqual(arr3[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3200
     * @tc.name testArrayPushOne032
     * @tc.desc Verify pushOne preserves object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Item032>();
      let item = new Item032();
      item.value = 100;
      arr.pushOne(item);
      item.value = 200;
      expect(arr[0].value).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3300
     * @tc.name testArrayPushOne033
     * @tc.desc Verify pushOne returns a number and does not support array chaining
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pushOne(1);
      expect(typeof result).assertEqual('int');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3400
     * @tc.name testArrayPushOne034
     * @tc.desc Verify repeated pushOne calls preserve length and element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      for (let i: int = 0; i < 50000; i++) {
        arr.pushOne(i);
      }
      expect(arr.length).assertEqual(50000);
      expect(arr[0]).assertEqual(0);
      expect(arr[49999]).assertEqual(49999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3500
     * @tc.name testArrayPushOne035
     * @tc.desc Verify pushOne can trigger automatic array growth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      for (let i: int = 0; i < 1000; i++) {
        arr.pushOne(i);
      }
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3600
     * @tc.name testArrayPushOne036
     * @tc.desc Verify pushOne can append after a prior pop operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      let removed = arr.pop();
      let result = arr.pushOne(3);
      expect(removed).assertEqual(2);
      expect(result).assertEqual(2);
      expect(arr.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3700
     * @tc.name testArrayPushOne037
     * @tc.desc Verify heterogeneous values can be appended with a broad union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Object | string | number | boolean>();
      let payload = new Payload037();
      payload.label = 'value';
      arr.pushOne(1);
      arr.pushOne('string');
      arr.pushOne(true);
      arr.pushOne(payload);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3800
     * @tc.name testArrayPushOne038
     * @tc.desc Verify pushOne works after extendTo on arrays with undefined fill values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, 2, 3);
      arr.extendTo(10, undefined);
      expect(arr.length).assertEqual(10);
      arr.pushOne(100);
      expect(arr.length).assertEqual(11);
      expect(arr[10]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_3900
     * @tc.name testArrayPushOne039
     * @tc.desc Verify pushOne works after shrinkTo shortens the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(2);
      expect(arr.length).assertEqual(2);
      arr.pushOne(100);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4000
     * @tc.name testArrayPushOne040
     * @tc.desc Verify pushOne supports bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>();
      arr.pushOne(1n);
      arr.pushOne(2n);
      arr.pushOne(9007199254740991n);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(9007199254740991n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4100
     * @tc.name testArrayPushOne041
     * @tc.desc Verify pushOne supports enum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Color041>();
      arr.pushOne(Color041.Red);
      arr.pushOne(Color041.Green);
      arr.pushOne(Color041.Blue);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(Color041.Green);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4200
     * @tc.name testArrayPushOne042
     * @tc.desc Verify pushOne updates length consistently across multiple calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(1);
      expect(arr.length).assertEqual(1);
      arr.pushOne(2);
      expect(arr.length).assertEqual(2);
      arr.pushOne(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4300
     * @tc.name testArrayPushOne043
     * @tc.desc Verify new elements can be accessed by index after pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(10);
      expect(arr[0]).assertEqual(10);
      arr.pushOne(20);
      expect(arr[1]).assertEqual(20);
      arr.pushOne(30);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4400
     * @tc.name testArrayPushOne044
     * @tc.desc Verify pushOne and pop can implement stack operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stack = new Array<number>();
      stack.pushOne(1);
      stack.pushOne(2);
      stack.pushOne(3);
      expect(stack.pop()).assertEqual(3);
      expect(stack.pop()).assertEqual(2);
      expect(stack.pop()).assertEqual(1);
      expect(stack.pop()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4500
     * @tc.name testArrayPushOne045
     * @tc.desc Verify pushOne supports numeric boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.pushOne(Number.MAX_VALUE);
      arr.pushOne(Number.MIN_VALUE);
      arr.pushOne(Number.MAX_SAFE_INTEGER);
      arr.pushOne(Number.MIN_SAFE_INTEGER);
      expect(arr.length).assertEqual(4);
      expect(arr[2]).assertEqual(Number.MAX_SAFE_INTEGER);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4600
     * @tc.name testArrayPushOne046
     * @tc.desc Verify pushOne supports representative string boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>();
      arr.pushOne('');
      arr.pushOne('a');
      arr.pushOne('very-long-string-content');
      arr.pushOne('\u0000');
      arr.pushOne('\uDC04');
      expect(arr.length).assertEqual(5);
      expect(arr[3]).assertEqual('\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4700
     * @tc.name testArrayPushOne047
     * @tc.desc Verify pushOne supports special char boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>();
      arr.pushOne(c'\x00');
      arr.pushOne(c'\x7F');
      arr.pushOne(c'\n');
      arr.pushOne(c'\t');
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(c'\x7F');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4800
     * @tc.name testArrayPushOne048
     * @tc.desc Verify pushOne can improve readability in stack-like wrappers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stack = new Stack049<number>();
      stack.push(10);
      expect(stack.size()).assertEqual(1);
      expect(stack.pop()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_4900
     * @tc.name testArrayPushOne049
     * @tc.desc Verify push and pushOne append equivalent values in insertion order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(10);
      arr.pushOne(10);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(arr[1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5000
     * @tc.name testArrayPushOne050
     * @tc.desc Verify push behavior matches one-value and multi-value alias scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      arr.push(10);
      expect(arr.length).assertEqual(1);
      arr.push(20, 30);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5100
     * @tc.name testArrayPushOne051
     * @tc.desc Verify repeated pushOne calls and one pushArray call both build the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>();
      for (let i: int = 0; i < 1000; i++) {
        arr1.pushOne(i);
      }

      let arr2 = new Array<number>();
      let source = createLargeNumberArray(1000);
      arr2.pushArray(...source);

      expect(arr1.length).assertEqual(1000);
      expect(arr2.length).assertEqual(1000);
      expect(arr1[0]).assertEqual(arr2[0]);
      expect(arr1[999]).assertEqual(arr2[999]);
      expect(arr1.toString()).assertEqual(arr2.toString());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5200
     * @tc.name testArrayPushOne052
     * @tc.desc Verify pushOne can append 1 to a one-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 2);
      const result = arr.pushOne(1);
      expect(result).assertEqual(2);
      expect(arr[1]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5300
     * @tc.name testArrayPushOne053
     * @tc.desc Verify pushOne can append values to number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const first = arr.pushOne(1);
      const second = arr.pushOne(2);
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5400
     * @tc.name testArrayPushOne054
     * @tc.desc Verify pushOne can append values to string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>();
      const first = arr.pushOne('a');
      const second = arr.pushOne('b');
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5500
     * @tc.name testArrayPushOne055
     * @tc.desc Verify pushOne can append values to boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>();
      const first = arr.pushOne(true);
      const second = arr.pushOne(false);
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5600
     * @tc.name testArrayPushOne056
     * @tc.desc Verify pushOne can append values to bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>();
      const first = arr.pushOne(1n);
      const second = arr.pushOne(2n);
      expect(first).assertEqual(1);
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5700
     * @tc.name testArrayPushOne057
     * @tc.desc Verify pushOne supports object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Person007>();
      const result = arr.pushOne(createPushOnePerson('item', 1));
      expect(result).assertEqual(1);
      expect(arr[0].name).assertEqual('item');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5800
     * @tc.name testArrayPushOne058
     * @tc.desc Verify pushOne works after the array was cleared through length assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      const result = arr.pushOne(9);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_5900
     * @tc.name testArrayPushOne059
     * @tc.desc Verify pushOne works after the array was shrunk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      const result = arr.pushOne(5);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_6000
     * @tc.name testArrayPushOne060
     * @tc.desc Verify pushOne works on arrays returned by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 3);
      const result = arr.pushOne(9);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_6100
     * @tc.name testArrayPushOne061
     * @tc.desc Verify pushOne preserves insertion order for repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      arr.pushOne(5);
      arr.pushOne(5);
      expect(arr.toString()).assertEqual('5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_6200
     * @tc.name testArrayPushOne062
     * @tc.desc Verify pushOne can be followed by pop to remove the newest tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.pushOne(3);
      const value = arr.pop();
      expect(value).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_6300
     * @tc.name testArrayPushOne063
     * @tc.desc Verify pushOne can be followed by shift to remove the newest head when appropriate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3);
      arr.unshift(1); arr.pushOne(4);
      const value = arr.shift();
      expect(value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_6400
     * @tc.name testArrayPushOne064
     * @tc.desc Verify pushOne appends correctly after reverse changes element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.reverse();
      const result = arr.pushOne(3);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_6500
     * @tc.name testArrayPushOne065
     * @tc.desc Verify pushOne works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2);
      expect(pushOneOnAnyNumberArray(anyValue)).assertEqual('1,2,3|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_PUSH_ONE_6600
     * @tc.name testArrayPushOne066
     * @tc.desc Verify pushOne supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPushOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two');
      const length = anyArr.pushOne(true);
      expect(length).assertEqual(3);
      expect(anyArr.toString()).assertEqual('1,two,true');
    });
  });
}
