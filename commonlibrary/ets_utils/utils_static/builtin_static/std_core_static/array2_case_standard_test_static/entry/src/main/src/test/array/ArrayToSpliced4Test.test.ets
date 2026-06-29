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

class ToSplicedFourItem036 {
  value: number = 0;
}

class ToSplicedFourItem {
  value: number = 0;
}

function createLargeNumberArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function toSplicedAnyNumberArrayFour(value: Any, start: int): string {
  const arr = value as Array<number>;
  return arr.toSpliced(start).toString();
}

export default function ArrayToSpliced4Test(): void {
  describe('ArrayToSpliced4Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0010
     * @tc.name testArrayToSplicedFour001
     * @tc.desc Verify toSpliced accepts one required int start parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0020
     * @tc.name testArrayToSplicedFour002
     * @tc.desc Verify start can be passed through an int variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0030
     * @tc.name testArrayToSplicedFour003
     * @tc.desc Verify examples use the one-argument form when start is required
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1);
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0040
     * @tc.name testArrayToSplicedFour004
     * @tc.desc Verify int start values produce the expected remaining prefix length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0050
     * @tc.name testArrayToSplicedFour005
     * @tc.desc Verify a zero start removes elements from the beginning through the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 0;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0060
     * @tc.name testArrayToSplicedFour006
     * @tc.desc Verify toSpliced returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(2);
      expect(Array.isArray(result)).assertTrue();
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0070
     * @tc.name testArrayToSplicedFour007
     * @tc.desc Verify toSpliced leaves the original array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const originalStr = arr.toString();
      arr.toSpliced(1);
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0080
     * @tc.name testArrayToSplicedFour008
     * @tc.desc Verify toSpliced keeps the prefix before start and removes the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(2);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0090
     * @tc.name testArrayToSplicedFour009
     * @tc.desc Verify start one keeps only the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.toSpliced(1);
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0100
     * @tc.name testArrayToSplicedFour010
     * @tc.desc Verify start at length minus one keeps all but the last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = arr.length - 1;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0110
     * @tc.name testArrayToSplicedFour011
     * @tc.desc Verify start equal to the array length deletes nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = arr.length;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0120
     * @tc.name testArrayToSplicedFour012
     * @tc.desc Verify start values greater than the array length delete nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(10);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0130
     * @tc.name testArrayToSplicedFour013
     * @tc.desc Verify negative start values count from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = -2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0140
     * @tc.name testArrayToSplicedFour014
     * @tc.desc Verify start zero produces an empty returned array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(9, 8, 7);
      const result = arr.toSpliced(0);
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0150
     * @tc.name testArrayToSplicedFour015
     * @tc.desc Verify the one-argument form differs from the no-argument form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3, 4);
      const arr2 = new Array<number>(1, 2, 3, 4);
      const r1 = arr1.toSpliced();
      const r2 = arr2.toSpliced(2);
      expect(r1.length).assertEqual(4);
      expect(r2.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0160
     * @tc.name testArrayToSplicedFour016
     * @tc.desc Verify the one-argument form differs from the items overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const items: FixedArray<number> = [10, 20];
      const r1 = arr.toSpliced(2);
      const r2 = arr.toSpliced(2, 2, ...items);
      expect(r1.toString()).assertEqual('1,2');
      expect(r2.toString()).assertEqual('1,2,10,20,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0170
     * @tc.name testArrayToSplicedFour017
     * @tc.desc Verify the int overload keeps the expected prefix content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0180
     * @tc.name testArrayToSplicedFour018
     * @tc.desc Verify toSpliced does not change original length or boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const originalLength = arr.length;
      const originalFirst = arr[0];
      const originalLast = arr[arr.length - 1];
      arr.toSpliced(2);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[4]).assertEqual(originalLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0190
     * @tc.name testArrayToSplicedFour019
     * @tc.desc Verify the returned array is independent from the source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.toSpliced(1);
      result[0] = 999;
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0200
     * @tc.name testArrayToSplicedFour020
     * @tc.desc Verify toSpliced can keep the first half of an array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const mid: int = 3;
      const firstHalf = arr.toSpliced(mid);
      expect(firstHalf.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0210
     * @tc.name testArrayToSplicedFour021
     * @tc.desc Verify toSpliced can remove the tail after a chosen index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(3);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0220
     * @tc.name testArrayToSplicedFour022
     * @tc.desc Verify toSpliced can keep elements through a specified index boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const keepUntil: int = 3;
      const result = arr.toSpliced(keepUntil);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0230
     * @tc.name testArrayToSplicedFour023
     * @tc.desc Verify a start computed from array length can remove the last items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6, 7);
      const removeLast: int = 3;
      const start: int = arr.length - removeLast;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0240
     * @tc.name testArrayToSplicedFour024
     * @tc.desc Verify chained toSpliced calls can keep a narrowed prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const result = arr.toSpliced(4).toSpliced(1);
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0250
     * @tc.name testArrayToSplicedFour025
     * @tc.desc Verify integer start values can be reused across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const start: int = 2;
      const result1 = arr.toSpliced(start);
      const result2 = arr.toSpliced(start);
      expect(result1.toString()).assertEqual('1,2');
      expect(result2.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0260
     * @tc.name testArrayToSplicedFour026
     * @tc.desc Verify start can be calculated from the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const len: int = arr.length;
      const start: int = len - 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0270
     * @tc.name testArrayToSplicedFour027
     * @tc.desc Verify toSpliced on a single-element array with start zero returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(42);
      const result = arr.toSpliced(0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0280
     * @tc.name testArrayToSplicedFour028
     * @tc.desc Verify toSpliced on a single-element array with start one keeps the element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(42);
      const result = arr.toSpliced(1);
      expect(result.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0290
     * @tc.name testArrayToSplicedFour029
     * @tc.desc Verify two-element arrays handle several start positions consistently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      expect(arr.toSpliced(0).length).assertEqual(0);
      expect(arr.toSpliced(1).toString()).assertEqual('1');
      expect(arr.toSpliced(2).toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0300
     * @tc.name testArrayToSplicedFour030
     * @tc.desc Verify toSpliced can be combined with map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(3).map((v: number): number => v * 2);
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0310
     * @tc.name testArrayToSplicedFour031
     * @tc.desc Verify toSpliced can be combined with filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(2).filter((v: number): boolean => v > 1);
      expect(result.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0320
     * @tc.name testArrayToSplicedFour032
     * @tc.desc Verify sliced arrays can call toSpliced afterward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5, 6);
      const sliced = arr.slice(0, 4);
      const result = sliced.toSpliced(2);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0330
     * @tc.name testArrayToSplicedFour033
     * @tc.desc Verify toSpliced reflects earlier push operations without mutating the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.push(4, 5);
      const result = arr.toSpliced(3);
      expect(result.toString()).assertEqual('1,2,3');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0340
     * @tc.name testArrayToSplicedFour034
     * @tc.desc Verify the return type preserves the generic element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 2;
      const result: Array<number> = arr.toSpliced(start);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0350
     * @tc.name testArrayToSplicedFour035
     * @tc.desc Verify different generic array element types keep the expected prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(1, 2, 3);
      const arr2 = new Array<string>('a', 'b', 'c');
      const r1 = arr1.toSpliced(1);
      const r2 = arr2.toSpliced(1);
      expect(r1.toString()).assertEqual('1');
      expect(r2.toString()).assertEqual('a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0360
     * @tc.name testArrayToSplicedFour036
     * @tc.desc Verify object arrays keep the remaining object references after deletion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new ToSplicedFourItem036();
      item1.value = 1;
      const item2 = new ToSplicedFourItem036();
      item2.value = 2;
      const item3 = new ToSplicedFourItem036();
      item3.value = 3;
      const arr = new Array<ToSplicedFourItem036>(item1, item2, item3);
      const result = arr.toSpliced(1);
      expect(result.length).assertEqual(1);
      expect(result[0].value).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0370
     * @tc.name testArrayToSplicedFour037
     * @tc.desc Verify large arrays support removing all elements from a later start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(10000);
      const start: int = 5000;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(5000);
      expect(result[0]).assertEqual(0);
      expect(result[4999]).assertEqual(4999);
      expect(arr[5000]).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0380
     * @tc.name testArrayToSplicedFour038
     * @tc.desc Verify toSpliced allocates a new array object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.toSpliced(2);
      expect(result !== arr).assertTrue();
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0390
     * @tc.name testArrayToSplicedFour039
     * @tc.desc Verify several start values produce the expected prefixes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.toSpliced(0).toString()).assertEqual('');
      expect(arr.toSpliced(1).toString()).assertEqual('1');
      expect(arr.toSpliced(2).toString()).assertEqual('1,2');
      expect(arr.toSpliced(3).toString()).assertEqual('1,2,3');
      expect(arr.toSpliced(4).toString()).assertEqual('1,2,3,4');
      expect(arr.toSpliced(5).toString()).assertEqual('1,2,3,4,5');
      expect(arr.toSpliced(6).toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0400
     * @tc.name testArrayToSplicedFour040
     * @tc.desc Verify negative start values normalize relative to the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.toSpliced(-1).toString()).assertEqual('1,2,3,4');
      expect(arr.toSpliced(-2).toString()).assertEqual('1,2,3');
      expect(arr.toSpliced(-5).toString()).assertEqual('');
      expect(arr.toSpliced(-6).toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0410
     * @tc.name testArrayToSplicedFour041
     * @tc.desc Verify toSpliced and slice keep different sides of the boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const spliced = arr.toSpliced(2);
      const sliced = arr.slice(2);
      expect(spliced.toString()).assertEqual('1,2');
      expect(sliced.toString()).assertEqual('3,4,5');
      expect(arr.toString()).assertEqual('1,2,3,4,5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0420
     * @tc.name testArrayToSplicedFour042
     * @tc.desc Verify slice can reproduce the same prefix as toSpliced with one start argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const r1 = arr.toSpliced(2);
      const r2 = arr.slice(0, 2);
      expect(r1.toString()).assertEqual(r2.toString());
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0430
     * @tc.name testArrayToSplicedFour043
     * @tc.desc Verify one-argument toSpliced far negative start removes the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = -99;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(0);
      expect(arr.toString()).assertEqual('1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0440
     * @tc.name testArrayToSplicedFour044
     * @tc.desc Verify one-argument toSpliced far positive start returns a full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      const start: int = 999;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('2,3,4');
      expect(result !== arr).assertTrue();
      expect(arr.toString()).assertEqual('2,3,4');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0450
     * @tc.name testArrayToSplicedFour045
     * @tc.desc Verify one-argument toSpliced preserves undefined in the kept prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(undefined, 4, 5);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result[0]).assertUndefined();
      expect(result[1]).assertEqual(4);
      expect(result.length).assertEqual(2);
      expect(arr[0]).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0460
     * @tc.name testArrayToSplicedFour046
     * @tc.desc Verify one-argument toSpliced preserves null in the kept prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(null, 5, 6);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result[0]).assertNull();
      expect(result[1]).assertEqual(5);
      expect(arr[0]).assertNull();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0470
     * @tc.name testArrayToSplicedFour047
     * @tc.desc Verify one-argument toSpliced preserves explicit undefined values in the copied prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(4, (_index) => undefined);
      arr[0] = 5;
      arr[2] = 7;
      const start: int = 3;
      const result = arr.toSpliced(start);
      expect(result[0]).assertEqual(5);
      expect(result[1]).assertUndefined();
      expect(result[2]).assertEqual(7);
      expect(result.lastIndexOf(undefined)).assertEqual(1);
      expect(arr.lastIndexOf(undefined)).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0480
     * @tc.name testArrayToSplicedFour048
     * @tc.desc Verify one-argument toSpliced can keep only an empty string prefix item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', ' ', 'value');
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('');
      expect(arr[1]).assertEqual(' ');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0490
     * @tc.name testArrayToSplicedFour049
     * @tc.desc Verify one-argument toSpliced can keep an empty string and a space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', ' ', 'tail');
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('');
      expect(result[1]).assertEqual(' ');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0500
     * @tc.name testArrayToSplicedFour050
     * @tc.desc Verify one-argument toSpliced preserves object references in the prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToSplicedFourItem();
      first.value = 8;
      const second = new ToSplicedFourItem();
      second.value = 9;
      const arr = new Array<ToSplicedFourItem>(first, second);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result[0] === first).assertTrue();
      result[0].value = 80;
      expect(arr[0].value).assertEqual(80);
      expect(arr[1] === second).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0510
     * @tc.name testArrayToSplicedFour051
     * @tc.desc Verify one-argument toSpliced keeps nested array references shallow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Array<number>(9);
      const second = new Array<number>(10);
      const arr = new Array<Array<number>>(first, second);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result[0] === first).assertTrue();
      result[0][0] = 90;
      expect(arr[0][0]).assertEqual(90);
      expect(arr[1] === second).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0520
     * @tc.name testArrayToSplicedFour052
     * @tc.desc Verify one-argument toSpliced result mutation does not change primitive source values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 11, 12);
      const start: int = 2;
      const result = arr.toSpliced(start);
      result[0] = 99;
      expect(result.toString()).assertEqual('99,11');
      expect(arr.toString()).assertEqual('10,11,12');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0530
     * @tc.name testArrayToSplicedFour053
     * @tc.desc Verify one-argument toSpliced start equal to length returns an independent full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(11, 12, 13);
      const start: int = arr.length;
      const result = arr.toSpliced(start);
      result[1] = 99;
      expect(result.toString()).assertEqual('11,99,13');
      expect(arr.toString()).assertEqual('11,12,13');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0540
     * @tc.name testArrayToSplicedFour054
     * @tc.desc Verify one-argument toSpliced negative start equal to length deletes all items
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(12, 13, 14);
      const start: int = -3;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(0);
      expect(arr.toString()).assertEqual('12,13,14');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0550
     * @tc.name testArrayToSplicedFour055
     * @tc.desc Verify one-argument toSpliced negative start keeps the prefix before the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(13, 14, 15, 16);
      const start: int = -2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('13,14');
      expect(arr.toString()).assertEqual('13,14,15,16');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0560
     * @tc.name testArrayToSplicedFour056
     * @tc.desc Verify one-argument toSpliced can keep boolean prefixes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('true,false');
      expect(arr.toString()).assertEqual('true,false,true');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0570
     * @tc.name testArrayToSplicedFour057
     * @tc.desc Verify one-argument toSpliced can keep bigint prefixes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(15n, 16n, 17n);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result[0]).assertEqual(15n);
      expect(result[1]).assertEqual(16n);
      expect(result.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0580
     * @tc.name testArrayToSplicedFour058
     * @tc.desc Verify one-argument toSpliced on an empty array returns a new empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const start: int = 0;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(0);
      expect(result !== arr).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0590
     * @tc.name testArrayToSplicedFour059
     * @tc.desc Verify one-argument toSpliced after push keeps the computed prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(17, 18);
      arr.pushOne(19);
      arr.pushOne(20);
      const start: int = arr.length - 1;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('17,18,19');
      expect(arr.toString()).assertEqual('17,18,19,20');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0600
     * @tc.name testArrayToSplicedFour060
     * @tc.desc Verify one-argument toSpliced can isolate a long numeric prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createLargeNumberArray(20);
      const start: int = 18;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(18);
      expect(result[0]).assertEqual(0);
      expect(result[17]).assertEqual(17);
      expect(arr.length).assertEqual(20);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0610
     * @tc.name testArrayToSplicedFour061
     * @tc.desc Verify one-argument toSpliced with int start zero removes the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 0;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(0);
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0620
     * @tc.name testArrayToSplicedFour062
     * @tc.desc Verify one-argument toSpliced with int start one keeps only the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0630
     * @tc.name testArrayToSplicedFour063
     * @tc.desc Verify one-argument toSpliced with int start equal to length returns an independent copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = arr.length;
      const result = arr.toSpliced(start);
      result[0] = 9;
      expect(result !== arr).assertTrue();
      expect(result.toString()).assertEqual('9,2,3');
      expect(arr.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0640
     * @tc.name testArrayToSplicedFour064
     * @tc.desc Verify one-argument toSpliced with int start beyond length keeps the whole array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 10;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0650
     * @tc.name testArrayToSplicedFour065
     * @tc.desc Verify one-argument toSpliced with negative int start does not mutate the original tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const start: int = -1;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('10,20,30');
      expect(arr.toString()).assertEqual('10,20,30,40');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0660
     * @tc.name testArrayToSplicedFour066
     * @tc.desc Verify one-argument toSpliced works for string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'd');
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('a,b');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0670
     * @tc.name testArrayToSplicedFour067
     * @tc.desc Verify one-argument toSpliced works for boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true, false);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('true,false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0680
     * @tc.name testArrayToSplicedFour068
     * @tc.desc Verify one-argument toSpliced works for bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 4n);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0690
     * @tc.name testArrayToSplicedFour069
     * @tc.desc Verify one-argument toSpliced preserves object references in the kept prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new ToSplicedFourItem036();
      const second = new ToSplicedFourItem036();
      const arr = new Array<ToSplicedFourItem036>(first, second);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result[0] === first).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0700
     * @tc.name testArrayToSplicedFour070
     * @tc.desc Verify one-argument toSpliced works on a slice result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).slice(0, 4);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0710
     * @tc.name testArrayToSplicedFour071
     * @tc.desc Verify one-argument toSpliced works on a filter result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).filter((value: number): boolean => value >= 1);
      const start: int = 3;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0720
     * @tc.name testArrayToSplicedFour072
     * @tc.desc Verify one-argument toSpliced works on a concat result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2).concat(new Array<number>(3, 4));
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0730
     * @tc.name testArrayToSplicedFour073
     * @tc.desc Verify one-argument toSpliced works on a toReversed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4).toReversed();
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('4,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0740
     * @tc.name testArrayToSplicedFour074
     * @tc.desc Verify one-argument toSpliced works after reverse mutates the source first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.reverse();
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('4,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0750
     * @tc.name testArrayToSplicedFour075
     * @tc.desc Verify one-argument toSpliced works after sort mutates the source first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0760
     * @tc.name testArrayToSplicedFour076
     * @tc.desc Verify one-argument toSpliced works after shift changes the source head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shift();
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0770
     * @tc.name testArrayToSplicedFour077
     * @tc.desc Verify one-argument toSpliced works after pop changes the source tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.pop();
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0780
     * @tc.name testArrayToSplicedFour078
     * @tc.desc Verify one-argument toSpliced works after unshift prepends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4);
      arr.unshift(1, 2);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0790
     * @tc.name testArrayToSplicedFour079
     * @tc.desc Verify one-argument toSpliced works after push appends values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2);
      arr.push(3, 4);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0800
     * @tc.name testArrayToSplicedFour080
     * @tc.desc Verify one-argument toSpliced works after splice inserts middle values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.splice(1, 1, 8, 9);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0810
     * @tc.name testArrayToSplicedFour081
     * @tc.desc Verify one-argument toSpliced works after shrinkTo truncates the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      arr.shrinkTo(3);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0820
     * @tc.name testArrayToSplicedFour082
     * @tc.desc Verify one-argument toSpliced works on Array.of results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.of<number>(5, 6, 7, 8);
      const start: int = 3;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('5,6,7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0830
     * @tc.name testArrayToSplicedFour083
     * @tc.desc Verify one-argument toSpliced works on Array.from results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.from<number>(new Array<number>(2, 4, 6, 8));
      const start: int = 3;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('2,4,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0840
     * @tc.name testArrayToSplicedFour084
     * @tc.desc Verify one-argument toSpliced works on a rebuilt array after length reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(7);
      arr.pushOne(8);
      arr.pushOne(9);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('7,8');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0850
     * @tc.name testArrayToSplicedFour085
     * @tc.desc Verify one-argument toSpliced keeps duplicate prefix values intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 2, 2, 3);
      const start: int = 3;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('2,2,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0860
     * @tc.name testArrayToSplicedFour086
     * @tc.desc Verify one-argument toSpliced keeps negative and zero prefix values intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(-3, 0, 3, 6);
      const start: int = 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('-3,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0870
     * @tc.name testArrayToSplicedFour087
     * @tc.desc Verify one-argument toSpliced returns a new array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result !== arr).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0880
     * @tc.name testArrayToSplicedFour088
     * @tc.desc Verify one-argument toSpliced leaves the source array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const before = arr.toString();
      const start: int = 1;
      arr.toSpliced(start);
      expect(arr.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0890
     * @tc.name testArrayToSplicedFour089
     * @tc.desc Verify one-argument toSpliced can be followed by join on the prefix copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 3;
      const result = arr.toSpliced(start);
      expect(result.join('-')).assertEqual('1-2-3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0900
     * @tc.name testArrayToSplicedFour090
     * @tc.desc Verify one-argument toSpliced can be followed by with on the prefix copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 3;
      const result = arr.toSpliced(start).with(1, 9);
      expect(result.toString()).assertEqual('1,9,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0910
     * @tc.name testArrayToSplicedFour091
     * @tc.desc Verify one-argument toSpliced can be followed by slice on the prefix copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const start: int = 3;
      const result = arr.toSpliced(start).slice(1);
      expect(result.toString()).assertEqual('2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0920
     * @tc.name testArrayToSplicedFour092
     * @tc.desc Verify one-argument toSpliced can isolate a single leading element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 6, 7);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0930
     * @tc.name testArrayToSplicedFour093
     * @tc.desc Verify one-argument toSpliced can preserve the full prefix for a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0940
     * @tc.name testArrayToSplicedFour094
     * @tc.desc Verify one-argument toSpliced can remove the whole single-element array from start zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5);
      const start: int = 0;
      const result = arr.toSpliced(start);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0950
     * @tc.name testArrayToSplicedFour095
     * @tc.desc Verify one-argument toSpliced works on a large generated array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      for (let i: int = 0; i < 12; i++) {
        arr.pushOne(i);
      }
      const start: int = 10;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('0,1,2,3,4,5,6,7,8,9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0960
     * @tc.name testArrayToSplicedFour096
     * @tc.desc Verify one-argument toSpliced preserves array element type information
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 2;
      const result: Array<number> = arr.toSpliced(start);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0970
     * @tc.name testArrayToSplicedFour097
     * @tc.desc Verify one-argument toSpliced keeps the original array usable after the copy is built
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 2;
      arr.toSpliced(start);
      arr.pushOne(4);
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0980
     * @tc.name testArrayToSplicedFour098
     * @tc.desc Verify one-argument toSpliced handles a computed int start from length minus two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const start: int = arr.length - 2;
      const result = arr.toSpliced(start);
      expect(result.toString()).assertEqual('10,20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_0990
     * @tc.name testArrayToSplicedFour099
     * @tc.desc Verify one-argument toSpliced preserves array identity separation from the returned copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const start: int = 1;
      const result = arr.toSpliced(start);
      expect(arr === result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_1000
     * @tc.name testArrayToSplicedFour100
     * @tc.desc Verify one-argument toSpliced works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3, 4);
      expect(toSplicedAnyNumberArrayFour(anyValue, 2)).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_TO_SPLICED_FOUR_1010
     * @tc.name testArrayToSplicedFour101
     * @tc.desc Verify one-argument toSpliced supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayToSplicedFour101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      const result = anyArr.toSpliced(1);
      expect(result.toString()).assertEqual('1');
      expect(anyArr.toString()).assertEqual('1,two,true');
    });

  });
}

