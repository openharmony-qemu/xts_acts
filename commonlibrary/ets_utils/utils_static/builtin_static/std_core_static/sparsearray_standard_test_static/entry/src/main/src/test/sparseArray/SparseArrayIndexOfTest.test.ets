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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';


class Person037 {
    name: string;
    constructor(name: string) {
      this.name = name;
    }
  }

export default function SparseArrayIndexOfTest(): void {
  describe('SparseArrayIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_0100
     * @tc.name testSparseArrayIndexOf001
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 10;
        arr[2] = 20;
        const index = arr.indexOf(20);
        expect(index).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_0200
     * @tc.name testSparseArrayIndexOf002
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 10;
        arr[2] = 20;
        const index = arr.indexOf(20, 1);
        expect(index).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_0300
     * @tc.name testSparseArrayIndexOf003
     * @tc.desc Test SparseArray.indexOf, verify result equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 5, 9);
      const result = arr.indexOf(7);
      expect(result).assertEqual(-1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_0400
     * @tc.name testSparseArrayIndexOf004
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = -2147483648;
        const index = arr.indexOf(-2147483648);
        expect(index).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_0500
     * @tc.name testSparseArrayIndexOf005
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>();
        arr[0] = null;
        const index = arr.indexOf(null);
        expect(index).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_0600
     * @tc.name testSparseArrayIndexOf006
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>();
        arr[0] = undefined;
        const index = arr.indexOf(undefined);
        expect(index).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_0700
     * @tc.name testSparseArrayIndexOf007
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 10;
        arr[2] = 20;
        arr[4] = 20;
        const index = arr.indexOf(20);
        expect(index).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_0800
     * @tc.name testSparseArrayIndexOf008
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const index = arr.indexOf(10);
        expect(index).assertEqual(-1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_0900
     * @tc.name testSparseArrayIndexOf009
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        const index = arr.indexOf(10);
        expect(index).assertEqual(-1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1000
     * @tc.name testSparseArrayIndexOf010
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[4] = 20;
        const index = arr.indexOf(20);
        expect(index).assertEqual(4);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1100
     * @tc.name testSparseArrayIndexOf011
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[4] = 20;
        const index = arr.indexOf(20, 2);
        expect(index).assertEqual(4);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1200
     * @tc.name testSparseArrayIndexOf012
     * @tc.desc Test SparseArray.indexOf, verify result equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 5, 9, 2);
      const result = arr.indexOf(2);
      expect(result).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1300
     * @tc.name testSparseArrayIndexOf013
     * @tc.desc Test SparseArray.indexOf, verify result equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 5, 9, 2);
      const result = arr.indexOf(2, 1);
      expect(result).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1400
     * @tc.name testSparseArrayIndexOf014
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[9] = 100;
        const index = arr.indexOf(100);
        expect(index).assertEqual(9);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1500
     * @tc.name testSparseArrayIndexOf015
     * @tc.desc indexOf at index 0 returns integer index and preserves arr[0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 10;
        const index = arr.indexOf(10);
        expect(index).assertEqual(0);
        expect(Number.isInteger(index)).assertTrue();
        expect(arr[0]).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1600
     * @tc.name testSparseArrayIndexOf016
     * @tc.desc Test SparseArray.indexOf, verify result equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(42);
        const result = arr.indexOf(42);
        expect(result).assertEqual(-1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1700
     * @tc.name testSparseArrayIndexOf017
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Array<int>>();
        arr[0] = [1, 2, 3];
        const index = arr.indexOf([1, 2, 3]);
        expect(index).assertEqual(-1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1800
     * @tc.name testSparseArrayIndexOf018
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Person037>();
        const p = new Person037("Alice");
        arr[0] = p;
        const index = arr.indexOf(p);
        expect(index).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_1900
     * @tc.name testSparseArrayIndexOf019
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>();
        arr[0] = Double.NaN;
        const index = arr.indexOf(Double.NaN);
        expect(index).assertEqual(-1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2000
     * @tc.name testSparseArrayIndexOf020
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>();
        arr[0] = Double.POSITIVE_INFINITY;
        const index = arr.indexOf(Double.POSITIVE_INFINITY);
        expect(index).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2100
     * @tc.name testSparseArrayIndexOf021
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>();
        arr[0] = Double.NEGATIVE_INFINITY;
        const index = arr.indexOf(Double.NEGATIVE_INFINITY);
        expect(index).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2200
     * @tc.name testSparseArrayIndexOf022
     * @tc.desc Test SparseArray.indexOf, verify method result (index1 equals 0, index2 equals 999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000);
        arr[0] = 10;
        arr[999] = 20;
        const index1 = arr.indexOf(10);
        const index2 = arr.indexOf(20);
        expect(index1).assertEqual(0);
        expect(index2).assertEqual(999);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2300
     * @tc.name testSparseArrayIndexOf023
     * @tc.desc Test SparseArray.indexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3);
        arr[0] = 10;
        const index = arr.indexOf(10, -3);
        expect(index).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2400
     * @tc.name testSparseArrayIndexOf024
     * @tc.desc Test SparseArray.indexOf, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string | boolean>();
        arr[0] = 10;
        arr[2] = "hello";
        arr[4] = true;
        expect(arr.indexOf(10, 0)).assertEqual(0);
        expect(arr.indexOf("hello", 1)).assertEqual(2);
        expect(arr.indexOf(true, 3)).assertEqual(4);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2500
     * @tc.name testSparseArrayIndexOf025
     * @tc.desc indexOf long element in SparseArray<long>, verify matched index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>();
        const target: long = 10000000000 as long;
        arr.$_set(0, 1 as long);
        arr.$_set(3, target);
        expect(arr.indexOf(target)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2600
     * @tc.name testSparseArrayIndexOf026
     * @tc.desc indexOf float element in SparseArray<float>, verify matched index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
        expect(arr.indexOf(2.5f)).assertEqual(1);
        expect(arr.indexOf(9.9f)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2700
     * @tc.name testSparseArrayIndexOf027
     * @tc.desc indexOf float NaN in SparseArray<float> returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const nan = Double.toFloat(Double.NaN);
        const arr = new SparseArray<float>();
        arr.$_set(0, nan);
        expect(arr.indexOf(nan)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2800
     * @tc.name testSparseArrayIndexOf028
     * @tc.desc indexOf finds int element stored as hex literal 0x123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 0x123;
        expect(arr.indexOf(0x123)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_2900
     * @tc.name testSparseArrayIndexOf029
     * @tc.desc indexOf finds decimal-format string element "0x123" not hex int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const token = "0x123";
        const arr = new SparseArray<string>("other", token);
        expect(arr.indexOf(token)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_3000
     * @tc.name testSparseArrayIndexOf030
     * @tc.desc indexOf locates zero-width space string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zw = "\u200B";
        const arr = new SparseArray<string>("a", zw, "c");
        expect(arr.indexOf(zw)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_3100
     * @tc.name testSparseArrayIndexOf031
     * @tc.desc indexOf finds false element in SparseArray<boolean> with fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        expect(arr.indexOf(false, 1)).assertEqual(1);
        expect(arr.indexOf(false, 2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_3200
     * @tc.name testSparseArrayIndexOf032
     * @tc.desc indexOf finds char element after sparse hole
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(5);
        arr[1] = c'A';
        arr[4] = c'Z';
        expect(arr.indexOf(c'Z')).assertEqual(4);
        expect(arr.indexOf(c'A', 2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_3300
     * @tc.name testSparseArrayIndexOf033
     * @tc.desc indexOf finds explicitly stored undefined but skips later holes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(4);
        arr[1] = undefined;
        expect(arr.indexOf(undefined)).assertEqual(1);
        expect(arr.indexOf(undefined, 2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INDEX_OF_3400
     * @tc.name testSparseArrayIndexOf034
     * @tc.desc indexOf with fromIndex beyond length returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIndexOf034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 1);
        expect(arr.indexOf(1, 3)).assertEqual(-1);
        expect(arr.indexOf(2, 100)).assertEqual(-1);
    });
  });
}
