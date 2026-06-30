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

class ToSplicedItem035 {
  value: number = 0;
}

function createSequentialArray(size: int): Array<number> {
  const arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function removeFirst<T>(arr: Array<T>): Array<T> {
  return arr.toSpliced(0, 1);
}

function removeLast<T>(arr: Array<T>): Array<T> {
  return arr.toSpliced(arr.length - 1, 1);
}

export default function ArrayToSpliced1Test(): void {
  describe('ArrayToSpliced1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_0100
     * @tc.name testArrayToSplicedOne001
     * @tc.desc Verify toSpliced returns an unchanged copy when called without parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced();
      expect(result.length).assertEqual(4);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_0200
     * @tc.name testArrayToSplicedOne002
     * @tc.desc Verify toSpliced(start) removes elements from start through the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(2);
      expect(result.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_0300
     * @tc.name testArrayToSplicedOne003
     * @tc.desc Verify toSpliced(start, delete) removes the requested number of elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 2);
      expect(result.toString()).assertEqual('1,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_0400
     * @tc.name testArrayToSplicedOne004
     * @tc.desc Verify optional parameter combinations produce the expected copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const r1 = arr.toSpliced();
      expect(r1.length).assertEqual(4);

      const r2 = arr.toSpliced(1);
      expect(r2.toString()).assertEqual('1');

      const r3 = arr.toSpliced(1, 2);
      expect(r3.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_0500
     * @tc.name testArrayToSplicedOne005
     * @tc.desc Verify the start parameter accepts Number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 1;
      const result = arr.toSpliced(start, 2);
      expect(result.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_0600
     * @tc.name testArrayToSplicedOne006
     * @tc.desc Verify the delete parameter accepts Number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const deleteCount: int = 2;
      const result = arr.toSpliced(1, deleteCount);
      expect(result.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_0700
     * @tc.name testArrayToSplicedOne007
     * @tc.desc Verify omitted optional parameters use the implementation defaults
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced();
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_0800
     * @tc.name testArrayToSplicedOne008
     * @tc.desc Verify toSpliced returns a new Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 2);
      expect(Array.isArray(result)).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_0900
     * @tc.name testArrayToSplicedOne009
     * @tc.desc Verify toSpliced does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const originalStr = arr.toString();
      arr.toSpliced(1, 2);
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1000
     * @tc.name testArrayToSplicedOne010
     * @tc.desc Verify the returned array has the expected length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(1, 2);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1100
     * @tc.name testArrayToSplicedOne011
     * @tc.desc Verify toSpliced handles empty arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.toSpliced(0, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1200
     * @tc.name testArrayToSplicedOne012
     * @tc.desc Verify start values greater than the array length delete nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(10, 1);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1300
     * @tc.name testArrayToSplicedOne013
     * @tc.desc Verify oversized delete counts remove through the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 10);
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1400
     * @tc.name testArrayToSplicedOne014
     * @tc.desc Verify a delete count of zero removes no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 0);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1500
     * @tc.name testArrayToSplicedOne015
     * @tc.desc Verify removing from index zero deletes leading elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(0, 2);
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1600
     * @tc.name testArrayToSplicedOne016
     * @tc.desc Verify start values equal to the array length delete nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(3, 1);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1700
     * @tc.name testArrayToSplicedOne017
     * @tc.desc Verify toSpliced leaves the original array unchanged while splice mutates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3, 4);
      const arr2 = new Array<number>(1, 2, 3, 4);
      const toSplicedResult = arr1.toSpliced(1, 2);
      const spliceResult = arr2.splice(1, 2);
      expect(arr1.toString()).assertEqual('1,2,3,4');
      expect(arr2.toString()).assertEqual('1,4');
      expect(toSplicedResult.toString()).assertEqual('1,4');
      expect(spliceResult.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1800
     * @tc.name testArrayToSplicedOne018
     * @tc.desc Verify toSpliced and splice return different value shapes for the same deletion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3, 4);
      const arr2 = new Array<number>(1, 2, 3, 4);
      const result1 = arr1.toSpliced(1, 2);
      const result2 = arr2.splice(1, 2);
      expect(result1.toString()).assertEqual('1,4');
      expect(result2.toString()).assertEqual('2,3');
      expect(result1.toString() !== result2.toString()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_1900
     * @tc.name testArrayToSplicedOne019
     * @tc.desc Verify start values supplied by int variables are handled consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 1;
      const result = arr.toSpliced(start, 1);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,3,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2000
     * @tc.name testArrayToSplicedOne020
     * @tc.desc Verify delete counts supplied by int variables are handled consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const deleteCount: int = 1;
      const result = arr.toSpliced(1, deleteCount);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('1,3,4');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2100
     * @tc.name testArrayToSplicedOne021
     * @tc.desc Verify zero start values remove from the beginning without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(0, 1);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('2,3');
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2200
     * @tc.name testArrayToSplicedOne022
     * @tc.desc Verify start values at array length leave the array contents unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(arr.length, 1);
      expect(result.toString()).assertEqual('1,2,3');
      expect(result.length).assertEqual(3);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2300
     * @tc.name testArrayToSplicedOne023
     * @tc.desc Verify toSpliced does not mutate original length or boundary elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      arr.toSpliced(1, 2);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[1]).assertEqual(2);
      expect(arr[2]).assertEqual(3);
      expect(arr[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2400
     * @tc.name testArrayToSplicedOne024
     * @tc.desc Verify repeated toSpliced calls return distinct array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result1 = arr.toSpliced(0, 1);
      const result2 = arr.toSpliced(0, 1);
      expect(result1 !== result2).assertTrue();
      expect(result1.toString()).assertEqual(result2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2500
     * @tc.name testArrayToSplicedOne025
     * @tc.desc Verify toSpliced can safely remove elements without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new Array<number>(1, 2, 3, 4, 5);
      const withoutMiddle = original.toSpliced(1, 3);
      expect(withoutMiddle.toString()).assertEqual('1,5');
      expect(original.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2600
     * @tc.name testArrayToSplicedOne026
     * @tc.desc Verify chained toSpliced calls can isolate middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const middle = arr.toSpliced(0, 2).toSpliced(1, 2);
      expect(middle.toString()).assertEqual('3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2700
     * @tc.name testArrayToSplicedOne027
     * @tc.desc Verify multiple toSpliced calls can be chained to remove several positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const result = arr.toSpliced(0, 1).toSpliced(2, 1).toSpliced(3, 1);
      expect(result.toString()).assertEqual('2,3,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2800
     * @tc.name testArrayToSplicedOne028
     * @tc.desc Verify toSpliced can be used in generic functional helpers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = removeLast(removeFirst(arr));
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_2900
     * @tc.name testArrayToSplicedOne029
     * @tc.desc Verify deleting all elements returns an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(0, 3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3000
     * @tc.name testArrayToSplicedOne030
     * @tc.desc Verify deleting the first element keeps the remaining suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(0, 1);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3100
     * @tc.name testArrayToSplicedOne031
     * @tc.desc Verify deleting the last element keeps the leading prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(2, 1);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3200
     * @tc.name testArrayToSplicedOne032
     * @tc.desc Verify deleting middle elements joins the remaining ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(1, 3);
      expect(result.toString()).assertEqual('1,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3300
     * @tc.name testArrayToSplicedOne033
     * @tc.desc Verify the delete count defaults remove elements through the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3400
     * @tc.name testArrayToSplicedOne034
     * @tc.desc Verify the return type preserves the generic element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result: Array<number> = arr.toSpliced(1, 1);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3500
     * @tc.name testArrayToSplicedOne035
     * @tc.desc Verify object arrays keep the remaining object references after deletion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new ToSplicedItem035();
      item1.value = 1;
      const item2 = new ToSplicedItem035();
      item2.value = 2;
      const arr = new Array<ToSplicedItem035>(item1, item2);
      const result = arr.toSpliced(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0].value).assertEqual(2);
      expect(result[0] === item2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3600
     * @tc.name testArrayToSplicedOne036
     * @tc.desc Verify toSpliced can be combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 2).map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('2,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3700
     * @tc.name testArrayToSplicedOne037
     * @tc.desc Verify toSpliced can be combined with filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(1, 1).filter((v: number): boolean => v > 2);
      expect(result.toString()).assertEqual('3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3800
     * @tc.name testArrayToSplicedOne038
     * @tc.desc Verify mapped arrays can be post-processed with toSpliced
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.map((v: number): number => v * 2).toSpliced(0, 1);
      expect(result.toString()).assertEqual('4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_3900
     * @tc.name testArrayToSplicedOne039
     * @tc.desc Verify large arrays support wide deletion ranges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createSequentialArray(10000);
      const result = arr.toSpliced(1000, 5000);
      expect(result.length).assertEqual(5000);
      expect(result[0]).assertEqual(0);
      expect(result[999]).assertEqual(999);
      expect(result[1000]).assertEqual(6000);
      expect(result[4999]).assertEqual(9999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4000
     * @tc.name testArrayToSplicedOne040
     * @tc.desc Verify toSpliced allocates a new array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const original = arr;
      const result = arr.toSpliced(2, 1);
      expect(result !== original).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4100
     * @tc.name testArrayToSplicedOne041
     * @tc.desc Verify multiple start positions produce the expected remaining elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.toSpliced(0, 1).toString()).assertEqual('2,3,4,5');
      expect(arr.toSpliced(1, 1).toString()).assertEqual('1,3,4,5');
      expect(arr.toSpliced(2, 1).toString()).assertEqual('1,2,4,5');
      expect(arr.toSpliced(4, 1).toString()).assertEqual('1,2,3,4');
      expect(arr.toSpliced(5, 1).toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4200
     * @tc.name testArrayToSplicedOne042
     * @tc.desc Verify multiple delete counts produce the expected remaining elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.toSpliced(0, 0).toString()).assertEqual('1,2,3,4,5');
      expect(arr.toSpliced(0, 1).toString()).assertEqual('2,3,4,5');
      expect(arr.toSpliced(0, 2).toString()).assertEqual('3,4,5');
      expect(arr.toSpliced(0, 5).toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4300
     * @tc.name testArrayToSplicedOne043
     * @tc.desc Verify toSpliced clone preserves explicit undefined middle elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(0, 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4400
     * @tc.name testArrayToSplicedOne044
     * @tc.desc Verify toSpliced with no arguments clones dense arrays with undefined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced();
      expect(result.length).assertEqual(3);
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4500
     * @tc.name testArrayToSplicedOne045
     * @tc.desc Verify toSpliced can delete an explicit undefined element and return kept values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(1, 1);
      expect(result.length).assertEqual(2);
      expect(result.toString()).assertEqual('1,3');
      expect(result.lastIndexOf(undefined)).assertEqual(-1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4600
     * @tc.name testArrayToSplicedOne046
     * @tc.desc Verify replacing the tail preserves an earlier explicit undefined element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(2, 1, 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(4);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4700
     * @tc.name testArrayToSplicedOne047
     * @tc.desc Verify inserting into an all-undefined dense array keeps undefined values on both sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(2, (_index) => undefined);
      const result = arr.toSpliced(1, 0, 1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual(1);
      expect(result[2]).assertUndefined();
      expect(arr.indexOf(undefined)).assertEqual(0);
      expect(result.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4800
     * @tc.name testArrayToSplicedOne048
     * @tc.desc Verify deleting from an all-undefined dense array returns remaining undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      const result = arr.toSpliced(1, 1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_4900
     * @tc.name testArrayToSplicedOne049
     * @tc.desc Verify explicit undefined elements are preserved by a zero-delete copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined);
      const result = arr.toSpliced(0, 0);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5000
     * @tc.name testArrayToSplicedOne050
     * @tc.desc Verify a far negative start is clamped to the beginning before deletion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(-100, 1);
      expect(result.toString()).assertEqual('2,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5100
     * @tc.name testArrayToSplicedOne051
     * @tc.desc Verify negative delete counts remove no elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, -100);
      expect(result.toString()).assertEqual('1,2,3');
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5200
     * @tc.name testArrayToSplicedOne052
     * @tc.desc Verify one-argument far negative start deletes the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(-100);
      expect(result.length).assertEqual(0);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5300
     * @tc.name testArrayToSplicedOne053
     * @tc.desc Verify omitted delete count and zero delete count are distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const omittedDelete = arr.toSpliced(1);
      const zeroDelete = arr.toSpliced(1, 0);
      expect(omittedDelete.toString()).assertEqual('1');
      expect(zeroDelete.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5400
     * @tc.name testArrayToSplicedOne054
     * @tc.desc Verify deleting the tail preserves an earlier explicit undefined value in the kept prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      arr[3] = 4;
      const result = arr.toSpliced(3, 1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(3);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5500
     * @tc.name testArrayToSplicedOne055
     * @tc.desc Verify middle deletion preserves an explicit undefined suffix element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[1] = 2;
      const result = arr.toSpliced(1, 1);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5600
     * @tc.name testArrayToSplicedOne056
     * @tc.desc Verify zero-delete copy of an all-undefined dense array preserves undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      const result = arr.toSpliced(0, 0);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result[2]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(2);
      expect(arr.lastIndexOf(undefined)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5700
     * @tc.name testArrayToSplicedOne057
     * @tc.desc Verify one-argument toSpliced keeps explicit undefined values in the copied prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[2] = 3;
      const result = arr.toSpliced(2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertUndefined();
      expect(result.lastIndexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5800
     * @tc.name testArrayToSplicedOne058
     * @tc.desc Verify explicit undefined delete count follows ArkTS default deletion semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, undefined);
      expect(result.toString()).assertEqual('1');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_5900
     * @tc.name testArrayToSplicedOne059
     * @tc.desc Verify zero-delete copy preserves source after result mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      const result = arr.toSpliced(0, 0);
      result[1] = 2;
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr.lastIndexOf(undefined)).assertEqual(1);
      expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6000
     * @tc.name testArrayToSplicedOne060
     * @tc.desc Verify toSpliced without inserted items can remove middle value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const result = arr.toSpliced(1, 1);
      expect(result.toString()).assertEqual('2,4');
      expect(arr.toString()).assertEqual('2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6100
     * @tc.name testArrayToSplicedOne061
     * @tc.desc Verify toSpliced with no parameters returns an unchanged copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced();
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6200
     * @tc.name testArrayToSplicedOne062
     * @tc.desc Verify toSpliced with only start removes from that start to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(2);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6300
     * @tc.name testArrayToSplicedOne063
     * @tc.desc Verify toSpliced with start and delete removes one middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 1);
      expect(result.toString()).assertEqual('1,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6400
     * @tc.name testArrayToSplicedOne064
     * @tc.desc Verify toSpliced with start and delete can remove a suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(2, 2);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6500
     * @tc.name testArrayToSplicedOne065
     * @tc.desc Verify toSpliced with start zero and delete zero keeps the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(0, 0);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6600
     * @tc.name testArrayToSplicedOne066
     * @tc.desc Verify toSpliced can replace the tail with an inserted value while preserving the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(2, 5, 9);
      expect(result.toString()).assertEqual('1,2,9');
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6700
     * @tc.name testArrayToSplicedOne067
     * @tc.desc Verify toSpliced with negative start counts from the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(-2, 1);
      expect(result.toString()).assertEqual('1,2,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6800
     * @tc.name testArrayToSplicedOne068
     * @tc.desc Verify toSpliced with start equal to length keeps the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(arr.length, 1);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_6900
     * @tc.name testArrayToSplicedOne069
     * @tc.desc Verify toSpliced with start beyond length appends inserted items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(10, 1, 4, 5);
      expect(result.toString()).assertEqual('1,2,3,4,5');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7000
     * @tc.name testArrayToSplicedOne070
     * @tc.desc Verify toSpliced with no parameters returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7100
     * @tc.name testArrayToSplicedOne071
     * @tc.desc Verify toSpliced with delete parameters preserves the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const before = arr.toString();
      arr.toSpliced(1, 1);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7200
     * @tc.name testArrayToSplicedOne072
     * @tc.desc Verify toSpliced without inserted items works for string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      const result = arr.toSpliced(1, 1);
      expect(result.toString()).assertEqual('a,c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7300
     * @tc.name testArrayToSplicedOne073
     * @tc.desc Verify toSpliced without inserted items works for boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.toSpliced(1, 1);
      expect(result.toString()).assertEqual('true,true');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7400
     * @tc.name testArrayToSplicedOne074
     * @tc.desc Verify toSpliced without inserted items works for bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n);
      const result = arr.toSpliced(1, 1);
      expect(result.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7500
     * @tc.name testArrayToSplicedOne075
     * @tc.desc Verify toSpliced without inserted items preserves object references in kept positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToSplicedItem035();
      const second = new ToSplicedItem035();
      const third = new ToSplicedItem035();
      const arr = new Array<ToSplicedItem035>(first, second, third);
      const result = arr.toSpliced(1, 1);
      expect(result[0] === first).assertTrue();
      expect(result[1] === third).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7600
     * @tc.name testArrayToSplicedOne076
     * @tc.desc Verify toSpliced without inserted items works on Array.of results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(4, 5, 6, 7);
      const result = arr.toSpliced(2, 1);
      expect(result.toString()).assertEqual('4,5,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7700
     * @tc.name testArrayToSplicedOne077
     * @tc.desc Verify toSpliced without inserted items works on Array.from results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6, 8));
      const result = arr.toSpliced(1, 2);
      expect(result.toString()).assertEqual('2,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7800
     * @tc.name testArrayToSplicedOne078
     * @tc.desc Verify toSpliced without inserted items works after reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      const result = arr.toSpliced(1, 2);
      expect(result.toString()).assertEqual('4,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_7900
     * @tc.name testArrayToSplicedOne079
     * @tc.desc Verify toSpliced without inserted items works after sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(4, 1, 3, 2);
      arr.sort((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = arr.toSpliced(1, 2);
      expect(result.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8000
     * @tc.name testArrayToSplicedOne080
     * @tc.desc Verify toSpliced without inserted items works after shift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shift();
      const result = arr.toSpliced(1, 1);
      expect(result.toString()).assertEqual('2,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8100
     * @tc.name testArrayToSplicedOne081
     * @tc.desc Verify toSpliced without inserted items works after pop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.pop();
      const result = arr.toSpliced(1, 1);
      expect(result.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8200
     * @tc.name testArrayToSplicedOne082
     * @tc.desc Verify toSpliced without inserted items works after unshift
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      const result = arr.toSpliced(1, 2);
      expect(result.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8300
     * @tc.name testArrayToSplicedOne083
     * @tc.desc Verify toSpliced without inserted items works after push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      const result = arr.toSpliced(1, 2);
      expect(result.toString()).assertEqual('1,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8400
     * @tc.name testArrayToSplicedOne084
     * @tc.desc Verify toSpliced without inserted items works after splice inserts middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 8, 9);
      const result = arr.toSpliced(1, 2);
      expect(result.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8500
     * @tc.name testArrayToSplicedOne085
     * @tc.desc Verify toSpliced without inserted items works after shrinkTo truncates the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      const result = arr.toSpliced(1, 1);
      expect(result.toString()).assertEqual('1,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8600
     * @tc.name testArrayToSplicedOne086
     * @tc.desc Verify toSpliced without inserted items works on duplicate values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2, 3);
      const result = arr.toSpliced(1, 2);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8700
     * @tc.name testArrayToSplicedOne087
     * @tc.desc Verify toSpliced without inserted items works on negative and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 0, 3, 6);
      const result = arr.toSpliced(1, 2);
      expect(result.toString()).assertEqual('-3,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8800
     * @tc.name testArrayToSplicedOne088
     * @tc.desc Verify toSpliced without inserted items can chain with join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 2);
      expect(result.join('-')).assertEqual('1-4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_8900
     * @tc.name testArrayToSplicedOne089
     * @tc.desc Verify toSpliced without inserted items can chain with with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 2).with(1, 9);
      expect(result.toString()).assertEqual('1,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_9000
     * @tc.name testArrayToSplicedOne090
     * @tc.desc Verify toSpliced without inserted items can chain with slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(1, 1).slice(1);
      expect(result.toString()).assertEqual('3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_9100
     * @tc.name testArrayToSplicedOne091
     * @tc.desc Verify toSpliced can insert into an empty array and return a new populated copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.toSpliced(0, 1, 7, 8);
      expect(result.toString()).assertEqual('7,8');
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_9200
     * @tc.name testArrayToSplicedOne092
     * @tc.desc Verify toSpliced without inserted items can operate on a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      const result = arr.toSpliced(0, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_9300
     * @tc.name testArrayToSplicedOne093
     * @tc.desc Verify toSpliced without inserted items can keep a single-element array when delete is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      const result = arr.toSpliced(0, 0);
      expect(result.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_9400
     * @tc.name testArrayToSplicedOne094
     * @tc.desc Verify toSpliced without inserted items can operate on a large generated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 10; i++) {
        arr.pushOne(i);
      }
      const result = arr.toSpliced(4, 3);
      expect(result.toString()).assertEqual('0,1,2,3,7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_9500
     * @tc.name testArrayToSplicedOne095
     * @tc.desc Verify toSpliced without inserted items can operate after length reset and rebuild
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      arr.pushOne(9);
      const result = arr.toSpliced(1, 1);
      expect(result.toString()).assertEqual('7,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_9600
     * @tc.name testArrayToSplicedOne096
     * @tc.desc Verify toSpliced without inserted items keeps array identity separate from the result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1, 1);
      expect(arr === result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_9700
     * @tc.name testArrayToSplicedOne097
     * @tc.desc Verify toSpliced without inserted items preserves array element typing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result: Array<number> = arr.toSpliced(1, 1);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_ONE_9800
     * @tc.name testArrayToSplicedOne098
     * @tc.desc Verify toSpliced without inserted items can remove the full tail from a computed start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.toSpliced(arr.length - 2);
      expect(result.toString()).assertEqual('10,20');
    });

  });
}

