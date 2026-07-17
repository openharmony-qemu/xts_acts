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

export default function uint16ArrayFindIndex01Test(): void {
  describe('Uint16ArrayFindIndex01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_0100
     * @tc.name testUint16ArrayFindIndex01_001
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let captured: number = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(10);
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_0200
     * @tc.name testUint16ArrayFindIndex01_002
     * @tc.desc Verify value index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10, 15);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 7;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_0300
     * @tc.name testUint16ArrayFindIndex01_003
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10);
      let firstIndex: int = -1;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        firstIndex = index;
        return true;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_0400
     * @tc.name testUint16ArrayFindIndex01_004
     * @tc.desc Verify index 0,1,2,...
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10, 15);
      const indices: Array<int> = [];
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        indices.push(index);
        return false;
      });
      expect(indices.length).assertEqual(3);
      expect(indices.at(0)).assertEqual(0);
      expect(indices.at(1)).assertEqual(1);
      expect(indices.at(2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_0500
     * @tc.name testUint16ArrayFindIndex01_005
     * @tc.desc Verify index value array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 200, 300);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_0600
     * @tc.name testUint16ArrayFindIndex01_006
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10);
      let capturedArr: Uint16Array = Uint16Array.of();
      let callCount: int = 0;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        capturedArr = array;
        callCount++;
        return true;
      });
      expect(result).assertEqual(0);
      expect(callCount).assertEqual(1);
      expect(capturedArr).assertEqual(arr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_0700
     * @tc.name testUint16ArrayFindIndex01_007
     * @tc.desc Verify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      let arrLen: int = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        arrLen = array.length;
        return true;
      });
      expect(arrLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_0800
     * @tc.name testUint16ArrayFindIndex01_008
     * @tc.desc Verify array value index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return array.length === 3;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_0900
     * @tc.name testUint16ArrayFindIndex01_009
     * @tc.desc Verify value/index/array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(42, 99);
      let ok: boolean = false;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        ok = value === 42 && index === 0 && array === arr;
        return true;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1000
     * @tc.name testUint16ArrayFindIndex01_010
     * @tc.desc Verify callback values match array elements at each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let allCorrect: boolean = true;
      let callCount: int = 0;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        allCorrect = allCorrect && array[index] === value && array.length === 3;
        callCount++;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(callCount).assertEqual(3);
      expect(allCorrect).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1100
     * @tc.name testUint16ArrayFindIndex01_011
     * @tc.desc Verify (index 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 5;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1200
     * @tc.name testUint16ArrayFindIndex01_012
     * @tc.desc Verify (index 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 5, 5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1300
     * @tc.name testUint16ArrayFindIndex01_013
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1400
     * @tc.name testUint16ArrayFindIndex01_014
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1500
     * @tc.name testUint16ArrayFindIndex01_015
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value < 5;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1600
     * @tc.name testUint16ArrayFindIndex01_016
     * @tc.desc Verify new Uint16Array(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return true;
      });
      expect(result).assertEqual(-1);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1700
     * @tc.name testUint16ArrayFindIndex01_017
     * @tc.desc Verify 0, value===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1800
     * @tc.name testUint16ArrayFindIndex01_018
     * @tc.desc Verify 65535, value===65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_1900
     * @tc.name testUint16ArrayFindIndex01_019
     * @tc.desc Verify 32768, value===32768 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(32768);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 32768;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2000
     * @tc.name testUint16ArrayFindIndex01_020
     * @tc.desc Verify 0 65535, value===65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2100
     * @tc.name testUint16ArrayFindIndex01_021
     * @tc.desc Verify 3.14 3, value===3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 3.14;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 3;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2200
     * @tc.name testUint16ArrayFindIndex01_022
     * @tc.desc Verify 65535.9 65535, value===65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 65535.9;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2300
     * @tc.name testUint16ArrayFindIndex01_023
     * @tc.desc Verify concise predicate returns index 1 for first value greater than 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => value > 15);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2400
     * @tc.name testUint16ArrayFindIndex01_024
     * @tc.desc Verify lambda
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2500
     * @tc.name testUint16ArrayFindIndex01_025
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number): boolean => value > 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2600
     * @tc.name testUint16ArrayFindIndex01_026
     * @tc.desc Verify value > threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10, 15);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 12;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2700
     * @tc.name testUint16ArrayFindIndex01_027
     * @tc.desc Verify value < threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 5, 1);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value < 6;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2800
     * @tc.name testUint16ArrayFindIndex01_028
     * @tc.desc Verify value >= threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 5, 10);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value >= 5;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_2900
     * @tc.name testUint16ArrayFindIndex01_029
     * @tc.desc Verify value <= threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 5, 1);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value <= 5;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3000
     * @tc.name testUint16ArrayFindIndex01_030
     * @tc.desc Verify value !== threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 5, 10);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value !== 5;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3100
     * @tc.name testUint16ArrayFindIndex01_031
     * @tc.desc Verify value === threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 100, 200);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 100;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3200
     * @tc.name testUint16ArrayFindIndex01_032
     * @tc.desc Verify index === n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3300
     * @tc.name testUint16ArrayFindIndex01_033
     * @tc.desc Verify index >= n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index >= 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3400
     * @tc.name testUint16ArrayFindIndex01_034
     * @tc.desc Verify index === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3500
     * @tc.name testUint16ArrayFindIndex01_035
     * @tc.desc Verify value % 2 === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 3, 4, 7);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3600
     * @tc.name testUint16ArrayFindIndex01_036
     * @tc.desc Verify value % 2 === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(2, 4, 5, 8);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value % 2 === 1;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3700
     * @tc.name testUint16ArrayFindIndex01_037
     * @tc.desc Verify index % 2 === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index % 2 === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3800
     * @tc.name testUint16ArrayFindIndex01_038
     * @tc.desc Verify value > 0 && value < 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 50, 200);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 0 && value < 100;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_3900
     * @tc.name testUint16ArrayFindIndex01_039
     * @tc.desc Verify index > 0 && value > 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 50000, 60000);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index > 0 && value > 32768;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4000
     * @tc.name testUint16ArrayFindIndex01_040
     * @tc.desc Verify value === 0 || value === 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 65535, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 0 || value === 65535;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4100
     * @tc.name testUint16ArrayFindIndex01_041
     * @tc.desc Verify 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 2;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4200
     * @tc.name testUint16ArrayFindIndex01_042
     * @tc.desc Verify 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 3;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4300
     * @tc.name testUint16ArrayFindIndex01_043
     * @tc.desc Verify 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(99, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4400
     * @tc.name testUint16ArrayFindIndex01_044
     * @tc.desc Verify 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0, 0, 0, 0, 0, 0, 0, 99);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4500
     * @tc.name testUint16ArrayFindIndex01_045
     * @tc.desc Verify 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4600
     * @tc.name testUint16ArrayFindIndex01_046
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(100);
      arr[0] = 42;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 42;
      });
      expect(result).assertEqual(0);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4700
     * @tc.name testUint16ArrayFindIndex01_047
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(100);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 999;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4800
     * @tc.name testUint16ArrayFindIndex01_048
     * @tc.desc Verify 5, ===5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 5, 5, 5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_4900
     * @tc.name testUint16ArrayFindIndex01_049
     * @tc.desc Verify 5, ===6 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 5, 5, 5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 6;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5000
     * @tc.name testUint16ArrayFindIndex01_050
     * @tc.desc Verify 0, ===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5100
     * @tc.name testUint16ArrayFindIndex01_051
     * @tc.desc Verify 65535, ===65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5200
     * @tc.name testUint16ArrayFindIndex01_052
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7, 7);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value !== 7;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5300
     * @tc.name testUint16ArrayFindIndex01_053
     * @tc.desc Verify Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      try {
        arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
          throw new Error("findIndex error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5400
     * @tc.name testUint16ArrayFindIndex01_054
     * @tc.desc Verify callback mutation changes the first array element to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        if (index === 0) {
          arr[0] = 99;
        }
        return false;
      });
      expect(arr.at(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5500
     * @tc.name testUint16ArrayFindIndex01_055
     * @tc.desc Verify predicate visits all elements and accumulates a sum of 6 when no value matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      let sum: number = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        sum = sum + value;
        return false;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5600
     * @tc.name testUint16ArrayFindIndex01_056
     * @tc.desc Verify predicate captures threshold 2 and returns index 2 for the first greater value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      let threshold: int = 2;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > threshold;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5700
     * @tc.name testUint16ArrayFindIndex01_057
     * @tc.desc Verify callback can mutate the next array element to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        if (index === 0) {
          arr[1] = 99;
        }
        return false;
      });
      expect(arr.at(1)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5800
     * @tc.name testUint16ArrayFindIndex01_058
     * @tc.desc Verify predicate is called three times before value 3 matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      let callCount: int = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        callCount = callCount + 1;
        return value === 3;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_5900
     * @tc.name testUint16ArrayFindIndex01_059
     * @tc.desc Verify predicate is called for all three elements when no value matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      let callCount: int = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6000
     * @tc.name testUint16ArrayFindIndex01_060
     * @tc.desc Verify index 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      let callCount: int = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        callCount = callCount + 1;
        return index === 0;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6100
     * @tc.name testUint16ArrayFindIndex01_061
     * @tc.desc Verify subarray findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const view = arr.subarray(1, 3);
      const result: int = view.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 30;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6200
     * @tc.name testUint16ArrayFindIndex01_062
     * @tc.desc Verify buffer findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const buf = new ArrayBuffer(8);
      const arr = new Uint16Array(buf);
      arr[0] = 100;
      arr[1] = 200;
      arr[2] = 300;
      arr[3] = 400;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 300;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6300
     * @tc.name testUint16ArrayFindIndex01_063
     * @tc.desc Verify subarray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const view = arr.subarray(2);
      const result: int = view.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 40;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6400
     * @tc.name testUint16ArrayFindIndex01_064
     * @tc.desc Verify fill findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(5);
      arr.fill(42);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 42;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6500
     * @tc.name testUint16ArrayFindIndex01_065
     * @tc.desc Verify set findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      arr.set([10, 20, 30] as FixedArray<int>, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6600
     * @tc.name testUint16ArrayFindIndex01_066
     * @tc.desc Verify reverse findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      arr.reverse();
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6700
     * @tc.name testUint16ArrayFindIndex01_067
     * @tc.desc Verify sort findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(30, 10, 20);
      arr.sort();
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6800
     * @tc.name testUint16ArrayFindIndex01_068
     * @tc.desc Verify copyWithin findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 2, 4);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 3;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_6900
     * @tc.name testUint16ArrayFindIndex01_069
     * @tc.desc Verify filter findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const filtered = arr.filter((value: number, index: int, array: Uint16Array): boolean => {
        return value > 2;
      });
      const result: int = filtered.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 4;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_7000
     * @tc.name testUint16ArrayFindIndex01_070
     * @tc.desc Verify map findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const mapped = arr.map((value: number, index: int, array: Uint16Array): number => {
        return value * 10;
      });
      const result: int = mapped.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_7100
     * @tc.name testUint16ArrayFindIndex01_071
     * @tc.desc Verify slice findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const sliced = arr.slice(1, 4);
      const result: int = sliced.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 30;
      });
      expect(result).assertEqual(1);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_7200
     * @tc.name testUint16ArrayFindIndex01_072
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const r1: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 1;
      });
      const r2: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 2;
      });
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_7300
     * @tc.name testUint16ArrayFindIndex01_073
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const before: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 99;
      });
      arr[2] = 99;
      const after: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 99;
      });
      expect(before).assertEqual(-1);
      expect(after).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_7400
     * @tc.name testUint16ArrayFindIndex01_074
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const r1: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value % 2 === 0;
      });
      const r2: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value % 2 === 1;
      });
      expect(r1).assertEqual(1);
      expect(r2).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_7500
     * @tc.name testUint16ArrayFindIndex01_075
     * @tc.desc Verify findIndex findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        if (index > 0) {
          const inner: int = arr.findIndex((v: number, i: int, a: Uint16Array): boolean => {
            return v === value;
          });
          return inner === index;
        }
        return false;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_7600
     * @tc.name testUint16ArrayFindIndex01_076
     * @tc.desc Verify findIndex forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      let total: number = 0;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        if (index === 0) {
          arr.forEach((v: number, i: int, a: Uint16Array) => {
            total = total + v;
          });
        }
        return false;
      });
      expect(total).assertEqual(6);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_7700
     * @tc.name testUint16ArrayFindIndex01_077
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return true;
      });
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDINDEX01_7800
     * @tc.name testUint16ArrayFindIndex01_078
     * @tc.desc Verify callCount equals length when predicate returns false for all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndex01_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      let callCount: int = 0;
      const result: int = arr.findIndex((value: number): boolean => {
        callCount++;
        return false;
      });
      expect(callCount).assertEqual(4);
      expect(result).assertEqual(-1);
    });

  });
}
