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

class ToReversedItem014 {
  value: number = 0;
}

function createOneBasedArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 1; i <= size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function createZeroBasedArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function getReversedCopy051<T>(arr: Array<T>): Array<T> {
  return arr.toReversed();
}

function isNegativeZero(value: number): boolean {
  return value === 0 && 1 / value === -Double.POSITIVE_INFINITY;
}

function isFullyReversed(source: Array<number>, result: Array<number>): boolean {
  if (source.length !== result.length) {
    return false;
  }
  for (let i: int = 0; i < source.length; i++) {
    if (result[i] !== source[source.length - 1 - i]) {
      return false;
    }
  }
  return true;
}

function toReversedFromAnyNumberArray(value: Any): string {
  const arr = value as Array<number>;
  return arr.toReversed().toString();
}

export default function ArrayToReversedTest(): void {
  describe('ArrayToReversedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_0100
     * @tc.name testArrayToReversed001
     * @tc.desc Verify toReversed can be called without arguments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('3,2,1');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_0200
     * @tc.name testArrayToReversed002
     * @tc.desc Verify toReversed returns a reversed copy while leaving the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed();
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('3,2,1');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_0300
     * @tc.name testArrayToReversed003
     * @tc.desc Verify toReversed returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed();
      expect(Array.isArray(result)).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_0400
     * @tc.name testArrayToReversed004
     * @tc.desc Verify toReversed does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalStr = arr.toString();
      arr.toReversed();
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_0500
     * @tc.name testArrayToReversed005
     * @tc.desc Verify toReversed returns elements in reverse order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(3);
      expect(result[2]).assertEqual(2);
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_0600
     * @tc.name testArrayToReversed006
     * @tc.desc Verify the returned type remains Array of the same element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result: Array<number> = arr.toReversed();
      expect(typeof result[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_0700
     * @tc.name testArrayToReversed007
     * @tc.desc Verify toReversed returns an empty array for empty input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.toReversed();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_0800
     * @tc.name testArrayToReversed008
     * @tc.desc Verify a single-element array stays unchanged after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 42);
      const result = arr.toReversed();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_0900
     * @tc.name testArrayToReversed009
     * @tc.desc Verify a two-element array is reversed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1000
     * @tc.name testArrayToReversed010
     * @tc.desc Verify a three-element array is reversed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1100
     * @tc.name testArrayToReversed011
     * @tc.desc Verify an ascending array becomes descending after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('4,3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1200
     * @tc.name testArrayToReversed012
     * @tc.desc Verify a descending array becomes ascending after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 3, 2, 1);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1300
     * @tc.name testArrayToReversed013
     * @tc.desc Verify arrays with duplicate elements are reversed correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 2, 3);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('3,2,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1400
     * @tc.name testArrayToReversed014
     * @tc.desc Verify arrays with identical elements keep the same values after reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 5, 5);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1500
     * @tc.name testArrayToReversed015
     * @tc.desc Verify number arrays support toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1600
     * @tc.name testArrayToReversed016
     * @tc.desc Verify string arrays support toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('c,b,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1700
     * @tc.name testArrayToReversed017
     * @tc.desc Verify boolean arrays support toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('true,false,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1800
     * @tc.name testArrayToReversed018
     * @tc.desc Verify object arrays preserve element references after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new ToReversedItem014();
      item1.value = 1;
      let item2 = new ToReversedItem014();
      item2.value = 2;
      let item3 = new ToReversedItem014();
      item3.value = 3;
      const arr = new Array<ToReversedItem014>(item1, item2, item3);
      const result = arr.toReversed();
      expect(result[0] === item3).assertTrue();
      expect(result[2] === item1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_1900
     * @tc.name testArrayToReversed019
     * @tc.desc Verify union-typed arrays support toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'a', 2);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2000
     * @tc.name testArrayToReversed020
     * @tc.desc Verify bigint arrays support toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2100
     * @tc.name testArrayToReversed021
     * @tc.desc Verify toReversed does not mutate original length or boundary elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const originalLast = arr[arr.length - 1];
      arr.toReversed();
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[arr.length - 1]).assertEqual(originalLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2200
     * @tc.name testArrayToReversed022
     * @tc.desc Verify the returned array is independent from the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed();
      result[0] = 999;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2300
     * @tc.name testArrayToReversed023
     * @tc.desc Verify each toReversed call returns a distinct array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result1 = arr.toReversed();
      const result2 = arr.toReversed();
      expect(result1 !== result2).assertTrue();
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2400
     * @tc.name testArrayToReversed024
     * @tc.desc Verify the original array remains usable after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const reversed = arr.toReversed();
      arr.push(4);
      expect(arr.toString()).assertEqual('1,2,3,4');
      expect(reversed.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2500
     * @tc.name testArrayToReversed025
     * @tc.desc Verify toReversed does not mutate the original array while reverse does
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const arr2 = new Array<number>(1, 2, 3);
      const toReversedResult = arr1.toReversed();
      const reverseResult = arr2.reverse();
      expect(arr1.toString()).assertEqual('1,2,3');
      expect(arr2.toString()).assertEqual('3,2,1');
      expect(toReversedResult.toString()).assertEqual(reverseResult.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2600
     * @tc.name testArrayToReversed026
     * @tc.desc Verify reverse returns this while toReversed returns a new array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const reverseResult = arr1.reverse();
      expect(reverseResult === arr1).assertTrue();

      const arr2 = new Array<number>(1, 2, 3);
      const toReversedResult = arr2.toReversed();
      expect(toReversedResult !== arr2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2700
     * @tc.name testArrayToReversed027
     * @tc.desc Verify reverse and toReversed can be selected based on mutability needs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const reversedCopy = arr1.toReversed();
      expect(arr1.toString()).assertEqual('1,2,3');
      expect(reversedCopy.toString()).assertEqual('3,2,1');

      const arr2 = new Array<number>(1, 2, 3);
      arr2.reverse();
      expect(arr2.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2800
     * @tc.name testArrayToReversed028
     * @tc.desc Verify toReversed and reverse both support chained map calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const result1 = arr1.toReversed().map((v: number): number => v * 2);
      expect(arr1.toString()).assertEqual('1,2,3');
      expect(result1.toString()).assertEqual('6,4,2');

      const arr2 = new Array<number>(1, 2, 3);
      const result2 = arr2.reverse().map((v: number): number => v * 2);
      expect(arr2.toString()).assertEqual('3,2,1');
      expect(result2.toString()).assertEqual('6,4,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_2900
     * @tc.name testArrayToReversed029
     * @tc.desc Verify toReversed can create a reversed copy without changing the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Array<number>(1, 2, 3, 4, 5);
      const reversed = original.toReversed();
      expect(reversed.toString()).assertEqual('5,4,3,2,1');
      expect(original.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3000
     * @tc.name testArrayToReversed030
     * @tc.desc Verify the original array preserves its element order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.toReversed();
      expect(arr[0]).assertEqual(1);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3100
     * @tc.name testArrayToReversed031
     * @tc.desc Verify forward and backward traversal can use original and reversed copies together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const reversed = arr.toReversed();
      let forwardSum = 0;
      for (let i: int = 0; i < arr.length; i++) {
        forwardSum += arr[i];
      }
      let backwardSum = 0;
      for (let i: int = 0; i < reversed.length; i++) {
        backwardSum += reversed[i];
      }
      expect(forwardSum).assertEqual(backwardSum);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3200
     * @tc.name testArrayToReversed032
     * @tc.desc Verify toReversed supports chained operations with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed().map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('6,4,2');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3300
     * @tc.name testArrayToReversed033
     * @tc.desc Verify toReversed can be used in a generic function pipeline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const reversed = getReversedCopy051(arr);
      expect(reversed.toString()).assertEqual('3,2,1');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3400
     * @tc.name testArrayToReversed034
     * @tc.desc Verify large arrays are fully reversed by toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createOneBasedArray(10000);
      const result = arr.toReversed();
      expect(isFullyReversed(arr, result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3500
     * @tc.name testArrayToReversed035
     * @tc.desc Verify toReversed allocates a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const original = arr;
      const result = arr.toReversed();
      expect(result !== original).assertTrue();
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3600
     * @tc.name testArrayToReversed036
     * @tc.desc Verify toReversed and reverse produce the same reversed ordering
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = createZeroBasedArray(1000);
      const arr2 = createZeroBasedArray(1000);
      const result1 = arr1.toReversed();
      arr2.reverse();
      expect(result1.toString()).assertEqual(arr2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3700
     * @tc.name testArrayToReversed037
     * @tc.desc Verify null elements keep reversed positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(null);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3800
     * @tc.name testArrayToReversed038
     * @tc.desc Verify undefined elements keep reversed positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(undefined);
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_3900
     * @tc.name testArrayToReversed039
     * @tc.desc Verify zero values keep reversed positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('2,1,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4000
     * @tc.name testArrayToReversed040
     * @tc.desc Verify empty string elements keep reversed positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', '', 'c');
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('c,,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4100
     * @tc.name testArrayToReversed041
     * @tc.desc Verify NaN elements keep reversed positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, NaN, 3);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(Number.isNaN(result[1])).assertTrue();
      expect(result[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4200
     * @tc.name testArrayToReversed042
     * @tc.desc Verify negative numbers keep reversed positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, -2, 3);
      const result = arr.toReversed();
      expect(result.toString()).assertEqual('3,-2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4300
     * @tc.name testArrayToReversed043
     * @tc.desc Verify Infinity values keep reversed positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Infinity, 1, 2);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4400
     * @tc.name testArrayToReversed044
     * @tc.desc Verify element types remain unchanged after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed();
      expect(typeof result[0]).assertEqual('number');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4500
     * @tc.name testArrayToReversed045
     * @tc.desc Verify the return type can be used as Array of the original element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result: Array<number> = arr.toReversed();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4600
     * @tc.name testArrayToReversed046
     * @tc.desc Verify different generic arrays all support toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const r1 = arr1.toReversed();
      expect(r1.toString()).assertEqual('3,2,1');

      const arr2 = new Array<string>('a', 'b', 'c');
      const r2 = arr2.toReversed();
      expect(r2.toString()).assertEqual('c,b,a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4700
     * @tc.name testArrayToReversed047
     * @tc.desc Verify union-typed arrays preserve values after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | string>(1, 'a', 2, 'b');
      const result = arr.toReversed();
      expect(result[0]).assertEqual('b');
      expect(result[3]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4800
     * @tc.name testArrayToReversed048
     * @tc.desc Verify toReversed can be combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed().map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('6,4,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_4900
     * @tc.name testArrayToReversed049
     * @tc.desc Verify toReversed can be combined with filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const filtered = arr.filter((v: number): boolean => v > 2);
      const result = filtered.toReversed();
      expect(result.toString()).assertEqual('5,4,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5000
     * @tc.name testArrayToReversed050
     * @tc.desc Verify toReversed can be combined with slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const sliced = arr.slice(0, 3);
      const result = sliced.toReversed();
      expect(result.toString()).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5100
     * @tc.name testArrayToReversed051
     * @tc.desc Verify multiple array methods can be chained with toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr
        .filter((v: number): boolean => v > 1)
        .toReversed()
        .slice(0, 3);
      expect(result.toString()).assertEqual('5,4,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5200
     * @tc.name testArrayToReversed052
     * @tc.desc Verify toReversed can be combined with toSorted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 4, 1, 5);
      const sorted = arr.toSorted();
      const reversed = sorted.toReversed();
      expect(reversed.toString()).assertEqual('5,4,3,1,1');
      expect(arr.toString()).assertEqual('3,1,4,1,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5300
     * @tc.name testArrayToReversed053
     * @tc.desc Verify writing to the toReversed result does not update the original numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed();
      result[0] = 99;
      expect(result.toString()).assertEqual('99,2,1');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5400
     * @tc.name testArrayToReversed054
     * @tc.desc Verify toReversed keeps repeated object references as a shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ToReversedItem014();
      item.value = 7;
      const arr = new Array<ToReversedItem014>(item, item);
      const result = arr.toReversed();
      result[0].value = 12;
      expect(result[0] === result[1]).assertTrue();
      expect(arr[0] === item).assertTrue();
      expect(arr[1].value).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5500
     * @tc.name testArrayToReversed055
     * @tc.desc Verify filling the toReversed copy changes only the copied array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toReversed();
      result.fill(0, 1, 3);
      expect(result.toString()).assertEqual('4,0,0,1');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5600
     * @tc.name testArrayToReversed056
     * @tc.desc Verify copyWithin on the toReversed result does not mutate the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toReversed();
      result.copyWithin(1, 0, 2);
      expect(result.toString()).assertEqual('4,4,3,1');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5700
     * @tc.name testArrayToReversed057
     * @tc.desc Verify source writes after toReversed do not alter the returned primitive values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('first', 'second', 'third');
      const result = arr.toReversed();
      arr[2] = 'changed';
      expect(result.toString()).assertEqual('third,second,first');
      expect(arr.toString()).assertEqual('first,second,changed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5800
     * @tc.name testArrayToReversed058
     * @tc.desc Verify appending to the toReversed result leaves the source length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.toReversed();
      result.pushOne(3);
      expect(result.toString()).assertEqual('2,1,3');
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_5900
     * @tc.name testArrayToReversed059
     * @tc.desc Verify null and undefined keep their reversed positions in a copied array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(1, null, undefined, 4);
      const result = arr.toReversed();
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertNull();
      expect(result[3]).assertEqual(1);
      expect(arr[1]).assertNull();
      expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6000
     * @tc.name testArrayToReversed060
     * @tc.desc Verify replacing a null slot in the copy does not change the source null slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      const result = arr.toReversed();
      result[1] = 9;
      expect(result.toString()).assertEqual('3,9,1');
      expect(arr[1]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6100
     * @tc.name testArrayToReversed061
     * @tc.desc Verify replacing an undefined slot in the copy does not change the source undefined slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      const result = arr.toReversed();
      result[1] = 9;
      expect(result.toString()).assertEqual('3,9,1');
      expect(arr[1]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6200
     * @tc.name testArrayToReversed062
     * @tc.desc Verify repeated primitive values still produce a distinct mutable reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 5, 5);
      const result = arr.toReversed();
      result[1] = 8;
      expect(result.toString()).assertEqual('5,8,5');
      expect(arr.toString()).assertEqual('5,5,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6300
     * @tc.name testArrayToReversed063
     * @tc.desc Verify shifting from the reversed copy does not remove from the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toReversed();
      const shifted = result.shift();
      expect(shifted).assertEqual(4);
      expect(result.toString()).assertEqual('3,2,1');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6400
     * @tc.name testArrayToReversed064
     * @tc.desc Verify popping from the reversed copy does not remove from the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toReversed();
      const popped = result.pop();
      expect(popped).assertEqual(1);
      expect(result.toString()).assertEqual('3,2');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6500
     * @tc.name testArrayToReversed065
     * @tc.desc Verify a reversed shallow copy observes object field mutations through shared references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToReversedItem014();
      first.value = 1;
      const second = new ToReversedItem014();
      second.value = 2;
      const arr = new Array<ToReversedItem014>(first, second);
      const result = arr.toReversed();
      first.value = 10;
      expect(result[1] === first).assertTrue();
      expect(result[1].value).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6600
     * @tc.name testArrayToReversed066
     * @tc.desc Verify replacing an object slot in the reversed copy does not replace the source slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToReversedItem014();
      first.value = 1;
      const second = new ToReversedItem014();
      second.value = 2;
      const replacement = new ToReversedItem014();
      replacement.value = 99;
      const arr = new Array<ToReversedItem014>(first, second);
      const result = arr.toReversed();
      result[0] = replacement;
      expect(result[0].value).assertEqual(99);
      expect(arr[1] === second).assertTrue();
      expect(arr[1].value).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6700
     * @tc.name testArrayToReversed067
     * @tc.desc Verify an empty toReversed result is still a new mutable array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.toReversed();
      result.pushOne(9);
      expect(result.toString()).assertEqual('9');
      expect(result.length).assertEqual(1);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6800
     * @tc.name testArrayToReversed068
     * @tc.desc Verify filling a single-element reversed copy does not change the single source element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.toReversed();
      result.fill(7);
      expect(result.toString()).assertEqual('7');
      expect(arr.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_6900
     * @tc.name testArrayToReversed069
     * @tc.desc Verify copyWithin on a two-element reversed copy is isolated from the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      const result = arr.toReversed();
      result.copyWithin(1, 0, 1);
      expect(result.toString()).assertEqual('2,2');
      expect(arr.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7000
     * @tc.name testArrayToReversed070
     * @tc.desc Verify null and undefined remain searchable after reversing a copied union array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null | undefined>(null, 1, undefined, 2);
      const result = arr.toReversed();
      expect(result[1]).assertUndefined();
      expect(result[3]).assertNull();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr[0]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7100
     * @tc.name testArrayToReversed071
     * @tc.desc Verify explicit undefined in the reversed copy can be replaced without changing the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 1, 2);
      const result = arr.toReversed();
      result[2] = 9;
      expect(result.toString()).assertEqual('2,1,9');
      expect(arr[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7200
     * @tc.name testArrayToReversed072
     * @tc.desc Verify explicit null in the reversed copy can be replaced without changing the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null, 1, 2);
      const result = arr.toReversed();
      result[2] = 9;
      expect(result.toString()).assertEqual('2,1,9');
      expect(arr[0]).assertNull();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7300
     * @tc.name testArrayToReversed073
     * @tc.desc Verify a reversed copy created from a slice stays independent from both arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(0, 1, 2, 3);
      const sliced = source.slice(1, 4);
      const result = sliced.toReversed();
      result[0] = 99;
      sliced[2] = 88;
      source[3] = 77;
      expect(result.toString()).assertEqual('99,2,1');
      expect(sliced.toString()).assertEqual('1,2,88');
      expect(source.toString()).assertEqual('0,1,2,77');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7400
     * @tc.name testArrayToReversed074
     * @tc.desc Verify filtering before toReversed produces a copy isolated from the filtered array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const filtered = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value > 2);
      const result = filtered.toReversed();
      result[0] = 99;
      filtered[0] = 33;
      expect(result.toString()).assertEqual('99,4,3');
      expect(filtered.toString()).assertEqual('33,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7500
     * @tc.name testArrayToReversed075
     * @tc.desc Verify nested arrays are shallow-copied while outer array replacement stays independent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = Array.create<number>(1, 1);
      const second = Array.create<number>(1, 2);
      const third = Array.create<number>(1, 3);
      const replacement = Array.create<number>(1, 9);
      const arr = new Array<Array<number>>(first, second, third);
      const result = arr.toReversed();
      result[0].pushOne(4);
      result[2] = replacement;
      expect(arr[2].toString()).assertEqual('3,4');
      expect(arr[0] === first).assertTrue();
      expect(result[2].toString()).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7600
     * @tc.name testArrayToReversed076
     * @tc.desc Verify filling a reversed numeric copy that contains zero and negatives leaves the source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-1, 0, 1);
      const result = arr.toReversed();
      result.fill(5, 1, 2);
      expect(result.toString()).assertEqual('1,5,-1');
      expect(arr.toString()).assertEqual('-1,0,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7700
     * @tc.name testArrayToReversed077
     * @tc.desc Verify toReversed preserves explicit undefined values while reversing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7800
     * @tc.name testArrayToReversed078
     * @tc.desc Verify toReversed moves a leading explicit undefined value to the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[1] = 2;
      arr[2] = 3;
      const result = arr.toReversed();
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_7900
     * @tc.name testArrayToReversed079
     * @tc.desc Verify an all-undefined dense array remains undefined after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const result = arr.toReversed();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8000
     * @tc.name testArrayToReversed080
     * @tc.desc Verify an all-undefined generated array remains undefined after toReversed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      const result = arr.toReversed();
      expect(result.length).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8100
     * @tc.name testArrayToReversed081
     * @tc.desc Verify explicit undefined reverses as a real element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined);
      const result = arr.toReversed();
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(0);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8200
     * @tc.name testArrayToReversed082
     * @tc.desc Verify NaN and signed zero values keep exact reversed positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(NaN, 0, -0);
      const result = arr.toReversed();
      expect(isNegativeZero(result[0])).assertTrue();
      expect(result[1]).assertEqual(0);
      expect(Number.isNaN(result[2])).assertTrue();
      expect(Number.isNaN(arr[0])).assertTrue();
      expect(isNegativeZero(arr[2])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8300
     * @tc.name testArrayToReversed083
     * @tc.desc Verify toReversed moves trailing explicit undefined to the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[1] = 2;
      const result = arr.toReversed();
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(1);
      expect(result.lastIndexOf(undefined)).assertEqual(0);
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8400
     * @tc.name testArrayToReversed084
     * @tc.desc Verify a reversed result can be modified without touching the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toReversed();
      result[1] = 99;
      expect(result.toString()).assertEqual('3,99,1');
      expect(arr.toString()).assertEqual('1,,3');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8500
     * @tc.name testArrayToReversed085
     * @tc.desc Verify a densified result keeps explicit undefined when reversed again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const first = arr.toReversed();
      const second = first.toReversed();
      expect(first.lastIndexOf(undefined)).assertEqual(1);
      expect(second[0]).assertEqual(1);
      expect(second[1]).assertUndefined();
      expect(second[2]).assertEqual(3);
      expect(second.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8600
     * @tc.name testArrayToReversed086
     * @tc.desc Verify toReversed copy behavior stays independent from reverse behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sourceForCopy = new Array<number | undefined>(3, (_index) => undefined);
      sourceForCopy[0] = 1;
      sourceForCopy[2] = 3;
      const sourceForReverse = new Array<number | undefined>(3, (_index) => undefined);
      sourceForReverse[0] = 1;
      sourceForReverse[2] = 3;
      const copied = sourceForCopy.toReversed();
      sourceForReverse.reverse();
      expect(copied.lastIndexOf(undefined)).assertEqual(1);
      expect(sourceForReverse.lastIndexOf(undefined)).assertEqual(1);
      expect(copied.toString()).assertEqual(sourceForReverse.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8700
     * @tc.name testArrayToReversed087
     * @tc.desc Verify object references are shallow copied for single-element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new ToReversedItem014();
      item.value = 7;
      const arr = Array.create<ToReversedItem014>(1, item);
      const result = arr.toReversed();
      expect(result !== arr).assertTrue();
      expect(result[0] === arr[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8800
     * @tc.name testArrayToReversed088
     * @tc.desc Verify copying a dense array with undefined does not mutate the original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toReversed();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_8900
     * @tc.name testArrayToReversed089
     * @tc.desc Verify toReversed supports consecutive chained calls and restores the original order after two reversals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toReversed().toReversed();
      expect(result !== arr).assertTrue();
      expect(result.toString()).assertEqual('1,2,3,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_9000
     * @tc.name testArrayToReversed090
     * @tc.desc Verify toReversed works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(toReversedFromAnyNumberArray(anyValue)).assertEqual('3,2,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_REVERSED_9100
     * @tc.name testArrayToReversed091
     * @tc.desc Verify toReversed supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToReversed091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const result = anyArr.toReversed();
      expect(result.toString()).assertEqual('true,two,1');
      expect(anyArr.toString()).assertEqual('1,two,true');
    });

  });
}
