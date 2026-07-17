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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_0100
     * @tc.name testUint16ArrayFindIndexOne001
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      let captured: number = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        captured = value;
        return true;
      });
      expect(captured).assertEqual(10);
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_0200
     * @tc.name testUint16ArrayFindIndexOne002
     * @tc.desc Verify value index array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10, 15);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 7;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_0300
     * @tc.name testUint16ArrayFindIndexOne003
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10);
      let firstIndex: int = -1;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        firstIndex = index;
        return true;
      });
      expect(firstIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_0400
     * @tc.name testUint16ArrayFindIndexOne004
     * @tc.desc Verify index 0,1,2,...
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_0500
     * @tc.name testUint16ArrayFindIndexOne005
     * @tc.desc Verify index value array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 200, 300);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_0600
     * @tc.name testUint16ArrayFindIndexOne006
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_0700
     * @tc.name testUint16ArrayFindIndexOne007
     * @tc.desc Verify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      let arrLen: int = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        arrLen = array.length;
        return true;
      });
      expect(arrLen).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_0800
     * @tc.name testUint16ArrayFindIndexOne008
     * @tc.desc Verify array value index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return array.length === 3;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_0900
     * @tc.name testUint16ArrayFindIndexOne009
     * @tc.desc Verify value/index/array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(42, 99);
      let ok: boolean = false;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        ok = value === 42 && index === 0 && array === arr;
        return true;
      });
      expect(ok).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1000
     * @tc.name testUint16ArrayFindIndexOne010
     * @tc.desc Verify callback values match array elements at each index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1100
     * @tc.name testUint16ArrayFindIndexOne011
     * @tc.desc Verify (index 0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 5;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1200
     * @tc.name testUint16ArrayFindIndexOne012
     * @tc.desc Verify (index 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 5, 5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1300
     * @tc.name testUint16ArrayFindIndexOne013
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1400
     * @tc.name testUint16ArrayFindIndexOne014
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1500
     * @tc.name testUint16ArrayFindIndexOne015
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value < 5;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1600
     * @tc.name testUint16ArrayFindIndexOne016
     * @tc.desc Verify new Uint16Array(0) -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return true;
      });
      expect(result).assertEqual(-1);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1700
     * @tc.name testUint16ArrayFindIndexOne017
     * @tc.desc Verify 0, value===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1800
     * @tc.name testUint16ArrayFindIndexOne018
     * @tc.desc Verify 65535, value===65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_1900
     * @tc.name testUint16ArrayFindIndexOne019
     * @tc.desc Verify 32768, value===32768 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(32768);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 32768;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2000
     * @tc.name testUint16ArrayFindIndexOne020
     * @tc.desc Verify 0 65535, value===65535 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2100
     * @tc.name testUint16ArrayFindIndexOne021
     * @tc.desc Verify 3.14 3, value===3 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 3.14;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 3;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2200
     * @tc.name testUint16ArrayFindIndexOne022
     * @tc.desc Verify 65535.9 65535, value===65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(1);
      arr[0] = 65535.9;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2300
     * @tc.name testUint16ArrayFindIndexOne023
     * @tc.desc Verify concise predicate returns index 1 for first value greater than 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => value > 15);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2400
     * @tc.name testUint16ArrayFindIndexOne024
     * @tc.desc Verify lambda
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2500
     * @tc.name testUint16ArrayFindIndexOne025
     * @tc.desc Verify value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number): boolean => value > 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2600
     * @tc.name testUint16ArrayFindIndexOne026
     * @tc.desc Verify value > threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 10, 15);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 12;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2700
     * @tc.name testUint16ArrayFindIndexOne027
     * @tc.desc Verify value < threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 5, 1);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value < 6;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2800
     * @tc.name testUint16ArrayFindIndexOne028
     * @tc.desc Verify value >= threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 5, 10);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value >= 5;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_2900
     * @tc.name testUint16ArrayFindIndexOne029
     * @tc.desc Verify value <= threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 5, 1);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value <= 5;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3000
     * @tc.name testUint16ArrayFindIndexOne030
     * @tc.desc Verify value !== threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 5, 10);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value !== 5;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3100
     * @tc.name testUint16ArrayFindIndexOne031
     * @tc.desc Verify value === threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 100, 200);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 100;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3200
     * @tc.name testUint16ArrayFindIndexOne032
     * @tc.desc Verify index === n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index === 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3300
     * @tc.name testUint16ArrayFindIndexOne033
     * @tc.desc Verify index >= n
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index >= 2;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3400
     * @tc.name testUint16ArrayFindIndexOne034
     * @tc.desc Verify index === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3500
     * @tc.name testUint16ArrayFindIndexOne035
     * @tc.desc Verify value % 2 === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 3, 4, 7);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value % 2 === 0;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3600
     * @tc.name testUint16ArrayFindIndexOne036
     * @tc.desc Verify value % 2 === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(2, 4, 5, 8);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value % 2 === 1;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3700
     * @tc.name testUint16ArrayFindIndexOne037
     * @tc.desc Verify index % 2 === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index % 2 === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3800
     * @tc.name testUint16ArrayFindIndexOne038
     * @tc.desc Verify value > 0 && value < 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 50, 200);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 0 && value < 100;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_3900
     * @tc.name testUint16ArrayFindIndexOne039
     * @tc.desc Verify index > 0 && value > 32768
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 50000, 60000);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return index > 0 && value > 32768;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4000
     * @tc.name testUint16ArrayFindIndexOne040
     * @tc.desc Verify value === 0 || value === 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 65535, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 0 || value === 65535;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4100
     * @tc.name testUint16ArrayFindIndexOne041
     * @tc.desc Verify 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 2;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4200
     * @tc.name testUint16ArrayFindIndexOne042
     * @tc.desc Verify 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 3;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4300
     * @tc.name testUint16ArrayFindIndexOne043
     * @tc.desc Verify 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(99, 0, 0, 0, 0, 0, 0, 0, 0, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4400
     * @tc.name testUint16ArrayFindIndexOne044
     * @tc.desc Verify 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0, 0, 0, 0, 0, 0, 0, 99);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 99;
      });
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4500
     * @tc.name testUint16ArrayFindIndexOne045
     * @tc.desc Verify 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > 100;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4600
     * @tc.name testUint16ArrayFindIndexOne046
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(100);
      arr[0] = 42;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 42;
      });
      expect(result).assertEqual(0);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4700
     * @tc.name testUint16ArrayFindIndexOne047
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(100);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 999;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4800
     * @tc.name testUint16ArrayFindIndexOne048
     * @tc.desc Verify 5, ===5 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 5, 5, 5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 5;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_4900
     * @tc.name testUint16ArrayFindIndexOne049
     * @tc.desc Verify 5, ===6 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(5, 5, 5, 5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 6;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5000
     * @tc.name testUint16ArrayFindIndexOne050
     * @tc.desc Verify 0, ===0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 0;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5100
     * @tc.name testUint16ArrayFindIndexOne051
     * @tc.desc Verify 65535, ===65535 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 65535;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5200
     * @tc.name testUint16ArrayFindIndexOne052
     * @tc.desc Verify -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7, 7);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value !== 7;
      });
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5300
     * @tc.name testUint16ArrayFindIndexOne053
     * @tc.desc Verify Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5400
     * @tc.name testUint16ArrayFindIndexOne054
     * @tc.desc Verify callback mutation changes the first array element to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5500
     * @tc.name testUint16ArrayFindIndexOne055
     * @tc.desc Verify predicate visits all elements and accumulates a sum of 6 when no value matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      let sum: number = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        sum = sum + value;
        return false;
      });
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5600
     * @tc.name testUint16ArrayFindIndexOne056
     * @tc.desc Verify predicate captures threshold 2 and returns index 2 for the first greater value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      let threshold: int = 2;
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value > threshold;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5700
     * @tc.name testUint16ArrayFindIndexOne057
     * @tc.desc Verify callback can mutate the next array element to 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5800
     * @tc.name testUint16ArrayFindIndexOne058
     * @tc.desc Verify predicate is called three times before value 3 matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      let callCount: int = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        callCount = callCount + 1;
        return value === 3;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_5900
     * @tc.name testUint16ArrayFindIndexOne059
     * @tc.desc Verify predicate is called for all three elements when no value matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      let callCount: int = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        callCount = callCount + 1;
        return false;
      });
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6000
     * @tc.name testUint16ArrayFindIndexOne060
     * @tc.desc Verify index 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      let callCount: int = 0;
      arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        callCount = callCount + 1;
        return index === 0;
      });
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6100
     * @tc.name testUint16ArrayFindIndexOne061
     * @tc.desc Verify subarray findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const view = arr.subarray(1, 3);
      const result: int = view.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 30;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6200
     * @tc.name testUint16ArrayFindIndexOne062
     * @tc.desc Verify buffer findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6300
     * @tc.name testUint16ArrayFindIndexOne063
     * @tc.desc Verify subarray 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40);
      const view = arr.subarray(2);
      const result: int = view.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 40;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6400
     * @tc.name testUint16ArrayFindIndexOne064
     * @tc.desc Verify fill findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(5);
      arr.fill(42);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 42;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6500
     * @tc.name testUint16ArrayFindIndexOne065
     * @tc.desc Verify set findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      arr.set([10, 20, 30] as FixedArray<int>, 0);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6600
     * @tc.name testUint16ArrayFindIndexOne066
     * @tc.desc Verify reverse findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      arr.reverse();
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 10;
      });
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6700
     * @tc.name testUint16ArrayFindIndexOne067
     * @tc.desc Verify sort findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(30, 10, 20);
      arr.sort();
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 20;
      });
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6800
     * @tc.name testUint16ArrayFindIndexOne068
     * @tc.desc Verify copyWithin findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4);
      arr.copyWithin(0, 2, 4);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 3;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_6900
     * @tc.name testUint16ArrayFindIndexOne069
     * @tc.desc Verify filter findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_7000
     * @tc.name testUint16ArrayFindIndexOne070
     * @tc.desc Verify map findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_7100
     * @tc.name testUint16ArrayFindIndexOne071
     * @tc.desc Verify slice findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30, 40, 50);
      const sliced = arr.slice(1, 4);
      const result: int = sliced.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return value === 30;
      });
      expect(result).assertEqual(1);
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_7200
     * @tc.name testUint16ArrayFindIndexOne072
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_7300
     * @tc.name testUint16ArrayFindIndexOne073
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_7400
     * @tc.name testUint16ArrayFindIndexOne074
     * @tc.desc Verify findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_7500
     * @tc.name testUint16ArrayFindIndexOne075
     * @tc.desc Verify findIndex findIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_7600
     * @tc.name testUint16ArrayFindIndexOne076
     * @tc.desc Verify findIndex forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_7700
     * @tc.name testUint16ArrayFindIndexOne077
     * @tc.desc Verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20);
      const result: int = arr.findIndex((value: number, index: int, array: Uint16Array): boolean => {
        return true;
      });
      expect(result).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FIND_INDEX_ONE_7800
     * @tc.name testUint16ArrayFindIndexOne078
     * @tc.desc Verify callCount equals length when predicate returns false for all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindIndexOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
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
