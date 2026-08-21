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
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Int16ArrayToSortedTest02(): void {
  describe('Int16ArrayToSortedTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_0100
     * @tc.name testInt16ArrayToSortedTestTwo001
     * @tc.desc Verify toSorted() result byteLength is 2 for single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 42;
      let arr: Int16Array = Int16Array.of(val);
      let result: Int16Array = arr.toSorted();
      let actualByteLength: int = result.byteLength;
      let expectedByteLength: int = 2;
      expect(actualByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_0200
     * @tc.name testInt16ArrayToSortedTestTwo002
     * @tc.desc Verify toSorted() result contains three sorted Int16 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, 2);
      let result: Int16Array = arr.toSorted();
      let actualLength: int = result.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
      let actualFirstElement: number = result.$_get(0);
      let expectedFirstElement: int = 1;
      expect(actualFirstElement).assertEqual(expectedFirstElement);
      let actualLastElement: number = result.$_get(2);
      let expectedLastElement: int = 3;
      expect(actualLastElement).assertEqual(expectedLastElement);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_0300
     * @tc.name testInt16ArrayToSortedTestTwo003
     * @tc.desc Verify original length unchanged after toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, 2);
      let result: Int16Array = arr.toSorted();
      let actualString: string = result.toString();
      let expectedString: string = '1,2,3';
      expect(actualString).assertEqual(expectedString);
      let actualLength: int = arr.length;
      let expectedLength: int = 3;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_0400
     * @tc.name testInt16ArrayToSortedTestTwo004
     * @tc.desc Verify original boundary values unchanged after toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(-32768, 0, 32767);
      let result: Int16Array = arr.toSorted();
      let actualString: string = result.toString();
      let expectedString: string = '-32768,0,32767';
      expect(actualString).assertEqual(expectedString);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 0;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_0500
     * @tc.name testInt16ArrayToSortedTestTwo005
     * @tc.desc Verify empty original remains empty after toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array();
      let result: Int16Array = arr.toSorted();
      let actualString: string = result.toString();
      let expectedString: string = '';
      expect(actualString).assertEqual(expectedString);
      expect(result.buffer).not().assertEqual(arr.buffer);
      let actualLength: int = arr.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_0600
     * @tc.name testInt16ArrayToSortedTestTwo006
     * @tc.desc Verify single-element original unchanged after toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 42;
      let arr: Int16Array = Int16Array.of(val);
      let result: Int16Array = arr.toSorted();
      let actualString: string = result.toString();
      let expectedString: string = '42';
      expect(actualString).assertEqual(expectedString);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 42;
      expect(elementAt0).assertEqual(expectedElement0);
      let actualLength: int = arr.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_0700
     * @tc.name testInt16ArrayToSortedTestTwo007
     * @tc.desc Verify fill on toSorted() result leaves original elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, 2);
      let result: Int16Array = arr.toSorted();
      result.fill(0);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 1;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 2;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_0800
     * @tc.name testInt16ArrayToSortedTestTwo008
     * @tc.desc Verify two toSorted() calls return independent objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, 2);
      let sortedResultFirst: Int16Array = arr.toSorted();
      let sortedResultSecond: Int16Array = arr.toSorted();
      expect(sortedResultFirst).not().assertEqual(sortedResultSecond);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_0900
     * @tc.name testInt16ArrayToSortedTestTwo009
     * @tc.desc Verify toSorted() result supports $_set write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, 2);
      let result: Int16Array = arr.toSorted();
      result.$_set(0, 99);
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 99;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1000
     * @tc.name testInt16ArrayToSortedTestTwo010
     * @tc.desc Verify toSorted() result join returns sorted string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(3, 1, 2);
      let result: Int16Array = arr.toSorted();
      let actualJoined: string = result.join(',');
      let expectedJoined: string = '1,2,3';
      expect(actualJoined).assertEqual(expectedJoined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1100
     * @tc.name testInt16ArrayToSortedTestTwo011
     * @tc.desc Verify large-array toSorted() length remains 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = Int16Array.of(
        100,
        50,
        75,
        25,
        0,
        -50,
        -25,
        10,
        60,
        90,
        -100,
        40,
        80,
        20,
        70,
        30,
        -10,
        -75,
        -40,
        -90,
      );
      let result: Int16Array = arr.toSorted();
      let actualLength: int = result.length;
      let expectedLength: int = 20;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1200
     * @tc.name testInt16ArrayToSortedTestTwo012
     * @tc.desc Verify toSorted() deep copy has byteOffset 0 from ArrayBuffer view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int16Array = new Int16Array(buf, 0, 3);
      arr.$_set(0, 3);
      arr.$_set(1, 1);
      arr.$_set(2, 2);
      let result: Int16Array = arr.toSorted();
      let actualByteOffset: int = result.byteOffset;
      let expectedByteOffset: int = 0;
      expect(actualByteOffset).assertEqual(expectedByteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1300
     * @tc.name testInt16ArrayToSortedTestTwo013
     * @tc.desc Verify empty array toSorted() is idempotent when called twice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let sortedOnce = arr.toSorted();
      let sortedTwice = sortedOnce.toSorted();
      let actualLength: int = sortedTwice.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1400
     * @tc.name testInt16ArrayToSortedTestTwo014
     * @tc.desc Verify empty array toSorted() result is not the original reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.toSorted();
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1500
     * @tc.name testInt16ArrayToSortedTestTwo015
     * @tc.desc Verify empty array toSorted() returns empty Int16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(0);
      let result = arr.toSorted();
      let actualLength: int = result.length;
      let expectedLength: int = 0;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1600
     * @tc.name testInt16ArrayToSortedTestTwo016
     * @tc.desc Verify single element 0 toSorted() returns a copy containing 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 0;
      let arr: Int16Array = Int16Array.of(val);
      let result = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 0;
      expect(elementAt0).assertEqual(expectedElement0);
      let actualLength: int = result.length;
      let expectedLength: int = 1;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1700
     * @tc.name testInt16ArrayToSortedTestTwo017
     * @tc.desc Verify single element toSorted() result is not the original reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 42;
      let arr: Int16Array = Int16Array.of(val);
      let result = arr.toSorted();
      expect(result).not().assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1800
     * @tc.name testInt16ArrayToSortedTestTwo018
     * @tc.desc Verify single element toSorted() result can be modified independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 5;
      let arr: Int16Array = Int16Array.of(val);
      let result = arr.toSorted();
      result.$_set(0, 10);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 5;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_1900
     * @tc.name testInt16ArrayToSortedTestTwo019
     * @tc.desc Verify all-zero array toSorted() keeps values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(5);
      let result = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 0;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt4: number = result.$_get(4);
      let expectedElement4: int = 0;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2000
     * @tc.name testInt16ArrayToSortedTestTwo020
     * @tc.desc Verify all-equal array toSorted() leaves original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(9, 9, 9);
      let result = arr.toSorted();
      let actualResultString: string = result.toString();
      let expectedResultString: string = '9,9,9';
      expect(actualResultString).assertEqual(expectedResultString);
      let actualOriginalString: string = arr.toString();
      let expectedOriginalString: string = '9,9,9';
      expect(actualOriginalString).assertEqual(expectedOriginalString);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 9;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 9;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 9;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2100
     * @tc.name testInt16ArrayToSortedTestTwo021
     * @tc.desc Verify alternating MIN/MAX values place all MIN before MAX after toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(32767, -32768, 32767, -32768);
      let result = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = -32768;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = -32768;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = 32767;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = result.$_get(3);
      let expectedElement3: int = 32767;
      expect(elementAt3).assertEqual(expectedElement3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2200
     * @tc.name testInt16ArrayToSortedTestTwo022
     * @tc.desc Verify modifying toSorted() result does not change original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(3, 1, 2);
      let result = arr.toSorted();
      result.$_set(0, 99);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 1;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 2;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2300
     * @tc.name testInt16ArrayToSortedTestTwo023
     * @tc.desc Verify fill on toSorted() result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 1, 3);
      let result = arr.toSorted();
      result.fill(0);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 5;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 1;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2400
     * @tc.name testInt16ArrayToSortedTestTwo024
     * @tc.desc Verify reverse on toSorted() result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 3, 2);
      let result = arr.toSorted();
      result.reverse();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 3;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 2;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2500
     * @tc.name testInt16ArrayToSortedTestTwo025
     * @tc.desc Verify set on toSorted() result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(4, 1, 3);
      let result = arr.toSorted();
      let other = Int16Array.of(99, 99, 99);
      result.set(other, 0);
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 4;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 1;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2600
     * @tc.name testInt16ArrayToSortedTestTwo026
     * @tc.desc Verify sort on toSorted() result does not affect original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 3, 2);
      let result = arr.toSorted();
      result.sort();
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = arr.$_get(1);
      let expectedElement1: int = 3;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = arr.$_get(2);
      let expectedElement2: int = 2;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2700
     * @tc.name testInt16ArrayToSortedTestTwo027
     * @tc.desc Verify original mutations after toSorted() do not affect returned result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(10, 5, 8);
      let result = arr.toSorted();
      arr.fill(0);
      arr.reverse();
      arr.sort();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 5;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = 8;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = 10;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2800
     * @tc.name testInt16ArrayToSortedTestTwo028
     * @tc.desc Verify ascending array toSorted() twice yields same order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(1, 2, 3, 4, 5);
      let sortedOnce = arr.toSorted();
      let sortedTwice = sortedOnce.toSorted();
      let elementAt0: number = sortedTwice.$_get(0);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = sortedTwice.$_get(1);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = sortedTwice.$_get(2);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = sortedTwice.$_get(3);
      let expectedElement3: int = 4;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = sortedTwice.$_get(4);
      let expectedElement4: int = 5;
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_2900
     * @tc.name testInt16ArrayToSortedTestTwo029
     * @tc.desc Verify unordered array chained toSorted() is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(7, 2, 9, 1, 5);
      let sortedOnce = arr.toSorted();
      let sortedTwice = sortedOnce.toSorted();
      let elementAt0: number = sortedOnce.$_get(0);
      let expectedElement0: number = sortedTwice.$_get(0);
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt4: number = sortedOnce.$_get(4);
      let expectedElement4: number = sortedTwice.$_get(4);
      expect(elementAt4).assertEqual(expectedElement4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3000
     * @tc.name testInt16ArrayToSortedTestTwo030
     * @tc.desc Verify single element toSorted() three times remains the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: int = 42;
      let arr: Int16Array = Int16Array.of(val);
      let sortedOnce = arr.toSorted();
      let sortedTwice = sortedOnce.toSorted();
      let sortedThrice = sortedTwice.toSorted();
      let elementAt0: number = sortedThrice.$_get(0);
      let expectedElement0: int = 42;
      expect(elementAt0).assertEqual(expectedElement0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3100
     * @tc.name testInt16ArrayToSortedTestTwo031
     * @tc.desc Verify toSorted() result length equals original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(9, 7, 8, 6);
      let result = arr.toSorted();
      let actualLength: int = result.length;
      let expectedLength: number = arr.length;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3200
     * @tc.name testInt16ArrayToSortedTestTwo032
     * @tc.desc Verify larger-magnitude negatives sort before smaller ones with toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(-1, -100, -10);
      let result = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = -100;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = -10;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = -1;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3300
     * @tc.name testInt16ArrayToSortedTestTwo033
     * @tc.desc Verify toSorted() uses numeric order not lexicographic order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(100, 20, 3);
      let result = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = 3;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = 20;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = 100;
      expect(elementAt2).assertEqual(expectedElement2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3400
     * @tc.name testInt16ArrayToSortedTestTwo034
     * @tc.desc Verify toSorted() returns the complete sequence with duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, 3, 5, 1, 5);
      let result = arr.toSorted();
      let actualString: string = result.toString();
      let expectedString: string = '1,3,5,5,5';
      expect(actualString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3500
     * @tc.name testInt16ArrayToSortedTestTwo035
     * @tc.desc Verify symmetric opposite numbers sort correctly with toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(5, -5, 3, -3, 1, -1);
      let result = arr.toSorted();
      let elementAt0: number = result.$_get(0);
      let expectedElement0: int = -5;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = -3;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = result.$_get(2);
      let expectedElement2: int = -1;
      expect(elementAt2).assertEqual(expectedElement2);
      let elementAt3: number = result.$_get(3);
      let expectedElement3: int = 1;
      expect(elementAt3).assertEqual(expectedElement3);
      let elementAt4: number = result.$_get(4);
      let expectedElement4: int = 3;
      expect(elementAt4).assertEqual(expectedElement4);
      let elementAt5: number = result.$_get(5);
      let expectedElement5: int = 5;
      expect(elementAt5).assertEqual(expectedElement5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3600
     * @tc.name testInt16ArrayToSortedTestTwo036
     * @tc.desc Verify length-1000 reverse array remains unchanged after toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int16Array(1000);
      for (let i = 0; i < 1000; i++) {
        arr.$_set(i, 1000 - i);
      }
      let result = arr.toSorted();
      for (let i = 0; i < result.length; i++) {
        let actualResultValue: number = result.$_get(i);
        let expectedResultValue: int = i + 1;
        expect(actualResultValue).assertEqual(expectedResultValue);
      }
      let elementAt0: number = arr.$_get(0);
      let expectedElement0: int = 1000;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt999: number = arr.$_get(999);
      let expectedElement999: int = 1;
      expect(elementAt999).assertEqual(expectedElement999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3700
     * @tc.name testInt16ArrayToSortedTestTwo037
     * @tc.desc Verify original length is unchanged after toSorted()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(30, 10, 20);
      let lenBefore = arr.length;
      let result = arr.toSorted();
      let actualString: string = result.toString();
      let expectedString: string = '10,20,30';
      expect(actualString).assertEqual(expectedString);
      let actualLength: int = arr.length;
      let expectedLength: number = lenBefore;
      expect(actualLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3800
     * @tc.name testInt16ArrayToSortedTestTwo038
     * @tc.desc Verify toSorted() result supports $_set to modify elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(3, 1, 2);
      let result = arr.toSorted();
      result.$_set(1, 88);
      let elementAt1: number = result.$_get(1);
      let expectedElement1: int = 88;
      expect(elementAt1).assertEqual(expectedElement1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_TOSORTED_TWO_3900
     * @tc.name testInt16ArrayToSortedTestTwo039
     * @tc.desc Verify toSorted() result can reconstruct via Int16Array.from
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInt16ArrayToSortedTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int16Array.of(3, 1, 2);
      let result = arr.toSorted();
      let copy = Int16Array.from(result);
      let elementAt0: number = copy.$_get(0);
      let expectedElement0: int = 1;
      expect(elementAt0).assertEqual(expectedElement0);
      let elementAt1: number = copy.$_get(1);
      let expectedElement1: int = 2;
      expect(elementAt1).assertEqual(expectedElement1);
      let elementAt2: number = copy.$_get(2);
      let expectedElement2: int = 3;
      expect(elementAt2).assertEqual(expectedElement2);
    });
  });
}
