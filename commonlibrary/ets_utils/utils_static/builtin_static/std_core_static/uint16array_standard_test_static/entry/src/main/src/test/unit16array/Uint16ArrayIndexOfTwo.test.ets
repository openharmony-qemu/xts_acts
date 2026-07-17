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

export default function uint16ArrayIndexOf02Test(): void {
  describe('Uint16ArrayIndexOf02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0001
     * @tc.name testUint16ArrayIndexOfTwo001
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0002
     * @tc.name testUint16ArrayIndexOfTwo002
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0003
     * @tc.name testUint16ArrayIndexOfTwo003
     * @tc.desc Verify indexOf fromIndex number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(20, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0004
     * @tc.name testUint16ArrayIndexOfTwo004
     * @tc.desc Verify indexOf fromIndex number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(30, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0005
     * @tc.name testUint16ArrayIndexOfTwo005
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([]);
      let result: int = arr.indexOf(10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0006
     * @tc.name testUint16ArrayIndexOfTwo006
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42]);
      let result: int = arr.indexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0007
     * @tc.name testUint16ArrayIndexOfTwo007
     * @tc.desc Verify indexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 5, 5]);
      let result: int = arr.indexOf(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0008
     * @tc.name testUint16ArrayIndexOfTwo008
     * @tc.desc Verify indexOf searchElement number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([255]);
      let result: int = arr.indexOf(0xFF);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0009
     * @tc.name testUint16ArrayIndexOfTwo009
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0010
     * @tc.name testUint16ArrayIndexOfTwo010
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 20, 30, 20]);
      let result: int = arr.indexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0011
     * @tc.name testUint16ArrayIndexOfTwo011
     * @tc.desc Verify indexOf 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 100, 200]);
      let result: int = arr.indexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0012
     * @tc.name testUint16ArrayIndexOfTwo012
     * @tc.desc Verify indexOf 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([65535, 100, 200]);
      let result: int = arr.indexOf(65535);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0013
     * @tc.name testUint16ArrayIndexOfTwo013
     * @tc.desc Verify indexOf 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([32768, 100, 200]);
      let result: int = arr.indexOf(32768);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0014
     * @tc.name testUint16ArrayIndexOfTwo014
     * @tc.desc Verify indexOf 0xFFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([65535, 100, 200]);
      let result: int = arr.indexOf(0xFFFF);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0015
     * @tc.name testUint16ArrayIndexOfTwo015
     * @tc.desc Verify indexOf 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(0b1010);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0016
     * @tc.name testUint16ArrayIndexOfTwo016
     * @tc.desc Verify indexOf 0o77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([63, 100, 200]);
      let result: int = arr.indexOf(0o77);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0017
     * @tc.name testUint16ArrayIndexOfTwo017
     * @tc.desc Verify indexOf 1e4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10000, 200, 300]);
      let result: int = arr.indexOf(1e4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0018
     * @tc.name testUint16ArrayIndexOfTwo018
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([7, 7, 7, 7]);
      let result: int = arr.indexOf(7);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0019
     * @tc.name testUint16ArrayIndexOfTwo019
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0020
     * @tc.name testUint16ArrayIndexOfTwo020
     * @tc.desc Verify indexOf NaN -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(Number.NaN);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0021
     * @tc.name testUint16ArrayIndexOfTwo021
     * @tc.desc Verify indexOf Infinity -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0022
     * @tc.name testUint16ArrayIndexOfTwo022
     * @tc.desc Verify indexOf -Infinity -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(-Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0023
     * @tc.name testUint16ArrayIndexOfTwo023
     * @tc.desc Verify indexOf 3.14 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([3, 5, 7]);
      let result: int = arr.indexOf(3.14);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0024
     * @tc.name testUint16ArrayIndexOfTwo024
     * @tc.desc Verify indexOf -1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(-1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0025
     * @tc.name testUint16ArrayIndexOfTwo025
     * @tc.desc Verify indexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42]);
      let result: int = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0026
     * @tc.name testUint16ArrayIndexOfTwo026
     * @tc.desc Verify indexOf 65535.9 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([65535, 100, 200]);
      let result: int = arr.indexOf(65535.9);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0027
     * @tc.name testUint16ArrayIndexOfTwo027
     * @tc.desc Verify indexOf fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0028
     * @tc.name testUint16ArrayIndexOfTwo028
     * @tc.desc Verify indexOf fromIndex=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0029
     * @tc.name testUint16ArrayIndexOfTwo029
     * @tc.desc Verify indexOf fromIndex=3 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 15, 20, 25]);
      let result: int = arr.indexOf(15, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0030
     * @tc.name testUint16ArrayIndexOfTwo030
     * @tc.desc Verify indexOf fromIndex=-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
      let result: int = arr.indexOf(40, -1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0031
     * @tc.name testUint16ArrayIndexOfTwo031
     * @tc.desc Verify indexOf fromIndex=-2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, -2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0032
     * @tc.name testUint16ArrayIndexOfTwo032
     * @tc.desc Verify indexOf fromIndex=-length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(10, -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0033
     * @tc.name testUint16ArrayIndexOfTwo033
     * @tc.desc Verify indexOf fromIndex=-length-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(10, -6);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0034
     * @tc.name testUint16ArrayIndexOfTwo034
     * @tc.desc Verify indexOf fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(10, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0035
     * @tc.name testUint16ArrayIndexOfTwo035
     * @tc.desc Verify indexOf fromIndex -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: int = arr.indexOf(10, 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0036
     * @tc.name testUint16ArrayIndexOfTwo036
     * @tc.desc Verify indexOf fromIndex=length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(50, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0037
     * @tc.name testUint16ArrayIndexOfTwo037
     * @tc.desc Verify indexOf fromIndex 0x1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 0x1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0038
     * @tc.name testUint16ArrayIndexOfTwo038
     * @tc.desc Verify indexOf fromIndex 0b10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 0b10);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0039
     * @tc.name testUint16ArrayIndexOfTwo039
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(20);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0040
     * @tc.name testUint16ArrayIndexOfTwo040
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(99);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0041
     * @tc.name testUint16ArrayIndexOfTwo041
     * @tc.desc Verify indexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(20, 1);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0042
     * @tc.name testUint16ArrayIndexOfTwo042
     * @tc.desc Verify indexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(30, -1);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0043
     * @tc.name testUint16ArrayIndexOfTwo043
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([]);
      let lenBefore: int = arr.length;
      arr.indexOf(10);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0044
     * @tc.name testUint16ArrayIndexOfTwo044
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 5, 5]);
      let lenBefore: int = arr.length;
      arr.indexOf(5);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0045
     * @tc.name testUint16ArrayIndexOfTwo045
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42]);
      let lenBefore: int = arr.length;
      arr.indexOf(42);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0046
     * @tc.name testUint16ArrayIndexOfTwo046
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let lenBefore: int = arr.length;
      arr.indexOf(20);
      arr.indexOf(10, 1);
      arr.indexOf(99);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0047
     * @tc.name testUint16ArrayIndexOfTwo047
     * @tc.desc Verify indexOf arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let v0: number = arr[0];
      arr.indexOf(20);
      expect(arr.at(0)).assertEqual(v0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0048
     * @tc.name testUint16ArrayIndexOfTwo048
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([]);
      arr.indexOf(10);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0049
     * @tc.name testUint16ArrayIndexOfTwo049
     * @tc.desc Verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.indexOf(20);
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0050
     * @tc.name testUint16ArrayIndexOfTwo050
     * @tc.desc Verify indexOf buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let bufLenBefore: int = arr.buffer.byteLength;
      arr.indexOf(20);
      expect(arr.buffer.byteLength).assertEqual(bufLenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0051
     * @tc.name testUint16ArrayIndexOfTwo051
     * @tc.desc Verify indexOf arr.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let blBefore: int = arr.byteLength;
      arr.indexOf(20);
      expect(arr.byteLength).assertEqual(blBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0052
     * @tc.name testUint16ArrayIndexOfTwo052
     * @tc.desc Verify indexOf arr.byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let boBefore: int = arr.byteOffset;
      arr.indexOf(20);
      expect(arr.byteOffset).assertEqual(boBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0053
     * @tc.name testUint16ArrayIndexOfTwo053
     * @tc.desc Verify indexOf arr.BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let bpeBefore: int = arr.BYTES_PER_ELEMENT;
      arr.indexOf(20);
      expect(arr.BYTES_PER_ELEMENT).assertEqual(bpeBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0054
     * @tc.name testUint16ArrayIndexOfTwo054
     * @tc.desc Verify indexOf buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let buf: ArrayBuffer = arr.buffer;
      let view: Uint16Array = new Uint16Array(buf);
      arr.indexOf(20);
      expect(view.at(0)).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0055
     * @tc.name testUint16ArrayIndexOfTwo055
     * @tc.desc Verify indexOf buffer Uint16Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let buf: ArrayBuffer = arr.buffer;
      let view: Uint16Array = new Uint16Array(buf);
      arr.indexOf(20);
      expect(view.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0056
     * @tc.name testUint16ArrayIndexOfTwo056
     * @tc.desc Verify indexOf buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let buf: ArrayBuffer = arr.buffer;
      let view: Uint16Array = new Uint16Array(buf);
      arr.indexOf(20);
      arr.indexOf(10, 1);
      arr.indexOf(99);
      expect(view.at(0)).assertEqual(10);
      expect(view.at(1)).assertEqual(20);
      expect(view.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0057
     * @tc.name testUint16ArrayIndexOfTwo057
     * @tc.desc Verify indexOf arr.byteLength length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.indexOf(20);
      expect(arr.byteLength).assertEqual(arr.length * arr.BYTES_PER_ELEMENT);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0058
     * @tc.name testUint16ArrayIndexOfTwo058
     * @tc.desc Verify indexOf arr.buffer instanceof ArrayBuffer true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      arr.indexOf(20);
      expect(arr.buffer instanceof ArrayBuffer).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0059
     * @tc.name testUint16ArrayIndexOfTwo059
     * @tc.desc Verify indexOf fromIndex 0o10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 0o10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0060
     * @tc.name testUint16ArrayIndexOfTwo060
     * @tc.desc Verify indexOf fromIndex 1e0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 20, 40]);
      let result: int = arr.indexOf(20, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0061
     * @tc.name testUint16ArrayIndexOfTwo061
     * @tc.desc Verify indexOf fromIndex 1.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(30, Double.toInt(1.5));
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0062
     * @tc.name testUint16ArrayIndexOfTwo062
     * @tc.desc Verify indexOf fromIndex NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(10, Double.toInt(Number.NaN));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0063
     * @tc.name testUint16ArrayIndexOfTwo063
     * @tc.desc Verify indexOf fromIndex Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(50, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0064
     * @tc.name testUint16ArrayIndexOfTwo064
     * @tc.desc Verify indexOf fromIndex arr.length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(50, arr.length - 1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0065
     * @tc.name testUint16ArrayIndexOfTwo065
     * @tc.desc Verify indexOf fromIndex arr.byteLength/2-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: int = arr.indexOf(50, arr.byteLength / 2 - 1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0066
     * @tc.name testUint16ArrayIndexOfTwo066
     * @tc.desc Verify indexOf observes a value written through an alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[2] = 50;
            expect(arr.indexOf(50)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0067
     * @tc.name testUint16ArrayIndexOfTwo067
     * @tc.desc Verify indexOf offset view reports a view-relative first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 4, 5, 4);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 3);
            expect(view.indexOf(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0068
     * @tc.name testUint16ArrayIndexOfTwo068
     * @tc.desc Verify indexOf offset view excludes a match before its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 1, 2);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 2);
            expect(view.indexOf(9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0069
     * @tc.name testUint16ArrayIndexOfTwo069
     * @tc.desc Verify indexOf alias replacement changes the first matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            arr.set([7, 7, 7]);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[0] = 6;
            expect(arr.indexOf(7)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_INDEX_OF_TWO_0070
     * @tc.name testUint16ArrayIndexOfTwo070
     * @tc.desc Verify indexOf applies fromIndex and returns an index relative to a nonzero-offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayIndexOfTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(9, 7, 8, 7, 9);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 3);
      expect(view.indexOf(7, 1)).assertEqual(2);
    });

  });
}
