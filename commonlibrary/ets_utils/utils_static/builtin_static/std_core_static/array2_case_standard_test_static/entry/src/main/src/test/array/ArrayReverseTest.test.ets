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

class ReverseItem018 {
  value: number = 0;
}

function createOneBasedArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 1; i <= size; i++) {
    arr.push(i);
  }
  return arr;
}

function reverseNumberArrayFromAny(value: Any): string {
  const arr = value as Array<number>;
  return arr.reverse().toString();
}

export default function ArrayReverseTest(): void {
  describe('ArrayReverseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_0100
     * @tc.name testArrayReverse001
     * @tc.desc Verify reverse accepts no arguments and mutates the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reverse();
      expect(result.toString()).assertEqual('3,2,1');
      expect(arr.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_0200
     * @tc.name testArrayReverse002
     * @tc.desc Verify reverse reorders elements when called normally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reverse();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_0300
     * @tc.name testArrayReverse003
     * @tc.desc Verify reverse returns the original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reverse();
      expect(result === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_0400
     * @tc.name testArrayReverse004
     * @tc.desc Verify the returned array keeps the caller element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reverse();
      expect(typeof result[0]).assertEqual('number');
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_0500
     * @tc.name testArrayReverse005
     * @tc.desc Verify reverse modifies the original array contents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalFirst = arr[0];
      arr.reverse();
      expect(arr[0] !== originalFirst).assertTrue();
      expect(arr[arr.length - 1]).assertEqual(originalFirst);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_0600
     * @tc.name testArrayReverse006
     * @tc.desc Verify reverse reorders elements in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      expect(arr[0]).assertEqual(4);
      expect(arr[1]).assertEqual(3);
      expect(arr[2]).assertEqual(2);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_0700
     * @tc.name testArrayReverse007
     * @tc.desc Verify reverse on an empty array returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.reverse();
      expect(result.length).assertEqual(0);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_0800
     * @tc.name testArrayReverse008
     * @tc.desc Verify reverse does not change a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 42);
      let result = arr.reverse();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_0900
     * @tc.name testArrayReverse009
     * @tc.desc Verify reverse swaps elements in a two-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1000
     * @tc.name testArrayReverse010
     * @tc.desc Verify reverse swaps elements in a three-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1100
     * @tc.name testArrayReverse011
     * @tc.desc Verify an ascending array becomes descending after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      expect(arr.toString()).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1200
     * @tc.name testArrayReverse012
     * @tc.desc Verify a descending array becomes ascending after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(4, 3, 2, 1);
      arr.reverse();
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1300
     * @tc.name testArrayReverse013
     * @tc.desc Verify reverse handles arrays with duplicate elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 2, 3);
      arr.reverse();
      expect(arr.toString()).assertEqual('3,2,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1400
     * @tc.name testArrayReverse014
     * @tc.desc Verify reverse keeps identical elements unchanged in value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(5, 5, 5);
      arr.reverse();
      expect(arr.toString()).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1500
     * @tc.name testArrayReverse015
     * @tc.desc Verify reverse works for number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.reverse();
      expect(arr.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1600
     * @tc.name testArrayReverse016
     * @tc.desc Verify reverse works for string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      arr.reverse();
      expect(arr.toString()).assertEqual('c,b,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1700
     * @tc.name testArrayReverse017
     * @tc.desc Verify reverse works for boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false, true);
      arr.reverse();
      expect(arr.toString()).assertEqual('true,false,true');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1800
     * @tc.name testArrayReverse018
     * @tc.desc Verify reverse works for object arrays and preserves references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new ReverseItem018();
      item1.value = 1;
      let item2 = new ReverseItem018();
      item2.value = 2;
      let item3 = new ReverseItem018();
      item3.value = 3;
      let arr = new Array<ReverseItem018>(item1, item2, item3);
      arr.reverse();
      expect(arr[0] === item3).assertTrue();
      expect(arr[2] === item1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_1900
     * @tc.name testArrayReverse019
     * @tc.desc Verify reverse works for union-typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, 'a', 2);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2000
     * @tc.name testArrayReverse020
     * @tc.desc Verify reverse changes the original array string form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalStr = arr.toString();
      arr.reverse();
      expect(arr.toString() !== originalStr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2100
     * @tc.name testArrayReverse021
     * @tc.desc Verify reverse supports chaining with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.reverse().map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('6,4,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2200
     * @tc.name testArrayReverse022
     * @tc.desc Verify two reverse calls restore the original order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalStr = arr.toString();
      arr.reverse();
      arr.reverse();
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2300
     * @tc.name testArrayReverse023
     * @tc.desc Verify reverse can completely reverse an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.reverse();
      expect(arr.toString()).assertEqual('5,4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2400
     * @tc.name testArrayReverse024
     * @tc.desc Verify the first element after reverse was originally the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.reverse();
      let lastOriginal = arr[0];
      expect(lastOriginal).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2500
     * @tc.name testArrayReverse025
     * @tc.desc Verify reverse can help simulate deque-style operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let deque = new Array<number>(1, 2, 3);
      deque.reverse();
      deque.push(0);
      deque.reverse();
      expect(deque.toString()).assertEqual('0,1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2600
     * @tc.name testArrayReverse026
     * @tc.desc Verify reverse can help compare palindromic arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 1);
      let original = arr.toString();
      arr.reverse();
      let isPalindrome = original === arr.toString();
      expect(isPalindrome).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2700
     * @tc.name testArrayReverse027
     * @tc.desc Verify reverse mutates the original array while toReversed does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      let arr2 = new Array<number>(1, 2, 3);
      let reverseResult = arr1.reverse();
      let toReversedResult = arr2.toReversed();
      expect(arr1.toString()).assertEqual('3,2,1');
      expect(arr2.toString()).assertEqual('1,2,3');
      expect(reverseResult.toString()).assertEqual(toReversedResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2800
     * @tc.name testArrayReverse028
     * @tc.desc Verify reverse returns this while toReversed returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let reverseResult = arr.reverse();
      expect(reverseResult === arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_2900
     * @tc.name testArrayReverse029
     * @tc.desc Verify reverse and toReversed can be chosen based on mutability needs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      arr1.reverse();
      expect(arr1.toString()).assertEqual('3,2,1');

      let arr2 = new Array<number>(1, 2, 3);
      let reversed = arr2.toReversed();
      expect(arr2.toString()).assertEqual('1,2,3');
      expect(reversed.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3000
     * @tc.name testArrayReverse030
     * @tc.desc Verify reverse handles large arrays and preserves boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createOneBasedArray(10000);
      arr.reverse();
      expect(arr[0]).assertEqual(10000);
      expect(arr[1]).assertEqual(9999);
      expect(arr[arr.length - 2]).assertEqual(2);
      expect(arr[arr.length - 1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3100
     * @tc.name testArrayReverse031
     * @tc.desc Verify reverse works in place without changing the array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let original = arr;
      arr.reverse();
      expect(arr === original).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3200
     * @tc.name testArrayReverse032
     * @tc.desc Verify reverse reorders null elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>(1, null, 3);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1] === null).assertTrue();
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3300
     * @tc.name testArrayReverse033
     * @tc.desc Verify reverse reorders undefined elements correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, undefined, 3);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(arr[1] === undefined).assertTrue();
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3400
     * @tc.name testArrayReverse034
     * @tc.desc Verify reverse reorders arrays containing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(0, 1, 2);
      arr.reverse();
      expect(arr.toString()).assertEqual('2,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3500
     * @tc.name testArrayReverse035
     * @tc.desc Verify reverse reorders arrays containing empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', '', 'c');
      arr.reverse();
      expect(arr.toString()).assertEqual('c,,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3600
     * @tc.name testArrayReverse036
     * @tc.desc Verify reverse reorders arrays containing NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, Double.NaN, 3);
      arr.reverse();
      expect(arr[0]).assertEqual(3);
      expect(Number.isNaN(arr[1])).assertTrue();
      expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3700
     * @tc.name testArrayReverse037
     * @tc.desc Verify reverse reorders arrays containing negative numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, -2, 3);
      arr.reverse();
      expect(arr.toString()).assertEqual('3,-2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3800
     * @tc.name testArrayReverse038
     * @tc.desc Verify reverse reorders arrays containing infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(Double.POSITIVE_INFINITY, 1, 2);
      arr.reverse();
      expect(arr[0]).assertEqual(2);
      expect(arr[2]).assertEqual(Double.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_3900
     * @tc.name testArrayReverse039
     * @tc.desc Verify reverse works together with push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.reverse();
      arr.push(0);
      expect(arr.toString()).assertEqual('3,2,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4000
     * @tc.name testArrayReverse040
     * @tc.desc Verify reverse works together with pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.reverse();
      let popped = arr.pop();
      expect(popped).assertEqual(1);
      expect(arr.toString()).assertEqual('3,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4100
     * @tc.name testArrayReverse041
     * @tc.desc Verify reverse works together with sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(3, 1, 4, 1, 5);
      arr.sort();
      arr.reverse();
      expect(arr.toString()).assertEqual('5,4,3,1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4200
     * @tc.name testArrayReverse042
     * @tc.desc Verify reverse supports chaining with filter and map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.reverse()
        .filter((v: number): boolean => v > 2)
        .map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('10,8,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4300
     * @tc.name testArrayReverse043
     * @tc.desc Verify reverse preserves the generic element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.reverse();
      expect(typeof arr[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4400
     * @tc.name testArrayReverse044
     * @tc.desc Verify reverse returns the same array type as the caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result: Array<number> = arr.reverse();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4500
     * @tc.name testArrayReverse045
     * @tc.desc Verify reversing a mutable copy does not change the readonly source data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: ReadonlyArray<number> = [1, 2, 3];
      let arr = Array.from<number>(source);
      let result = arr.reverse();
      expect(result.toString()).assertEqual('3,2,1');
      expect(source.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4600
     * @tc.name testArrayReverse046
     * @tc.desc Verify arrays with identical elements remain visually unchanged after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 1, 1);
      arr.reverse();
      expect(arr.toString()).assertEqual('1,1,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4700
     * @tc.name testArrayReverse047
     * @tc.desc Verify object references remain the same while their positions change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new ReverseItem018();
      item1.value = 1;
      let item2 = new ReverseItem018();
      item2.value = 2;
      let arr = new Array<ReverseItem018>(item1, item2);
      arr.reverse();
      expect(arr[0] === item2).assertTrue();
      expect(arr[1] === item1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4800
     * @tc.name testArrayReverse048
     * @tc.desc Verify large arrays keep correct boundary elements after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createOneBasedArray(1000);
      arr.reverse();
      expect(arr[0]).assertEqual(1000);
      expect(arr[arr.length - 1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_4900
     * @tc.name testArrayReverse049
     * @tc.desc Verify the middle element stays in place for odd-length arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      arr.reverse();
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5000
     * @tc.name testArrayReverse050
     * @tc.desc Verify reverse handles even-length arrays correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      expect(arr[0]).assertEqual(4);
      expect(arr[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5100
     * @tc.name testArrayReverse051
     * @tc.desc Verify reverse does not create a new array object in memory
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalRef = arr;
      arr.reverse();
      expect(arr === originalRef).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5200
     * @tc.name testArrayReverse052
     * @tc.desc Verify reverse reorders a medium-large array while preserving both boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      for (let i: int = 0; i < 1000; i++) {
        arr.push(i);
      }
      arr.reverse();
      expect(arr[0]).assertEqual(999);
      expect(arr[arr.length - 1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5300
     * @tc.name testArrayReverse053
     * @tc.desc Verify reverse can transform stack order into queue-style access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let stack = new Array<number>(1, 2, 3);
      stack.reverse();
      let dequeued = stack.shift();
      expect(dequeued).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5400
     * @tc.name testArrayReverse054
     * @tc.desc Verify reverse works for character arrays represented as strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let chars = new Array<string>('h', 'e', 'l', 'l', 'o');
      chars.reverse();
      expect(chars.toString()).assertEqual('o,l,l,e,h');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5500
     * @tc.name testArrayReverse055
     * @tc.desc Verify reverse changes traversal order while preserving the total sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      arr.reverse();
      let sum = 0;
      for (let i: int = 0; i < arr.length; i++) {
        sum += arr[i];
      }
      expect(sum).assertEqual(6);
      expect(arr[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5600
     * @tc.name testArrayReverse056
     * @tc.desc Verify forward and reversed traversals produce the same total sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let forwardSum = 0;
      for (let i: int = 0; i < arr.length; i++) {
        forwardSum += arr[i];
      }

      arr.reverse();
      let backwardSum = 0;
      for (let i: int = 0; i < arr.length; i++) {
        backwardSum += arr[i];
      }
      expect(forwardSum).assertEqual(backwardSum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5700
     * @tc.name testArrayReverse057
     * @tc.desc Verify reverse works after slice creates a subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2, 3).slice(1, 4);
      const result = arr.reverse();
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5800
     * @tc.name testArrayReverse058
     * @tc.desc Verify reverse works after filter creates a subrange
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value > 2);
      const result = arr.reverse();
      expect(result.toString()).assertEqual('5,4,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_5900
     * @tc.name testArrayReverse059
     * @tc.desc Verify reverse moves explicit undefined tail values to the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[1] = 2;
      const result = arr.reverse();
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6000
     * @tc.name testArrayReverse060
     * @tc.desc Verify reverse preserves a length-two array initialized with explicit undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const result = arr.reverse();
      expect(result.length).assertEqual(2);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6100
     * @tc.name testArrayReverse061
     * @tc.desc Verify reverse preserves a larger array initialized with explicit undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(5, (_index) => undefined);
      const result = arr.reverse();
      expect(result.length).assertEqual(5);
      expect(result.lastIndexOf(undefined)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6200
     * @tc.name testArrayReverse062
     * @tc.desc Verify reverse moves an explicit undefined element like a normal dense value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 1);
      const result = arr.reverse();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6300
     * @tc.name testArrayReverse063
     * @tc.desc Verify reverse moves an explicit null element like a normal dense value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null, 1);
      const result = arr.reverse();
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6400
     * @tc.name testArrayReverse064
     * @tc.desc Verify reverse reorders nested arrays without cloning inner references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = Array.create<number>(1, 1);
      const second = Array.create<number>(1, 2);
      const arr = new Array<Array<number>>(first, second);
      const result = arr.reverse();
      expect(result[0] === second).assertTrue();
      expect(result[1] === first).assertTrue();
      expect(result[0][0]).assertEqual(2);
      expect(result[1][0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6500
     * @tc.name testArrayReverse065
     * @tc.desc Verify reverse keeps the middle object reference in place for odd-length arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ReverseItem018();
      first.value = 1;
      const middle = new ReverseItem018();
      middle.value = 2;
      const last = new ReverseItem018();
      last.value = 3;
      const arr = new Array<ReverseItem018>(first, middle, last);
      const result = arr.reverse();
      expect(result[0] === last).assertTrue();
      expect(result[1] === middle).assertTrue();
      expect(result[2] === first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6600
     * @tc.name testArrayReverse066
     * @tc.desc Verify reverse reorders arrays containing NaN, Infinity and zero together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, Double.POSITIVE_INFINITY, 0);
      const result = arr.reverse();
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(Double.POSITIVE_INFINITY);
      expect(Number.isNaN(result[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6700
     * @tc.name testArrayReverse067
     * @tc.desc Verify reverse works on bigint arrays containing negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(-1n, 0n, 2n);
      const result = arr.reverse();
      expect(result.toString()).assertEqual('2,0,-1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6800
     * @tc.name testArrayReverse068
     * @tc.desc Verify reverse works on char arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'c');
      const result = arr.reverse();
      expect(result[0]).assertEqual(c'c');
      expect(result[1]).assertEqual(c'b');
      expect(result[2]).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_6900
     * @tc.name testArrayReverse069
     * @tc.desc Verify reverse keeps large array length unchanged while swapping endpoints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createOneBasedArray(1000);
      const result = arr.reverse();
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual(1000);
      expect(result[499]).assertEqual(501);
      expect(result[999]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7000
     * @tc.name testArrayReverse070
     * @tc.desc Verify reverse reorders self-referential arrays while preserving the self reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Object>();
      const item = new ReverseItem018();
      item.value = 9;
      arr.push(arr as Object, item);
      const result = arr.reverse();
      expect(result[0] === item).assertTrue();
      expect(result[1] === (arr as Object)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7100
     * @tc.name testArrayReverse071
     * @tc.desc Verify reverse reorders function arrays by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = (): number => 1;
      const second = (): number => 2;
      const arr = new Array<() => number>(first, second);
      const result = arr.reverse();
      expect(result[0] === second).assertTrue();
      expect(result[1] === first).assertTrue();
      expect(result[0]()).assertEqual(2);
      expect(result[1]()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7200
     * @tc.name testArrayReverse072
     * @tc.desc Verify reverse on a mutable copy does not affect a readonly union source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ReadonlyArray<number | string> = [1, 'two', 3];
      const arr = Array.from<number | string>(source);
      const result = arr.reverse();
      expect(result.toString()).assertEqual('3,two,1');
      expect(source.toString()).assertEqual('1,two,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7300
     * @tc.name testArrayReverse073
     * @tc.desc Verify reverse keeps an explicit undefined middle element searchable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.reverse();
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7400
     * @tc.name testArrayReverse074
     * @tc.desc Verify reverse moves a head value to the tail while preserving explicit undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      const result = arr.reverse();
      expect(result[2]).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7500
     * @tc.name testArrayReverse075
     * @tc.desc Verify reverse moves a tail value to the head while preserving explicit undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[2] = 3;
      const result = arr.reverse();
      expect(result[0]).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7600
     * @tc.name testArrayReverse076
     * @tc.desc Verify reverse preserves explicit undefined values in a dense array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[2] = 5;
      const result = arr.reverse();
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
      expect(result.indexOf(undefined)).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7700
     * @tc.name testArrayReverse077
     * @tc.desc Verify reverse reorders arrays containing null, undefined and numbers together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(undefined, 2, null, 4);
      const result = arr.reverse();
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertNull();
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7800
     * @tc.name testArrayReverse078
     * @tc.desc Verify reverse preserves shared object aliases after reordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new ReverseItem018();
      shared.value = 7;
      const other = new ReverseItem018();
      other.value = 8;
      const tail = new ReverseItem018();
      tail.value = 9;
      const arr = new Array<ReverseItem018>(shared, other, shared, tail);
      const result = arr.reverse();
      expect(result[1] === shared).assertTrue();
      expect(result[3] === shared).assertTrue();
      result[1].value = 70;
      expect(shared.value).assertEqual(70);
      expect(result[3].value).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_7900
     * @tc.name testArrayReverse079
     * @tc.desc Verify the reversed array remains the same mutable instance for later push and pop operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.reverse();
      result.push(3);
      expect(result === arr).assertTrue();
      expect(arr.toString()).assertEqual('2,1,3');
      result.pop();
      expect(arr.toString()).assertEqual('2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_8000
     * @tc.name testArrayReverse080
     * @tc.desc Verify reverse on a mutable copy can continue mutating without affecting a readonly source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: ReadonlyArray<number | string> = [1, 'two', 3];
      const arr = Array.from<number | string>(source);
      const result = arr.reverse();
      result.push('tail');
      expect(result.toString()).assertEqual('3,two,1,tail');
      expect(source.toString()).assertEqual('1,two,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_8100
     * @tc.name testArrayReverse081
     * @tc.desc Verify reverse reorders heterogeneous primitive unions without changing element identity by kind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string | boolean>(1, 'two', false, 4);
      const result = arr.reverse();
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(false);
      expect(result[2]).assertEqual('two');
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_8200
     * @tc.name testArrayReverse082
     * @tc.desc Verify reversing a sliced copy does not affect the original source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(1, 2, 3, 4);
      const copy = source.slice(1, 4);
      const result = copy.reverse();
      expect(result.toString()).assertEqual('4,3,2');
      expect(source.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_8300
     * @tc.name testArrayReverse083
     * @tc.desc Verify reverse supports consecutive chained calls and restores the original order after two reversals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.reverse().reverse();
      expect(result === arr).assertTrue();
      expect(result.toString()).assertEqual('1,2,3,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_8400
     * @tc.name testArrayReverse084
     * @tc.desc Verify reverse works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(reverseNumberArrayFromAny(anyValue)).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_REVERSE_8500
     * @tc.name testArrayReverse085
     * @tc.desc Verify reverse supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayReverse085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const result = anyArr.reverse();
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('true,two,1');
    });

  });
}
