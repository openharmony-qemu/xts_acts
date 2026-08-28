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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

function matchTarget073(value: number, index: int, array: Int16Array): boolean {
  return value === 42;
}

export default function Int16ArrayFindIndexTest02(): void {
  describe('Int16ArrayFindIndexTest02', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll((): void => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_0100
     * @tc.name testInt16ArrayFindIndexTestTwo001
     * @tc.desc Verify findIndex middle element match returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0, 5, 0);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 5);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_0200
     * @tc.name testInt16ArrayFindIndexTestTwo002
     * @tc.desc Verify findIndex center element match returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 1, 9, 1, 1);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 5);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_0300
     * @tc.name testInt16ArrayFindIndexTestTwo003
     * @tc.desc Verify findIndex second element first match returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 8, 8, 8);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_0400
     * @tc.name testInt16ArrayFindIndexTestTwo004
     * @tc.desc Verify findIndex last element match returns length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 1, 1, 9);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 5);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_0500
     * @tc.name testInt16ArrayFindIndexTestTwo005
     * @tc.desc Verify findIndex second-to-last first match returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(2, 2, 7, 0);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_0600
     * @tc.name testInt16ArrayFindIndexTestTwo006
     * @tc.desc Verify findIndex two-element second match returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 99);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 50);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_0700
     * @tc.name testInt16ArrayFindIndexTestTwo007
     * @tc.desc Verify findIndex single element no match returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(42);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value !== 42);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_0800
     * @tc.name testInt16ArrayFindIndexTestTwo008
     * @tc.desc Verify findIndex empty array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      const result: int = arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => true);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_0900
     * @tc.name testInt16ArrayFindIndexTestTwo009
     * @tc.desc Verify findIndex all-zero array positive miss returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0, 0);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1000
     * @tc.name testInt16ArrayFindIndexTestTwo010
     * @tc.desc Verify findIndex all-positive array negative miss returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3, 4);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1100
     * @tc.name testInt16ArrayFindIndexTestTwo011
     * @tc.desc Verify findIndex matches int16 MAX value index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 32767, 0);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 32767);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1200
     * @tc.name testInt16ArrayFindIndexTestTwo012
     * @tc.desc Verify findIndex matches int16 MIN value index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, -32768, 2);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === -32768);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1300
     * @tc.name testInt16ArrayFindIndexTestTwo013
     * @tc.desc Verify findIndex matches zero value index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(5, 0, 3);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1400
     * @tc.name testInt16ArrayFindIndexTestTwo014
     * @tc.desc Verify findIndex matches negative one index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(2, -1, 4);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value < 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1500
     * @tc.name testInt16ArrayFindIndexTestTwo015
     * @tc.desc Verify findIndex first positive in negatives returns 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(-5, -3, 7, -1);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1600
     * @tc.name testInt16ArrayFindIndexTestTwo016
     * @tc.desc Verify findIndex compound value and even index predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 5, 0);
      const result: int = arr.findIndex(
        (value: number, index: int, _array: Int16Array): boolean => value > 0 && index % 2 === 0,
      );
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1700
     * @tc.name testInt16ArrayFindIndexTestTwo017
     * @tc.desc Verify findIndex predicate based on index returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30, 40, 50);
      const result: int = arr.findIndex((_value: number, index: int, _array: Int16Array): boolean => index === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1800
     * @tc.name testInt16ArrayFindIndexTestTwo018
     * @tc.desc Verify findIndex value and index compound condition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 1, 5, 8);
      const result: int = arr.findIndex(
        (value: number, index: int, _array: Int16Array): boolean => value > 3 && index > 1,
      );
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_1900
     * @tc.name testInt16ArrayFindIndexTestTwo019
     * @tc.desc Verify findIndex array param same object returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(3, 6, 9);
      const result: int = arr.findIndex((_value: number, _index: int, array: Int16Array): boolean => array === arr);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2000
     * @tc.name testInt16ArrayFindIndexTestTwo020
     * @tc.desc Verify findIndex two-element first match returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(77, 66);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 77);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2100
     * @tc.name testInt16ArrayFindIndexTestTwo021
     * @tc.desc Verify findIndex repeated values returns first index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(3, 4);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2200
     * @tc.name testInt16ArrayFindIndexTestTwo022
     * @tc.desc Verify findIndex short-circuits after first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 9, 2, 9, 3);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 9);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2300
     * @tc.name testInt16ArrayFindIndexTestTwo023
     * @tc.desc Verify findIndex no match calls predicate length times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const arr = Int16Array.of(1, 2, 3, 4, 5);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => {
        count = count + 1;
        return value >= 2;
      });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2400
     * @tc.name testInt16ArrayFindIndexTestTwo024
     * @tc.desc Verify findIndex empty array calls predicate zero times
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const arr = Int16Array.of(10, 20, 30);
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => {
        count = count + 1;
        return false;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2500
     * @tc.name testInt16ArrayFindIndexTestTwo025
     * @tc.desc Verify findIndex first match calls predicate once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const arr = new Int16Array(0);
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => {
        count = count + 1;
        return true;
      });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2600
     * @tc.name testInt16ArrayFindIndexTestTwo026
     * @tc.desc Verify findIndex captured index equals match position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: int = 0;
      const arr = Int16Array.of(99, 99, 99, 99);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => {
        count = count + 1;
        return value === 99;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2700
     * @tc.name testInt16ArrayFindIndexTestTwo027
     * @tc.desc Verify findIndex last miss index equals length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let capturedIndex: int = -999;
      const arr = Int16Array.of(0, 0, 5, 0);
      arr.findIndex((value: number, index: int, _array: Int16Array): boolean => {
        if (value === 5) {
          capturedIndex = index;
          return true;
        }
        return false;
      });
      expect(capturedIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2800
     * @tc.name testInt16ArrayFindIndexTestTwo028
     * @tc.desc Verify findIndex match leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lastIndex: int = -999;
      const arr = Int16Array.of(1, 2, 3);
      arr.findIndex((_value: number, index: int, _array: Int16Array): boolean => {
        lastIndex = index;
        return false;
      });
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_2900
     * @tc.name testInt16ArrayFindIndexTestTwo029
     * @tc.desc Verify findIndex miss leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30, 40);
      const lenBefore: number = arr.length;
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 15);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3000
     * @tc.name testInt16ArrayFindIndexTestTwo030
     * @tc.desc Verify findIndex empty array length remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const lenBefore: number = arr.length;
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => false);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3100
     * @tc.name testInt16ArrayFindIndexTestTwo031
     * @tc.desc Verify findIndex match on empty array leaves length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => true);
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3200
     * @tc.name testInt16ArrayFindIndexTestTwo032
     * @tc.desc Verify findIndex match leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(55);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 55);
      let r1: int = arr.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3300
     * @tc.name testInt16ArrayFindIndexTestTwo033
     * @tc.desc Verify findIndex miss leaves byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3, 4);
      const blBefore: number = arr.byteLength;
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 3);
      let r1: int = arr.byteLength;
      let e1: number = blBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3400
     * @tc.name testInt16ArrayFindIndexTestTwo034
     * @tc.desc Verify findIndex byteLength equals length times 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(5, 6, 7);
      const blBefore: number = arr.byteLength;
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => false);
      let r1: int = arr.byteLength;
      let e1: number = blBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3500
     * @tc.name testInt16ArrayFindIndexTestTwo035
     * @tc.desc Verify findIndex empty array byteLength remains 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0);
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => true);
      let r1: int = arr.byteLength;
      let e1: number = arr.length * 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3600
     * @tc.name testInt16ArrayFindIndexTestTwo036
     * @tc.desc Verify findIndex match on empty array leaves byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => true);
      let r1: int = arr.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3700
     * @tc.name testInt16ArrayFindIndexTestTwo037
     * @tc.desc Verify findIndex miss leaves BYTES_PER_ELEMENT 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(3, 6, 9);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 4);
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3800
     * @tc.name testInt16ArrayFindIndexTestTwo038
     * @tc.desc Verify findIndex match leaves first element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Int16Array(0);
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => true);
      let r1: int = arr.BYTES_PER_ELEMENT;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_3900
     * @tc.name testInt16ArrayFindIndexTestTwo039
     * @tc.desc Verify findIndex match leaves last element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(100, 200, 300);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 150);
      let r1: number = arr.$_get(0);
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4000
     * @tc.name testInt16ArrayFindIndexTestTwo040
     * @tc.desc Verify findIndex match leaves matched element unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 1);
      let r1: number = arr.$_get(arr.length - 1);
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4100
     * @tc.name testInt16ArrayFindIndexTestTwo041
     * @tc.desc Verify findIndex miss leaves all elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(5, 10, 15);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 10);
      let r1: number = arr.$_get(1);
      let e1: int = 10;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4200
     * @tc.name testInt16ArrayFindIndexTestTwo042
     * @tc.desc Verify findIndex match leaves preceding elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(7, 8, 9);
      const snap0: number = arr.$_get(0);
      const snap1: number = arr.$_get(1);
      const snap2: number = arr.$_get(2);
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => false);
      let r1: number = arr.$_get(0);
      let e1: number = snap0;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: number = snap1;
      expect(r2).assertEqual(e2);
      let r3: number = arr.$_get(2);
      let e3: number = snap2;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4300
     * @tc.name testInt16ArrayFindIndexTestTwo043
     * @tc.desc Verify findIndex match leaves following elements unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(11, 22, 33, 44);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 33);
      let r1: number = arr.$_get(0);
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = arr.$_get(1);
      let e2: int = 22;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4400
     * @tc.name testInt16ArrayFindIndexTestTwo044
     * @tc.desc Verify findIndex miss keeps buffer non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(2, 4, 6);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 3);
      let r1: boolean = arr.buffer !== null;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4500
     * @tc.name testInt16ArrayFindIndexTestTwo045
     * @tc.desc Verify findIndex miss leaves byteOffset unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const offBefore: number = arr.byteOffset;
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 2);
      let r1: int = arr.byteOffset;
      let e1: number = offBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4600
     * @tc.name testInt16ArrayFindIndexTestTwo046
     * @tc.desc Verify findIndex match leaves buffer.byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(4, 5, 6);
      const offBefore: number = arr.byteOffset;
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => false);
      let r1: int = arr.byteOffset;
      let e1: number = offBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4700
     * @tc.name testInt16ArrayFindIndexTestTwo047
     * @tc.desc Verify findIndex miss leaves buffer.byteLength unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(9, 8, 7);
      const bufLenBefore: number = arr.buffer.byteLength;
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value < 9);
      let r1: int = arr.buffer.byteLength;
      let e1: number = bufLenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4800
     * @tc.name testInt16ArrayFindIndexTestTwo048
     * @tc.desc Verify findIndex after mutation returns updated index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const r1: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 15);
      const r2: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 15);
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_4900
     * @tc.name testInt16ArrayFindIndexTestTwo049
     * @tc.desc Verify findIndex predicate uses external closure threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const r1: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 99);
      arr.$_set(1, 99);
      const r2: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 99);
      expect(r1).assertEqual(-1);
      expect(r2).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5000
     * @tc.name testInt16ArrayFindIndexTestTwo050
     * @tc.desc Verify findIndex side-effect counter and correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(3, 7, 2, 9);
      const threshold: number = 5;
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > threshold);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5100
     * @tc.name testInt16ArrayFindIndexTestTwo051
     * @tc.desc Verify findIndex array param identity with external arr
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sideCount: int = 0;
      const arr = Int16Array.of(0, 0, 1, 0);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => {
        sideCount = sideCount + 1;
        return value === 1;
      });
      expect(result).assertEqual(2);
      expect(sideCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5200
     * @tc.name testInt16ArrayFindIndexTestTwo052
     * @tc.desc Verify findIndex array param length equals original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      let arrayRef: Int16Array | null = null;
      arr.findIndex((_value: number, _index: int, array: Int16Array): boolean => {
        arrayRef = array;
        return true;
      });
      let same: boolean = false;
      if (arrayRef !== null) {
        same = arrayRef === arr;
      }
      expect(same).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5300
     * @tc.name testInt16ArrayFindIndexTestTwo053
     * @tc.desc Verify findIndex visits indexes in ascending order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30, 40);
      let capturedLen: number = 0;
      arr.findIndex((_value: number, _index: int, array: Int16Array): boolean => {
        capturedLen = array.length;
        return true;
      });
      expect(capturedLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5400
     * @tc.name testInt16ArrayFindIndexTestTwo054
     * @tc.desc Verify findIndex empty array never executes predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(0, 0, 0, 5);
      const visited: Array<number> = new Array<number>();
      arr.findIndex((value: number, index: int, _array: Int16Array): boolean => {
        visited.push(index);
        return value === 5;
      });
      let r1: int = visited.length;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: number = visited[0];
      let e2: int = 0;
      expect(r2).assertEqual(e2);
      let r3: number = visited[1];
      let e3: int = 1;
      expect(r3).assertEqual(e3);
      let r4: number = visited[2];
      let e4: int = 2;
      expect(r4).assertEqual(e4);
      let r5: number = visited[3];
      let e5: int = 3;
      expect(r5).assertEqual(e5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5500
     * @tc.name testInt16ArrayFindIndexTestTwo055
     * @tc.desc Verify findIndex on Int16Array.from returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let executed: boolean = false;
      const arr = new Int16Array(0);
      arr.findIndex((_value: number, _index: int, _array: Int16Array): boolean => {
        executed = true;
        return true;
      });
      expect(executed).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5600
     * @tc.name testInt16ArrayFindIndexTestTwo056
     * @tc.desc Verify findIndex on Int16Array.from leaves length unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.from([5, 15, 25]);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5700
     * @tc.name testInt16ArrayFindIndexTestTwo057
     * @tc.desc Verify findIndex on ArrayBuffer view returns correct index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.from([1, 2, 3]);
      const lenBefore: number = arr.length;
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 3);
      let r1: int = arr.length;
      let e1: number = lenBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5800
     * @tc.name testInt16ArrayFindIndexTestTwo058
     * @tc.desc Verify findIndex on ArrayBuffer view leaves byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Int16Array = new Int16Array(buf, 0, 3);
      arr.$_set(0, 1);
      arr.$_set(1, 2);
      arr.$_set(2, 3);
      const result: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value > 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_5900
     * @tc.name testInt16ArrayFindIndexTestTwo059
     * @tc.desc Verify findIndex on ArrayBuffer view keeps buffer identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(6);
      const arr: Int16Array = new Int16Array(buf, 2, 2);
      const offBefore: number = arr.byteOffset;
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 20);
      let r1: int = arr.byteOffset;
      let e1: number = offBefore;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6000
     * @tc.name testInt16ArrayFindIndexTestTwo060
     * @tc.desc Verify findIndex result usable as $_get index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(4);
      const arr: Int16Array = new Int16Array(buf);
      arr.$_set(0, 5);
      arr.$_set(1, 6);
      arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 5);
      let r1: boolean = arr.buffer === buf;
      expect(r1).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6100
     * @tc.name testInt16ArrayFindIndexTestTwo061
     * @tc.desc Verify findIndex result usable as $_set index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(10, 20, 30);
      const idx: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 20);
      let r1: number = arr.$_get(idx);
      let e1: int = 20;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6200
     * @tc.name testInt16ArrayFindIndexTestTwo062
     * @tc.desc Verify findIndex result usable as $_set index update
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Int16Array.of(1, 2, 3);
      const idx: int = arr.findIndex((value: number, _index: int, _array: Int16Array): boolean => value === 2);
      arr.$_set(idx, 99);
      let r1: number = arr.$_get(idx);
      let e1: int = 99;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6300
     * @tc.name testInt16ArrayFindIndexTestTwo063
     * @tc.desc Verify findIndex on empty source array returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: number[] = [];
      let arr: Int16Array = new Int16Array(src);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6400
     * @tc.name testInt16ArrayFindIndexTestTwo064
     * @tc.desc Verify findIndex non-matching single element 5 returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([5]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value > 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6500
     * @tc.name testInt16ArrayFindIndexTestTwo065
     * @tc.desc Verify findIndex all ones non-matching returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 1, 1, 1, 1]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6600
     * @tc.name testInt16ArrayFindIndexTestTwo066
     * @tc.desc Verify findIndex all zeros non-zero check returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value !== 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6700
     * @tc.name testInt16ArrayFindIndexTestTwo067
     * @tc.desc Verify findIndex all -1 positive check returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-1, -1, -1, -1, -1]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6800
     * @tc.name testInt16ArrayFindIndexTestTwo068
     * @tc.desc Verify findIndex all MAX matching returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([32767, 32767, 32767]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === 32767);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_6900
     * @tc.name testInt16ArrayFindIndexTestTwo069
     * @tc.desc Verify findIndex all MIN matching returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([-32768, -32768, -32768]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => value === -32768);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_7000
     * @tc.name testInt16ArrayFindIndexTestTwo070
     * @tc.desc Verify findIndex all zeros matches by index 3 returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([0, 0, 0, 0, 0]);
      let result: int = arr.findIndex((value: number, index: int, array: Int16Array): boolean => index === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_7100
     * @tc.name testInt16ArrayFindIndexTestTwo071
     * @tc.desc Verify findIndex propagates Error thrown at second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      let thrownAt: int = -1;
      try {
        arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
          if (index === 1) {
            throw new Error('predicate error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        thrownAt = 1;
        let rErr: string = e.name;
        let eErr: string = 'Error';
        expect(rErr).assertEqual(eErr);
      }
      expect(thrownAt).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_7200
     * @tc.name testInt16ArrayFindIndexTestTwo072
     * @tc.desc Verify findIndex propagates Error thrown at last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([1, 2, 3]);
      try {
        arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
          if (index === 2) {
            throw new Error('predicate error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        let rErr: string = e.name;
        let eErr: string = 'Error';
        expect(rErr).assertEqual(eErr);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT16ARRAY_FINDINDEX_TWO_7300
     * @tc.name testInt16ArrayFindIndexTestTwo073
     * @tc.desc Verify findIndex propagates Error after multiple non-matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testInt16ArrayFindIndexTestTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int16Array = new Int16Array([10, 20, 30, 40, 50]);
      let callCount: int = 0;
      try {
        arr.findIndex((value: number, index: int, array: Int16Array): boolean => {
          callCount++;
          if (index === 3) {
            throw new Error('predicate error');
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(callCount).assertEqual(4);
      }
    });
  });
}
