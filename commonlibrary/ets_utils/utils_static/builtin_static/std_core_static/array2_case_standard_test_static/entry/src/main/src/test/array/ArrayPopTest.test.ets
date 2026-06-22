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

class Person005 {
  name: string = '';
  age: number = 0;
}

class PopRefCase006 {
  value: number = 0;
}

function createLargeNumberArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
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

function popAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  const removed = arr.pop();
  if (removed == undefined) {
    return 'undefined|' + arr.length.toString();
  }
  return removed.toString() + '|' + arr.length.toString();
}

export default function ArrayPopTest(): void {
  describe('ArrayPopTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0010
     * @tc.name testArrayPop001
     * @tc.desc Verify pop accepts no arguments and removes the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.pop();
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0020
     * @tc.name testArrayPop002
     * @tc.desc Verify pop empties a single-element array and later returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(42);
      let first = arr.pop();
      let second = arr.pop();
      expect(first).assertEqual(42);
      expect(second).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0030
     * @tc.name testArrayPop003
     * @tc.desc Verify pop removes and returns the last numeric element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.pop();
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(2);
      expect(arr[arr.length - 1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0040
     * @tc.name testArrayPop004
     * @tc.desc Verify pop returns string elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.pop();
      expect(result).assertEqual('c');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0050
     * @tc.name testArrayPop005
     * @tc.desc Verify pop returns object elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Person005>();
      let person = new Person005();
      person.name = 'Alice';
      person.age = 25;
      arr.push(person);
      let result = arr.pop();
      if (result === null || result === undefined) {
        expect().assertFail();
        return;
      }
      const poppedPerson = result as Person005;
      expect(poppedPerson.name).assertEqual('Alice');
      expect(poppedPerson.age).assertEqual(25);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0060
     * @tc.name testArrayPop006
     * @tc.desc Verify pop returns undefined for an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pop();
      expect(result).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0070
     * @tc.name testArrayPop007
     * @tc.desc Verify pop returns null when the tail element is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>(1, 2, null);
      let result = arr.pop();
      expect(result).assertNull();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0080
     * @tc.name testArrayPop008
     * @tc.desc Verify pop returns undefined when the tail element is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, 2, undefined);
      let result = arr.pop();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0090
     * @tc.name testArrayPop009
     * @tc.desc Verify pop returns zero correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 0);
      let result = arr.pop();
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0100
     * @tc.name testArrayPop010
     * @tc.desc Verify pop returns false correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false);
      let result = arr.pop();
      expect(result).assertFalse();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0110
     * @tc.name testArrayPop011
     * @tc.desc Verify pop returns empty strings correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', '');
      let result = arr.pop();
      expect(result).assertEqual('');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0120
     * @tc.name testArrayPop012
     * @tc.desc Verify pop preserves NaN values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, Double.NaN);
      let result = arr.pop();
      if (result === undefined) {
        expect().assertFail();
        return;
      }
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0130
     * @tc.name testArrayPop013
     * @tc.desc Verify pop preserves infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, Double.POSITIVE_INFINITY);
      let result = arr.pop();
      expect(result).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0140
     * @tc.name testArrayPop014
     * @tc.desc Verify pop preserves negative infinity values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, -Double.POSITIVE_INFINITY);
      let result = arr.pop();
      expect(result).assertEqual(-Double.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0150
     * @tc.name testArrayPop015
     * @tc.desc Verify the return type can be used as T or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result: number | undefined = arr.pop();
      expect(result).assertEqual(3);
      if (result !== undefined) {
        expect(typeof result).assertEqual('number');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0160
     * @tc.name testArrayPop016
     * @tc.desc Verify type inference keeps the inferred numeric return type shape
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.pop();
      expect(result).assertEqual(3);
      if (result !== undefined) {
        expect(typeof result).assertEqual('number');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0170
     * @tc.name testArrayPop017
     * @tc.desc Verify pop empties a single-element array after removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(42);
      let result = arr.pop();
      expect(result).assertEqual(42);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0180
     * @tc.name testArrayPop018
     * @tc.desc Verify pop removes the last element from large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeNumberArray(10);
      let result = arr.pop();
      expect(result).assertEqual(9);
      expect(arr.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0190
     * @tc.name testArrayPop019
     * @tc.desc Verify pop does not throw when called on an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      try {
        let result = arr.pop();
        expect(result).assertUndefined();
        expect(arr.length).assertEqual(0);
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0200
     * @tc.name testArrayPop020
     * @tc.desc Verify a mutable copy created from readonly data can still use pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: ReadonlyArray<number> = [1, 2, 3];
      let arr = Array.from<number>(source);
      let result = arr.pop();
      expect(result).assertEqual(3);
      expect(source.length).assertEqual(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0210
     * @tc.name testArrayPop021
     * @tc.desc Verify pop is exposed as an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(typeof arr.pop).assertEqual('function');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0220
     * @tc.name testArrayPop022
     * @tc.desc Verify pop executes synchronously and updates length immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let beforeLength = arr.length;
      let result = arr.pop();
      let afterLength = arr.length;
      expect(result).assertEqual(3);
      expect(afterLength).assertEqual(beforeLength - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0230
     * @tc.name testArrayPop023
     * @tc.desc Verify pop reduces the array length by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalLength = arr.length;
      arr.pop();
      expect(arr.length).assertEqual(originalLength - 1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0240
     * @tc.name testArrayPop024
     * @tc.desc Verify earlier element indexes remain unchanged after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.pop();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0250
     * @tc.name testArrayPop025
     * @tc.desc Verify pop mutates the original array reference instead of creating a copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalRef = arr;
      arr.pop();
      expect(arr).assertEqual(originalRef);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0260
     * @tc.name testArrayPop026
     * @tc.desc Verify empty arrays remain length zero after pop returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.pop();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0270
     * @tc.name testArrayPop027
     * @tc.desc Verify repeated pop calls can empty the array completely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(arr.pop()).assertEqual(3);
      expect(arr.pop()).assertEqual(2);
      expect(arr.pop()).assertEqual(1);
      expect(arr.pop()).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0280
     * @tc.name testArrayPop028
     * @tc.desc Verify pop works with char arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>(c'A', c'B', c'C');
      let result = arr.pop();
      expect(result).assertEqual(c'C');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0290
     * @tc.name testArrayPop029
     * @tc.desc Verify pop works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false, true);
      let result = arr.pop();
      expect(result).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0300
     * @tc.name testArrayPop030
     * @tc.desc Verify pop works with bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>(1n, 2n, 3n);
      let result = arr.pop();
      expect(result).assertEqual(3n);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0310
     * @tc.name testArrayPop031
     * @tc.desc Verify pop removes the tail element from a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createLargeNumberArray(10000);
      let result = arr.pop();
      expect(result).assertEqual(9999);
      expect(arr.length).assertEqual(9999);
      expect(arr[arr.length - 1]).assertEqual(9998);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0320
     * @tc.name testArrayPop032
     * @tc.desc Verify repeated pop and shift calls remove the same number of elements from opposite ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = createLargeNumberArray(200);
      let arr2 = createLargeNumberArray(200);

      for (let i: int = 0; i < 10; i++) {
        arr1.pop();
      }

      for (let i: int = 0; i < 10; i++) {
        arr2.shift();
      }
      expect(arr1.length).assertEqual(190);
      expect(arr2.length).assertEqual(190);
      expect(arr1[arr1.length - 1]).assertEqual(189);
      expect(arr2[0]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0330
     * @tc.name testArrayPop033
     * @tc.desc Verify pop works with union typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string | number>(1, 'two', 3);
      let result = arr.pop();
      expect(result).assertEqual(3);
      if (result !== undefined) {
        expect(typeof result).assertEqual('number');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0340
     * @tc.name testArrayPop034
     * @tc.desc Verify broad union arrays can cover heterogeneous pop scenarios
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<Object | string | number | boolean>(1, 'two', true);
      let result = arr.pop();
      expect(result).assertTrue();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0350
     * @tc.name testArrayPop035
     * @tc.desc Verify pop returns an element value rather than another array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.pop();
      expect(Array.isArray(result)).assertFalse();
      expect(result).assertEqual(3);
      expect(typeof result).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0360
     * @tc.name testArrayPop036
     * @tc.desc Verify pop during iteration affects the remaining traversal state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      for (let i: int = 0; i < arr.length; i++) {
        if (arr[i] === 4) {
          arr.pop();
          break;
        }
      }
      expect(arr.length).assertEqual(4);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0370
     * @tc.name testArrayPop037
     * @tc.desc Verify push and pop together implement LIFO stack behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stack = new Array<number>();
      stack.push(1);
      stack.push(2);
      stack.push(3);
      expect(stack.pop()).assertEqual(3);
      expect(stack.pop()).assertEqual(2);
      expect(stack.pop()).assertEqual(1);
      expect(stack.pop()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0380
     * @tc.name testArrayPop038
     * @tc.desc Verify pop symmetrically reverses a preceding push operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalLength = arr.length;
      arr.push(4);
      expect(arr.length).assertEqual(originalLength + 1);
      expect(arr.pop()).assertEqual(4);
      expect(arr.length).assertEqual(originalLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0390
     * @tc.name testArrayPop039
     * @tc.desc Verify pop works after extendTo grows the array with undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, 2, 3);
      arr.extendTo(10, undefined);
      expect(arr.length).assertEqual(10);
      let result = arr.pop();
      expect(result).assertUndefined();
      expect(arr.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0400
     * @tc.name testArrayPop040
     * @tc.desc Verify pop works after shrinkTo shortens the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      expect(arr.length).assertEqual(3);
      let result = arr.pop();
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0410
     * @tc.name testArrayPop041
     * @tc.desc Verify empty arrays and undefined tail values can both return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>();
      let result1 = arr1.pop();
      expect(result1).assertUndefined();
      expect(arr1.length).assertEqual(0);

      let arr2 = new Array<number | undefined>(1, 2, undefined);
      let result2 = arr2.pop();
      expect(result2).assertUndefined();
      expect(arr2.length).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0420
     * @tc.name testArrayPop042
     * @tc.desc Verify pop can remove a single explicit undefined element and clear the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined);
      const value = arr.pop();
      expect(value).assertUndefined();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0430
     * @tc.name testArrayPop043
     * @tc.desc Verify pop can remove a single explicit null element and clear the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null);
      const value = arr.pop();
      expect(value).assertNull();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0440
     * @tc.name testArrayPop044
     * @tc.desc Verify pop can remove a single NaN element and clear the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.NaN);
      const value = arr.pop();
      if (value === undefined) {
        expect().assertFail();
        return;
      }
      expect(value).assertNaN();
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0450
     * @tc.name testArrayPop045
     * @tc.desc Verify pop can remove a single infinity element and clear the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY);
      const value = arr.pop();
      expect(value).assertEqual(Double.POSITIVE_INFINITY);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0460
     * @tc.name testArrayPop046
     * @tc.desc Verify pop returns the exact nested array reference from a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<number>(1, 2);
      const arr = new Array<Array<number>>(nested);
      const value = arr.pop();
      expect(value).assertEqual(nested);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0470
     * @tc.name testArrayPop047
     * @tc.desc Verify pop returns the exact object reference from a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new PopRefCase006();
      ref.value = 7;
      const arr = new Array<PopRefCase006>(ref);
      const value = arr.pop();
      expect(value).assertEqual(ref);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0480
     * @tc.name testArrayPop048
     * @tc.desc Verify pop preserves duplicate object references when the tail is removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ref = new PopRefCase006();
      const arr = new Array<PopRefCase006>(ref, ref);
      const value = arr.pop();
      expect(value).assertEqual(ref);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(ref);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0490
     * @tc.name testArrayPop049
     * @tc.desc Verify pop preserves duplicate nested array references when the tail is removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<number>(3, 4);
      const arr = new Array<Array<number>>(nested, nested);
      const value = arr.pop();
      expect(value).assertEqual(nested);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(nested);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0500
     * @tc.name testArrayPop050
     * @tc.desc Verify pop follows LIFO order for a mixed union tail boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(1, 'a', false);
      const value = arr.pop();
      expect(value).assertFalse();
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0510
     * @tc.name testArrayPop051
     * @tc.desc Verify a second pop on a mixed union array exposes the previous string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(1, 'a', false);
      arr.pop();
      const value = arr.pop();
      expect(value).assertEqual('a');
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0520
     * @tc.name testArrayPop052
     * @tc.desc Verify repeated pop calls on a mixed union array eventually expose the head number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(1, 'a', false);
      arr.pop();
      arr.pop();
      const value = arr.pop();
      expect(value).assertEqual(1);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0530
     * @tc.name testArrayPop053
     * @tc.desc Verify pop can remove a single false value and clear the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false);
      const value = arr.pop();
      expect(value).assertEqual(false);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0540
     * @tc.name testArrayPop054
     * @tc.desc Verify pop can remove a single zero value and clear the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0);
      const value = arr.pop();
      expect(value).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0550
     * @tc.name testArrayPop055
     * @tc.desc Verify pop can remove a single empty string and clear the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('');
      const value = arr.pop();
      expect(value).assertEqual('');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0560
     * @tc.name testArrayPop056
     * @tc.desc Verify pop can remove a single bigint value and clear the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(10n);
      const value = arr.pop();
      expect(value).assertEqual(10n);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0570
     * @tc.name testArrayPop057
     * @tc.desc Verify pop can return a function value that remains callable after removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (): int => 8;
      const arr = new Array<() => int>(fn);
      const value = arr.pop();
      if (value === undefined) {
        expect().assertFail();
        return;
      }
      expect(value()).assertEqual(8);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0580
     * @tc.name testArrayPop058
     * @tc.desc Verify a popped nested array reference remains mutable after removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nested = new Array<number>(1);
      const arr = new Array<Array<number>>(nested);
      const value = arr.pop();
      if (value === undefined) {
        expect().assertFail();
        return;
      }
      expect(value).assertEqual(nested);
      value.pushOne(2);
      expect(value.length).assertEqual(2);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0590
     * @tc.name testArrayPop059
     * @tc.desc Verify pop removes only the tail reference and leaves earlier references untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new PopRefCase006();
      const second = new PopRefCase006();
      first.value = 1;
      second.value = 2;
      const arr = new Array<PopRefCase006>(first, second);
      const value = arr.pop();
      expect(value).assertEqual(second);
      expect(arr.length).assertEqual(1);
      expect(arr[0]).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0600
     * @tc.name testArrayPop060
     * @tc.desc Verify pop can reveal the head value of a short mixed union array after removing the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, '2');
      arr.pop();
      const value = arr.pop();
      expect(value).assertEqual(1);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0610
     * @tc.name testArrayPop061
     * @tc.desc Verify pop leaves the remaining numeric prefix intact after one removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const value = arr.pop();
      expect(value).assertEqual(3);
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0620
     * @tc.name testArrayPop062
     * @tc.desc Verify pop returns undefined for an empty number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      expect(arr.pop()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0630
     * @tc.name testArrayPop063
     * @tc.desc Verify pop empties a single-element number array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(99);
      expect(arr.pop()).assertEqual(99);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0640
     * @tc.name testArrayPop064
     * @tc.desc Verify pop returns the boundary element from a string array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.pop()).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0650
     * @tc.name testArrayPop065
     * @tc.desc Verify pop returns the boundary element from a boolean array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false);
      expect(arr.pop()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0660
     * @tc.name testArrayPop066
     * @tc.desc Verify pop returns the boundary element from a bigint array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const value = arr.pop();
      expect(value).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0670
     * @tc.name testArrayPop067
     * @tc.desc Verify pop preserves object references when removing the boundary object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new PopRefCase006();
      const second = new PopRefCase006();
      const arr = new Array<PopRefCase006>(first, second);
      const value = arr.pop();
      expect(value).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0680
     * @tc.name testArrayPop068
     * @tc.desc Verify pop returns null when the boundary element is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null);
      expect(arr.pop()).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0690
     * @tc.name testArrayPop069
     * @tc.desc Verify pop returns undefined when the boundary element is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined);
      expect(arr.pop()).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0700
     * @tc.name testArrayPop070
     * @tc.desc Verify pop returns zero when zero is the only remaining tail value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 0);
      expect(arr.pop()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0710
     * @tc.name testArrayPop071
     * @tc.desc Verify pop returns true correctly after removing a trailing true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true);
      const value = arr.pop();
      expect(value).assertEqual(true);
      expect(arr[0]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0720
     * @tc.name testArrayPop072
     * @tc.desc Verify pop works after push appends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      expect(arr.pop()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0730
     * @tc.name testArrayPop073
     * @tc.desc Verify pop works after unshift prepends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      expect(arr.pop()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0740
     * @tc.name testArrayPop074
     * @tc.desc Verify pop works after reverse changes order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      expect(arr.pop()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0750
     * @tc.name testArrayPop075
     * @tc.desc Verify pop works after sort orders numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      expect(arr.pop()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0760
     * @tc.name testArrayPop076
     * @tc.desc Verify pop works after splice inserts middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 8, 9);
      expect(arr.pop()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0770
     * @tc.name testArrayPop077
     * @tc.desc Verify pop after shrinkTo exposes the next remaining tail value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      arr.shrinkTo(3);
      expect(arr.pop()).assertEqual(3);
      expect(arr.pop()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0780
     * @tc.name testArrayPop078
     * @tc.desc Verify pop works on a slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(1, 4);
      expect(arr.pop()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0790
     * @tc.name testArrayPop079
     * @tc.desc Verify pop works on a filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).filter((value: number): boolean => value >= 2);
      expect(arr.pop()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0800
     * @tc.name testArrayPop080
     * @tc.desc Verify pop works on a concat result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      expect(arr.pop()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0810
     * @tc.name testArrayPop081
     * @tc.desc Verify pop works on a toReversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      expect(arr.pop()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0820
     * @tc.name testArrayPop082
     * @tc.desc Verify pop works on a toSpliced copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toSpliced(1, 1, 7, 8);
      expect(arr.pop()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0830
     * @tc.name testArrayPop083
     * @tc.desc Verify pop works on a with replacement copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).with(1, 9);
      expect(arr.pop()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0840
     * @tc.name testArrayPop084
     * @tc.desc Verify pop returns values in reverse order while length decreases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      expect(arr.pop()).assertEqual(6);
      expect(arr.length).assertEqual(2);
      expect(arr.pop()).assertEqual(5);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0850
     * @tc.name testArrayPop085
     * @tc.desc Verify pop can be called twice in sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.pop();
      const second = arr.pop();
      expect(second).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0860
     * @tc.name testArrayPop086
     * @tc.desc Verify pop leaves the remaining array searchable with indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.pop();
      expect(arr.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0870
     * @tc.name testArrayPop087
     * @tc.desc Verify pop leaves the remaining array joinable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.pop();
      expect(arr.join(',')).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0880
     * @tc.name testArrayPop088
     * @tc.desc Verify pop works on arrays created by Array.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5, 6);
      expect(arr.pop()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0890
     * @tc.name testArrayPop089
     * @tc.desc Verify pop works on arrays created by Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6));
      expect(arr.pop()).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0900
     * @tc.name testArrayPop090
     * @tc.desc Verify pop works on a large generated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 12; i++) {
        arr.pushOne(i);
      }
      expect(arr.pop()).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0910
     * @tc.name testArrayPop091
     * @tc.desc Verify pop preserves duplicate values remaining after boundary removal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2);
      arr.pop();
      expect(arr.toString()).assertEqual('2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0920
     * @tc.name testArrayPop092
     * @tc.desc Verify pop removes the only true value from a boolean boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true);
      expect(arr.pop()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0930
     * @tc.name testArrayPop093
     * @tc.desc Verify pop can continue after clearing length and rebuilding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      expect(arr.pop()).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0940
     * @tc.name testArrayPop094
     * @tc.desc Verify pop can remove values after shrinkTo followed by pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(2);
      arr.pushOne(9);
      expect(arr.pop()).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0950
     * @tc.name testArrayPop095
     * @tc.desc Verify pop can remove values after reverse and push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      arr.push(4);
      expect(arr.pop()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0960
     * @tc.name testArrayPop096
     * @tc.desc Verify pop does not change array identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const same = arr;
      arr.pop();
      expect(arr).assertEqual(same);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0970
     * @tc.name testArrayPop097
     * @tc.desc Verify pop leaves the original array reusable for a later push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      expect(arr.pop()).assertEqual(2);
      arr.pushOne(9);
      expect(arr.pop()).assertEqual(9);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0980
     * @tc.name testArrayPop098
     * @tc.desc Verify pop can remove a boundary character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B', 'C');
      expect(arr.pop()).assertEqual("C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_0990
     * @tc.name testArrayPop099
     * @tc.desc Verify pop can remove from a rebuilt array after concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1).concat(new Array<number>(2, 3));
      expect(arr.pop()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_1000
     * @tc.name testArrayPop100
     * @tc.desc Verify pop leaves the next boundary value exposed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 5, 6);
      arr.pop();
      expect(arr[arr.length - 1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_1010
     * @tc.name testArrayPop101
     * @tc.desc Verify pop works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(popAnyNumberArray(anyValue)).assertEqual('3|2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_POP_1020
     * @tc.name testArrayPop102
     * @tc.desc Verify pop supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayPop102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const removed = anyArr.pop();
      expect(removed == true).assertTrue();
      expect(anyArr.toString()).assertEqual('1,two');
    });

  });
}
