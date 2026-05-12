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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class Item016 {
  value: int = 0;
}

export default function ArrayAt2Test(): void {
  describe('ArrayAt2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_0100
     * @tc.name testArrayAt2001
     * @tc.desc Verify integer index access reads the expected first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      const result = arr.at(0);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_0200
     * @tc.name testArrayAt2002
     * @tc.desc Verify positive integer indexes count from the front
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_0300
     * @tc.name testArrayAt2003
     * @tc.desc Verify negative integer indexes count from the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      expect(arr.at(-1)).assertEqual(50);
      expect(arr.at(-2)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_0400
     * @tc.name testArrayAt2004
     * @tc.desc Verify index zero returns the first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(100, 200, 300);
      expect(arr.at(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_0500
     * @tc.name testArrayAt2005
     * @tc.desc Verify positive out-of-range indexes throw invalid index errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(10);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
      try {
        arr.at(3);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_0600
     * @tc.name testArrayAt2006
     * @tc.desc Verify negative out-of-range indexes throw invalid index errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(-10);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
      try {
        arr.at(-4);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_0700
     * @tc.name testArrayAt2007
     * @tc.desc Verify at returns the array element generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(1);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_0800
     * @tc.name testArrayAt2008
     * @tc.desc Verify invalid integer indexes do not return a valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(100);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_0900
     * @tc.name testArrayAt2009
     * @tc.desc Verify positive indexes can read each in-range element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(3)).assertEqual(40);
      expect(arr.at(4)).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1000
     * @tc.name testArrayAt2010
     * @tc.desc Verify negative indexes can read each valid tail element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      expect(arr.at(-1)).assertEqual(50);
      expect(arr.at(-2)).assertEqual(40);
      expect(arr.at(-3)).assertEqual(30);
      expect(arr.at(-4)).assertEqual(20);
      expect(arr.at(-5)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1100
     * @tc.name testArrayAt2011
     * @tc.desc Verify empty arrays reject all tested integer indexes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      try {
        arr.at(0);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
      try {
        arr.at(-1);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
      try {
        arr.at(1);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1200
     * @tc.name testArrayAt2012
     * @tc.desc Verify single-element arrays support valid and invalid integer access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1);
      arr[0] = 100;
      expect(arr.at(0)).assertEqual(100);
      expect(arr.at(-1)).assertEqual(100);
      try {
        arr.at(1);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
      try {
        arr.at(-2);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1300
     * @tc.name testArrayAt2013
     * @tc.desc Verify number arrays support integer at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(-1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1400
     * @tc.name testArrayAt2014
     * @tc.desc Verify string arrays support integer at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('a', 'b', 'c');
      expect(arr.at(1)).assertEqual('b');
      expect(arr.at(-1)).assertEqual('c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1500
     * @tc.name testArrayAt2015
     * @tc.desc Verify character-like string arrays support integer at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('A', 'B', 'C');
      expect(arr.at(1)).assertEqual('B');
      expect(arr.at(-1)).assertEqual('C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1600
     * @tc.name testArrayAt2016
     * @tc.desc Verify object arrays support integer at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Item016>();
      const item = new Item016();
      item.value = 100;
      arr.pushOne(item);
      const result = arr.at(0);
      expect(result != undefined).assertTrue();
      if (result != undefined) {
        expect(result.value).assertEqual(100);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1700
     * @tc.name testArrayAt2017
     * @tc.desc Verify integer-only index logic can be represented with number values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result = arr.at(1);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1800
     * @tc.name testArrayAt2018
     * @tc.desc Verify integer-normalized and number indexes give the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result1 = arr.at((1).toInt());
      const result2 = arr.at(1);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_1900
     * @tc.name testArrayAt2019
     * @tc.desc Verify large integer indexes are rejected safely
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      try {
        arr.at(2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
      try {
        arr.at(-2147483647);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2000
     * @tc.name testArrayAt2020
     * @tc.desc Verify valid and invalid edge indexes around array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      expect(arr.at(2)).assertEqual(30);
      try {
        arr.at(3);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
      expect(arr.at(-3)).assertEqual(10);
      try {
        arr.at(-4);
        expect().assertFail();
      } catch (e) {
        expect(e == null).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2100
     * @tc.name testArrayAt2021
     * @tc.desc Verify at negative one gets the last element in practice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      expect(arr.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2200
     * @tc.name testArrayAt2022
     * @tc.desc Verify negative indexes can get specific tail elements in practice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30, 40, 50);
      expect(arr.at(-2)).assertEqual(40);
      expect(arr.at(-3)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2300
     * @tc.name testArrayAt2023
     * @tc.desc Verify integer index at access remains stable in a large loop
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 10000; i++) {
        arr.pushOne(i);
      }
      const startTime = Date.now();
      for (let i = 0; i < arr.length; i++) {
        arr.at(i);
      }
      const endTime = Date.now();
      expect(endTime >= startTime).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2400
     * @tc.name testArrayAt2024
     * @tc.desc Verify readonly arrays support integer at access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<int>(10, 20, 30);
      const arr: ReadonlyArray<int> = source;
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(-1)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2500
     * @tc.name testArrayAt2025
     * @tc.desc Verify integer-style indexes prevent decimal access by normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const index = (1.9).toInt();
      const result = arr.at(index);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2600
     * @tc.name testArrayAt2026
     * @tc.desc Verify type inference still narrows the return value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const value = arr.at(1);
      if (value !== undefined) {
        expect(value).assertEqual(20);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2700
     * @tc.name testArrayAt2027
     * @tc.desc Verify integer-normalized and number indexes are functionally identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const result1 = arr.at((1).toInt());
      const result2 = arr.at(1);
      expect(result1).assertEqual(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2800
     * @tc.name testArrayAt2028
     * @tc.desc Verify decimal examples are handled by explicit integer normalization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const normalized = (1.5).toInt();
      const result = arr.at(normalized);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_2900
     * @tc.name testArrayAt2029
     * @tc.desc Verify at negative one supports safe last-element access after checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const last = arr.at(-1);
      if (last !== undefined) {
        expect(last).assertEqual(30);
      } else {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_AT_TWO_3000
     * @tc.name testArrayAt2030
     * @tc.desc Verify at works with values derived from the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayAt2030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 20, 30);
      const len = arr.length.toInt();
      expect(arr.at(len - 1)).assertEqual(30);
      expect(arr.at(-len)).assertEqual(10);
    });
  });
}
