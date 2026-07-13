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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

type SparseArrayIntFindLastIndexPred = (v: int) => boolean;

interface Item024 {
    id: number;
    name: string;
  }

export default function SparseArrayFindLastIndexTest(): void {
  describe('SparseArrayFindLastIndexTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_0100
     * @tc.name testSparseArrayFindLastIndex001
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals -1, arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const index = arr.findLastIndex((_v: int, _i: int, _a: SparseArray<int>) => false);
        expect(index).assertEqual(-1);
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_0200
     * @tc.name testSparseArrayFindLastIndex002
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2, arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const index = arr.findLastIndex((v) => v > 1);
        expect(index).assertEqual(2);
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_0300
     * @tc.name testSparseArrayFindLastIndex003
     * @tc.desc findLastIndex with elem/index predicate on [10,20,30] returns 2, instanceof SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const index = arr.findLastIndex((elem, index, array) => {
          return elem > 15 && index > 0;
        });
        expect(index).assertEqual(2);
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_0400
     * @tc.name testSparseArrayFindLastIndex004
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 1, arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const index = arr.findLastIndex((v) => v === 2);
        expect(index).assertEqual(1);
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_0500
     * @tc.name testSparseArrayFindLastIndex005
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const index = arr.findLastIndex((v) => v === 3);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_0600
     * @tc.name testSparseArrayFindLastIndex006
     * @tc.desc findLastIndex returns last index of matching value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 3, 5);
        const index = arr.findLastIndex((v) => v === 5);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_0700
     * @tc.name testSparseArrayFindLastIndex007
     * @tc.desc findLastIndex returns last index of duplicate value 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 5, 3);
        const index = arr.findLastIndex((v) => v === 5);
        expect(index).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_0800
     * @tc.name testSparseArrayFindLastIndex008
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-1, -2, -3);
        const index = arr.findLastIndex((v) => v < -2);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_0900
     * @tc.name testSparseArrayFindLastIndex009
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2147483640, 100, 200);
        const index = arr.findLastIndex((v) => v > 150);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1000
     * @tc.name testSparseArrayFindLastIndex010
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const index = arr.findLastIndex((v) => v > "b");
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1100
     * @tc.name testSparseArrayFindLastIndex011
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "", "c");
        const index = arr.findLastIndex((v) => v === "");
        expect(index).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1200
     * @tc.name testSparseArrayFindLastIndex012
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        const index = arr.findLastIndex((v) => v === true);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1300
     * @tc.name testSparseArrayFindLastIndex013
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Item024>();
        arr[0] = { id: 1, name: "a" };
        arr[2] = { id: 2, name: "b" };
        const index = arr.findLastIndex((v) => v.id > 1);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1400
     * @tc.name testSparseArrayFindLastIndex014
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 2, 1);
        const index = arr.findLastIndex((v) => v === 2);
        expect(index).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1500
     * @tc.name testSparseArrayFindLastIndex015
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const index = arr.findLastIndex((v) => v > 2);
        expect(index).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1600
     * @tc.name testSparseArrayFindLastIndex016
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const index = arr.findLastIndex((v) => v > 10);
        expect(index).assertEqual(-1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1700
     * @tc.name testSparseArrayFindLastIndex017
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const index = arr.findLastIndex((v) => true);
        expect(index).assertEqual(-1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1800
     * @tc.name testSparseArrayFindLastIndex018
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(10);
        arr[5] = 100;
        arr[0] = undefined;
        const index = arr.findLastIndex((v) => v !== undefined && v > 50);
        expect(index).assertEqual(5);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_1900
     * @tc.name testSparseArrayFindLastIndex019
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 10;
        arr[2] = 30;
        arr[4] = 50;
        const index = arr.findLastIndex((v) => v > 20);
        expect(index).assertEqual(4);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2000
     * @tc.name testSparseArrayFindLastIndex020
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 10;
        arr[2] = 20;
        arr[4] = 30;
        arr[6] = 40;
        const index = arr.findLastIndex((v) => v > 25);
        expect(index).assertEqual(6);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2100
     * @tc.name testSparseArrayFindLastIndex021
     * @tc.desc findLastIndex finds last occurrence of 5 in dense array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6, 5, 3);
        const index = arr.findLastIndex((v) => v === 5);
        expect(index).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2200
     * @tc.name testSparseArrayFindLastIndex022
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const index = arr.findLastIndex((elem, index, array) => {
          return array === arr && elem === 30;
        });
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2300
     * @tc.name testSparseArrayFindLastIndex023
     * @tc.desc Test SparseArray.find Last Index error path, verify expected exception is thrown (assertFail is triggered, error.name equals "Error")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.findLastIndex((v) => {
            throw new Error("predicate error");
          });
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("Error");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2400
     * @tc.name testSparseArrayFindLastIndex024
     * @tc.desc findLastIndex returns last index of value 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 4, 3);
        const index = arr.findLastIndex((v) => v === 3);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2500
     * @tc.name testSparseArrayFindLastIndex025
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(2);
        arr[0] = 1;
        arr[1] = undefined;
        const index = arr.findLastIndex((v) => v === undefined);
        expect(index).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2600
     * @tc.name testSparseArrayFindLastIndex026
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | string>(1, "a", 3);
        const index = arr.findLastIndex((v): boolean => {
          if (typeof v === "string") {
            return false;
          }
          const n = v as number;
          return n > 2;
        });
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2700
     * @tc.name testSparseArrayFindLastIndex027
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 9999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        for (let i = 0; i < 10000; i++) {
          arr[i] = i;
        }
        const index = arr.findLastIndex((v) => v > 9990);
        expect(index).assertEqual(9999);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2800
     * @tc.name testSparseArrayFindLastIndex028
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000);
        arr[0] = 1;
        arr[999] = 999;
        const index = arr.findLastIndex((v) => v > 500);
        expect(index).assertEqual(999);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_2900
     * @tc.name testSparseArrayFindLastIndex029
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(100);
        const index = arr.findLastIndex((v) => v > 50);
        expect(index).assertEqual(-1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3000
     * @tc.name testSparseArrayFindLastIndex030
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        const index = arr.findLastIndex((v) => v > 50);
        expect(index).assertEqual(-1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3100
     * @tc.name testSparseArrayFindLastIndex031
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const index = arr.findLastIndex((v) => v === 3);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3200
     * @tc.name testSparseArrayFindLastIndex032
     * @tc.desc findLastIndex returns last index of duplicate value 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 2, 5);
        const index = arr.findLastIndex((v) => v === 2);
        expect(index).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3300
     * @tc.name testSparseArrayFindLastIndex033
     * @tc.desc findLastIndex returns last index when all elements match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 3, 3);
        const index = arr.findLastIndex((v) => v === 3);
        expect(index).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3400
     * @tc.name testSparseArrayFindLastIndex034
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const index = arr.findLastIndex((v) => v < 5);
        expect(index).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3500
     * @tc.name testSparseArrayFindLastIndex035
     * @tc.desc Test SparseArray.findLastIndex, verify method result (index equals 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 10;
        arr[2] = 20;
        arr[4] = 30;
        arr[6] = 40;
        arr[8] = 50;
        const index = arr.findLastIndex((v) => v === 40);
        expect(index).assertEqual(6);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3600
     * @tc.name testSparseArrayFindLastIndex036
     * @tc.desc findLastIndex on SparseArray<long> finds last index above threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(1 as long, 10000000000 as long, 3 as long);
        const threshold: long = 1000000000 as long;
        const index = arr.findLastIndex((v: long): boolean => v > threshold);
        expect(index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3700
     * @tc.name testSparseArrayFindLastIndex037
     * @tc.desc findLastIndex locates last null element in SparseArray<int|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 2, null);
        const index = arr.findLastIndex((v: int | null): boolean => v === null);
        expect(index).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3800
     * @tc.name testSparseArrayFindLastIndex038
     * @tc.desc findLastIndex locates last octal literal element 0o12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0o5, 0o7, 0o12);
        const index = arr.findLastIndex((v: int): boolean => v === 0o12);
        expect(index).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_3900
     * @tc.name testSparseArrayFindLastIndex039
     * @tc.desc Test SparseArray.findLastIndex error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.findLastIndex(null as SparseArrayIntFindLastIndexPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FIND_LAST_INDEX_4000
     * @tc.name testSparseArrayFindLastIndex040
     * @tc.desc Test SparseArray.findLastIndex error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFindLastIndex040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.findLastIndex(undefined as SparseArrayIntFindLastIndexPred);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

  });
}
