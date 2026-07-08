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

class Item035 {
  value: number = 0;
}

function createRangeArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

export default function ArrayIndexOf1Test(): void {
  describe('ArrayIndexOf1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0010
     * @tc.name testArrayIndexOfOne001
     * @tc.desc Verify indexOf accepts value and fromIndex parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let val = 3;
      let fromIndex: int = 0;
      let result = arr.indexOf(val, fromIndex);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0020
     * @tc.name testArrayIndexOfOne002
     * @tc.desc Verify the value parameter uses the array element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let val: string = 'b';
      let result = arr.indexOf(val);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0030
     * @tc.name testArrayIndexOfOne003
     * @tc.desc Verify indexOf uses strict equality and distinguishes numeric and string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, '2', 2, '3');
      expect(arr.indexOf('2')).assertEqual(1);
      expect(arr.indexOf(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0040
     * @tc.name testArrayIndexOfOne004
     * @tc.desc Verify fromIndex is an optional int parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let r1 = arr.indexOf(3);
      let r2 = arr.indexOf(3, 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0050
     * @tc.name testArrayIndexOfOne005
     * @tc.desc Verify fromIndex must be an int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let fromIndex: int = 1;
      let result = arr.indexOf(2, fromIndex);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0060
     * @tc.name testArrayIndexOfOne006
     * @tc.desc Verify the value type matches the array element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let val: number = 2;
      let result = arr.indexOf(val);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0070
     * @tc.name testArrayIndexOfOne007
     * @tc.desc Verify indexOf returns an int compatible result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.indexOf(2);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0080
     * @tc.name testArrayIndexOfOne008
     * @tc.desc Verify indexOf returns the index when the value is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let result = arr.indexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0090
     * @tc.name testArrayIndexOfOne009
     * @tc.desc Verify indexOf returns minus one when the value is not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0100
     * @tc.name testArrayIndexOfOne010
     * @tc.desc Verify indexOf returns the first matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 2, 3);
      let result = arr.indexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0110
     * @tc.name testArrayIndexOfOne011
     * @tc.desc Verify indexOf does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalStr = arr.toString();
      arr.indexOf(2);
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0120
     * @tc.name testArrayIndexOfOne012
     * @tc.desc Verify empty arrays return minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.indexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0130
     * @tc.name testArrayIndexOfOne013
     * @tc.desc Verify searching from the start works with fromIndex zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.indexOf(1, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0140
     * @tc.name testArrayIndexOfOne014
     * @tc.desc Verify fromIndex equal to the array length returns minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.indexOf(1, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0150
     * @tc.name testArrayIndexOfOne015
     * @tc.desc Verify fromIndex beyond the array length returns minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.indexOf(1, 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0160
     * @tc.name testArrayIndexOfOne016
     * @tc.desc Verify negative fromIndex counts from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.indexOf(4, -2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0170
     * @tc.name testArrayIndexOfOne017
     * @tc.desc Verify indexOf can find the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.indexOf(1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0180
     * @tc.name testArrayIndexOfOne018
     * @tc.desc Verify indexOf can find the last string element in order-sensitive arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('red', 'green', 'blue');
      let result = arr.indexOf('blue');
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0190
     * @tc.name testArrayIndexOfOne019
     * @tc.desc Verify indexOf returns minus one for values not present in the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.indexOf(999);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0200
     * @tc.name testArrayIndexOfOne020
     * @tc.desc Verify indexOf handles single element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 42);
      expect(arr.indexOf(42)).assertEqual(0);
      expect(arr.indexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0210
     * @tc.name testArrayIndexOfOne021
     * @tc.desc Verify positive fromIndex values start searching at the given index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.indexOf(4, 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0220
     * @tc.name testArrayIndexOfOne022
     * @tc.desc Verify omitting fromIndex uses the default zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let r1 = arr.indexOf(2);
      let r2 = arr.indexOf(2, 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0230
     * @tc.name testArrayIndexOfOne023
     * @tc.desc Verify indexOf can find targets when fromIndex is before them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let result = arr.indexOf(3, 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0240
     * @tc.name testArrayIndexOfOne024
     * @tc.desc Verify indexOf can find later targets when fromIndex is after the first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2);
      let result = arr.indexOf(2, 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0250
     * @tc.name testArrayIndexOfOne025
     * @tc.desc Verify indexOf returns the target index when fromIndex matches it exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.indexOf(2, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0260
     * @tc.name testArrayIndexOfOne026
     * @tc.desc Verify negative fromIndex values search relative to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let r1 = arr.indexOf(5, -1);
      let r2 = arr.indexOf(3, -3);
      let r3 = arr.indexOf(1, -10);
      expect(r1).assertEqual(4);
      expect(r2).assertEqual(2);
      expect(r3).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0270
     * @tc.name testArrayIndexOfOne027
     * @tc.desc Verify fromIndex can find a later duplicate match in string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'b', 'c');
      let result = arr.indexOf('b', 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0280
     * @tc.name testArrayIndexOfOne028
     * @tc.desc Verify indexOf returns minus one when fromIndex is after all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2);
      let result = arr.indexOf(2, 4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0290
     * @tc.name testArrayIndexOfOne029
     * @tc.desc Verify indexOf can find duplicates when fromIndex starts between matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 4);
      let result = arr.indexOf(2, 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0300
     * @tc.name testArrayIndexOfOne030
     * @tc.desc Verify indexOf works with number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(arr.indexOf(2)).assertEqual(1);
      expect(arr.indexOf(99)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0310
     * @tc.name testArrayIndexOfOne031
     * @tc.desc Verify indexOf works with string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      expect(arr.indexOf('b')).assertEqual(1);
      expect(arr.indexOf('z')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0320
     * @tc.name testArrayIndexOfOne032
     * @tc.desc Verify indexOf works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false, true);
      expect(arr.indexOf(true)).assertEqual(0);
      expect(arr.indexOf(false)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0330
     * @tc.name testArrayIndexOfOne033
     * @tc.desc Verify indexOf compares objects by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Item035();
      item1.value = 1;
      let item2 = new Item035();
      item2.value = 2;
      let arr = new Array<Item035>(item1, item2);
      let newItem = new Item035();
      newItem.value = 1;
      expect(arr.indexOf(item1)).assertEqual(0);
      expect(arr.indexOf(item2)).assertEqual(1);
      expect(arr.indexOf(newItem)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0340
     * @tc.name testArrayIndexOfOne034
     * @tc.desc Verify indexOf can search for null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>(1, null, 3);
      expect(arr.indexOf(null)).assertEqual(1);
      expect(arr.indexOf(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0350
     * @tc.name testArrayIndexOfOne035
     * @tc.desc Verify indexOf can search for explicit undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, undefined, 3);
      expect(arr.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0360
     * @tc.name testArrayIndexOfOne036
     * @tc.desc Verify indexOf can find an explicit undefined value in a dense array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      expect(arr.indexOf(undefined)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0370
     * @tc.name testArrayIndexOfOne037
     * @tc.desc Verify indexOf can search for zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 0, 3);
      expect(arr.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0380
     * @tc.name testArrayIndexOfOne038
     * @tc.desc Verify indexOf can search for empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', '', 'c');
      expect(arr.indexOf('')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0390
     * @tc.name testArrayIndexOfOne039
     * @tc.desc Verify indexOf does not match NaN because it uses strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, Double.NaN, 3);
      expect(arr.indexOf(Double.NaN)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0400
     * @tc.name testArrayIndexOfOne040
     * @tc.desc Verify indexOf leaves the original array completely unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let originalLength = arr.length;
      let originalFirst = arr[0];
      let originalLast = arr[arr.length - 1];
      arr.indexOf(3);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[arr.length - 1]).assertEqual(originalLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0410
     * @tc.name testArrayIndexOfOne041
     * @tc.desc Verify repeated indexOf calls return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let r1 = arr.indexOf(2);
      let r2 = arr.indexOf(2);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0420
     * @tc.name testArrayIndexOfOne042
     * @tc.desc Verify indexOf can get the position of an element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30, 40);
      let index = arr.indexOf(30);
      expect(index).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0430
     * @tc.name testArrayIndexOfOne043
     * @tc.desc Verify indexOf can be used to check whether an element exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let exists = arr.indexOf(2) !== -1;
      expect(exists).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0440
     * @tc.name testArrayIndexOfOne044
     * @tc.desc Verify fromIndex can find later duplicate occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 4);
      let firstIndex = arr.indexOf(2);
      let secondIndex = arr.indexOf(2, firstIndex + 1);
      expect(firstIndex).assertEqual(1);
      expect(secondIndex).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0450
     * @tc.name testArrayIndexOfOne045
     * @tc.desc Verify conditional logic can use indexOf results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('apple', 'banana', 'cherry');
      let index = arr.indexOf('banana');
      expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0460
     * @tc.name testArrayIndexOfOne046
     * @tc.desc Verify indexOf works correctly with large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createRangeArray(10000);
      let result = arr.indexOf(5000);
      expect(result).assertEqual(5000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0470
     * @tc.name testArrayIndexOfOne047
     * @tc.desc Verify indexOf can find a boolean match near the start of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(false, true, false, true);
      let result = arr.indexOf(true);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0480
     * @tc.name testArrayIndexOfOne048
     * @tc.desc Verify indexOf and includes return different result types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let idx = arr.indexOf(2);
      let inc = arr.includes(2);
      expect(typeof idx).assertEqual('int');
      expect(typeof inc).assertEqual('boolean');
      expect(inc).assertEqual(idx !== -1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0490
     * @tc.name testArrayIndexOfOne049
     * @tc.desc Verify indexOf searches from the front while lastIndexOf searches from the back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2);
      let idx = arr.indexOf(2);
      let lastIdx = arr.lastIndexOf(2);
      expect(idx).assertEqual(1);
      expect(lastIdx).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0500
     * @tc.name testArrayIndexOfOne050
     * @tc.desc Verify indexOf searches values while findIndex searches by condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let idx = arr.indexOf(2);
      let foundIdx = arr.findIndex((v: number): boolean => v > 1);
      expect(idx).assertEqual(1);
      expect(foundIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0510
     * @tc.name testArrayIndexOfOne051
     * @tc.desc Verify indexOf handles all search cases for two element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      expect(arr.indexOf(1)).assertEqual(0);
      expect(arr.indexOf(2)).assertEqual(1);
      expect(arr.indexOf(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0520
     * @tc.name testArrayIndexOfOne052
     * @tc.desc Verify indexOf handles different fromIndex values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.indexOf(1, 0)).assertEqual(0);
      expect(arr.indexOf(1, 1)).assertEqual(-1);
      expect(arr.indexOf(5, 4)).assertEqual(4);
      expect(arr.indexOf(5, 5)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0530
     * @tc.name testArrayIndexOfOne053
     * @tc.desc Verify the returned index points to the requested value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(10, 20, 30);
      let index = arr.indexOf(20);
      expect(arr[index]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0540
     * @tc.name testArrayIndexOfOne054
     * @tc.desc Verify the return type is explicitly int compatible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result: int = arr.indexOf(2);
      expect(typeof result).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0550
     * @tc.name testArrayIndexOfOne055
     * @tc.desc Verify indexOf works with union typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, 'two', 3);
      expect(arr.indexOf(1)).assertEqual(0);
      expect(arr.indexOf('two')).assertEqual(1);
      expect(arr.indexOf(3)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0560
     * @tc.name testArrayIndexOfOne056
     * @tc.desc Verify array length values can be used to compute fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let len: int = arr.length;
      let result = arr.indexOf(1, len);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0570
     * @tc.name testArrayIndexOfOne057
     * @tc.desc Verify negative integer fromIndex values are computed from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let fromIndex: int = -2;
      let result = arr.indexOf(4, fromIndex);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0580
     * @tc.name testArrayIndexOfOne058
     * @tc.desc Verify indexOf handles last value when scanning the full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.indexOf(4, 0);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0590
     * @tc.name testArrayIndexOfOne059
     * @tc.desc Verify indexOf handles duplicate values after a positive starting index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2, 4);
      const result = arr.indexOf(2, 2);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0600
     * @tc.name testArrayIndexOfOne060
     * @tc.desc Verify indexOf handles no later match after the final duplicate is skipped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2, 4);
      const result = arr.indexOf(2, 4);
      expect(result).assertEqual(-1);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0610
     * @tc.name testArrayIndexOfOne061
     * @tc.desc Verify indexOf handles negative start values that normalize near the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.indexOf(4, -2);
      expect(result).assertEqual(3);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0620
     * @tc.name testArrayIndexOfOne062
     * @tc.desc Verify indexOf handles negative starts that exclude the front prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.indexOf(1, -2);
      expect(result).assertEqual(-1);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0630
     * @tc.name testArrayIndexOfOne063
     * @tc.desc Verify indexOf handles searches for absent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.indexOf(40, 0);
      expect(result).assertEqual(-1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0640
     * @tc.name testArrayIndexOfOne064
     * @tc.desc Verify indexOf handles fromIndex values larger than the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.indexOf(20, 10);
      expect(result).assertEqual(-1);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0650
     * @tc.name testArrayIndexOfOne065
     * @tc.desc Verify indexOf handles single-element arrays when the element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      const result = arr.indexOf(5, 0);
      expect(result).assertEqual(0);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0660
     * @tc.name testArrayIndexOfOne066
     * @tc.desc Verify indexOf handles single-element arrays when the element does not match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      const result = arr.indexOf(1, 0);
      expect(result).assertEqual(-1);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0670
     * @tc.name testArrayIndexOfOne067
     * @tc.desc Verify indexOf supports repeated string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta', 'gamma', 'beta');
      const result = arr.indexOf('beta', 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0680
     * @tc.name testArrayIndexOfOne068
     * @tc.desc Verify indexOf supports string searches after skipping the first duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta', 'gamma', 'beta');
      const result = arr.indexOf('beta', 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0690
     * @tc.name testArrayIndexOfOne069
     * @tc.desc Verify indexOf supports missing string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('left', 'middle', 'right');
      const result = arr.indexOf('missing', 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0700
     * @tc.name testArrayIndexOfOne070
     * @tc.desc Verify indexOf supports empty strings in later positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'filled', '');
      const result = arr.indexOf('', 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0710
     * @tc.name testArrayIndexOfOne071
     * @tc.desc Verify indexOf supports case-sensitive string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'a', 'A');
      const result = arr.indexOf('a', 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0720
     * @tc.name testArrayIndexOfOne072
     * @tc.desc Verify indexOf supports boolean arrays with a later true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, false, true, false);
      const result = arr.indexOf(true, 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0730
     * @tc.name testArrayIndexOfOne073
     * @tc.desc Verify indexOf supports bigint arrays with repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 2n);
      const result = arr.indexOf(2n, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0740
     * @tc.name testArrayIndexOfOne074
     * @tc.desc Verify indexOf treats a very negative starting index as the full-array search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      const result = arr.indexOf(8, -100);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0750
     * @tc.name testArrayIndexOfOne075
     * @tc.desc Verify indexOf works on arrays rebuilt after clearing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(11);
      arr.pushOne(12);
      const result = arr.indexOf(12, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0760
     * @tc.name testArrayIndexOfOne076
     * @tc.desc Verify indexOf can search the result of a slice operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(0, 1, 2, 3, 4, 5);
      const arr = source.slice(2);
      const result = arr.indexOf(4, 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0770
     * @tc.name testArrayIndexOfOne077
     * @tc.desc Verify indexOf ignores later array mutations that happen after the call result is stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6, 8);
      const first = arr.indexOf(6, 0);
      arr[2] = 100;
      expect(first).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0780
     * @tc.name testArrayIndexOfOne078
     * @tc.desc Verify indexOf returns the same outcome as the default search when fromIndex is minus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 3, 5);
      const result1 = arr.indexOf(3);
      const result2 = arr.indexOf(3, -0);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0790
     * @tc.name testArrayIndexOfOne079
     * @tc.desc Verify indexOf can match a duplicate exactly at the positive start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 1, 2);
      const result = arr.indexOf(1, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0800
     * @tc.name testArrayIndexOfOne080
     * @tc.desc Verify indexOf returns minus one when positive fromIndex skips all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 1, 2);
      const result = arr.indexOf(1, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0810
     * @tc.name testArrayIndexOfOne081
     * @tc.desc Verify indexOf can find the tail value when fromIndex equals the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(3, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0820
     * @tc.name testArrayIndexOfOne082
     * @tc.desc Verify indexOf returns minus one for empty arrays with a positive fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.indexOf(1, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0830
     * @tc.name testArrayIndexOfOne083
     * @tc.desc Verify indexOf returns minus one for empty arrays with an oversized positive fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.indexOf(1, 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0840
     * @tc.name testArrayIndexOfOne084
     * @tc.desc Verify indexOf can search only the last element when fromIndex is minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(3, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0850
     * @tc.name testArrayIndexOfOne085
     * @tc.desc Verify indexOf does not search earlier elements when fromIndex is minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(2, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0860
     * @tc.name testArrayIndexOfOne086
     * @tc.desc Verify indexOf can find a tail duplicate when fromIndex normalizes from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2);
      const result = arr.indexOf(2, -2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0870
     * @tc.name testArrayIndexOfOne087
     * @tc.desc Verify indexOf treats negative fromIndex equal to minus length as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(1, -3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0880
     * @tc.name testArrayIndexOfOne088
     * @tc.desc Verify indexOf resets overly negative fromIndex values to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(1, -4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0890
     * @tc.name testArrayIndexOfOne089
     * @tc.desc Verify indexOf can still find the tail value after a very negative fromIndex reset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(3, -100);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0900
     * @tc.name testArrayIndexOfOne090
     * @tc.desc Verify indexOf returns minus one for empty arrays with a negative fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.indexOf(1, -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0910
     * @tc.name testArrayIndexOfOne091
     * @tc.desc Verify indexOf can find a single element when fromIndex is minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.indexOf(1, -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0920
     * @tc.name testArrayIndexOfOne092
     * @tc.desc Verify indexOf resets overly negative fromIndex values on single element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 1);
      const result = arr.indexOf(1, -2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0930
     * @tc.name testArrayIndexOfOne093
     * @tc.desc Verify indexOf can land exactly on a target after negative offset normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(2, -2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0940
     * @tc.name testArrayIndexOfOne094
     * @tc.desc Verify indexOf treats explicit plus zero fromIndex as a normal full search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.indexOf(1, +0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0950
     * @tc.name testArrayIndexOfOne095
     * @tc.desc Verify indexOf returns the first duplicate when fromIndex is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 10, 30);
      const result = arr.indexOf(10, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0960
     * @tc.name testArrayIndexOfOne096
     * @tc.desc Verify indexOf can find the second duplicate when fromIndex starts at that position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 10, 30);
      const result = arr.indexOf(10, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0970
     * @tc.name testArrayIndexOfOne097
     * @tc.desc Verify indexOf can find a later duplicate after a negative fromIndex skips the prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 1, 2);
      const result = arr.indexOf(1, -3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0980
     * @tc.name testArrayIndexOfOne098
     * @tc.desc Verify indexOf can find byte values in arrays built from byte typed elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: byte = -128;
      let midValue: byte = 0;
      let maxValue: byte = 127;
      const arr = new Array<byte>(minValue, midValue, maxValue);
      expect(arr.indexOf(minValue)).assertEqual(0);
      expect(arr.indexOf(maxValue)).assertEqual(2);
      expect(arr.indexOf(1 as byte)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_0990
     * @tc.name testArrayIndexOfOne099
     * @tc.desc Verify indexOf can find short duplicates after a typed fromIndex skip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: short = -32768;
      let duplicate: short = 100;
      let last: short = 32767;
      const arr = new Array<short>(first, duplicate, last, duplicate);
      expect(arr.indexOf(duplicate)).assertEqual(1);
      expect(arr.indexOf(duplicate, 2)).assertEqual(3);
      expect(arr.indexOf(200 as short)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_1000
     * @tc.name testArrayIndexOfOne100
     * @tc.desc Verify indexOf preserves int search behavior for duplicate and boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: int = -2147483648;
      let maxValue: int = 2147483647;
      let duplicate: int = 1024;
      const arr = new Array<int>(minValue, duplicate, maxValue, duplicate);
      expect(arr.indexOf(minValue)).assertEqual(0);
      expect(arr.indexOf(duplicate, 2)).assertEqual(3);
      expect(arr.indexOf(2048 as int)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_1010
     * @tc.name testArrayIndexOfOne101
     * @tc.desc Verify indexOf can find long values including 64-bit boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: long = -9223372036854775807 - 1;
      let businessValue: long = 10000000000;
      let maxValue: long = 9223372036854775807;
      const arr = new Array<long>(minValue, businessValue, maxValue);
      expect(arr.indexOf(minValue)).assertEqual(0);
      expect(arr.indexOf(maxValue)).assertEqual(2);
      expect(arr.indexOf(100)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_1020
     * @tc.name testArrayIndexOfOne102
     * @tc.desc Verify indexOf can search float arrays with duplicate and boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: float = Float.MIN_VALUE;
      let duplicate: float = 3.14f;
      let maxValue: float = Float.MAX_VALUE;
      const arr = new Array<float>(minValue, duplicate, maxValue, duplicate);
      expect(arr.indexOf(minValue)).assertEqual(0);
      expect(arr.indexOf(duplicate, 2)).assertEqual(3);
      expect(arr.indexOf(2.71f)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INDEX_OF_ONE_1030
     * @tc.name testArrayIndexOfOne103
     * @tc.desc Verify indexOf can search double arrays with duplicate and IEEE boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIndexOfOne103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minValue: double = Double.MIN_VALUE;
      let duplicate: double = 123.456;
      let maxValue: double = Double.MAX_VALUE;
      const arr = new Array<double>(minValue, duplicate, maxValue, duplicate);
      expect(arr.indexOf(minValue)).assertEqual(0);
      expect(arr.indexOf(duplicate, 2)).assertEqual(3);
      expect(arr.indexOf(789.123)).assertEqual(-1);
    });

  });
}

