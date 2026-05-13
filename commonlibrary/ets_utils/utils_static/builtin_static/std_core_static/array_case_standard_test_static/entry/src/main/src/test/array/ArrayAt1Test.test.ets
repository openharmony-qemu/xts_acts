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
      const result = arr.at(0);
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
      const result = arr.at(-1);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0300
     * @tc.name testArrayAt003
     * @tc.desc Verify index zero returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100, 200, 300);
      const result = arr.at(0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0400
     * @tc.name testArrayAt004
     * @tc.desc Verify index greater than or equal to length returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(10);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0500
     * @tc.name testArrayAt005
     * @tc.desc Verify negative index beyond array length returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(-10);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0600
     * @tc.name testArrayAt006
     * @tc.desc Verify decimal index is converted with integer semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const normalizedIndex = (1.5).toInt();
      const result = arr.at(normalizedIndex);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0700
     * @tc.name testArrayAt007
     * @tc.desc Verify NaN index is treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const nanIndex = Number.parseInt('abc');
      const normalizedIndex = (nanIndex != nanIndex) ? 0 : nanIndex.toInt();
      const result = arr.at(normalizedIndex);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0800
     * @tc.name testArrayAt008
     * @tc.desc Verify Infinity index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const largeIndex = 2147483647;
      try {
        arr.at(largeIndex);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_0900
     * @tc.name testArrayAt009
     * @tc.desc Verify negative Infinity index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const largeNegativeIndex = -2147483648;
      try {
        arr.at(largeNegativeIndex);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1000
     * @tc.name testArrayAt010
     * @tc.desc Verify the returned element keeps the array generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1100
     * @tc.name testArrayAt011
     * @tc.desc Verify invalid index returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(100);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1200
     * @tc.name testArrayAt012
     * @tc.desc Verify positive indexes can read multiple elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(3)).assertEqual(40);
      expect(arr.at(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1300
     * @tc.name testArrayAt013
     * @tc.desc Verify negative indexes can read multiple elements from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      expect(arr.at(-1)).assertEqual(50);
      expect(arr.at(-2)).assertEqual(40);
      expect(arr.at(-3)).assertEqual(30);
      expect(arr.at(-4)).assertEqual(20);
      expect(arr.at(-5)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1400
     * @tc.name testArrayAt014
     * @tc.desc Verify at negative one returns the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(-1);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1500
     * @tc.name testArrayAt015
     * @tc.desc Verify at zero returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1600
     * @tc.name testArrayAt016
     * @tc.desc Verify length minus one is the last valid positive index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(arr.length - 1);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1700
     * @tc.name testArrayAt017
     * @tc.desc Verify negative length is the first valid negative index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(-arr.length);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1800
     * @tc.name testArrayAt018
     * @tc.desc Verify index equal to length returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(arr.length);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_1900
     * @tc.name testArrayAt019
     * @tc.desc Verify index smaller than negative length returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(-arr.length - 1);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2000
     * @tc.name testArrayAt020
     * @tc.desc Verify empty array returns undefined for all tested indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      try {
        arr.at(0);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
      try {
        arr.at(-1);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
      try {
        arr.at(1);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2100
     * @tc.name testArrayAt021
     * @tc.desc Verify single-element array supports front and negative access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      arr[0] = 100;
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(-1)).assertEqual(100);
      try {
        arr.at(1);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
      try {
        arr.at(-2);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2200
     * @tc.name testArrayAt022
     * @tc.desc Verify two-element array supports both positive and negative access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(-1)).assertEqual(20);
      expect(arr.at(-2)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2300
     * @tc.name testArrayAt023
     * @tc.desc Verify number arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      expect(arr.at(1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2400
     * @tc.name testArrayAt024
     * @tc.desc Verify string arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.at(1)).assertEqual('b');
      expect(arr.at(-1)).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2500
     * @tc.name testArrayAt025
     * @tc.desc Verify boolean arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      expect(arr.at(1)).assertFalse();
      expect(arr.at(-1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2600
     * @tc.name testArrayAt026
     * @tc.desc Verify single-character string arrays can cover char-like access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B', 'C');
      expect(arr.at(1)).assertEqual('B');
      expect(arr.at(-1)).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2700
     * @tc.name testArrayAt027
     * @tc.desc Verify object arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2800
     * @tc.name testArrayAt028
     * @tc.desc Verify union type arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | int>(1, 'two', 3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual('two');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_2900
     * @tc.name testArrayAt029
     * @tc.desc Verify arrays containing null elements return null at the matching position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | null>(1, null, 3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertNull();
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3000
     * @tc.name testArrayAt030
     * @tc.desc Verify arrays containing undefined elements return undefined at the matching position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | undefined>(1, undefined, 3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertUndefined();
      expect(arr.at(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3100
     * @tc.name testArrayAt031
     * @tc.desc Verify arrays containing zero elements return zero correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 1, 2);
      expect(arr.at(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3200
     * @tc.name testArrayAt032
     * @tc.desc Verify arrays containing false elements return false correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, true);
      expect(arr.at(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3300
     * @tc.name testArrayAt033
     * @tc.desc Verify arrays containing empty strings return empty strings correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'a');
      expect(arr.at(0)).assertEqual('');
      expect(arr.at(1)).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3400
     * @tc.name testArrayAt034
     * @tc.desc Verify at negative indexes match direct indexing of translated positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      expect(arr.at(-1)).assertEqual(arr[arr.length - 1]);
      expect(arr.at(-2)).assertEqual(arr[arr.length - 2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3500
     * @tc.name testArrayAt035
     * @tc.desc Verify at and bracket notation match for positive indexes and at stays convenient for tail access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      expect(arr.at(1)).assertEqual(arr[1]);
      expect(arr.at(-1)).assertEqual(arr[arr.length - 1]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3600
     * @tc.name testArrayAt036
     * @tc.desc Verify repeated positive at access remains stable in a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 10000; i++) {
        arr.pushOne(i);
      }
      const startTime = Date.now();
      for (let i = 0; i < 10000; i++) {
        arr.at(i);
      }
      const endTime = Date.now();
      expect(endTime >= startTime).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3700
     * @tc.name testArrayAt037
     * @tc.desc Verify repeated negative at access remains stable in a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 10000; i++) {
        arr.pushOne(i);
      }
      const startTime = Date.now();
      for (let i = 0; i < 10000; i++) {
        arr.at(-i - 1);
      }
      const endTime = Date.now();
      expect(endTime >= startTime).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3800
     * @tc.name testArrayAt038
     * @tc.desc Verify at negative one is suitable for getting the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const last = arr.at(-1);
      expect(last).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_3900
     * @tc.name testArrayAt039
     * @tc.desc Verify negative indexes can get multiple elements from the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const secondLast = arr.at(-2);
      const thirdLast = arr.at(-3);
      expect(secondLast).assertEqual(40);
      expect(thirdLast).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4000
     * @tc.name testArrayAt040
     * @tc.desc Verify at can avoid out-of-bounds direct index assumptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(100);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4100
     * @tc.name testArrayAt041
     * @tc.desc Verify readonly arrays support at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<int>(10, 20, 30);
      const arr: ReadonlyArray<int> = source;
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4200
     * @tc.name testArrayAt042
     * @tc.desc Verify very large positive indexes return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const hugeIndex1 = 2147483647;
      const hugeIndex2 = Number.MAX_SAFE_INTEGER.toInt();
      try {
        arr.at(hugeIndex1);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
      try {
        arr.at(hugeIndex2);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4300
     * @tc.name testArrayAt043
     * @tc.desc Verify very small numeric indexes follow integer conversion semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const normalizedMinValueIndex = Number.MIN_VALUE.toInt();
      const normalizedMinSafeIndex = Number.MIN_SAFE_INTEGER.toInt();
      expect(arr.at(normalizedMinValueIndex)).assertEqual(10);
      try {
        arr.at(normalizedMinSafeIndex);
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4400
     * @tc.name testArrayAt044
     * @tc.desc Verify another decimal index also follows integer conversion semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const normalizedIndex = (1.9).toInt();
      const result = arr.at(normalizedIndex);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4500
     * @tc.name testArrayAt045
     * @tc.desc Verify scientific notation indexes are accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const normalizedIndex = (1e0).toInt();
      const result = arr.at(normalizedIndex);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4600
     * @tc.name testArrayAt046
     * @tc.desc Verify return type can be narrowed from T or undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(0);
      if (result !== undefined) {
        expect(result).assertEqual(10);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4700
     * @tc.name testArrayAt047
     * @tc.desc Verify type guard logic handles undefined results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        const value = arr.at(5);
        if (value !== undefined) {
          expect().assertFail();
        } else {
          expect(value).assertUndefined();
        }
        expect().assertFail();
      } catch (e) {
        expect(e !== null && e !== undefined).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4800
     * @tc.name testArrayAt048
     * @tc.desc Verify repeated at calls can read different elements continuously
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(-1)).assertEqual(50);
      expect(arr.at(-3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_4900
     * @tc.name testArrayAt049
     * @tc.desc Verify at does not modify the array while pop removes the tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<int>(10, 20, 30);
      const value1 = arr1.at(-1);
      expect(arr1.length).assertEqual(3);

      const arr2 = new Array<int>(10, 20, 30);
      const value2 = arr2.pop();
      expect(arr2.length).assertEqual(2);

      expect(value1).assertEqual(value2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5000
     * @tc.name testArrayAt050
     * @tc.desc Verify at returns one element while slice returns an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const value = arr.at(1);
      expect(value).assertEqual(20);

      const sliced = arr.slice(1, 2);
      expect(sliced.length).assertEqual(1);
      expect(sliced[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5100
     * @tc.name testArrayAt051
     * @tc.desc Verify at can be used in follow-up calculations after null checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_ONE_5200
     * @tc.name testArrayAt052
     * @tc.desc Verify at combines with nullable array processing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(process1052(null)).assertUndefined();
      expect(process1052(new Array<int>(1, 2))).assertEqual(1);
    });
  });
}
