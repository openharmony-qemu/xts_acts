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

class Person026 {
  name: string = '';
}


function process1052(arr: Array<int> | null): int | undefined {
  if (arr == null) {
    return undefined;
  }
  return arr.at(0);
}

export default function ArrayAt1Test(): void {
  describe('ArrayAt1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0100
     * @tc.name testArrayAt001
     * @tc.desc Verify positive integer index counts from the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const firstIndex = 0;
      const result = arr.at(firstIndex);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0200
     * @tc.name testArrayAt002
     * @tc.desc Verify negative integer index counts from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const lastIndex = -1;
      const result = arr.at(lastIndex);

      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0300
     * @tc.name testArrayAt003
     * @tc.desc Verify negative index beyond array length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const invalidNegativeIndex = -10;
      try {
        arr.at(invalidNegativeIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0400
     * @tc.name testArrayAt004
     * @tc.desc Verify decimal index is converted with integer semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const sourceIndex = 1.5;
      const normalizedIndex = sourceIndex.toInt();
      const result = arr.at(normalizedIndex);

      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0500
     * @tc.name testArrayAt005
     * @tc.desc Verify a very large positive index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(40, 50, 60);
      const largeIndex = 2147483647;
      try {
        arr.at(largeIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0600
     * @tc.name testArrayAt006
     * @tc.desc Verify a very large negative index throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const largeNegativeIndex = -2147483648;
      try {
        arr.at(largeNegativeIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0700
     * @tc.name testArrayAt007
     * @tc.desc Verify the returned element keeps the array generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const index = 0;
      const result = arr.at(index);

      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0800
     * @tc.name testArrayAt008
     * @tc.desc Verify positive indexes can read multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const firstValue = arr.at(0);
      const secondValue = arr.at(1);
      const thirdValue = arr.at(2);
      const fourthValue = arr.at(3);
      const fifthValue = arr.at(4);

      expect(firstValue).assertEqual(10);
      expect(secondValue).assertEqual(20);
      expect(thirdValue).assertEqual(30);
      expect(fourthValue).assertEqual(40);
      expect(fifthValue).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0900
     * @tc.name testArrayAt009
     * @tc.desc Verify negative indexes can read multiple elements from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const lastValue = arr.at(-1);
      const secondLastValue = arr.at(-2);
      const thirdLastValue = arr.at(-3);
      const fourthLastValue = arr.at(-4);
      const fifthLastValue = arr.at(-5);

      expect(lastValue).assertEqual(50);
      expect(secondLastValue).assertEqual(40);
      expect(thirdLastValue).assertEqual(30);
      expect(fourthLastValue).assertEqual(20);
      expect(fifthLastValue).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1000
     * @tc.name testArrayAt010
     * @tc.desc Verify at negative one returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const negativeIndex = -1;
      const result = arr.at(negativeIndex);

      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1100
     * @tc.name testArrayAt011
     * @tc.desc Verify length minus one is the last valid positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const lastValidIndex = arr.length - 1;
      const result = arr.at(lastValidIndex);

      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1200
     * @tc.name testArrayAt012
     * @tc.desc Verify negative length is the first valid negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const firstNegativeIndex = -arr.length;
      const result = arr.at(firstNegativeIndex);

      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1300
     * @tc.name testArrayAt013
     * @tc.desc Verify index equal to length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const boundaryIndex = arr.length;
      try {
        arr.at(boundaryIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1400
     * @tc.name testArrayAt014
     * @tc.desc Verify index smaller than negative length throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const invalidNegativeIndex = -arr.length - 1;
      try {
        arr.at(invalidNegativeIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1500
     * @tc.name testArrayAt015
     * @tc.desc Verify empty array throws RangeError for all tested indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      try {
        arr.at(0);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }

      try {
        arr.at(-1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }

      try {
        arr.at(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1600
     * @tc.name testArrayAt016
     * @tc.desc Verify single-element array supports front and negative access and throws RangeError on overflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<int>(1, 1);
      arr[0] = 100;
      const firstValue = arr.at(0);
      const lastValue = arr.at(-1);
      expect(firstValue).assertEqual(100);
      expect(lastValue).assertEqual(100);

      try {
        arr.at(1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }

      try {
        arr.at(-2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1700
     * @tc.name testArrayAt017
     * @tc.desc Verify two-element array supports both positive and negative access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20);
      const firstValue = arr.at(0);
      const secondValue = arr.at(1);
      const lastValue = arr.at(-1);
      const firstFromNegative = arr.at(-2);

      expect(firstValue).assertEqual(10);
      expect(secondValue).assertEqual(20);
      expect(lastValue).assertEqual(20);
      expect(firstFromNegative).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1800
     * @tc.name testArrayAt018
     * @tc.desc Verify number arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      const targetIndex = 1;
      const result = arr.at(targetIndex);

      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1900
     * @tc.name testArrayAt019
     * @tc.desc Verify string arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const middleIndex = 1;
      const lastIndex = -1;
      const middleValue = arr.at(middleIndex);
      const lastValue = arr.at(lastIndex);

      expect(middleValue).assertEqual('b');
      expect(lastValue).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2000
     * @tc.name testArrayAt020
     * @tc.desc Verify boolean arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const middleValue = arr.at(1);
      const lastValue = arr.at(-1);

      expect(middleValue).assertFalse();
      expect(lastValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2100
     * @tc.name testArrayAt021
     * @tc.desc Verify single-character string arrays can cover char-like access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B', 'C');
      const middleValue = arr.at(1);
      const lastValue = arr.at(-1);

      expect(middleValue).assertEqual('B');
      expect(lastValue).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2200
     * @tc.name testArrayAt022
     * @tc.desc Verify object arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Person026>();
      const p1 = new Person026();
      p1.name = 'Alice';
      const p2 = new Person026();
      p2.name = 'Bob';
      arr.push(p1, p2);
      const first = arr.at(0);
      const last = arr.at(-1);
      expect(first != undefined).assertTrue();
      expect(last != undefined).assertTrue();
      if (first != undefined && last != undefined) {
        expect(first.name).assertEqual('Alice');
        expect(last.name).assertEqual('Bob');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2300
     * @tc.name testArrayAt023
     * @tc.desc Verify union type arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | int>(1, 'two', 3);
      const firstValue = arr.at(0);
      const secondValue = arr.at(1);

      expect(firstValue).assertEqual(1);
      expect(secondValue).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2400
     * @tc.name testArrayAt024
     * @tc.desc Verify arrays containing null elements return null at the matching position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(1, null, 3);
      const firstValue = arr.at(0);
      const secondValue = arr.at(1);
      const thirdValue = arr.at(2);

      expect(firstValue).assertEqual(1);
      expect(secondValue).assertNull();
      expect(thirdValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2500
     * @tc.name testArrayAt025
     * @tc.desc Verify arrays containing undefined elements return undefined at the matching position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, undefined, 3);
      const firstValue = arr.at(0);
      const secondValue = arr.at(1);
      const thirdValue = arr.at(2);

      expect(firstValue).assertEqual(1);
      expect(secondValue).assertUndefined();
      expect(thirdValue).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2600
     * @tc.name testArrayAt026
     * @tc.desc Verify arrays containing zero elements return zero correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 1, 2);
      const zeroIndex = 0;
      const result = arr.at(zeroIndex);

      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2700
     * @tc.name testArrayAt027
     * @tc.desc Verify arrays containing false elements return false correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true);
      const zeroIndex = 0;
      const result = arr.at(zeroIndex);

      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2800
     * @tc.name testArrayAt028
     * @tc.desc Verify arrays containing empty strings return empty strings correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'a');
      const firstValue = arr.at(0);
      const secondValue = arr.at(1);

      expect(firstValue).assertEqual('');
      expect(secondValue).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2900
     * @tc.name testArrayAt029
     * @tc.desc Verify at negative indexes match direct indexing of translated positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const lastValue = arr.at(-1);
      const translatedLastValue = arr[arr.length - 1];
      const secondLastValue = arr.at(-2);
      const translatedSecondLastValue = arr[arr.length - 2];

      expect(lastValue).assertEqual(translatedLastValue);
      expect(secondLastValue).assertEqual(translatedSecondLastValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3000
     * @tc.name testArrayAt030
     * @tc.desc Verify at and bracket notation match for positive indexes and at stays convenient for tail access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const middleValue = arr.at(1);
      const directMiddleValue = arr[1];
      const lastValue = arr.at(-1);
      const directLastValue = arr[arr.length - 1];

      expect(middleValue).assertEqual(directMiddleValue);
      expect(lastValue).assertEqual(directLastValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3100
     * @tc.name testArrayAt031
     * @tc.desc Verify repeated positive at access reads every element in order from a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 100; i++) {
        arr.pushOne(i);
      }
      let sum = 0;
      for (let i = 0; i < 100; i++) {
        sum += arr.at(i);
      }
      expect(sum).assertEqual(4950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3200
     * @tc.name testArrayAt032
     * @tc.desc Verify repeated negative at access reads elements from the tail of a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 100; i++) {
        arr.pushOne(i);
      }
      let sum = 0;
      for (let i = 0; i < 100; i++) {
        sum += arr.at(-i - 1);
      }
      expect(sum).assertEqual(4950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3300
     * @tc.name testArrayAt033
     * @tc.desc Verify at negative one is suitable for getting the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const tailIndex = -1;
      const last = arr.at(tailIndex);
      expect(last).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3400
     * @tc.name testArrayAt034
     * @tc.desc Verify negative indexes can get multiple elements from the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const secondLast = arr.at(-2);
      const thirdLast = arr.at(-3);

      expect(secondLast).assertEqual(40);
      expect(thirdLast).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3500
     * @tc.name testArrayAt035
     * @tc.desc Verify out-of-bounds at access throws RangeError instead of behaving like direct indexing assumptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const invalidIndex = 100;
      try {
        arr.at(invalidIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3600
     * @tc.name testArrayAt036
     * @tc.desc Verify readonly arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<int>(10, 20, 30);
      const arr: ReadonlyArray<int> = source;
      const firstValue = arr.at(0);
      const lastValue = arr.at(-1);

      expect(firstValue).assertEqual(10);
      expect(lastValue).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3700
     * @tc.name testArrayAt037
     * @tc.desc Verify very large positive indexes throw RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const hugeIndex1 = 2147483647;
      const hugeIndex2 = Number.MAX_SAFE_INTEGER.toInt();
      try {
        arr.at(hugeIndex1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }

      try {
        arr.at(hugeIndex2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3800
     * @tc.name testArrayAt038
     * @tc.desc Verify very small numeric indexes follow integer conversion semantics and out-of-range normalization throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const normalizedMinValueIndex = Number.MIN_VALUE.toInt();
      const normalizedMinSafeIndex = Number.MIN_SAFE_INTEGER.toInt();
      const minValueResult = arr.at(normalizedMinValueIndex);
      expect(minValueResult).assertEqual(10);

      try {
        arr.at(normalizedMinSafeIndex);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3900
     * @tc.name testArrayAt039
     * @tc.desc Verify return type can be narrowed from T or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const index = 0;
      const result = arr.at(index);
      if (result !== undefined) {
        expect(result).assertEqual(10);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4000
     * @tc.name testArrayAt040
     * @tc.desc Verify repeated at calls can read different elements continuously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const firstValue = arr.at(0);
      const middleValue = arr.at(2);
      const lastValue = arr.at(-1);
      const thirdFromEndValue = arr.at(-3);

      expect(firstValue).assertEqual(10);
      expect(middleValue).assertEqual(30);
      expect(lastValue).assertEqual(50);
      expect(thirdFromEndValue).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4100
     * @tc.name testArrayAt041
     * @tc.desc Verify at does not modify the array while pop removes the tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(10, 20, 30);
      const value1 = arr1.at(-1);
      expect(arr1.length).assertEqual(3);

      const arr2 = new Array<int>(10, 20, 30);
      const value2 = arr2.pop();
      expect(arr2.length).assertEqual(2);

      expect(value1).assertEqual(value2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4200
     * @tc.name testArrayAt042
     * @tc.desc Verify at returns one element while slice returns an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const value = arr.at(1);
      expect(value).assertEqual(20);

      const sliced = arr.slice(1, 2);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4300
     * @tc.name testArrayAt043
     * @tc.desc Verify at can be used in follow-up calculations after null checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const last = arr.at(-1);
      if (last !== undefined) {
        const doubled = last * 2;
        expect(doubled).assertEqual(60);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4400
     * @tc.name testArrayAt044
     * @tc.desc Verify at combines with nullable array processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nullResult = process1052(null);
      const arrayResult = process1052(new Array<int>(1, 2));

      expect(nullResult).assertUndefined();
      expect(arrayResult).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4500
     * @tc.name testArrayAt045
     * @tc.desc Verify negative zero index behaves the same as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const negativeZeroIndex = -0;
      const negativeZeroResult = arr.at(negativeZeroIndex);
      const zeroResult = arr.at(0);

      expect(negativeZeroResult).assertEqual(10);
      expect(negativeZeroResult).assertEqual(zeroResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4600
     * @tc.name testArrayAt046
     * @tc.desc Verify negative decimal indexes work after integer normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const sourceIndex = -1.9;
      const normalizedIndex = sourceIndex.toInt();
      const translatedIndex = arr.length + normalizedIndex;
      const result = arr.at(normalizedIndex);

      expect(normalizedIndex < 0).assertTrue();
      expect(result).assertEqual(arr[translatedIndex]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4700
     * @tc.name testArrayAt047
     * @tc.desc Verify at can read leading undefined elements before a defined tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(undefined, undefined, 300);

      expect(arr.at(0)).assertUndefined();
      expect(arr.at(1)).assertUndefined();
      expect(arr.at(2)).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4800
     * @tc.name testArrayAt048
     * @tc.desc Verify negative indexes can read leading undefined elements and the defined tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(undefined, undefined, 300);

      expect(arr.at(-1)).assertEqual(300);
      expect(arr.at(-2)).assertUndefined();
      expect(arr.at(-3)).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4900
     * @tc.name testArrayAt049
     * @tc.desc Verify nested arrays are returned as stored child-array references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const child1 = new Array<int>(1, 2);
      const child2 = new Array<int>(3, 4);
      const arr = new Array<Array<int>>();
      arr.pushOne(child1);
      arr.pushOne(child2);

      const firstChild = arr.at(0);
      const lastChild = arr.at(-1);

      expect(firstChild != undefined).assertTrue();
      expect(lastChild != undefined).assertTrue();
      if (firstChild != undefined && lastChild != undefined) {
        expect(firstChild === child1).assertTrue();
        expect(lastChild === child2).assertTrue();
        expect(firstChild[0]).assertEqual(1);
        expect(lastChild[1]).assertEqual(4);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5000
     * @tc.name testArrayAt050
     * @tc.desc Verify repeated references remain identical when read through at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shared = new Person026();
      shared.name = 'Shared';
      const arr = new Array<Person026>();
      arr.push(shared, shared);

      const first = arr.at(0);
      const second = arr.at(1);

      expect(first != undefined).assertTrue();
      expect(second != undefined).assertTrue();
      if (first != undefined && second != undefined) {
        expect(first === shared).assertTrue();
        expect(second === shared).assertTrue();
        expect(first === second).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5100
     * @tc.name testArrayAt051
     * @tc.desc Verify mutating an object returned by at updates the stored array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const person = new Person026();
      person.name = 'Before';
      const arr = new Array<Person026>();
      arr.pushOne(person);

      const first = arr.at(0);
      expect(first != undefined).assertTrue();
      if (first != undefined) {
        first.name = 'After';
      }

      expect(arr[0].name).assertEqual('After');
      expect(person.name).assertEqual('After');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5200
     * @tc.name testArrayAt052
     * @tc.desc Verify union arrays also support negative tail access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | int>(1, 'two', 3);
      const lastValue = arr.at(-1);
      const secondValue = arr.at(-2);

      expect(lastValue).assertEqual(3);
      expect(secondValue).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5300
     * @tc.name testArrayAt053
     * @tc.desc Verify negative tail access can read null elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(1, 2, null);
      const lastValue = arr.at(-1);
      const secondValue = arr.at(-2);

      expect(lastValue).assertNull();
      expect(secondValue).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5400
     * @tc.name testArrayAt054
     * @tc.desc Verify negative tail access can read undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, 2, undefined);
      const lastValue = arr.at(-1);
      const secondValue = arr.at(-2);

      expect(lastValue).assertUndefined();
      expect(secondValue).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5500
     * @tc.name testArrayAt055
     * @tc.desc Verify at reflects in-bounds element reassignment immediately
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const beforeUpdate = arr.at(1);
      arr[1] = 99;
      const afterUpdate = arr.at(1);

      expect(beforeUpdate).assertEqual(20);
      expect(afterUpdate).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5600
     * @tc.name testArrayAt056
     * @tc.desc Verify at negative one reflects tail changes after pushOne
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20);
      const originalTail = arr.at(-1);
      arr.pushOne(30);
      const updatedTail = arr.at(-1);

      expect(originalTail).assertEqual(20);
      expect(updatedTail).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5700
     * @tc.name testArrayAt057
     * @tc.desc Verify mutating a nested child array returned by at updates the stored child array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const child = new Array<int>(1, 2);
      const arr = new Array<Array<int>>();
      arr.pushOne(child);

      const firstChild = arr.at(0);
      expect(firstChild != undefined).assertTrue();
      if (firstChild != undefined) {
        firstChild[0] = 99;
        firstChild.pushOne(3);
      }

      expect(arr[0][0]).assertEqual(99);
      expect(arr[0][2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5800
     * @tc.name testArrayAt058
     * @tc.desc Verify readonly at access reflects source array updates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<int>(10, 20, 30);
      const arr: ReadonlyArray<int> = source;
      const originalTail = arr.at(-1);
      source[2] = 99;
      const updatedTail = arr.at(-1);

      expect(originalTail).assertEqual(30);
      expect(updatedTail).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5900
     * @tc.name testArrayAt059
     * @tc.desc Verify mixed nullable tail values remain distinguishable with negative indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null | undefined>(1, null, undefined);
      const lastValue = arr.at(-1);
      const secondValue = arr.at(-2);
      const thirdValue = arr.at(-3);

      expect(lastValue).assertUndefined();
      expect(secondValue).assertNull();
      expect(thirdValue).assertEqual(1);
    });
  });
}
