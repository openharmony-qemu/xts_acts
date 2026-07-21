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

export default function uint16ArrayLastIndexOf02Test(): void {
  describe('Uint16ArrayLastIndexOf02Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0001
     * @tc.name testUint16ArrayLastIndexOfTwo001
     * @tc.desc Verify lastIndexOf number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.lastIndexOf(20);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0002
     * @tc.name testUint16ArrayLastIndexOfTwo002
     * @tc.desc Verify lastIndexOf(0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(5);
      const result = arr.lastIndexOf(0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0003
     * @tc.name testUint16ArrayLastIndexOfTwo003
     * @tc.desc Verify [5,10,15,20,25] lastIndexOf(5) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10, 15, 20, 25);
      const result = arr.lastIndexOf(5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0004
     * @tc.name testUint16ArrayLastIndexOfTwo004
     * @tc.desc Verify [5,10,15,20,25] lastIndexOf(25) 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10, 15, 20, 25);
      const result = arr.lastIndexOf(25);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0005
     * @tc.name testUint16ArrayLastIndexOfTwo005
     * @tc.desc Verify [100,200,300,200,100] lastIndexOf(200) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 200, 300, 200, 100);
      const result = arr.lastIndexOf(200);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0006
     * @tc.name testUint16ArrayLastIndexOfTwo006
     * @tc.desc Verify 10 [1..5,1..5] lastIndexOf(5) 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5, 1, 2, 3, 4, 5);
      const result = arr.lastIndexOf(5);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0007
     * @tc.name testUint16ArrayLastIndexOfTwo007
     * @tc.desc Verify 10 [1..5,1..5] lastIndexOf(1) 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5, 1, 2, 3, 4, 5);
      const result = arr.lastIndexOf(1);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0008
     * @tc.name testUint16ArrayLastIndexOfTwo008
     * @tc.desc Verify 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 0, 65535);
      const result = arr.lastIndexOf(65535);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0009
     * @tc.name testUint16ArrayLastIndexOfTwo009
     * @tc.desc Verify [1,2,3] lastIndexOf(3) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0010
     * @tc.name testUint16ArrayLastIndexOfTwo010
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0011
     * @tc.name testUint16ArrayLastIndexOfTwo011
     * @tc.desc Verify lastIndexOf -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0012
     * @tc.name testUint16ArrayLastIndexOfTwo012
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5);
      const result = arr.lastIndexOf(3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0013
     * @tc.name testUint16ArrayLastIndexOfTwo013
     * @tc.desc Verify 0 0 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0014
     * @tc.name testUint16ArrayLastIndexOfTwo014
     * @tc.desc Verify 65535 65535 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(65535);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0015
     * @tc.name testUint16ArrayLastIndexOfTwo015
     * @tc.desc Verify 0 lastIndexOf(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(0);
      const result = arr.lastIndexOf(0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0016
     * @tc.name testUint16ArrayLastIndexOfTwo016
     * @tc.desc Verify fromIndex=4 [1,2,1,2,1] lastIndexOf(1) 4 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 1, 2, 1);
      const result = arr.lastIndexOf(1, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0017
     * @tc.name testUint16ArrayLastIndexOfTwo017
     * @tc.desc Verify fromIndex=3 [5,5,5,5] lastIndexOf(5) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 5, 5, 5);
      const result = arr.lastIndexOf(5, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0018
     * @tc.name testUint16ArrayLastIndexOfTwo018
     * @tc.desc Verify fromIndex=1 [1,2,3] lastIndexOf(3, 1) 0-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(3, 1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0019
     * @tc.name testUint16ArrayLastIndexOfTwo019
     * @tc.desc Verify fromIndex=2 [1,2,3] lastIndexOf(3, 2) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(3, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0020
     * @tc.name testUint16ArrayLastIndexOfTwo020
     * @tc.desc Verify fromIndex=0 [1,2,3] lastIndexOf(2, 0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0021
     * @tc.name testUint16ArrayLastIndexOfTwo021
     * @tc.desc Verify fromIndex [1,2,3] lastIndexOf(1, 10) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(1, 10);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0022
     * @tc.name testUint16ArrayLastIndexOfTwo022
     * @tc.desc Verify fromIndex=4 [1,2,3,4,5] lastIndexOf(5, 3) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.lastIndexOf(5, 3);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0023
     * @tc.name testUint16ArrayLastIndexOfTwo023
     * @tc.desc Verify fromIndex [1,2,3,4,5] lastIndexOf(4, 3) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.lastIndexOf(4, 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0024
     * @tc.name testUint16ArrayLastIndexOfTwo024
     * @tc.desc Verify fromIndex=4 10 lastIndexOf(5) 4 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5, 1, 2, 3, 4, 5);
      const result = arr.lastIndexOf(5, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0025
     * @tc.name testUint16ArrayLastIndexOfTwo025
     * @tc.desc Verify fromIndex=4 10 lastIndexOf(1) 4 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5, 1, 2, 3, 4, 5);
      const result = arr.lastIndexOf(1, 4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0026
     * @tc.name testUint16ArrayLastIndexOfTwo026
     * @tc.desc Verify fromIndex=-1 4 [1,2,1,2,1] lastIndexOf(1) 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 1, 2, 1);
      const result = arr.lastIndexOf(1, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0027
     * @tc.name testUint16ArrayLastIndexOfTwo027
     * @tc.desc Verify fromIndex=-2 3 [1,2,1,2,1] lastIndexOf(1) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 1, 2, 1);
      const result = arr.lastIndexOf(1, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0028
     * @tc.name testUint16ArrayLastIndexOfTwo028
     * @tc.desc Verify fromIndex=-3 2 [1,2,1,2,1] lastIndexOf(1) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 1, 2, 1);
      const result = arr.lastIndexOf(1, -3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0029
     * @tc.name testUint16ArrayLastIndexOfTwo029
     * @tc.desc Verify fromIndex=-4 1 [1,2,1,2,1] lastIndexOf(1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 1, 2, 1);
      const result = arr.lastIndexOf(1, -4);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0030
     * @tc.name testUint16ArrayLastIndexOfTwo030
     * @tc.desc Verify fromIndex=-5 0 [1,2,1,2,1] lastIndexOf(1) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 1, 2, 1);
      const result = arr.lastIndexOf(1, -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0031
     * @tc.name testUint16ArrayLastIndexOfTwo031
     * @tc.desc Verify fromIndex=-6 [1,2,1,2,1] lastIndexOf(1) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 1, 2, 1);
      const result = arr.lastIndexOf(1, -6);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0032
     * @tc.name testUint16ArrayLastIndexOfTwo032
     * @tc.desc Verify fromIndex=-1 lastIndexOf(0) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.lastIndexOf(0, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0033
     * @tc.name testUint16ArrayLastIndexOfTwo033
     * @tc.desc Verify fromIndex=-2 lastIndexOf(0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.lastIndexOf(0, -2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0034
     * @tc.name testUint16ArrayLastIndexOfTwo034
     * @tc.desc Verify fromIndex=-3 lastIndexOf(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.lastIndexOf(0, -3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0035
     * @tc.name testUint16ArrayLastIndexOfTwo035
     * @tc.desc Verify fromIndex=-4 lastIndexOf(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.lastIndexOf(0, -4);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0036
     * @tc.name testUint16ArrayLastIndexOfTwo036
     * @tc.desc Verify fromIndex=-1 [1,2,3] lastIndexOf(1) 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(1, -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0037
     * @tc.name testUint16ArrayLastIndexOfTwo037
     * @tc.desc Verify fromIndex=-2 [1,2,3] lastIndexOf(3) 0-1 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(3, -2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0038
     * @tc.name testUint16ArrayLastIndexOfTwo038
     * @tc.desc Verify fromIndex=-2 [1,2,3] lastIndexOf(2) 0-1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(2, -2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0039
     * @tc.name testUint16ArrayLastIndexOfTwo039
     * @tc.desc Verify fromIndex=-2 [1,2,3] lastIndexOf(1) 0-1 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(1, -2);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0040
     * @tc.name testUint16ArrayLastIndexOfTwo040
     * @tc.desc Verify fromIndex=-1 [1,2,3] lastIndexOf(3) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(3, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0041
     * @tc.name testUint16ArrayLastIndexOfTwo041
     * @tc.desc Verify [1,16,3] lastIndexOf(0x10) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 16, 3);
      const result = arr.lastIndexOf(0x10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0042
     * @tc.name testUint16ArrayLastIndexOfTwo042
     * @tc.desc Verify [1,2,3] lastIndexOf(0b10) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(0b10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0043
     * @tc.name testUint16ArrayLastIndexOfTwo043
     * @tc.desc Verify [1,8,3] lastIndexOf(0o10) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 8, 3);
      const result = arr.lastIndexOf(0o10);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0044
     * @tc.name testUint16ArrayLastIndexOfTwo044
     * @tc.desc Verify [1,10,3] lastIndexOf(1e1) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 10, 3);
      const result = arr.lastIndexOf(1e1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0045
     * @tc.name testUint16ArrayLastIndexOfTwo045
     * @tc.desc Verify [65535] lastIndexOf(0xFFFF) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535);
      const result = arr.lastIndexOf(0xFFFF);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0046
     * @tc.name testUint16ArrayLastIndexOfTwo046
     * @tc.desc Verify [255] lastIndexOf(0xFF) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(255);
      const result = arr.lastIndexOf(0xFF);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0047
     * @tc.name testUint16ArrayLastIndexOfTwo047
     * @tc.desc Verify 2.0 2 [1,2,3] lastIndexOf(2.0) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(2.0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0048
     * @tc.name testUint16ArrayLastIndexOfTwo048
     * @tc.desc Verify 2.5 2 [1,2,3] lastIndexOf(2.5) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.lastIndexOf(2.5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0049
     * @tc.name testUint16ArrayLastIndexOfTwo049
     * @tc.desc Verify -0 0 [0,0,0] lastIndexOf(-0) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.lastIndexOf(-0);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0050
     * @tc.name testUint16ArrayLastIndexOfTwo050
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 20, 10);
      const before = arr.length;
      arr.lastIndexOf(20);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0051
     * @tc.name testUint16ArrayLastIndexOfTwo051
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 20, 10);
      const before0 = arr[0];
      const before1 = arr[1];
      const before2 = arr[2];
      arr.lastIndexOf(20);
      expect(arr.at(0)).assertEqual(before0);
      expect(arr.at(1)).assertEqual(before1);
      expect(arr.at(2)).assertEqual(before2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0052
     * @tc.name testUint16ArrayLastIndexOfTwo052
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const before = arr.length;
      arr.lastIndexOf(99);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0053
     * @tc.name testUint16ArrayLastIndexOfTwo053
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const before0 = arr[0];
      arr.lastIndexOf(99);
      expect(arr.at(0)).assertEqual(before0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0054
     * @tc.name testUint16ArrayLastIndexOfTwo054
     * @tc.desc Verify lastIndexOf fromIndex byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const before = arr.byteLength;
      arr.lastIndexOf(3, 2);
      expect(arr.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0055
     * @tc.name testUint16ArrayLastIndexOfTwo055
     * @tc.desc Verify lastIndexOf fromIndex byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const before = arr.byteOffset;
      arr.lastIndexOf(3, -2);
      expect(arr.byteOffset).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0056
     * @tc.name testUint16ArrayLastIndexOfTwo056
     * @tc.desc Verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const before = arr.length;
      arr.lastIndexOf(1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0057
     * @tc.name testUint16ArrayLastIndexOfTwo057
     * @tc.desc Verify lastIndexOf ArrayBuffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint16Array(buf);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      const before = arr[0];
      arr.lastIndexOf(30);
      expect(arr.at(0)).assertEqual(before);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
      expect(arr.at(3)).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0058
     * @tc.name testUint16ArrayLastIndexOfTwo058
     * @tc.desc Verify fromIndex [1,2,3,4,5] lastIndexOf(4, 2) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.lastIndexOf(4, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0059
     * @tc.name testUint16ArrayLastIndexOfTwo059
     * @tc.desc Verify 0 [0] lastIndexOf(0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0);
      const result = arr.lastIndexOf(0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0060
     * @tc.name testUint16ArrayLastIndexOfTwo060
     * @tc.desc Verify [0] lastIndexOf(1) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0);
      const result = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0061
     * @tc.name testUint16ArrayLastIndexOfTwo061
     * @tc.desc Verify fromIndex=-1 [3,3,3] lastIndexOf(3) 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(3, 3, 3);
      const result = arr.lastIndexOf(3, -1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0062
     * @tc.name testUint16ArrayLastIndexOfTwo062
     * @tc.desc Verify fromIndex=-2 [3,3,3] lastIndexOf(3) 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(3, 3, 3);
      const result = arr.lastIndexOf(3, -2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0063
     * @tc.name testUint16ArrayLastIndexOfTwo063
     * @tc.desc Verify fromIndex=-3 [3,3,3] lastIndexOf(3) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(3, 3, 3);
      const result = arr.lastIndexOf(3, -3);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0064
     * @tc.name testUint16ArrayLastIndexOfTwo064
     * @tc.desc Verify ArrayBuffer lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint16Array(buf);
      arr[0] = 10;
      arr[1] = 20;
      arr[2] = 30;
      arr[3] = 40;
      const result = arr.lastIndexOf(30);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0065
     * @tc.name testUint16ArrayLastIndexOfTwo065
     * @tc.desc Verify subarray lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const parent = Uint16Array.of(10, 20, 30, 40);
      const sub = parent.subarray(1, 3);
      const result = sub.lastIndexOf(20);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0066
     * @tc.name testUint16ArrayLastIndexOfTwo066
     * @tc.desc Verify subarray lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const parent = Uint16Array.of(10, 20, 30, 40);
      const sub = parent.subarray(1, 3);
      const result = sub.lastIndexOf(40);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0067
     * @tc.name testUint16ArrayLastIndexOfTwo067
     * @tc.desc Verify 65535 fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 0, 65535);
      const result = arr.lastIndexOf(65535, 1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0068
     * @tc.name testUint16ArrayLastIndexOfTwo068
     * @tc.desc Verify fromIndex 1.5 treated as 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 20, 10);
      const result = arr.lastIndexOf(20, Double.toInt(1.5));
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0069
     * @tc.name testUint16ArrayLastIndexOfTwo069
     * @tc.desc Verify fromIndex NaN treated as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 20, 10);
      const result = arr.lastIndexOf(10, Double.toInt(Number.NaN));
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0070
     * @tc.name testUint16ArrayLastIndexOfTwo070
     * @tc.desc Verify fromIndex Infinity treated as arr.length -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 20, 10);
      const result = arr.lastIndexOf(10, Double.toInt(Number.POSITIVE_INFINITY));
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0071
     * @tc.name testUint16ArrayLastIndexOfTwo071
     * @tc.desc Verify fromIndex using arr.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const result = arr.lastIndexOf(50, arr.length - 1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0072
     * @tc.name testUint16ArrayLastIndexOfTwo072
     * @tc.desc Verify lastIndexOf observes a value written through an alias
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[2] = 50;
            expect(arr.lastIndexOf(50)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0073
     * @tc.name testUint16ArrayLastIndexOfTwo073
     * @tc.desc Verify lastIndexOf offset view reports a view-relative last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(9, 4, 5, 4);
            let view: Uint16Array = new Uint16Array(all.buffer, 2, 3);
            expect(view.lastIndexOf(4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0074
     * @tc.name testUint16ArrayLastIndexOfTwo074
     * @tc.desc Verify lastIndexOf offset view excludes a match after its range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let all: Uint16Array = Uint16Array.of(1, 2, 9);
            let view: Uint16Array = new Uint16Array(all.buffer, 0, 2);
            expect(view.lastIndexOf(9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0075
     * @tc.name testUint16ArrayLastIndexOfTwo075
     * @tc.desc Verify lastIndexOf alias replacement changes the last matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buffer: ArrayBuffer = new ArrayBuffer(6);
            let arr: Uint16Array = new Uint16Array(buffer);
            arr.set([7, 7, 7]);
            let alias: Uint16Array = new Uint16Array(buffer);
            alias[2] = 6;
            expect(arr.lastIndexOf(7)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_LAST_INDEX_OF_TWO_0076
     * @tc.name testUint16ArrayLastIndexOfTwo076
     * @tc.desc Verify lastIndexOf applies fromIndex and returns an index relative to a nonzero-offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayLastIndexOfTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let backing: Uint16Array = Uint16Array.of(9, 7, 8, 7, 9);
      let view: Uint16Array = new Uint16Array(backing.buffer, 2, 3);
      expect(view.lastIndexOf(7, 1)).assertEqual(0);
    });

  });
}
