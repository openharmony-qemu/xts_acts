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

class EveryItem009 {
  score: int = 0;
  valid: boolean = false;
  name: string = '';
}

export default function ArrayEveryTest(): void {
  describe('ArrayEveryTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0100
     * @tc.name testArrayEvery001
     * @tc.desc Verify every accepts a predicate function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6, 8);
      const result = arr.every((v: number): boolean => v % 2 == 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0200
     * @tc.name testArrayEvery002
     * @tc.desc Verify predicate receives value index and source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 4, 6);
      let indexSum = 0;
      const result = arr.every((v: number, i: int, a: Array<number>): boolean => {
        indexSum += i;
        expect(a.length).assertEqual(3);
        return v % 2 == 0;
      });
      expect(result).assertTrue();
      expect(indexSum).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0300
     * @tc.name testArrayEvery003
     * @tc.desc Verify every returns false when one element does not match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 6);
      const result = arr.every((v: number): boolean => v % 2 == 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0400
     * @tc.name testArrayEvery004
     * @tc.desc Verify empty arrays return true for every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>();
      const result = arr.every((v: number): boolean => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0500
     * @tc.name testArrayEvery005
     * @tc.desc Verify every stops at the first false result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;
      const arr = new Array<number>(1, 2, 3, 4, 5);
      const result = arr.every((v: number): boolean => {
        callCount++;
        return v < 3;
      });
      expect(result).assertFalse();
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0600
     * @tc.name testArrayEvery006
     * @tc.desc Verify every works with single-element arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      arr.pushOne(2);
      const result = arr.every((v: int): boolean => v % 2 == 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0700
     * @tc.name testArrayEvery007
     * @tc.desc Verify every can validate all values in a positive dataset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(10, 20, 30);
      const allPositive = arr.every((v: number): boolean => v > 0);
      expect(allPositive).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0800
     * @tc.name testArrayEvery008
     * @tc.desc Verify every and some differ when only part of the array matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number>(2, 3, 4);
      expect(arr.every((v: number): boolean => v % 2 == 0)).assertFalse();
      expect(arr.some((v: number): boolean => v % 2 == 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_0900
     * @tc.name testArrayEvery009
     * @tc.desc Verify every works with non-empty string arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', 'beta', 'gamma');
      const result = arr.every((v: string): boolean => v.length > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1000
     * @tc.name testArrayEvery010
     * @tc.desc Verify every returns false when a string element is empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<string>('alpha', '', 'gamma');
      const result = arr.every((v: string): boolean => v.length > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1100
     * @tc.name testArrayEvery011
     * @tc.desc Verify every works with boolean arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<boolean>(true, true, true);
      const result = arr.every((v: boolean): boolean => v);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1200
     * @tc.name testArrayEvery012
     * @tc.desc Verify every can validate object properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new EveryItem009();
      item1.score = 90;
      item1.valid = true;
      item1.name = 'A';
      const item2 = new EveryItem009();
      item2.score = 80;
      item2.valid = true;
      item2.name = 'B';
      const arr = new Array<EveryItem009>(item1, item2);
      const result = arr.every((item: EveryItem009): boolean => item.valid && item.score >= 60);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1300
     * @tc.name testArrayEvery013
     * @tc.desc Verify every returns false when one object property check fails
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const item1 = new EveryItem009();
      item1.score = 90;
      item1.valid = true;
      const item2 = new EveryItem009();
      item2.score = 59;
      item2.valid = true;
      const arr = new Array<EveryItem009>(item1, item2);
      const result = arr.every((item: EveryItem009): boolean => item.valid && item.score >= 60);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1400
     * @tc.name testArrayEvery014
     * @tc.desc Verify every can evaluate arrays containing null values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | null>(1, null, 3);
      const result = arr.every((v: number | null): boolean => v != null);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1500
     * @tc.name testArrayEvery015
     * @tc.desc Verify every can evaluate arrays containing undefined values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<number | undefined>(1, undefined, 3);
      const result = arr.every((v: number | undefined): boolean => v != undefined);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1600
     * @tc.name testArrayEvery016
     * @tc.desc Verify every can keep zero values while checking a lower bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 1, 2, 3);
      const result = arr.every((v: int): boolean => v >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1700
     * @tc.name testArrayEvery017
     * @tc.desc Verify every matches filter length when all elements pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(5, 6, 7, 8);
      const filtered = arr.filter((v: int): boolean => v > 4);
      const result = arr.every((v: int): boolean => v > 4);
      expect(result).assertTrue();
      expect(filtered.length).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1800
     * @tc.name testArrayEvery018
     * @tc.desc Verify every differs from find when a failing value exists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(4, 8, 7, 10);
      const result = arr.every((v: int): boolean => v % 2 == 0);
      const failed = arr.find((v: int): boolean => v % 2 != 0);
      expect(result).assertFalse();
      expect(failed).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_1900
     * @tc.name testArrayEvery019
     * @tc.desc Verify every does not mutate the original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(1, 2, 3, 4);
      const snapshot = arr.toString();
      const result = arr.every((v: int): boolean => v > 0);
      expect(result).assertTrue();
      expect(arr.toString()).assertEqual(snapshot);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2000
     * @tc.name testArrayEvery020
     * @tc.desc Verify every can use both index and value in the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(10, 11, 12, 13);
      const result = arr.every((v: int, i: int): boolean => v - i == 10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2100
     * @tc.name testArrayEvery021
     * @tc.desc Verify every callback count matches array length when all pass
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let callCount = 0;
      const arr = new Array<int>(2, 4, 6, 8, 10);
      const result = arr.every((v: int): boolean => {
        callCount++;
        return v % 2 == 0;
      });
      expect(result).assertTrue();
      expect(callCount).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2200
     * @tc.name testArrayEvery022
     * @tc.desc Verify every stops before visiting trailing elements after failure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastVisited = -1;
      const arr = new Array<int>(2, 4, 5, 8, 10);
      const result = arr.every((v: int, i: int): boolean => {
        lastVisited = i;
        return v % 2 == 0;
      });
      expect(result).assertFalse();
      expect(lastVisited).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2300
     * @tc.name testArrayEvery023
     * @tc.desc Verify every works with nested arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<Array<int>>(new Array<int>(1, 2), new Array<int>(3, 4, 5));
      const result = arr.every((item: Array<int>): boolean => item.length >= 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2400
     * @tc.name testArrayEvery024
     * @tc.desc Verify every works with mixed primitive types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int | string | boolean>(1, 'two', true);
      const result = arr.every((v: int | string | boolean): boolean => v != null);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2500
     * @tc.name testArrayEvery025
     * @tc.desc Verify every can validate all indexes against their values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 1, 2, 3, 4);
      const result = arr.every((v: int, i: int): boolean => v == i);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2600
     * @tc.name testArrayEvery026
     * @tc.desc Verify every fails when one index-value pair is misaligned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(0, 1, 9, 3, 4);
      const result = arr.every((v: int, i: int): boolean => v == i);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2700
     * @tc.name testArrayEvery027
     * @tc.desc Verify every can validate a mapped array result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new Array<int>(1, 2, 3);
      const mapped = source.map((v: int): int => v * 2);
      const result = mapped.every((v: int): boolean => v % 2 == 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2800
     * @tc.name testArrayEvery028
     * @tc.desc Verify every works with large arrays when all elements match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 10; i++) {
        arr.pushOne(i);
      }
      const result = arr.every((v: int): boolean => v >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_2900
     * @tc.name testArrayEvery029
     * @tc.desc Verify every can fail near the end of a large array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>();
      for (let i = 0; i < 64; i++) {
        arr.pushOne(i);
      }
      arr[63] = -1;
      const result = arr.every((v: int): boolean => v >= 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ARRAY_EVERY_3000
     * @tc.name testArrayEvery030
     * @tc.desc Verify every can compare the original array reference inside the predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testArrayEvery030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Array<int>(3, 6, 9);
      let sameReference = true;
      const result = arr.every((v: int, i: int, source: Array<int>): boolean => {
        sameReference = sameReference && source === arr;
        return source[i] == v;
      });
      expect(result).assertTrue();
      expect(sameReference).assertTrue();
    });
  });
}
