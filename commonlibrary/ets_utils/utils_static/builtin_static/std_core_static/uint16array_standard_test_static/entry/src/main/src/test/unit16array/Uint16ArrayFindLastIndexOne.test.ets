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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayFindLastIndex01Test(): void {
  describe('Uint16ArrayFindLastIndex01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0001
     * @tc.name testUint16ArrayFindLastIndexOne001
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0002
     * @tc.name testUint16ArrayFindLastIndexOne002
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0003
     * @tc.name testUint16ArrayFindLastIndexOne003
     * @tc.desc Verify findLastIndex 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 20, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 20);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0004
     * @tc.name testUint16ArrayFindLastIndexOne004
     * @tc.desc Verify findLastIndex 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 20, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0005
     * @tc.name testUint16ArrayFindLastIndexOne005
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 20, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0006
     * @tc.name testUint16ArrayFindLastIndexOne006
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 10, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0007
     * @tc.name testUint16ArrayFindLastIndexOne007
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0008
     * @tc.name testUint16ArrayFindLastIndexOne008
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 30);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0009
     * @tc.name testUint16ArrayFindLastIndexOne009
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 99);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0010
     * @tc.name testUint16ArrayFindLastIndexOne010
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 10, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0011
     * @tc.name testUint16ArrayFindLastIndexOne011
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10 || value === 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0012
     * @tc.name testUint16ArrayFindLastIndexOne012
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 25);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0013
     * @tc.name testUint16ArrayFindLastIndexOne013
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 30);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0014
     * @tc.name testUint16ArrayFindLastIndexOne014
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 15);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0015
     * @tc.name testUint16ArrayFindLastIndexOne015
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 25);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0016
     * @tc.name testUint16ArrayFindLastIndexOne016
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 35);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0017
     * @tc.name testUint16ArrayFindLastIndexOne017
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0018
     * @tc.name testUint16ArrayFindLastIndexOne018
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value >= 20);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0019
     * @tc.name testUint16ArrayFindLastIndexOne019
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value >= 30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0020
     * @tc.name testUint16ArrayFindLastIndexOne020
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value <= 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0021
     * @tc.name testUint16ArrayFindLastIndexOne021
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value <= 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0022
     * @tc.name testUint16ArrayFindLastIndexOne022
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 10 && value < 30);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0023
     * @tc.name testUint16ArrayFindLastIndexOne023
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value >= 15 && value <= 25);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0024
     * @tc.name testUint16ArrayFindLastIndexOne024
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(5, 15, 25);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 10 && value < 20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0025
     * @tc.name testUint16ArrayFindLastIndexOne025
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 1, 2);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0026
     * @tc.name testUint16ArrayFindLastIndexOne026
     * @tc.desc Verify findLastIndex 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 65535);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0027
     * @tc.name testUint16ArrayFindLastIndexOne027
     * @tc.desc Verify findLastIndex 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 32768);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0028
     * @tc.name testUint16ArrayFindLastIndexOne028
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0029
     * @tc.name testUint16ArrayFindLastIndexOne029
     * @tc.desc Verify findLastIndex 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 65535);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0030
     * @tc.name testUint16ArrayFindLastIndexOne030
     * @tc.desc Verify findLastIndex 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535, 0, 65535);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0031
     * @tc.name testUint16ArrayFindLastIndexOne031
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0032
     * @tc.name testUint16ArrayFindLastIndexOne032
     * @tc.desc Verify findLastIndex 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(65535, 65535, 65535);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0033
     * @tc.name testUint16ArrayFindLastIndexOne033
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0034
     * @tc.name testUint16ArrayFindLastIndexOne034
     * @tc.desc Verify findLastIndex 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 0, 0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0035
     * @tc.name testUint16ArrayFindLastIndexOne035
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 0);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value !== 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0036
     * @tc.name testUint16ArrayFindLastIndexOne036
     * @tc.desc Verify findLastIndex 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value >= 32768);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0037
     * @tc.name testUint16ArrayFindLastIndexOne037
     * @tc.desc Verify findLastIndex 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value <= 32768);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0038
     * @tc.name testUint16ArrayFindLastIndexOne038
     * @tc.desc Verify findLastIndex 65535 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 65535);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0039
     * @tc.name testUint16ArrayFindLastIndexOne039
     * @tc.desc Verify findLastIndex 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0040
     * @tc.name testUint16ArrayFindLastIndexOne040
     * @tc.desc Verify findLastIndex 2 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0041
     * @tc.name testUint16ArrayFindLastIndexOne041
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index === 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0042
     * @tc.name testUint16ArrayFindLastIndexOne042
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index > 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0043
     * @tc.name testUint16ArrayFindLastIndexOne043
     * @tc.desc Verify findLastIndex 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index < 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0044
     * @tc.name testUint16ArrayFindLastIndexOne044
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index % 2 === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0045
     * @tc.name testUint16ArrayFindLastIndexOne045
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index % 2 !== 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0046
     * @tc.name testUint16ArrayFindLastIndexOne046
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index >= 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0047
     * @tc.name testUint16ArrayFindLastIndexOne047
     * @tc.desc Verify findLastIndex 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => index < 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0048
     * @tc.name testUint16ArrayFindLastIndexOne048
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array.length === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0049
     * @tc.name testUint16ArrayFindLastIndexOne049
     * @tc.desc Verify findLastIndex array -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array.length < 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0050
     * @tc.name testUint16ArrayFindLastIndexOne050
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[0] === value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0051
     * @tc.name testUint16ArrayFindLastIndexOne051
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[0] < value);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0052
     * @tc.name testUint16ArrayFindLastIndexOne052
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[1] > value);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0053
     * @tc.name testUint16ArrayFindLastIndexOne053
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[index] === value);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0054
     * @tc.name testUint16ArrayFindLastIndexOne054
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[0] + array[1] === value);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0055
     * @tc.name testUint16ArrayFindLastIndexOne055
     * @tc.desc Verify findLastIndex array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => array[1] + array[2] === value + 20);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0056
     * @tc.name testUint16ArrayFindLastIndexOne056
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(2, 4, 6);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 2 === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0057
     * @tc.name testUint16ArrayFindLastIndexOne057
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 3, 5);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 2 === 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0058
     * @tc.name testUint16ArrayFindLastIndexOne058
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 2 !== 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0059
     * @tc.name testUint16ArrayFindLastIndexOne059
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 2 === 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0060
     * @tc.name testUint16ArrayFindLastIndexOne060
     * @tc.desc Verify findLastIndex 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(5, 10, 15);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 5 === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0061
     * @tc.name testUint16ArrayFindLastIndexOne061
     * @tc.desc Verify findLastIndex 3 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(6, 12, 18);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 3 === 0 && value % 6 === 0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0062
     * @tc.name testUint16ArrayFindLastIndexOne062
     * @tc.desc Verify findLastIndex 10 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 21, 32);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value % 10 === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0063
     * @tc.name testUint16ArrayFindLastIndexOne063
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value / 10 === 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0064
     * @tc.name testUint16ArrayFindLastIndexOne064
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => true);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0065
     * @tc.name testUint16ArrayFindLastIndexOne065
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10, 20, 30);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => false);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0066
     * @tc.name testUint16ArrayFindLastIndexOne066
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array();
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0067
     * @tc.name testUint16ArrayFindLastIndexOne067
     * @tc.desc Verify findLastIndex 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0068
     * @tc.name testUint16ArrayFindLastIndexOne068
     * @tc.desc Verify findLastIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0069
     * @tc.name testUint16ArrayFindLastIndexOne069
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0070
     * @tc.name testUint16ArrayFindLastIndexOne070
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 5);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0071
     * @tc.name testUint16ArrayFindLastIndexOne071
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0072
     * @tc.name testUint16ArrayFindLastIndexOne072
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value === 10);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_LAST_INDEX_ONE_0073
     * @tc.name testUint16ArrayFindLastIndexOne073
     * @tc.desc Verify findLastIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLastIndexOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let result: int = arr.findLastIndex((value: number, index: int, array: Uint16Array): boolean => value > 8);
      expect(result).assertEqual(9);
    });

  });
}
