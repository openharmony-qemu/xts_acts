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

export default function int8ArrayFindLastIndexPart01Test(): void {
  describe('Int8ArrayFindLastIndexPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_0100
     * @tc.name int8ArrayFindLastIndexPart01Test001
     * @tc.desc Verify findLastIndex expects 2 when callback matches value 30, on Int8Array.of(10, 20, 30, 40, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40, 50);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_0200
     * @tc.name int8ArrayFindLastIndexPart01Test002
     * @tc.desc Verify findLastIndex with always-true callback returns last index 2 on Int8Array.of(7, 8, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(7, 8, 9);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_0300
     * @tc.name int8ArrayFindLastIndexPart01Test003
     * @tc.desc Verify findLastIndex with predicate element == -3 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, -3, 8, -3, 12);
      let result = arr.findLastIndex((value: number): boolean => value === -3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_0400
     * @tc.name int8ArrayFindLastIndexPart01Test004
     * @tc.desc Verify findLastIndex with predicate element == 4 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let result = arr.findLastIndex((value: number, index: int): boolean => value === 4 && index === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_0500
     * @tc.name int8ArrayFindLastIndexPart01Test005
     * @tc.desc Verify findLastIndex with predicate element == 33 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(11, 22, 33, 44);
      let result = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => value === 33 && index === 2 && array.length === 4,
      );
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_0600
     * @tc.name int8ArrayFindLastIndexPart01Test006
     * @tc.desc Verify findLastIndex expects 3, with findLastIndex(isEvenValue), on Int8Array.of(11, 22, 33, 44, 55)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let isEvenValue: (value: number, index: int, array: Int8Array) => boolean = (
        value: number,
        index: int,
        array: Int8Array,
      ): boolean => {
        return value % 2 === 0;
      };
      let arr = Int8Array.of(11, 22, 33, 44, 55);
      let result = arr.findLastIndex(isEvenValue);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_0700
     * @tc.name int8ArrayFindLastIndexPart01Test007
     * @tc.desc Verify findLastIndex with predicate element == target returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const target: number = 3;
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === target);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_0800
     * @tc.name int8ArrayFindLastIndexPart01Test008
     * @tc.desc Verify findLastIndex with predicate element > threshold returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let threshold: number = 25;
      let arr = Int8Array.of(10, 20, 30, 40);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value > threshold);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_0900
     * @tc.name int8ArrayFindLastIndexPart01Test009
     * @tc.desc Verify findLastIndex callback captures last element > 10 in reverse traversal even when predicate returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 10, 15);
      let captured: number = 0;
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        if (value > 10) {
          captured = value;
        }
        return false;
      });
      expect(captured).assertEqual(15);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1000
     * @tc.name int8ArrayFindLastIndexPart01Test010
     * @tc.desc Verify findLastIndex with always-false callback invokes 3 times and returns -1 on Int8Array.of(2, 4, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(2, 4, 6);
      let count: number = 0;
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return false;
      });
      expect(count).assertEqual(3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1100
     * @tc.name int8ArrayFindLastIndexPart01Test011
     * @tc.desc Verify findLastIndex with predicate element = Int8Array.of(9, 8, 3, 7) returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      let reference = Int8Array.of(9, 8, 3, 7);
      let result = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => value === reference.$_get(index),
      );
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1200
     * @tc.name int8ArrayFindLastIndexPart01Test012
     * @tc.desc Verify findLastIndex with always-true callback returns last index 2 on Int8Array.of(11, 22, 33)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(11, 22, 33);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1300
     * @tc.name int8ArrayFindLastIndexPart01Test013
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => false);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1400
     * @tc.name int8ArrayFindLastIndexPart01Test014
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(-5, 3, -2, 9, 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-5, 3, -2, 9, 1);
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => value > 0 && index < 3);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1500
     * @tc.name int8ArrayFindLastIndexPart01Test015
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(11, 42, 13, 14, 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(11, 42, 13, 14, 15);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 42);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1600
     * @tc.name int8ArrayFindLastIndexPart01Test016
     * @tc.desc Verify findLastIndex with predicate element >= 80 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(100, 50, 90, 30, 80);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value >= 80);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1700
     * @tc.name int8ArrayFindLastIndexPart01Test017
     * @tc.desc Verify findLastIndex expects 4 when callback index > 2, on Int8Array.of(10, 20, 30, 40, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40, 50);
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => index > 2);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1800
     * @tc.name int8ArrayFindLastIndexPart01Test018
     * @tc.desc Verify findLastIndex returns 2 when value equals -128 on Int8Array.of(1, 2, -128)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, -128);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === -128);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_1900
     * @tc.name int8ArrayFindLastIndexPart01Test019
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(INT8_MAX, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(INT8_MAX, 1, 2);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === INT8_MAX);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2000
     * @tc.name int8ArrayFindLastIndexPart01Test020
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(1, 0, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 0, 2);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2100
     * @tc.name int8ArrayFindLastIndexPart01Test021
     * @tc.desc Verify findLastIndex returns 2 when value equals -1 on Int8Array.of(1, 2, -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, -1);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2200
     * @tc.name int8ArrayFindLastIndexPart01Test022
     * @tc.desc Verify findLastIndex expects 1, on Int8Array.of(2, 1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(2, 1, 3);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2300
     * @tc.name int8ArrayFindLastIndexPart01Test023
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(128, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(128, 1, 2);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === -128);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2400
     * @tc.name int8ArrayFindLastIndexPart01Test024
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(255, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(255, 1, 2);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2500
     * @tc.name int8ArrayFindLastIndexPart01Test025
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(-129, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-129, 1, 2);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === INT8_MAX);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2600
     * @tc.name int8ArrayFindLastIndexPart01Test026
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(256, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(256, 1, 2);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2700
     * @tc.name int8ArrayFindLastIndexPart01Test027
     * @tc.desc Verify findLastIndex with predicate element == -INT8_MAX returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(0x81, 1, 2);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === -INT8_MAX);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2800
     * @tc.name int8ArrayFindLastIndexPart01Test028
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(Number.NaN, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(Number.NaN, 1, 2);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_2900
     * @tc.name int8ArrayFindLastIndexPart01Test029
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(1.9, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1.9, 2, 3);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3000
     * @tc.name int8ArrayFindLastIndexPart01Test030
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(-1.9, 1, 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-1.9, 1, 2);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3100
     * @tc.name int8ArrayFindLastIndexPart01Test031
     * @tc.desc Verify findLastIndex with predicate element > 100 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(INT8_MAX, 50, INT8_MAX, -30);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value > 100);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3200
     * @tc.name int8ArrayFindLastIndexPart01Test032
     * @tc.desc Verify findLastIndex with predicate element < -100 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-128, 50, -128, 30);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value < -100);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3300
     * @tc.name int8ArrayFindLastIndexPart01Test033
     * @tc.desc Verify findLastIndex with predicate element < 50 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(60, 10, 70, 20);
      let result = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => -50 < value && value < 50,
      );
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3400
     * @tc.name int8ArrayFindLastIndexPart01Test034
     * @tc.desc Verify findLastIndex with predicate element != 0 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(0, 5, 0, 8);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value !== 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3500
     * @tc.name int8ArrayFindLastIndexPart01Test035
     * @tc.desc Verify findLastIndex with predicate element == 7 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(7, 7, 7, 7);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 7);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3600
     * @tc.name int8ArrayFindLastIndexPart01Test036
     * @tc.desc Verify findLastIndex returns 3 when value is positive on Int8Array.of(-5, 3, -2, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(-5, 3, -2, 9);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value > 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3700
     * @tc.name int8ArrayFindLastIndexPart01Test037
     * @tc.desc Verify findLastIndex with predicate element < 0 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, -3, 2, -7);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value < 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3800
     * @tc.name int8ArrayFindLastIndexPart01Test038
     * @tc.desc Verify findLastIndex reverse traversal reaches index 0 and returns -1 when predicate always false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30);
      let hitZero: boolean = false;
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (index === 0) {
          hitZero = true;
        }
        return false;
      });
      expect(hitZero).assertTrue();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_3900
     * @tc.name int8ArrayFindLastIndexPart01Test039
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30);
      let hitLast: boolean = false;
      let result = arr.findLastIndex((value: number, index: int, array: Int8Array): boolean => {
        if (index === array.length - 1) {
          hitLast = true;
        }
        return false;
      });
      expect(hitLast).assertTrue();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4000
     * @tc.name int8ArrayFindLastIndexPart01Test040
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(1, 2, 3, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4);
      let allNonNeg: boolean = true;
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (index < 0) {
          allNonNeg = false;
        }
        return false;
      });
      expect(allNonNeg).assertTrue();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4100
     * @tc.name int8ArrayFindLastIndexPart01Test041
     * @tc.desc Verify findLastIndex expects -1, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40);
      let seen0: boolean = false;
      let seen1: boolean = false;
      let seen2: boolean = false;
      let seen3: boolean = false;
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => {
        if (index === 0) {
          seen0 = true;
        }
        if (index === 1) {
          seen1 = true;
        }
        if (index === 2) {
          seen2 = true;
        }
        if (index === 3) {
          seen3 = true;
        }
        return false;
      });
      expect(seen0).assertTrue();
      expect(seen1).assertTrue();
      expect(seen2).assertTrue();
      expect(seen3).assertTrue();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4200
     * @tc.name int8ArrayFindLastIndexPart01Test042
     * @tc.desc Verify findLastIndex expects 0, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40);
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => index === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4300
     * @tc.name int8ArrayFindLastIndexPart01Test043
     * @tc.desc Verify findLastIndex expects 3 when callback index equals length - 1, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40);
      let result = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => index === array.length - 1,
      );
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4400
     * @tc.name int8ArrayFindLastIndexPart01Test044
     * @tc.desc Verify findLastIndex expects 2 when callback index === 2, on Int8Array.of(10, 20, 30, 40, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40, 50);
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => index === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4500
     * @tc.name int8ArrayFindLastIndexPart01Test045
     * @tc.desc Verify findLastIndex expects 4, on Int8Array.of(11, 22, 33, 44, 55)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(11, 22, 33, 44, 55);
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => index % 2 === 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4600
     * @tc.name int8ArrayFindLastIndexPart01Test046
     * @tc.desc Verify findLastIndex expects 4 when callback index >= 3, on Int8Array.of(10, 20, 30, 40, 50)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40, 50);
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => index >= 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4700
     * @tc.name int8ArrayFindLastIndexPart01Test047
     * @tc.desc Verify findLastIndex expects 3 when value > 30, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value > 30);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4800
     * @tc.name int8ArrayFindLastIndexPart01Test048
     * @tc.desc Verify findLastIndex returns 2 when index equals 2 on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40);
      let target: int = 2;
      let result = arr.findLastIndex((value: number, index: int, _array: Int8Array): boolean => index === target);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_4900
     * @tc.name int8ArrayFindLastIndexPart01Test049
     * @tc.desc Verify findLastIndex expects 3 when callback index + 1 equals length, on Int8Array.of(10, 20, 30, 40)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 40);
      let result = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => index + 1 === array.length,
      );
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5000
     * @tc.name int8ArrayFindLastIndexPart01Test050
     * @tc.desc Verify findLastIndex expects 2 when value > 1, on Int8Array.of(1, 2, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value > 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5100
     * @tc.name int8ArrayFindLastIndexPart01Test051
     * @tc.desc Verify findLastIndex returns 3 when array length equals 4 on Int8Array.of(5, 10, 15, 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 10, 15, 20);
      let result = arr.findLastIndex((value: number, _index: int, array: Int8Array): boolean => array.length === 4);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5200
     * @tc.name int8ArrayFindLastIndexPart01Test052
     * @tc.desc Verify findLastIndex expects 3 when value > 14, on Int8Array.of(7, 14, 21, 28)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(7, 14, 21, 28);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value > 14);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5300
     * @tc.name int8ArrayFindLastIndexPart01Test053
     * @tc.desc Verify findLastIndex expects 2 when value === 27, on Int8Array.of(9, 18, 27)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(9, 18, 27);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 27);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5400
     * @tc.name int8ArrayFindLastIndexPart01Test054
     * @tc.desc Verify findLastIndex with predicate element == array.$_get(0) returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(42, 10, 20, 30);
      let result = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => value === array.$_get(0),
      );
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5500
     * @tc.name int8ArrayFindLastIndexPart01Test055
     * @tc.desc Verify findLastIndex with predicate element == array.at(-1) returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30, 99);
      let result = arr.findLastIndex((value: number, _index: int, array: Int8Array): boolean => value === array.at(-1));
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5600
     * @tc.name int8ArrayFindLastIndexPart01Test056
     * @tc.desc Verify findLastIndex expects 2 when array.length equals external 3, on Int8Array.of(3, 6, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(3, 6, 9);
      let external: int = arr.length;
      let result = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => array.length === external,
      );
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5700
     * @tc.name int8ArrayFindLastIndexPart01Test057
     * @tc.desc Verify findLastIndex expects 2 when value === 6, on Int8Array.of(2, 4, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(2, 4, 6);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 6);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5800
     * @tc.name int8ArrayFindLastIndexPart01Test058
     * @tc.desc Verify findLastIndex expects 2 when index === array.byteLength - 1, on Int8Array.of(10, 20, 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(10, 20, 30);
      let result = arr.findLastIndex(
        (value: number, index: int, array: Int8Array): boolean => index === array.byteLength - 1,
      );
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_5900
     * @tc.name int8ArrayFindLastIndexPart01Test059
     * @tc.desc Verify findLastIndex expects 2, with $_get(i), on Int8Array.of(5, 10, 15)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 10, 15);
      let result = arr.findLastIndex((value: number, _index: int, array: Int8Array): boolean => {
        let sum: number = 0;
        for (let i = 0; i < array.length; i++) {
          sum = sum + array.$_get(i);
        }
        return value * 2 === sum;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6000
     * @tc.name int8ArrayFindLastIndexPart01Test060
     * @tc.desc Verify findLastIndex returns 2 when array.buffer matches view buffer on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(3);
      let arr = new Int8Array(buf);
      let result = arr.findLastIndex((value: number, _index: int, array: Int8Array): boolean => array.buffer === buf);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6100
     * @tc.name int8ArrayFindLastIndexPart01Test061
     * @tc.desc Verify findLastIndex with predicate element == 3 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(1, 2, 3, 4, 5);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6200
     * @tc.name int8ArrayFindLastIndexPart01Test062
     * @tc.desc Verify findLastIndex expects 2 from ArrayBuffer, with $_set(0, 10), on new Int8Array(buf)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(4);
      let arr = new Int8Array(buf);
      arr.$_set(0, 10);
      arr.$_set(1, 20);
      arr.$_set(2, 30);
      arr.$_set(3, 40);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6300
     * @tc.name int8ArrayFindLastIndexPart01Test063
     * @tc.desc Verify findLastIndex with predicate element == 15 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(5, 10, 15, 20);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 15);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6400
     * @tc.name int8ArrayFindLastIndexPart01Test064
     * @tc.desc Verify findLastIndex with predicate element == 21 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src: Array<number> = [7, 14, 21, 28];
      let arr = Int8Array.from(src);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 21);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6500
     * @tc.name int8ArrayFindLastIndexPart01Test065
     * @tc.desc Verify findLastIndex on subarray with predicate element == 80 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(100, 90, 80, 70, 60);
      let arr = base.subarray(1, 4);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 80);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6600
     * @tc.name int8ArrayFindLastIndexPart01Test066
     * @tc.desc Verify findLastIndex on slice with predicate element == 70 returns index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base = Int8Array.of(50, 60, 70, 80);
      let arr = base.slice(1, 3);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 70);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6700
     * @tc.name int8ArrayFindLastIndexPart01Test067
     * @tc.desc Verify findLastIndex on empty Int8Array(0) never invokes callback and returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(0);
      let called: boolean = false;
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6800
     * @tc.name int8ArrayFindLastIndexPart01Test068
     * @tc.desc Verify findLastIndex invokes callback once and returns -1 when predicate always false, on Int8Array.of(77)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(77);
      let count: number = 0;
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return false;
      });
      expect(count).assertEqual(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_6900
     * @tc.name int8ArrayFindLastIndexPart01Test069
     * @tc.desc Verify findLastIndex with predicate element == 77 returns first matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = Int8Array.of(77);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 77);
      expect(result).assertEqual(0);
      let missIndex = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 88);
      expect(missIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_7000
     * @tc.name int8ArrayFindLastIndexPart01Test070
     * @tc.desc Verify findLastIndex invokes callback 100 times and returns -1 when predicate always false, on new Int8Array(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(100);
      let count: number = 0;
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => {
        count = count + 1;
        return false;
      });
      expect(count).assertEqual(100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FIND_LAST_INDEX_PART01_7100
     * @tc.name int8ArrayFindLastIndexPart01Test071
     * @tc.desc Verify findLastIndex expects 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFindLastIndexPart01Test071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr = new Int8Array(100);
      arr.$_set(99, 42);
      let result = arr.findLastIndex((value: number, _index: int, _array: Int8Array): boolean => value === 42);
      expect(result).assertEqual(99);
    });
  });
}
