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

class Person009 {
  name: string = '';
  age: number = 0;
}

interface Printable034 {
  print(): void;
}

class PrintableItem034 implements Printable034 {
  print(): void {
  }
}

class MyArray041<T> extends Array<T> {
  static of<T>(...values: T[]): MyArray041<T> {
    let result = new MyArray041<T>();
    for (let i: int = 0; i < values.length; i++) {
      result.pushOne(values[i]);
    }
    return result;
  }
}

class MyArray052<T> extends Array<T> {
  customMethod(): string {
    return 'custom';
  }

  static of<T>(...values: T[]): MyArray052<T> {
    let result = new MyArray052<T>();
    for (let i: int = 0; i < values.length; i++) {
      result.pushOne(values[i]);
    }
    return result;
  }
}

function createLargeSequence(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function createArray034<T>(...args: T[]): Array<T> {
  return Array.of<T>(...args);
}

function createTypedArray041<T>(...values: T[]): Array<T> {
  return Array.of<T>(...values);
}

function toArray043<T>(...args: T[]): Array<T> {
  return Array.of<T>(...args);
}

export default function ArrayOfTest(): void {
  describe('ArrayOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_0100
     * @tc.name testArrayOf001
     * @tc.desc Verify Array of returns an empty array when called without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>();
      expect(arr.length).assertEqual(0);
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_0200
     * @tc.name testArrayOf002
     * @tc.desc Verify Array of accepts a single argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(100);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_0300
     * @tc.name testArrayOf003
     * @tc.desc Verify Array of accepts multiple arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(10, 20, 30);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_0400
     * @tc.name testArrayOf004
     * @tc.desc Verify Array of creates number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(typeof arr[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_0500
     * @tc.name testArrayOf005
     * @tc.desc Verify Array of creates string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<string>('a', 'b', 'c');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_0600
     * @tc.name testArrayOf006
     * @tc.desc Verify Array of creates boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<boolean>(true, false, true);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_0700
     * @tc.name testArrayOf007
     * @tc.desc Verify Array of creates char arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<char>(c'A', c'B', c'C');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_0800
     * @tc.name testArrayOf008
     * @tc.desc Verify Array of creates bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<bigint>(1n, 2n, 3n);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_0900
     * @tc.name testArrayOf009
     * @tc.desc Verify Array of creates object arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let p1 = new Person009();
      p1.name = 'Alice';
      let p2 = new Person009();
      p2.name = 'Bob';
      let arr = Array.of<Person009>(p1, p2);
      expect(arr.length).assertEqual(2);
      expect(arr[0].name).assertEqual('Alice');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1000
     * @tc.name testArrayOf010
     * @tc.desc Verify Array of creates union typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<string | number>('a', 1, 'b', 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1100
     * @tc.name testArrayOf011
     * @tc.desc Verify heterogeneous values can be collected with an explicit broad union type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<Object | string | number | boolean | null>(1, 'string', true, null);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1200
     * @tc.name testArrayOf012
     * @tc.desc Verify Array of preserves null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number | null>(1, null, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1300
     * @tc.name testArrayOf013
     * @tc.desc Verify Array of preserves undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number | undefined>(1, undefined, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1400
     * @tc.name testArrayOf014
     * @tc.desc Verify Array of preserves NaN elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(1, Double.NaN, 3);
      expect(arr.length).assertEqual(3);
      expect(Number.isNaN(arr[1])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1500
     * @tc.name testArrayOf015
     * @tc.desc Verify Array of preserves infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(1, Double.POSITIVE_INFINITY, -Double.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr[2]).assertEqual(-Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1600
     * @tc.name testArrayOf016
     * @tc.desc Verify Array of preserves zero and negative zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(0, -0, 1);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(0);
      expect(arr[1]).assertEqual(-0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1700
     * @tc.name testArrayOf017
     * @tc.desc Verify Array of preserves empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<string>('', 'a', '');
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1800
     * @tc.name testArrayOf018
     * @tc.desc Verify Array of returns Array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(1, 2, 3);
      expect(arr instanceof Array).assertTrue();
      expect(Array.isArray(arr)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_1900
     * @tc.name testArrayOf019
     * @tc.desc Verify each Array of call returns a new array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.of<number>(1, 2, 3);
      let arr2 = Array.of<number>(1, 2, 3);
      expect(arr1 !== arr2).assertTrue();
      expect(arr1.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2000
     * @tc.name testArrayOf020
     * @tc.desc Verify the array length equals the number of input values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(1, 2, 3, 4, 5);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2100
     * @tc.name testArrayOf021
     * @tc.desc Verify Array of preserves argument order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(10, 20, 30);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2200
     * @tc.name testArrayOf022
     * @tc.desc Verify Array of can be called as a static method on Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<string>('a', 'b');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2300
     * @tc.name testArrayOf023
     * @tc.desc Verify Array.of can be called through the Array constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(4, 5);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2400
     * @tc.name testArrayOf024
     * @tc.desc Verify explicit generic arguments preserve the intended element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(1, 2, 3);
      expect(typeof arr[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2500
     * @tc.name testArrayOf025
     * @tc.desc Verify type inference creates numeric arrays without explicit generic arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2600
     * @tc.name testArrayOf026
     * @tc.desc Verify Array of and single number construction preserve the same value in this implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.of<number>(7);
      let arr2 = Array.create<number>(1, 7);
      expect(arr1.length).assertEqual(1);
      expect(arr1[0]).assertEqual(7);
      expect(arr2.length).assertEqual(1);
      expect(arr2[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2700
     * @tc.name testArrayOf027
     * @tc.desc Verify multiple arguments behave consistently between Array of and the constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.of<number>(1, 2, 3);
      let arr2 = new Array<number>(1, 2, 3);
      expect(arr1.length).assertEqual(arr2.length);
      expect(arr1[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2800
     * @tc.name testArrayOf028
     * @tc.desc Verify Array of provides an explicit static creation path for single numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let clear = Array.of<number>(7);
      let ctor = Array.create<number>(1, 7);
      expect(clear.length).assertEqual(1);
      expect(clear[0]).assertEqual(7);
      expect(clear.toString()).assertEqual(ctor.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_2900
     * @tc.name testArrayOf029
     * @tc.desc Verify Array of accepts a large number of parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values = createLargeSequence(1000);
      let arr = Array.of<number>(...values);
      expect(arr.length).assertEqual(1000);
      expect(arr[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3000
     * @tc.name testArrayOf030
     * @tc.desc Verify Array of handles single argument boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.of<number>(0);
      let arr2 = Array.of<number>(-1);
      let arr3 = Array.of<number>(Number.MAX_VALUE);
      expect(arr1[0]).assertEqual(0);
      expect(arr2[0]).assertEqual(-1);
      expect(arr3[0]).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3100
     * @tc.name testArrayOf031
     * @tc.desc Verify Array of matches array literal contents for equivalent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.of<number>(1, 2, 3);
      let arr2 = [1, 2, 3];
      expect(arr1.length).assertEqual(arr2.length);
      expect(arr1[0]).assertEqual(arr2[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3200
     * @tc.name testArrayOf032
     * @tc.desc Verify Array of can build arrays from dynamic variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x = 10;
      let y = 20;
      let arr = Array.of<number>(x, y);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3300
     * @tc.name testArrayOf033
     * @tc.desc Verify generic helper functions can forward variadic arguments into Array of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createArray034<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3400
     * @tc.name testArrayOf034
     * @tc.desc Verify Array of respects generic interface constraints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<Printable034>(new PrintableItem034());
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3500
     * @tc.name testArrayOf035
     * @tc.desc Verify mixed arguments are inferred as a union typed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number | string | boolean>(1, 'string', true);
      expect(arr.length).assertEqual(3);
      expect(arr[1]).assertEqual('string');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3600
     * @tc.name testArrayOf036
     * @tc.desc Verify Array of and array literals can both be created repeatedly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastOf = Array.of<number>();
      for (let i: int = 0; i < 10000; i++) {
        lastOf = Array.of<number>(1, 2, 3);
      }

      let lastLiteral = new Array<number>();
      for (let i: int = 0; i < 10000; i++) {
        lastLiteral = [1, 2, 3];
      }
      expect(lastOf.length).assertEqual(3);
      expect(lastLiteral.length).assertEqual(3);
      expect(lastOf.toString()).assertEqual('1,2,3');
      expect(lastLiteral.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3700
     * @tc.name testArrayOf037
     * @tc.desc Verify Array of can create arrays from large value collections
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let largeArray = createLargeSequence(10000);
      let arr = Array.of<number>(...largeArray);
      expect(arr.length).assertEqual(10000);
      expect(arr[9999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3800
     * @tc.name testArrayOf038
     * @tc.desc Verify Array of and Array from both create arrays from equivalent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.of<number>(1, 2, 3);
      let arr2 = Array.from<number>([1, 2, 3]);
      expect(arr1.length).assertEqual(3);
      expect(arr2.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_3900
     * @tc.name testArrayOf039
     * @tc.desc Verify Array of keeps explicit single value semantics in this implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.of<number>(7);
      let arr2 = Array.create<number>(1, 7);
      expect(arr1[0]).assertEqual(7);
      expect(arr2[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4000
     * @tc.name testArrayOf040
     * @tc.desc Verify helper factories can create strongly typed arrays with Array of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numbers = createTypedArray041<number>(1, 2, 3);
      let strings = createTypedArray041<string>('a', 'b', 'c');
      expect(numbers.length).assertEqual(3);
      expect(strings[1]).assertEqual('b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4100
     * @tc.name testArrayOf041
     * @tc.desc Verify custom factory subclasses can use a static of method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = MyArray041.of<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr instanceof MyArray041).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4200
     * @tc.name testArrayOf042
     * @tc.desc Verify variadic helpers can convert arguments into arrays with Array of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = toArray043<number>(1, 2, 3, 4, 5);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4300
     * @tc.name testArrayOf043
     * @tc.desc Verify Array.of can create a string array from explicit string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<string>('test1', 'test2');
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertEqual('test1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4400
     * @tc.name testArrayOf044
     * @tc.desc Verify Array of can store function elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn1 = (): number => 1;
      let fn2 = (): number => 2;
      let arr = Array.of<() => number>(fn1, fn2);
      expect(arr.length).assertEqual(2);
      expect(arr[0]()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4500
     * @tc.name testArrayOf045
     * @tc.desc Verify Array of can create nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = Array.of<number>(1, 2);
      let arr2 = Array.of<number>(3, 4);
      let nested = Array.of<Array<number>>(arr1, arr2);
      expect(nested.length).assertEqual(2);
      expect(nested[0][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4600
     * @tc.name testArrayOf046
     * @tc.desc Verify Array of preserves important numeric boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(
        Number.MAX_VALUE,
        Number.MIN_VALUE,
        Number.MAX_SAFE_INTEGER,
        Number.MIN_SAFE_INTEGER,
        Number.POSITIVE_INFINITY,
        Number.NEGATIVE_INFINITY
      );
      expect(arr.length).assertEqual(6);
      expect(arr[0]).assertEqual(Number.MAX_VALUE);
      expect(arr[1]).assertEqual(Number.MIN_VALUE);
      expect(arr[2]).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(arr[3]).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(arr[4]).assertEqual(Number.POSITIVE_INFINITY);
      expect(arr[5]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4700
     * @tc.name testArrayOf047
     * @tc.desc Verify Array of preserves representative string boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<string>('', 'a', 'long-string-value', '\u0000', '👩‍');
      expect(arr.length).assertEqual(5);
      expect(arr[0]).assertEqual('');
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertEqual('long-string-value');
      expect(arr[3]).assertEqual('\u0000');
      expect(arr[4]).assertEqual('👩‍');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4800
     * @tc.name testArrayOf048
     * @tc.desc Verify Array of can initialize readonly arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyArray<number> = Array.of<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_4900
     * @tc.name testArrayOf049
     * @tc.desc Verify readonly alternatives can cover unsupported const assertion examples
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: ReadonlyArray<number> = Array.of<number>(1, 2, 3);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5000
     * @tc.name testArrayOf050
     * @tc.desc Verify Array of supports spreading an existing array into arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source = new Array<number>(10, 20, 30);
      let arr = Array.of<number>(...source);
      expect(arr.length).assertEqual(3);
      expect(arr[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5100
     * @tc.name testArrayOf051
     * @tc.desc Verify Array of supports mixing spread arguments with direct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let part1 = [1, 2];
      let part2 = [5, 6];
      let arr = Array.of<number>(...part1, 3, 4, ...part2);
      expect(arr.length).assertEqual(6);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5200
     * @tc.name testArrayOf052
     * @tc.desc Verify subclass factories can return subclass instances with custom behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = MyArray052.of<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
      expect(arr.customMethod()).assertEqual('custom');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5300
     * @tc.name testArrayOf053
     * @tc.desc Verify explicit generic arguments can be used to create numeric arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(1, 2);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5400
     * @tc.name testArrayOf054
     * @tc.desc Verify Array.of creates arrays directly from the provided values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.of<number>(1, 2, 3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5500
     * @tc.name testArrayOf055
     * @tc.desc Verify Array.of can create the numeric triple 1, 2, 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(1, 2, 3);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5600
     * @tc.name testArrayOf056
     * @tc.desc Verify Array.of can create numeric triple 2, 3, 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(2, 3, 4);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5700
     * @tc.name testArrayOf057
     * @tc.desc Verify Array.of can create a string array from three values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<string>('a', 'b', 'c');
      expect(arr.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5800
     * @tc.name testArrayOf058
     * @tc.desc Verify Array.of can create a boolean array from three values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<boolean>(true, false, true);
      expect(arr.toString()).assertEqual('true,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_5900
     * @tc.name testArrayOf059
     * @tc.desc Verify Array.of can create a bigint array from three values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<bigint>(1n, 2n, 3n);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6000
     * @tc.name testArrayOf060
     * @tc.desc Verify Array.of treats a negative single number as a normal element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(-7);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6100
     * @tc.name testArrayOf061
     * @tc.desc Verify Array.of stores a single floating-point number as an element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(3.14);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(3.14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6200
     * @tc.name testArrayOf062
     * @tc.desc Verify Array.of stores a standalone NaN value as the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(Double.NaN);
      expect(arr.length).assertEqual(1);
      expect(Number.isNaN(arr[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6300
     * @tc.name testArrayOf063
     * @tc.desc Verify Array.of stores a standalone infinity value as the only element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(Double.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6400
     * @tc.name testArrayOf064
     * @tc.desc Verify Array.of stores a zero value as an independent single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(0);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6500
     * @tc.name testArrayOf065
     * @tc.desc Verify Array.of stores a very large numeric element without interpreting it as a length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4294967296);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(4294967296);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6600
     * @tc.name testArrayOf066
     * @tc.desc Verify Array.of can store a single string argument as one element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<string>('7');
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6700
     * @tc.name testArrayOf067
     * @tc.desc Verify Array.of can store a single explicit undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number | undefined>(undefined);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6800
     * @tc.name testArrayOf068
     * @tc.desc Verify Array.of can preserve mixed nullish and boolean values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<null | boolean>(null, false);
      expect(arr.length).assertEqual(2);
      expect(arr[0]).assertNull();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_6900
     * @tc.name testArrayOf069
     * @tc.desc Verify Array.of preserves object and nested array references without cloning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = {} as Object;
      const inner = new Array<number>();
      const arr = Array.of<Object | Array<number>>(obj, inner);
      expect(arr.length).assertEqual(2);
      expect(arr[0] === obj).assertTrue();
      expect(arr[1] === inner).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7000
     * @tc.name testArrayOf070
     * @tc.desc Verify Array.of can rebuild a numeric array from a spread source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = [1, 2, 3];
      const arr = Array.of<number>(...source);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7100
     * @tc.name testArrayOf071
     * @tc.desc Verify Array.of can rebuild a character array from a spread source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: Array<string> = ['a', 'b', 'c'];
      const arr = Array.of<string>(...chars);
      expect(arr.length).assertEqual(3);
      expect(arr.toString()).assertEqual('a,b,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7200
     * @tc.name testArrayOf072
     * @tc.desc Verify subclass static of continues to produce subclass instances on the Array prototype chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = MyArray041.of<number>(1);
      expect(arr instanceof MyArray041).assertTrue();
      expect(arr instanceof Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7300
     * @tc.name testArrayOf073
     * @tc.desc Verify Array.of can accept an argument list array through spread syntax
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const args = [1, 2, 3];
      const arr = Array.of<int>(...args);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7400
     * @tc.name testArrayOf074
     * @tc.desc Verify repeated Array.of calls produce the same element layout
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Array.of<boolean>(true, false);
      const arr2 = Array.of<boolean>(true, false);
      expect(arr1.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7500
     * @tc.name testArrayOf075
     * @tc.desc Verify Array.of can preserve the literal string value "of"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<string>('of');
      expect(arr[0]).assertEqual('of');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7600
     * @tc.name testArrayOf076
     * @tc.desc Verify Array.of can create an empty array when no values are provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7700
     * @tc.name testArrayOf077
     * @tc.desc Verify Array.of keeps nested array references intact when wrapping them as single elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<number> = [1];
      const arr = Array.of<Array<number>>(nested);
      expect(arr.length).assertEqual(1);
      expect(arr[0] === nested).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7800
     * @tc.name testArrayOf078
     * @tc.desc Verify Array.of can preserve duplicate object references across multiple positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj = {} as Object;
      const arr = Array.of<Object>(obj, obj);
      expect(arr.length).assertEqual(2);
      expect(arr[0] === arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_7900
     * @tc.name testArrayOf079
     * @tc.desc Verify Array.of can preserve duplicate nested array references across multiple positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested: Array<number> = [1, 2];
      const arr = Array.of<Array<number>>(nested, nested);
      expect(arr.length).assertEqual(2);
      expect(arr[0] === arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_8000
     * @tc.name testArrayOf080
     * @tc.desc Verify Array.of can preserve order when combining spread arrays with a direct tail value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(...[1, 2], 3);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_8100
     * @tc.name testArrayOf081
     * @tc.desc Verify Array.of can preserve order when combining a direct head value with spread arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(0, ...[1, 2]);
      expect(arr.toString()).assertEqual('0,1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_8200
     * @tc.name testArrayOf082
     * @tc.desc Verify Array.of can preserve a single bigint value exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<bigint>(10n);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_8300
     * @tc.name testArrayOf083
     * @tc.desc Verify Array.of can preserve argument order in a wider mixed union
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number | string | boolean>(1, 'a', false, 2);
      expect(arr.length).assertEqual(4);
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual('a');
      expect(arr[2]).assertFalse();
      expect(arr[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_8400
     * @tc.name testArrayOf084
     * @tc.desc Verify Array.of can accept a direct Any value as an element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = 5;
      const result = Array.of<Any>(anyValue);
      expect(result.length).assertEqual(1);
      expect(result.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_OF_8500
     * @tc.name testArrayOf085
     * @tc.desc Verify Array.of supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Array.of<Any>(1, 'two', true);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,two,true');
    });

  });
}
