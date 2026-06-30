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

class Item028 {
  value: number = 0;
}

class IncludeArray109 extends Array<number> {
  constructor() {
    super();
  }
}

function createRangeArray(size: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i);
  }
  return arr;
}

function includesInAnyNumberArray(value: Any, target: number): boolean {
  const arr = value as Array<number>;
  return arr.includes(target);
}

export default function ArrayIncludesTest(): void {
  describe('ArrayIncludesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0010
     * @tc.name testArrayIncludes001
     * @tc.desc Verify includes has one required value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let result = arr.includes(3);
      expect(result).assertTrue();
      expect(arr.toString()).assertEqual('1,2,3,4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0020
     * @tc.name testArrayIncludes002
     * @tc.desc Verify value parameter uses the array element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      let result = arr.includes('b');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0030
     * @tc.name testArrayIncludes003
     * @tc.desc Verify includes uses strict equality for numeric and string values in union arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, '1', 2);
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes('1')).assertTrue();
      expect(arr.includes('2')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0040
     * @tc.name testArrayIncludes004
     * @tc.desc Verify fromIndex is an optional parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let r1 = arr.includes(3);
      let r2 = arr.includes(3, 2);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0050
     * @tc.name testArrayIncludes005
     * @tc.desc Verify value type matches the array element type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let val: number = 2;
      let result = arr.includes(val);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0060
     * @tc.name testArrayIncludes006
     * @tc.desc Verify fromIndex uses the Number type when provided
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let fromIndex: int = 1;
      let result = arr.includes(2, fromIndex);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0070
     * @tc.name testArrayIncludes007
     * @tc.desc Verify includes returns a boolean value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.includes(2);
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0080
     * @tc.name testArrayIncludes008
     * @tc.desc Verify includes returns true when the array contains the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4);
      let result = arr.includes(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0090
     * @tc.name testArrayIncludes009
     * @tc.desc Verify includes returns false when the array does not contain the value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.includes(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0100
     * @tc.name testArrayIncludes010
     * @tc.desc Verify includes does not modify the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let originalStr = arr.toString();
      arr.includes(2);
      expect(arr.toString()).assertEqual(originalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0110
     * @tc.name testArrayIncludes011
     * @tc.desc Verify empty arrays return false for any value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0120
     * @tc.name testArrayIncludes012
     * @tc.desc Verify searching from the start works with fromIndex zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.includes(1, 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0130
     * @tc.name testArrayIncludes013
     * @tc.desc Verify fromIndex equal to array length returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.includes(1, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0140
     * @tc.name testArrayIncludes014
     * @tc.desc Verify negative fromIndex counts from the end of the array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.includes(4, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0150
     * @tc.name testArrayIncludes015
     * @tc.desc Verify includes can find the last char element in a char array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>(c'a', c'b', c'c');
      let result = arr.includes(c'c');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0160
     * @tc.name testArrayIncludes016
     * @tc.desc Verify positive fromIndex values start searching at the given index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.includes(4, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0170
     * @tc.name testArrayIncludes017
     * @tc.desc Verify omitting fromIndex uses the default zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let r1 = arr.includes(2);
      let r2 = arr.includes(2, 0);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0180
     * @tc.name testArrayIncludes018
     * @tc.desc Verify fromIndex larger than the array length also returns false for NaN searches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(Double.NaN, 1, 2);
      let result = arr.includes(Double.NaN, 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0190
     * @tc.name testArrayIncludes019
     * @tc.desc Verify includes can find duplicated bigint values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<bigint>(1n, 2n, 2n, 3n);
      let result = arr.includes(2n);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0200
     * @tc.name testArrayIncludes020
     * @tc.desc Verify fromIndex can locate later duplicated boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(false, true, true, false);
      let result = arr.includes(true, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0210
     * @tc.name testArrayIncludes021
     * @tc.desc Verify includes returns false when fromIndex is after all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 2, 3);
      let result = arr.includes(2, 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0220
     * @tc.name testArrayIncludes022
     * @tc.desc Verify includes works with number arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(99)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0230
     * @tc.name testArrayIncludes023
     * @tc.desc Verify includes works with string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c');
      expect(arr.includes('b')).assertTrue();
      expect(arr.includes('z')).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0240
     * @tc.name testArrayIncludes024
     * @tc.desc Verify includes works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<boolean>(true, false, true);
      expect(arr.includes(true)).assertTrue();
      expect(arr.includes(false)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0250
     * @tc.name testArrayIncludes025
     * @tc.desc Verify includes compares object arrays by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Item028();
      item1.value = 1;
      let item2 = new Item028();
      item2.value = 2;
      let arr = new Array<Item028>(item1, item2);
      expect(arr.includes(item1)).assertTrue();
      expect(arr.includes(item2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0260
     * @tc.name testArrayIncludes026
     * @tc.desc Verify includes can search for null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>(1, null, 3);
      expect(arr.includes(null)).assertTrue();
      expect(arr.includes(0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0270
     * @tc.name testArrayIncludes027
     * @tc.desc Verify includes can search for explicit undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, undefined, 3);
      expect(arr.includes(undefined)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0280
     * @tc.name testArrayIncludes028
     * @tc.desc Verify includes finds explicit undefined values in a dense array and respects fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 3;
      expect(arr.indexOf(undefined)).assertEqual(1);
      expect(arr.includes(undefined)).assertTrue();
      expect(arr.includes(undefined, 1)).assertTrue();
      expect(arr.includes(undefined, 2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0290
     * @tc.name testArrayIncludes029
     * @tc.desc Verify includes can search for zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 0, 3);
      expect(arr.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0300
     * @tc.name testArrayIncludes030
     * @tc.desc Verify includes can search for empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', '', 'c');
      expect(arr.includes('')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0310
     * @tc.name testArrayIncludes031
     * @tc.desc Verify includes uses SameValueZero to handle NaN correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, Double.NaN, 3);
      expect(arr.includes(Double.NaN)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0320
     * @tc.name testArrayIncludes032
     * @tc.desc Verify includes leaves the original array completely unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let originalLength = arr.length;
      let originalFirst = arr[0];
      let originalLast = arr[arr.length - 1];
      arr.includes(3);
      expect(arr.length).assertEqual(originalLength);
      expect(arr[0]).assertEqual(originalFirst);
      expect(arr[arr.length - 1]).assertEqual(originalLast);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0330
     * @tc.name testArrayIncludes033
     * @tc.desc Verify repeated includes calls return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let r1 = arr.includes(2);
      let r2 = arr.includes(2);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0340
     * @tc.name testArrayIncludes034
     * @tc.desc Verify includes can be used to check whether a value exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let hasValue = arr.includes(3);
      expect(hasValue).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0350
     * @tc.name testArrayIncludes035
     * @tc.desc Verify includes results can drive conditional logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('apple', 'banana', 'cherry');
      let flag = false;
      if (arr.includes('banana')) {
        flag = true;
      }
      expect(flag).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0360
     * @tc.name testArrayIncludes036
     * @tc.desc Verify includes can be used to prevent duplicates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let newArr = new Array<number>();
      if (!newArr.includes(1)) {
        newArr.pushOne(1);
      }
      expect(newArr.length).assertEqual(1);
      expect(arr.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0370
     * @tc.name testArrayIncludes037
     * @tc.desc Verify searching can start from a specified index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 1);
      let found = arr.includes(2, 2);
      expect(found).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0380
     * @tc.name testArrayIncludes038
     * @tc.desc Verify includes works correctly with large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createRangeArray(10000);
      let result = arr.includes(5000);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0390
     * @tc.name testArrayIncludes039
     * @tc.desc Verify includes returns true after finding an early matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let result = arr.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0400
     * @tc.name testArrayIncludes040
     * @tc.desc Verify includes and indexOf return different result types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let inc = arr.includes(2);
      let idx = arr.indexOf(2);
      expect(typeof inc).assertEqual('boolean');
      expect(typeof idx).assertEqual('int');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0410
     * @tc.name testArrayIncludes041
     * @tc.desc Verify includes matches indexOf not equal minus one for ordinary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let val = 2;
      let incResult = arr.includes(val);
      let idxResult = arr.indexOf(val) !== -1;
      expect(incResult).assertEqual(idxResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0420
     * @tc.name testArrayIncludes042
     * @tc.desc Verify includes works correctly for single element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 42);
      expect(arr.includes(42)).assertTrue();
      expect(arr.includes(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0430
     * @tc.name testArrayIncludes043
     * @tc.desc Verify includes handles all search cases for two element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2);
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes(2)).assertTrue();
      expect(arr.includes(3)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0440
     * @tc.name testArrayIncludes044
     * @tc.desc Verify includes handles different fromIndex values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      expect(arr.includes(1, 0)).assertTrue();
      expect(arr.includes(1, 1)).assertFalse();
      expect(arr.includes(5, 4)).assertTrue();
      expect(arr.includes(5, 5)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0450
     * @tc.name testArrayIncludes045
     * @tc.desc Verify includes handles negative fromIndex values correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5);
      let r1 = arr.includes(5, -1);
      let r2 = arr.includes(3, -3);
      let r3 = arr.includes(1, -10);
      expect(r1).assertTrue();
      expect(r2).assertTrue();
      expect(r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0460
     * @tc.name testArrayIncludes046
     * @tc.desc Verify inferred includes calls work with char arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<char>(c'x', c'y', c'z');
      let result = arr.includes(c'y');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0470
     * @tc.name testArrayIncludes047
     * @tc.desc Verify includes works with union typed arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, 'two', 3);
      expect(arr.includes(1)).assertTrue();
      expect(arr.includes('two')).assertTrue();
      expect(arr.includes(3)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0480
     * @tc.name testArrayIncludes048
     * @tc.desc Verify includes handles last value when scanning the full array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4);
      const result = arr.includes(4, 0);
      expect(result).assertEqual(true);
      expect(arr.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0490
     * @tc.name testArrayIncludes049
     * @tc.desc Verify includes handles duplicate values after a positive starting index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2, 4);
      const result = arr.includes(2, 2);
      expect(result).assertEqual(true);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0500
     * @tc.name testArrayIncludes050
     * @tc.desc Verify includes handles no later match after the final duplicate is skipped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2, 4);
      const result = arr.includes(2, 4);
      expect(result).assertEqual(false);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0510
     * @tc.name testArrayIncludes051
     * @tc.desc Verify includes handles negative start values that normalize near the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.includes(4, -2);
      expect(result).assertEqual(true);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0520
     * @tc.name testArrayIncludes052
     * @tc.desc Verify includes handles negative starts that exclude the front prefix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.includes(1, -2);
      expect(result).assertEqual(false);
      expect(arr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0530
     * @tc.name testArrayIncludes053
     * @tc.desc Verify includes handles searches for absent values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.includes(40, 0);
      expect(result).assertEqual(false);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0540
     * @tc.name testArrayIncludes054
     * @tc.desc Verify includes handles fromIndex values larger than the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.includes(20, 10);
      expect(result).assertEqual(false);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0550
     * @tc.name testArrayIncludes055
     * @tc.desc Verify includes handles single-element arrays when the element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      const result = arr.includes(5, 0);
      expect(result).assertEqual(true);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0560
     * @tc.name testArrayIncludes056
     * @tc.desc Verify includes handles single-element arrays when the element does not match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 5);
      const result = arr.includes(1, 0);
      expect(result).assertEqual(false);
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0570
     * @tc.name testArrayIncludes057
     * @tc.desc Verify includes supports repeated string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta', 'gamma', 'beta');
      const result = arr.includes('beta', 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0580
     * @tc.name testArrayIncludes058
     * @tc.desc Verify includes supports string searches after skipping the first duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta', 'gamma', 'beta');
      const result = arr.includes('beta', 2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0590
     * @tc.name testArrayIncludes059
     * @tc.desc Verify includes supports missing string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('left', 'middle', 'right');
      const result = arr.includes('missing', 0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0600
     * @tc.name testArrayIncludes060
     * @tc.desc Verify includes supports empty strings in later positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('', 'filled', '');
      const result = arr.includes('', 1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0610
     * @tc.name testArrayIncludes061
     * @tc.desc Verify includes supports case-sensitive string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'a', 'A');
      const result = arr.includes('a', 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0620
     * @tc.name testArrayIncludes062
     * @tc.desc Verify includes supports boolean arrays with a later true value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(false, false, true, false);
      const result = arr.includes(true, 1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0630
     * @tc.name testArrayIncludes063
     * @tc.desc Verify includes supports bigint arrays with repeated values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 2n);
      const result = arr.includes(2n, 1);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0640
     * @tc.name testArrayIncludes064
     * @tc.desc Verify includes treats a very negative starting index as the full-array search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(7, 8, 9);
      const result = arr.includes(8, -100);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0650
     * @tc.name testArrayIncludes065
     * @tc.desc Verify includes works on arrays rebuilt after clearing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.length = 0;
      arr.pushOne(11);
      arr.pushOne(12);
      const result = arr.includes(12, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0660
     * @tc.name testArrayIncludes066
     * @tc.desc Verify includes can search the result of a slice operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<number>(0, 1, 2, 3, 4, 5);
      const arr = source.slice(2);
      const result = arr.includes(4, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0670
     * @tc.name testArrayIncludes067
     * @tc.desc Verify includes ignores later array mutations that happen after the call result is stored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6, 8);
      const first = arr.includes(6, 0);
      arr[2] = 100;
      expect(first).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0680
     * @tc.name testArrayIncludes068
     * @tc.desc Verify includes returns the same outcome as the default search when fromIndex is minus zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 3, 5);
      const result1 = arr.includes(3);
      const result2 = arr.includes(3, -0);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0690
     * @tc.name testArrayIncludes069
     * @tc.desc Verify includes can find repeated value 3 after a positive fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4, 3);
      const result = arr.includes(3, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0700
     * @tc.name testArrayIncludes070
     * @tc.desc Verify includes can find repeated value 4 after a positive fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 4, 5, 4);
      const result = arr.includes(4, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0710
     * @tc.name testArrayIncludes071
     * @tc.desc Verify includes handles first position in a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.includes(1, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0720
     * @tc.name testArrayIncludes072
     * @tc.desc Verify includes handles last position in a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.includes(3, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0730
     * @tc.name testArrayIncludes073
     * @tc.desc Verify includes handles missing values in a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.includes(4, 0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0740
     * @tc.name testArrayIncludes074
     * @tc.desc Verify includes handles duplicate numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2);
      const result = arr.includes(2, 2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0750
     * @tc.name testArrayIncludes075
     * @tc.desc Verify includes handles string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'b');
      const result = arr.includes('b', 2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0760
     * @tc.name testArrayIncludes076
     * @tc.desc Verify includes handles boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.includes(false, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0770
     * @tc.name testArrayIncludes077
     * @tc.desc Verify includes handles bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 2n);
      const result = arr.includes(2n, 2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0780
     * @tc.name testArrayIncludes078
     * @tc.desc Verify includes handles negative fromIndex normalization near the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.includes(30, -2);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0790
     * @tc.name testArrayIncludes079
     * @tc.desc Verify includes handles very large positive fromIndex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.includes(20, 100);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0800
     * @tc.name testArrayIncludes080
     * @tc.desc Verify includes handles single-element matching arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 77);
      const result = arr.includes(77, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0810
     * @tc.name testArrayIncludes081
     * @tc.desc Verify includes handles single-element non-matching arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 77);
      const result = arr.includes(78, 0);
      expect(result).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0820
     * @tc.name testArrayIncludes082
     * @tc.desc Verify includes handles arrays produced by slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2, 3, 4).slice(1, 4);
      const result = arr.includes(2, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0830
     * @tc.name testArrayIncludes083
     * @tc.desc Verify includes handles arrays produced by filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value > 2);
      const result = arr.includes(4, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0840
     * @tc.name testArrayIncludes084
     * @tc.desc Verify includes handles arrays reversed in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      arr.reverse();
      const result = arr.includes(2, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0850
     * @tc.name testArrayIncludes085
     * @tc.desc Verify includes handles arrays sorted in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
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
      const result = arr.includes(2, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0860
     * @tc.name testArrayIncludes086
     * @tc.desc Verify includes handles arrays rebuilt after clearing and repopulating
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = ((): Array<number> => { const arr = new Array<number>(1, 2, 3); arr.length = 0; arr.push(8, 9, 10); return arr; })();
      const result = arr.includes(9, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0870
     * @tc.name testArrayIncludes087
     * @tc.desc Verify includes works on object arrays when the same reference is searched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item028();
      first.value = 1;
      const second = new Item028();
      second.value = 2;
      const arr = new Array<Item028>(first, second);
      const target = arr[0];
      const result = arr.includes(target, 0);
      expect(result).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0880
     * @tc.name testArrayIncludes088
     * @tc.desc Verify includes can find values in Uint8Array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0890
     * @tc.name testArrayIncludes089
     * @tc.desc Verify includes uses SameValueZero for NaN in Float64Array instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([Double.NaN, 1, 2]);
      const result = arr.includes(Double.NaN);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0900
     * @tc.name testArrayIncludes090
     * @tc.desc Verify typed arrays normalize negative fromIndex values when searching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array([1, 2, 3]);
      const result = arr.includes(2, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0910
     * @tc.name testArrayIncludes091
     * @tc.desc Verify includes treats Infinity and negative Infinity as different numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(Double.POSITIVE_INFINITY, 0, -Double.POSITIVE_INFINITY);
      expect(arr.includes(Double.POSITIVE_INFINITY)).assertTrue();
      expect(arr.includes(-Double.POSITIVE_INFINITY)).assertTrue();
      expect(arr.includes(-Double.POSITIVE_INFINITY, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0920
     * @tc.name testArrayIncludes092
     * @tc.desc Verify includes treats positive zero and negative zero as the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = new Array<number>(0, 1);
      const arr2 = new Array<number>(-0, 1);
      expect(arr1.includes(-0)).assertTrue();
      expect(arr2.includes(0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0930
     * @tc.name testArrayIncludes093
     * @tc.desc Verify includes compares wrapper objects and primitive values by reference and type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const numberObj = new Number(1);
      const stringObj = new String('a');
      const booleanObj = new Boolean(true);
      const numberArr = Array.create<Number>(1, numberObj);
      const stringArr = Array.create<String>(1, stringObj);
      const booleanArr = Array.create<Boolean>(1, booleanObj);
      expect(numberArr.includes(numberObj)).assertTrue();
      expect(stringArr.includes(stringObj)).assertTrue();
      expect(booleanArr.includes(booleanObj)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0940
     * @tc.name testArrayIncludes094
     * @tc.desc Verify includes does not match a different object instance with the same field value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item028();
      first.value = 1;
      const second = new Item028();
      second.value = 1;
      const arr = Array.create<Item028>(1, first);
      expect(arr.includes(first)).assertTrue();
      expect(arr.includes(second)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0950
     * @tc.name testArrayIncludes095
     * @tc.desc Verify includes can distinguish custom object references after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item028();
      first.value = 2;
      const second = new Item028();
      second.value = 2;
      const arr = Array.create<Item028>(1, first);
      second.value = 3;
      expect(arr.includes(first)).assertTrue();
      expect(arr.includes(second)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0960
     * @tc.name testArrayIncludes096
     * @tc.desc Verify includes rejects an uninserted custom object even when stored values match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item028();
      const second = new Item028();
      const arr = Array.create<Item028>(1, first);
      expect(arr.includes(first)).assertTrue();
      expect(arr.includes(second)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0970
     * @tc.name testArrayIncludes097
     * @tc.desc Verify includes can find the array itself when stored as a self reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Object>();
      const selfRef = arr as Object;
      arr.push(selfRef);
      expect(arr.includes(selfRef)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0980
     * @tc.name testArrayIncludes098
     * @tc.desc Verify includes can search large arrays correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = createRangeArray(10000);
      const firstResult = arr.includes(0);
      const lastResult = arr.includes(9999);
      const missingResult = arr.includes(10000);
      expect(firstResult).assertTrue();
      expect(lastResult).assertTrue();
      expect(missingResult).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_0990
     * @tc.name testArrayIncludes099
     * @tc.desc Verify includes works with ReadonlyArray views
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<number> = [2, 4, 6, 8];
      expect(arr.includes(6)).assertTrue();
      expect(arr.includes(2, 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1000
     * @tc.name testArrayIncludes100
     * @tc.desc Verify includes works with readonly arrays that use union element types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<number | string> = [1, 'two', 3];
      expect(arr.includes('two')).assertTrue();
      expect(arr.includes(2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1010
     * @tc.name testArrayIncludes101
     * @tc.desc Verify includes returns false for same-shaped objects with different references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item028();
      first.value = 7;
      const second = new Item028();
      second.value = 7;
      const arr = Array.create<Item028>(1, first);
      expect(arr.includes(first)).assertTrue();
      expect(arr.includes(second)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1020
     * @tc.name testArrayIncludes102
     * @tc.desc Verify includes compares function values by reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = (): number => 1;
      const second = (): number => 1;
      const arr = Array.create<() => number>(1, first);
      expect(arr.includes(first)).assertTrue();
      expect(arr.includes(second)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1030
     * @tc.name testArrayIncludes103
     * @tc.desc Verify typed arrays return false when the searched value is absent after fromIndex normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array([-3, 0, 5]);
      expect(arr.includes(-3, 1)).assertFalse();
      expect(arr.includes(5, -1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1040
     * @tc.name testArrayIncludes104
     * @tc.desc Verify Float64Array includes returns false for NaN when NaN is not present
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float64Array([1, 2, 3]);
      expect(arr.includes(NaN)).assertFalse();
      expect(arr.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1050
     * @tc.name testArrayIncludes105
     * @tc.desc Verify includes can search bigint arrays with negative fromIndex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 4n);
      expect(arr.includes(3n, -2)).assertTrue();
      expect(arr.includes(2n, -2)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1060
     * @tc.name testArrayIncludes106
     * @tc.desc Verify includes can search char arrays with positive fromIndex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<char>(c'a', c'b', c'c', c'b');
      expect(arr.includes(c'b', 2)).assertTrue();
      expect(arr.includes(c'a', 1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1070
     * @tc.name testArrayIncludes107
     * @tc.desc Verify derived array instances inherit includes behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new IncludeArray109();
      arr.push(3, 6, 9);
      expect(arr.includes(6)).assertTrue();
      expect(arr.includes(1)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1080
     * @tc.name testArrayIncludes108
     * @tc.desc Verify includes works after narrowing an Any value back to Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyValue: Any = new Array<number>(1, 2, 3);
      expect(includesInAnyNumberArray(anyValue, 2)).assertTrue();
      expect(includesInAnyNumberArray(anyValue, 9)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_INCLUDES_1090
     * @tc.name testArrayIncludes109
     * @tc.desc Verify includes supports arrays whose element type is Any
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayIncludes109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const anyArr = new Array<Any>(1, 'two', true);
      expect(anyArr.includes('two')).assertTrue();
      expect(anyArr.includes(false)).assertFalse();
    });

  });
}

