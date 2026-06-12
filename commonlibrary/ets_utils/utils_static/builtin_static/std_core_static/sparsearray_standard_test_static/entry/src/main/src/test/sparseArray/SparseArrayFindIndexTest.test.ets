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

type SparseArrayIntFindIndexPred = (v: int) => boolean;

export default function SparseArrayFindIndexTest(): void {
  describe('SparseArrayFindIndexTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_0100
     * @tc.name testSparseArrayFindIndex001
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        arr[0] = 1;
        const index = arr.findIndex((v) => v === 1);
        expect(index).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_0200
     * @tc.name testSparseArrayFindIndex002
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4, 5, 3);
        const index = arr.findIndex((v) => v === 5);
        expect(index).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_0300
     * @tc.name testSparseArrayFindIndex003
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        const index = arr.findIndex((v) => v > 100);
        expect(index).assertEqual(-1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_0400
     * @tc.name testSparseArrayFindIndex004
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const index = arr.findIndex((v) => v > 0);
        expect(index).assertEqual(-1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_0500
     * @tc.name testSparseArrayFindIndex005
     * @tc.desc Test SparseArray.find Index error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(6);
          arr[0] = 10;
          arr.findIndex((v) => {
            if (v > 5) {
              throw new Error("Test error");
            }
            return false;
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_0600
     * @tc.name testSparseArrayFindIndex006
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        arr[0] = 10;
        arr[2] = 30;
        const index = arr.findIndex((v): boolean => true);
        expect(index).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_0700
     * @tc.name testSparseArrayFindIndex007
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        const index = arr.findIndex((v, i) => i > 2);
        expect(index).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_0800
     * @tc.name testSparseArrayFindIndex008
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        const index = arr.findIndex((v, i, a) => a.length === 6);
        expect(index).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_0900
     * @tc.name testSparseArrayFindIndex009
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(4);
        arr[0] = "apple";
        arr[1] = "banana";
        arr[2] = "cherry";
        const index = arr.findIndex((v) => v.startsWith("b"));
        expect(index).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1000
     * @tc.name testSparseArrayFindIndex010
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4);
        arr[0] = -10;
        arr[1] = 20;
        arr[2] = -30;
        const index = arr.findIndex((v) => v < 0);
        expect(index).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1100
     * @tc.name testSparseArrayFindIndex011
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4);
        arr[0] = 10;
        arr[1] = 0;
        arr[2] = 30;
        const index = arr.findIndex((v) => v === 0);
        expect(index).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1200
     * @tc.name testSparseArrayFindIndex012
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4);
        arr[0] = 50;
        arr[1] = 20;
        arr[2] = 30;
        const index = arr.findIndex((v) => v > 40);
        expect(index).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1300
     * @tc.name testSparseArrayFindIndex013
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4);
        arr[0] = 10;
        arr[1] = 20;
        arr[2] = 50;
        const index = arr.findIndex((v) => v > 40);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1400
     * @tc.name testSparseArrayFindIndex014
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4);
        arr[0] = 10;
        arr[1] = 20;
        arr[2] = 30;
        const index = arr.findIndex((v) => v > 0);
        expect(index).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1500
     * @tc.name testSparseArrayFindIndex015
     * @tc.desc Sparse findIndex v>20 returns index 2 and callback invoked twice before match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        let callCount = 0;
        const index = arr.findIndex((v, i) => {
          callCount++;
          return v > 20;
        });
        expect(index).assertEqual(2);
        expect(callCount).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1600
     * @tc.name testSparseArrayFindIndex016
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 4, 4);
        const index = arr.findIndex((v, i) => i === 2);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1700
     * @tc.name testSparseArrayFindIndex017
     * @tc.desc Test SparseArray.findIndex, verify method result (index equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[9] = 100;
        arr[5] = 50;
        const index = arr.findIndex((v) => v === 100);
        expect(index).assertEqual(9);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1800
     * @tc.name testSparseArrayFindIndex018
     * @tc.desc findIndex on SparseArray<long> finds index of element above threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(1 as long, 10000000000 as long, 3 as long);
        const threshold: long = 1000000000 as long;
        const index = arr.findIndex((v: long): boolean => v > threshold);
        expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_1900
     * @tc.name testSparseArrayFindIndex019
     * @tc.desc findIndex locates null element in SparseArray<int|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3);
        const index = arr.findIndex((v: int | null): boolean => v === null);
        expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_2000
     * @tc.name testSparseArrayFindIndex020
     * @tc.desc findIndex locates undefined element in SparseArray<int|undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined, 3);
        const index = arr.findIndex((v: int | undefined): boolean => v === undefined);
        expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_2100
     * @tc.name testSparseArrayFindIndex021
     * @tc.desc findIndex locates XSS script string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const xss = "<script>alert(1)</script>";
        const arr = new SparseArray<string>("safe", xss, "tail");
        const index = arr.findIndex((v: string): boolean => v === xss);
        expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_2200
     * @tc.name testSparseArrayFindIndex022
     * @tc.desc findIndex locates binary literal element 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 0b1010, 3);
        const index = arr.findIndex((v: int): boolean => v === 0b1010);
        expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_2300
     * @tc.name testSparseArrayFindIndex023
     * @tc.desc Test SparseArray.findIndex error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.findIndex(null as SparseArrayIntFindIndexPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_INDEX_2400
     * @tc.name testSparseArrayFindIndex024
     * @tc.desc Test SparseArray.findIndex error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindIndex024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.findIndex(undefined as SparseArrayIntFindIndexPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
  });
}
