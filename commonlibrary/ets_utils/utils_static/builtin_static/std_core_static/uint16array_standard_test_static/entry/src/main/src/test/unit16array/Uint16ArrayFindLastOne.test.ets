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

export default function uint16ArrayFindLast01Test(): void {
  describe('Uint16ArrayFindLast01Test', () => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_0100
     * @tc.name testUint16ArrayFindLast01_001
     * @tc.desc Verify 1 predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.findLast((v: number): boolean => v > 1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_0200
     * @tc.name testUint16ArrayFindLast01_002
     * @tc.desc Verify predicate true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: number = arr.findLast((): boolean => true);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_0300
     * @tc.name testUint16ArrayFindLast01_003
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 1, 2, 0, 3]);
      let result: number = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_0400
     * @tc.name testUint16ArrayFindLast01_004
     * @tc.desc Verify 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 65535, 200]);
      let result: number = arr.findLast((v: number): boolean => v === 65535);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_0500
     * @tc.name testUint16ArrayFindLast01_005
     * @tc.desc Verify 32768 0x8000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 32768, 200]);
      let result: number = arr.findLast((v: number): boolean => v === 32768);
      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_0600
     * @tc.name testUint16ArrayFindLast01_006
     * @tc.desc Verify 30000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 65535, 32768, 50]);
      let result: number = arr.findLast((v: number): boolean => v > 30000);
      expect(result).assertEqual(32768);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_0700
     * @tc.name testUint16ArrayFindLast01_007
     * @tc.desc Verify 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([3, 65535, 7]);
      let result: number = arr.findLast((v: number): boolean => v > 6);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_0800
     * @tc.name testUint16ArrayFindLast01_008
     * @tc.desc Verify 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([50, 200, 100, 300]);
      let result: number = arr.findLast((v: number): boolean => v <= 100);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_0900
     * @tc.name testUint16ArrayFindLast01_009
     * @tc.desc Verify 30000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 32768, 65535]);
      let result: number = arr.findLast((v: number): boolean => v >= 30000);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1000
     * @tc.name testUint16ArrayFindLast01_010
     * @tc.desc Verify (0,10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 5, 15, 8]);
      let result: number = arr.findLast((v: number): boolean => v > 0 && v < 10);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1100
     * @tc.name testUint16ArrayFindLast01_011
     * @tc.desc Verify 0 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 0, 65535, 200]);
      let result: number = arr.findLast((v: number): boolean => v === 0 || v === 65535);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1200
     * @tc.name testUint16ArrayFindLast01_012
     * @tc.desc Verify findLast returns the last even element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 3, 5, 7, 8]);
      let result: number = arr.findLast((v: number): boolean => v % 2 === 0);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1300
     * @tc.name testUint16ArrayFindLast01_013
     * @tc.desc Verify findLast returns the last odd element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([2, 4, 6, 7, 8]);
      let result: number = arr.findLast((v: number): boolean => v % 2 !== 0);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1400
     * @tc.name testUint16ArrayFindLast01_014
     * @tc.desc Verify >> 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 255, 256, 65535]);
      let result: number = arr.findLast((v: number): boolean => (v >> 8) > 0);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1500
     * @tc.name testUint16ArrayFindLast01_015
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300]);
      let result: number = arr.findLast((v: number, i: int): boolean => i === 0);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1600
     * @tc.name testUint16ArrayFindLast01_016
     * @tc.desc Verify index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([100, 200, 300]);
      let result: number = arr.findLast((v: number, i: int): boolean => i === arr.length - 1);
      expect(result).assertEqual(300);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1700
     * @tc.name testUint16ArrayFindLast01_017
     * @tc.desc Verify index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
      let result: number = arr.findLast((v: number, i: int): boolean => i === 2);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1800
     * @tc.name testUint16ArrayFindLast01_018
     * @tc.desc Verify index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: number = arr.findLast((v: number, i: int): boolean => i < 2);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_1900
     * @tc.name testUint16ArrayFindLast01_019
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: number = arr.findLast((v: number, i: int): boolean => i % 2 === 0);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2000
     * @tc.name testUint16ArrayFindLast01_020
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: number = arr.findLast((v: number, i: int): boolean => i % 2 !== 0);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2100
     * @tc.name testUint16ArrayFindLast01_021
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([7, 8, 9]);
      let result: number = arr.findLast((v: number, i: int): boolean => i >= 0);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2200
     * @tc.name testUint16ArrayFindLast01_022
     * @tc.desc Verify array 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      let result: number = arr.findLast((v: number, i: int, a: Uint16Array): boolean => a.length > 0);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2300
     * @tc.name testUint16ArrayFindLast01_023
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let result: number = arr.findLast((v: number, i: int, a: Uint16Array): boolean => a.length === 5);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2400
     * @tc.name testUint16ArrayFindLast01_024
     * @tc.desc Verify array indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 2, 1]);
      let result: number = arr.findLast((v: number, i: int, a: Uint16Array): boolean => a.indexOf(v) === i);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2500
     * @tc.name testUint16ArrayFindLast01_025
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 15]);
      let result: number = arr.findLast((v: number, i: int, a: Uint16Array): boolean => {
        a[i] = 0;
        return v > 8;
      });
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2600
     * @tc.name testUint16ArrayFindLast01_026
     * @tc.desc Verify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let len: int = arr.length;
      let result: number = arr.findLast((v: number, i: int, a: Uint16Array): boolean => a.length === len);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2700
     * @tc.name testUint16ArrayFindLast01_027
     * @tc.desc Verify array a[i] === v
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([7, 8, 9]);
      let result: number = arr.findLast((v: number, i: int, a: Uint16Array): boolean => a[i] === v);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2800
     * @tc.name testUint16ArrayFindLast01_028
     * @tc.desc Verify array lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 2, 1]);
      let result: number = arr.findLast((v: number, i: int, a: Uint16Array): boolean => a.lastIndexOf(v) === i);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_2900
     * @tc.name testUint16ArrayFindLast01_029
     * @tc.desc Verify findLast returns 30 for values greater than 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30]);
      let result: number = arr.findLast((v: number): boolean => v > 15);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3000
     * @tc.name testUint16ArrayFindLast01_030
     * @tc.desc Verify findLast returns the sole matching element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([42]);
      let result: number = arr.findLast((v: number): boolean => v === 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3100
     * @tc.name testUint16ArrayFindLast01_031
     * @tc.desc Verify findLast returns the last value when all elements match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 5, 5, 5]);
      let result: number = arr.findLast((v: number): boolean => v > 0);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3200
     * @tc.name testUint16ArrayFindLast01_032
     * @tc.desc Verify predicate Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3]);
      try {
        let result: number = arr.findLast((v: number): boolean => {
          throw new Error("findLast error");
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3300
     * @tc.name testUint16ArrayFindLast01_033
     * @tc.desc Verify predicate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let callCount: int = 0;
      const markerError = new Error("stop");
      try {
        arr.findLast((v: number): boolean => {
          callCount++;
          if (v > 3) {
            throw markerError;
          }
          return false;
        });
        expect().assertFail();
      } catch (e) {
        expect(e).assertEqual(markerError);
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3400
     * @tc.name testUint16ArrayFindLast01_034
     * @tc.desc Verify [1,2,3,2,1] ===2 3 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 2, 1]);
      let result: number = arr.findLast((v: number): boolean => v === 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3500
     * @tc.name testUint16ArrayFindLast01_035
     * @tc.desc Verify [1,2,3,4,5] ===5 4 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let result: number = arr.findLast((v: number): boolean => v === 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3600
     * @tc.name testUint16ArrayFindLast01_036
     * @tc.desc Verify [10,20,30,40] ===20 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
      let result: number = arr.findLast((v: number): boolean => v === 20);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3700
     * @tc.name testUint16ArrayFindLast01_037
     * @tc.desc Verify findLast stops after the last element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let callCount: int = 0;
      let result: number = arr.findLast((v: number): boolean => {
        callCount++;
        return v > 45;
      });
      expect(result).assertEqual(50);
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3800
     * @tc.name testUint16ArrayFindLast01_038
     * @tc.desc Verify findLast scans backward until value 30 matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let callCount: int = 0;
      let result: number = arr.findLast((v: number): boolean => {
        callCount++;
        return v === 30;
      });
      expect(result).assertEqual(30);
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_3900
     * @tc.name testUint16ArrayFindLast01_039
     * @tc.desc Verify 65536 0 ===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([65536]);
      let result: number = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4000
     * @tc.name testUint16ArrayFindLast01_040
     * @tc.desc Verify -1 65535 ===65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([-1]);
      let result: number = arr.findLast((v: number): boolean => v === 65535);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4100
     * @tc.name testUint16ArrayFindLast01_041
     * @tc.desc Verify 3.14 3 ===3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([3.14]);
      let result: number = arr.findLast((v: number): boolean => v === 3);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4200
     * @tc.name testUint16ArrayFindLast01_042
     * @tc.desc Verify NaN 0 ===0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([Number.NaN]);
      let result: number = arr.findLast((v: number): boolean => v === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4300
     * @tc.name testUint16ArrayFindLast01_043
     * @tc.desc Verify 0xFFFF ===65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0xFFFF]);
      let result: number = arr.findLast((v: number): boolean => v === 65535);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4400
     * @tc.name testUint16ArrayFindLast01_044
     * @tc.desc Verify 100 >50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr[i] = i;
      }
      let result: number = arr.findLast((v: number): boolean => v > 50);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4500
     * @tc.name testUint16ArrayFindLast01_045
     * @tc.desc Verify 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array(256);
      for (let i: int = 0; i < 256; i++) {
        arr[i] = i;
      }
      let result: number = arr.findLast((v: number): boolean => v % 2 === 0);
      expect(result).assertEqual(254);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4600
     * @tc.name testUint16ArrayFindLast01_046
     * @tc.desc Verify findLast returns the last value greater than 50000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([0, 65535, 32768, 0xFFFF, 0x8000]);
      let result: number = arr.findLast((v: number): boolean => v > 50000);
      expect(result).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4700
     * @tc.name testUint16ArrayFindLast01_047
     * @tc.desc Verify findLast uses a captured threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let threshold: number = 3;
      let result: number = arr.findLast((v: number): boolean => v > threshold);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4800
     * @tc.name testUint16ArrayFindLast01_048
     * @tc.desc Verify findLast stops before visiting earlier elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let sum: number = 0;
      let result: number = arr.findLast((v: number): boolean => {
        sum = sum + v;
        return v > 45;
      });
      expect(result).assertEqual(50);
      expect(sum).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_4900
     * @tc.name testUint16ArrayFindLast01_049
     * @tc.desc Verify findLast findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5, 6]);
      let result: number = arr.findLast((v: number): boolean => v > 3);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_5000
     * @tc.name testUint16ArrayFindLast01_050
     * @tc.desc Verify findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([5, 10, 15, 10, 5]);
      let r1: number = arr.findLast((v: number): boolean => v === 10);
      let r2: number = arr.findLast((v: number): boolean => v === 10);
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_5100
     * @tc.name testUint16ArrayFindLast01_051
     * @tc.desc Verify subarray findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let sub: Uint16Array = arr.subarray(1, 4);
      let result: number = sub.findLast((v: number): boolean => v > 25);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_5200
     * @tc.name testUint16ArrayFindLast01_052
     * @tc.desc Verify slice findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40, 50]);
      let sliced: Uint16Array = arr.slice(2);
      let result: number = sliced.findLast((v: number): boolean => v > 35);
      expect(result).assertEqual(50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_5300
     * @tc.name testUint16ArrayFindLast01_053
     * @tc.desc Verify fill findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      arr.fill(99, 1, 4);
      let result: number = arr.findLast((v: number): boolean => v === 99);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_5400
     * @tc.name testUint16ArrayFindLast01_054
     * @tc.desc Verify set findLast
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([1, 2, 3, 4, 5]);
      let src: Uint16Array = new Uint16Array([100, 200]);
      arr.set(src, 2);
      let result: number = arr.findLast((v: number): boolean => v > 50);
      expect(result).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_5500
     * @tc.name testUint16ArrayFindLast01_055
     * @tc.desc Verify callCount equals array length when first element matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40]);
      let callCount: int = 0;
      let result: number = arr.findLast((v: number): boolean => {
        callCount++;
        return v === 10;
      });
      expect(callCount).assertEqual(4);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_FINDLAST01_5600
     * @tc.name testUint16ArrayFindLast01_056
     * @tc.desc Verify findLast on reversed array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayFindLast01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let arr: Uint16Array = new Uint16Array([10, 20, 30, 40]).reverse();
      let result: number = arr.findLast((v: number): boolean => v > 25);
      expect(result).assertEqual(30);
    });

  });
}
