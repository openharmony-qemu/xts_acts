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

class Item004 {
  value: number = 0;
}

function createModuloArray(size: int, mod: int): Array<number> {
  let arr = new Array<number>();
  for (let i: int = 0; i < size; i++) {
    arr.pushOne(i % mod);
  }
  return arr;
}

export default function ArrayLastIndexOf1Test(): void {
  describe('ArrayLastIndexOf1Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_0100
     * @tc.name testArrayLastIndexOfOne001
     * @tc.desc Verify lastIndexOf accepts searchElement and fromIndex parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 1);
      let result = arr.lastIndexOf(2, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_0200
     * @tc.name testArrayLastIndexOfOne002
     * @tc.desc Verify omitting fromIndex searches the same range as using the last valid index explicitly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 1);
      let implicitResult = arr.lastIndexOf(2);
      let explicitResult = arr.lastIndexOf(2, arr.length - 1);
      expect(implicitResult).assertEqual(3);
      expect(explicitResult).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_0300
     * @tc.name testArrayLastIndexOfOne003
     * @tc.desc Verify fromIndex is an optional parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result1 = arr.lastIndexOf(2, 2);
      let result2 = arr.lastIndexOf(2);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_0400
     * @tc.name testArrayLastIndexOfOne004
     * @tc.desc Verify different generic array element types are supported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr1 = new Array<number>(1, 2, 3);
      let arr2 = new Array<string>('a', 'b', 'c');
      let item = new Item004();
      item.value = 100;
      let arr3 = Array.create<Item004>(1, item);
      expect(arr1.lastIndexOf(2)).assertEqual(1);
      expect(arr2.lastIndexOf('b')).assertEqual(1);
      expect(arr3.lastIndexOf(item)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_0500
     * @tc.name testArrayLastIndexOfOne005
     * @tc.desc Verify fromIndex must be an int value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 1);
      let idx: int = 3;
      let result = arr.lastIndexOf(2, idx);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_0600
     * @tc.name testArrayLastIndexOfOne006
     * @tc.desc Verify fromIndex can be zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.lastIndexOf(1, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_0700
     * @tc.name testArrayLastIndexOfOne007
     * @tc.desc Verify fromIndex values beyond array length search from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.lastIndexOf(1, 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_0800
     * @tc.name testArrayLastIndexOfOne008
     * @tc.desc Verify negative fromIndex starts searching from length plus fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 1);
      let result = arr.lastIndexOf(2, -2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_0900
     * @tc.name testArrayLastIndexOfOne009
     * @tc.desc Verify lastIndexOf returns an int index or minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let found = arr.lastIndexOf(2);
      let notFound = arr.lastIndexOf(99);
      expect(found).assertEqual(1);
      expect(notFound).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1000
     * @tc.name testArrayLastIndexOfOne010
     * @tc.desc Verify lastIndexOf returns minus one when the value is absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3);
      let result = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1100
     * @tc.name testArrayLastIndexOfOne011
     * @tc.desc Verify empty arrays return minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>();
      let result = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1200
     * @tc.name testArrayLastIndexOfOne012
     * @tc.desc Verify fromIndex limits the backward search range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 1);
      let result = arr.lastIndexOf(2, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1300
     * @tc.name testArrayLastIndexOfOne013
     * @tc.desc Verify the last valid fromIndex can still find an earlier matching string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('alpha', 'beta', 'gamma');
      let result = arr.lastIndexOf('beta', 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1400
     * @tc.name testArrayLastIndexOfOne014
     * @tc.desc Verify fromIndex zero only checks index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2);
      let result = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1500
     * @tc.name testArrayLastIndexOfOne015
     * @tc.desc Verify lastIndexOf does not match NaN under strict equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, Double.NaN, 2, Double.NaN);
      let result = arr.lastIndexOf(Double.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1600
     * @tc.name testArrayLastIndexOfOne016
     * @tc.desc Verify lastIndexOf can find explicit undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(1, undefined, 2);
      let result = arr.lastIndexOf(undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1700
     * @tc.name testArrayLastIndexOfOne017
     * @tc.desc Verify lastIndexOf can find an explicit undefined value in a dense array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | undefined>(3, (_index) => undefined);
      arr[0] = 1;
      arr[2] = 2;
      let result = arr.lastIndexOf(undefined);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1800
     * @tc.name testArrayLastIndexOfOne018
     * @tc.desc Verify lastIndexOf can find null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | null>(1, null, 2, null);
      let result = arr.lastIndexOf(null);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_1900
     * @tc.name testArrayLastIndexOfOne019
     * @tc.desc Verify lastIndexOf can find zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 0, 2, 0);
      let result = arr.lastIndexOf(0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2000
     * @tc.name testArrayLastIndexOfOne020
     * @tc.desc Verify lastIndexOf can find empty string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', '', 'b', '');
      let result = arr.lastIndexOf('');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2100
     * @tc.name testArrayLastIndexOfOne021
     * @tc.desc Verify duplicates return the final matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 2, 2, 3);
      let result = arr.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2200
     * @tc.name testArrayLastIndexOfOne022
     * @tc.desc Verify arrays with identical elements return the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(5, 5, 5, 5);
      let result = arr.lastIndexOf(5);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2300
     * @tc.name testArrayLastIndexOfOne023
     * @tc.desc Verify a single string occurrence returns its only index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('alpha', 'beta', 'gamma');
      let result = arr.lastIndexOf('beta');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2400
     * @tc.name testArrayLastIndexOfOne024
     * @tc.desc Verify lastIndexOf searches backward while indexOf searches forward
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 1);
      let lastIdx = arr.lastIndexOf(2);
      let firstIdx = arr.indexOf(2);
      expect(lastIdx).assertEqual(3);
      expect(firstIdx).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2500
     * @tc.name testArrayLastIndexOfOne025
     * @tc.desc Verify duplicates can produce different first and last indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<string>('a', 'b', 'c', 'b', 'a');
      expect(arr.indexOf('a')).assertEqual(0);
      expect(arr.lastIndexOf('a')).assertEqual(4);
      expect(arr.indexOf('b')).assertEqual(1);
      expect(arr.lastIndexOf('b')).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2600
     * @tc.name testArrayLastIndexOfOne026
     * @tc.desc Verify fromIndex after the later match can still find that match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2, 1);
      let result = arr.lastIndexOf(2, 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2700
     * @tc.name testArrayLastIndexOfOne027
     * @tc.desc Verify union typed arrays support lastIndexOf searches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, 'a', 2, 'a');
      let result = arr.lastIndexOf('a');
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2800
     * @tc.name testArrayLastIndexOfOne028
     * @tc.desc Verify lastIndexOf can find the last matching configuration entry
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let configs = new Array<string>('debug', 'release', 'debug', 'release');
      let lastRelease = configs.lastIndexOf('release');
      expect(lastRelease).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_2900
     * @tc.name testArrayLastIndexOfOne029
     * @tc.desc Verify indexOf and lastIndexOf can detect duplicates together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 2);
      let hasDuplicate = arr.indexOf(2) !== arr.lastIndexOf(2);
      expect(hasDuplicate).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3000
     * @tc.name testArrayLastIndexOfOne030
     * @tc.desc Verify fromIndex can restrict search to an earlier range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number>(1, 2, 3, 4, 5, 4, 3);
      let result = arr.lastIndexOf(4, 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3100
     * @tc.name testArrayLastIndexOfOne031
     * @tc.desc Verify single element arrays return zero when the value is found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 42);
      let result = arr.lastIndexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3200
     * @tc.name testArrayLastIndexOfOne032
     * @tc.desc Verify single element arrays return minus one when not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Array.create<number>(1, 1);
      let result = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3300
     * @tc.name testArrayLastIndexOfOne033
     * @tc.desc Verify lastIndexOf works correctly with large arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = createModuloArray(10000, 100);
      let result = arr.lastIndexOf(50);
      expect(result).assertEqual(9950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3400
     * @tc.name testArrayLastIndexOfOne034
     * @tc.desc Verify strict equality distinguishes numbers from strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Array<number | string>(1, '2', 3);
      expect(arr.lastIndexOf(2)).assertEqual(-1);
      expect(arr.lastIndexOf('2')).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3500
     * @tc.name testArrayLastIndexOfOne035
     * @tc.desc Verify objects are compared by reference identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let item1 = new Item004();
      let item2 = new Item004();
      let arr = new Array<Item004>(item1, item2);
      expect(arr.lastIndexOf(item1)).assertEqual(0);
      expect(arr.lastIndexOf(new Item004())).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3600
     * @tc.name testArrayLastIndexOfOne036
     * @tc.desc Verify lastIndexOf finds a middle duplicate using the default tail scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2, 1);
      const result = arr.lastIndexOf(2, 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3700
     * @tc.name testArrayLastIndexOfOne037
     * @tc.desc Verify lastIndexOf finds a restricted fromIndex that excludes the final duplicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 2, 1);
      const result = arr.lastIndexOf(2, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3800
     * @tc.name testArrayLastIndexOfOne038
     * @tc.desc Verify lastIndexOf finds arrays of identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(5, 5, 5);
      const result = arr.lastIndexOf(5, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_3900
     * @tc.name testArrayLastIndexOfOne039
     * @tc.desc Verify lastIndexOf finds missing values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.lastIndexOf(40, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4000
     * @tc.name testArrayLastIndexOfOne040
     * @tc.desc Verify lastIndexOf finds negative fromIndex values near the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.lastIndexOf(20, -1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4100
     * @tc.name testArrayLastIndexOfOne041
     * @tc.desc Verify lastIndexOf finds negative fromIndex values that still include the head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.lastIndexOf(10, -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4200
     * @tc.name testArrayLastIndexOfOne042
     * @tc.desc Verify lastIndexOf finds the first position when fromIndex equals zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.lastIndexOf(10, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4300
     * @tc.name testArrayLastIndexOfOne043
     * @tc.desc Verify lastIndexOf can locate the repeated tail value in numeric series 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2, 1);
      const result = arr.lastIndexOf(1, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4400
     * @tc.name testArrayLastIndexOfOne044
     * @tc.desc Verify lastIndexOf handles first position in a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(1, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4500
     * @tc.name testArrayLastIndexOfOne045
     * @tc.desc Verify lastIndexOf with fromIndex zero does not search later numeric elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(3, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4600
     * @tc.name testArrayLastIndexOfOne046
     * @tc.desc Verify lastIndexOf handles missing values in a numeric array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3);
      const result = arr.lastIndexOf(4, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4700
     * @tc.name testArrayLastIndexOfOne047
     * @tc.desc Verify lastIndexOf handles string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c', 'b');
      const result = arr.lastIndexOf('b', 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4800
     * @tc.name testArrayLastIndexOfOne048
     * @tc.desc Verify lastIndexOf with fromIndex zero does not search later boolean elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, false, true);
      const result = arr.lastIndexOf(false, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_4900
     * @tc.name testArrayLastIndexOfOne049
     * @tc.desc Verify lastIndexOf handles bigint arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<bigint>(1n, 2n, 3n, 2n);
      const result = arr.lastIndexOf(2n, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5000
     * @tc.name testArrayLastIndexOfOne050
     * @tc.desc Verify lastIndexOf handles negative fromIndex normalization near the tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30, 40);
      const result = arr.lastIndexOf(30, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5100
     * @tc.name testArrayLastIndexOfOne051
     * @tc.desc Verify lastIndexOf handles very large positive fromIndex values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const result = arr.lastIndexOf(20, 100);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5200
     * @tc.name testArrayLastIndexOfOne052
     * @tc.desc Verify lastIndexOf handles single-element matching arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 77);
      const result = arr.lastIndexOf(77, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5300
     * @tc.name testArrayLastIndexOfOne053
     * @tc.desc Verify lastIndexOf handles single-element non-matching arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Array.create<number>(1, 77);
      const result = arr.lastIndexOf(78, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5400
     * @tc.name testArrayLastIndexOfOne054
     * @tc.desc Verify lastIndexOf on a sliced array respects fromIndex zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(0, 1, 2, 3, 4).slice(1, 4);
      const result = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5500
     * @tc.name testArrayLastIndexOfOne055
     * @tc.desc Verify lastIndexOf on a filtered array respects fromIndex zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3, 4, 5).filter((value: number): boolean => value > 2);
      const result = arr.lastIndexOf(4, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5600
     * @tc.name testArrayLastIndexOfOne056
     * @tc.desc Verify lastIndexOf on a reversed copy respects fromIndex zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(1, 2, 3).toReversed();
      const result = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5700
     * @tc.name testArrayLastIndexOfOne057
     * @tc.desc Verify lastIndexOf on a sorted copy respects fromIndex zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(3, 1, 2).toSorted((left: number, right: number): int => {
        if (left < right) {
          return -1;
        }
        if (left > right) {
          return 1;
        }
        return 0;
      });
      const result = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5800
     * @tc.name testArrayLastIndexOfOne058
     * @tc.desc Verify lastIndexOf on a rebuilt array respects fromIndex zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = ((): Array<number> => {
        const arr = new Array<number>(1, 2, 3);
        arr.length = 0;
        arr.push(8, 9, 10);
        return arr;
      })();
      const result = arr.lastIndexOf(9, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_5900
     * @tc.name testArrayLastIndexOfOne059
     * @tc.desc Verify lastIndexOf works on object arrays when the same reference is searched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item004();
      first.value = 1;
      const second = new Item004();
      second.value = 2;
      const arr = new Array<Item004>(first, second);
      const target = arr[0];
      const result = arr.lastIndexOf(target, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6000
     * @tc.name testArrayLastIndexOfOne060
     * @tc.desc Verify lastIndexOf rejects object arrays when a different reference is searched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item004();
      first.value = 1;
      const second = new Item004();
      second.value = 2;
      const arr = new Array<Item004>(first, second);
      const target = new Item004();
      target.value = 1;
      const result = arr.lastIndexOf(target, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6100
     * @tc.name testArrayLastIndexOfOne061
     * @tc.desc Verify custom objects do not match primitive number searches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new Item004();
      item.value = 1;
      const arr = Array.create<Item004 | number>(1, item);
      const result = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6200
     * @tc.name testArrayLastIndexOfOne062
     * @tc.desc Verify primitive numbers do not match custom object searches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new Item004();
      item.value = 1;
      const arr = Array.create<Item004 | number>(1, 1);
      const result = arr.lastIndexOf(item);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6300
     * @tc.name testArrayLastIndexOfOne063
     * @tc.desc Verify different custom object instances with the same value do not match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const first = new Item004();
      first.value = 1;
      const second = new Item004();
      second.value = 1;
      const arr = Array.create<Item004>(1, first);
      const result = arr.lastIndexOf(second);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6400
     * @tc.name testArrayLastIndexOfOne064
     * @tc.desc Verify custom objects do not match primitive string searches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new Item004();
      const arr = Array.create<Item004 | string>(1, item);
      const result = arr.lastIndexOf('a');
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6500
     * @tc.name testArrayLastIndexOfOne065
     * @tc.desc Verify custom objects do not match primitive boolean searches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item = new Item004();
      const arr = Array.create<Item004 | boolean>(1, item);
      const result = arr.lastIndexOf(true);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6600
     * @tc.name testArrayLastIndexOfOne066
     * @tc.desc Verify empty strings and strings containing a space remain distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>(' ', '');
      const result = arr.lastIndexOf('');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6700
     * @tc.name testArrayLastIndexOfOne067
     * @tc.desc Verify tab characters and plain spaces remain distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\t', ' ');
      const result = arr.lastIndexOf(' ');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6800
     * @tc.name testArrayLastIndexOfOne068
     * @tc.desc Verify LF and CRLF line terminators remain distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\n', '\r\n');
      const result = arr.lastIndexOf('\n');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_6900
     * @tc.name testArrayLastIndexOfOne069
     * @tc.desc Verify string zero searches do not match numeric zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>('0', 0);
      const result = arr.lastIndexOf('0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_7000
     * @tc.name testArrayLastIndexOfOne070
     * @tc.desc Verify numeric zero searches do not match earlier string zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string | number>('0', 0);
      const result = arr.lastIndexOf(0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_7100
     * @tc.name testArrayLastIndexOfOne071
     * @tc.desc Verify numeric looking strings are matched strictly without numeric normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('1.0', '1');
      const result = arr.lastIndexOf('1');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_7200
     * @tc.name testArrayLastIndexOfOne072
     * @tc.desc Verify signed zero strings remain distinct from each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('+0', '-0');
      const result = arr.lastIndexOf('+0');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_7300
     * @tc.name testArrayLastIndexOfOne073
     * @tc.desc Verify hexadecimal escape sequences are compared after decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('\x41', 'A');
      const result = arr.lastIndexOf('A');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_7400
     * @tc.name testArrayLastIndexOfOne074
     * @tc.desc Verify NUL escape variants produce the same decoded string during matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a\x00b', 'a\0b');
      const result = arr.lastIndexOf('a\0b');
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_LAST_INDEX_OF_ONE_7500
     * @tc.name testArrayLastIndexOfOne075
     * @tc.desc Verify lastIndexOf can search later duplicates inside mixed window 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayLastIndexOfOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(16, 17, 18, 17);
      const result = arr.lastIndexOf(17, 2);
      expect(result).assertEqual(1);
    });

  });
}

