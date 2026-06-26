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

class LastIndexOfName {
  name: string;
  constructor(name: string) {
    this.name = name;
  }
}

class LastIndexOfIdBox {
  id: int;
  constructor(id: int) {
    this.id = id;
  }
}

export default function SparseArrayLastIndexOfTest(): void {
  describe('SparseArrayLastIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0001
     * @tc.name testSparseArrayLastIndexOf001
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const index = arr.lastIndexOf(2);
        expect(index).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0002
     * @tc.name testSparseArrayLastIndexOf002
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 2, 4);
        const index = arr.lastIndexOf(2);
        expect(index).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0003
     * @tc.name testSparseArrayLastIndexOf003
     * @tc.desc Test SparseArray.lastIndexOf, verify result equals -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 5, 9);
      const result = arr.lastIndexOf(7);
      expect(result).assertEqual(-1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0004
     * @tc.name testSparseArrayLastIndexOf004
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 2147483647;
        const index = arr.lastIndexOf(2147483647);
        expect(index).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0005
     * @tc.name testSparseArrayLastIndexOf005
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-1, -2, -3);
        const index = arr.lastIndexOf(-2);
        expect(index).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0006
     * @tc.name testSparseArrayLastIndexOf006
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 2);
        const index = arr.lastIndexOf(0);
        expect(index).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0007
     * @tc.name testSparseArrayLastIndexOf007
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const index = arr.lastIndexOf("b");
        expect(index).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0008
     * @tc.name testSparseArrayLastIndexOf008
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("", "a", "");
        const index = arr.lastIndexOf("");
        expect(index).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0009
     * @tc.name testSparseArrayLastIndexOf009
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const obj1 = new LastIndexOfName("test");
        const obj2 = new LastIndexOfName("test");
        const arr = new SparseArray<LastIndexOfName>(obj1, obj2);
        const index = arr.lastIndexOf(obj1);
        expect(index).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0010
     * @tc.name testSparseArrayLastIndexOf010
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(undefined, 1, undefined);
        const index = arr.lastIndexOf(undefined);
        expect(index).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0011
     * @tc.name testSparseArrayLastIndexOf011
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 2);
        const index = arr.lastIndexOf(2);
        expect(index).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0012
     * @tc.name testSparseArrayLastIndexOf012
     * @tc.desc lastIndexOf on capacity-only SparseArray(int) returns -1 for 100 and 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr100 = new SparseArray<int>(100);
        expect(arr100.lastIndexOf(100)).assertEqual(-1);
        const arr42 = new SparseArray<int>(42);
        expect(arr42.lastIndexOf(42)).assertEqual(-1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0013
     * @tc.name testSparseArrayLastIndexOf013
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 5, 5, 5);
        const index = arr.lastIndexOf(5);
        expect(index).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0014
     * @tc.name testSparseArrayLastIndexOf014
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const index = arr.lastIndexOf(999);
        expect(index).assertEqual(-1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0015
     * @tc.name testSparseArrayLastIndexOf015
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const index = arr.lastIndexOf(1);
        expect(index).assertEqual(-1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0016
     * @tc.name testSparseArrayLastIndexOf016
     * @tc.desc Test SparseArray.lastIndexOf, verify result equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 5, 9, 2);
      const result = arr.lastIndexOf(2, 2);
      expect(result).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0017
     * @tc.name testSparseArrayLastIndexOf017
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(false, true);
        const index = arr.lastIndexOf(false);
        expect(index).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0018
     * @tc.name testSparseArrayLastIndexOf018
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const index = arr.lastIndexOf(10);
        expect(index).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0019
     * @tc.name testSparseArrayLastIndexOf019
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const index = arr.lastIndexOf(30);
        expect(index).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0020
     * @tc.name testSparseArrayLastIndexOf020
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        arr[0] = 10;
        arr[2] = 20;
        arr[4] = 30;
        const index = arr.lastIndexOf(20);
        expect(index).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0021
     * @tc.name testSparseArrayLastIndexOf021
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 1;
        arr[2] = 2;
        const index = arr.lastIndexOf(1);
        expect(index).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0022
     * @tc.name testSparseArrayLastIndexOf022
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 1, 2, 1);
        const index = arr.lastIndexOf(1);
        expect(index).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0023
     * @tc.name testSparseArrayLastIndexOf023
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 1;
        arr[2] = 1;
        arr[4] = 1;
        const index = arr.lastIndexOf(1);
        expect(index).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0024
     * @tc.name testSparseArrayLastIndexOf024
     * @tc.desc Test SparseArray.lastIndexOf, verify result equals 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(2, 5, 9, 2);
      const result = arr.lastIndexOf(2);
      expect(result).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0025
     * @tc.name testSparseArrayLastIndexOf025
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("x", "y", "z");
        const index = arr.lastIndexOf("y");
        expect(index).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0026
     * @tc.name testSparseArrayLastIndexOf026
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "a", 2, "a");
        const index = arr.lastIndexOf("a");
        expect(index).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0027
     * @tc.name testSparseArrayLastIndexOf027
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const obj = new LastIndexOfIdBox(1);
        const arr = new SparseArray<LastIndexOfIdBox>(new LastIndexOfIdBox(0), obj);
        const index = arr.lastIndexOf(obj);
        expect(index).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0028
     * @tc.name testSparseArrayLastIndexOf028
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 995)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr[i] = i % 10;
        }
        const index = arr.lastIndexOf(5);
        expect(index).assertEqual(995);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0029
     * @tc.name testSparseArrayLastIndexOf029
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (index equals 9999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        arr[0] = 1;
        arr[9999] = 1;
        const index = arr.lastIndexOf(1);
        expect(index).assertEqual(9999);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0030
     * @tc.name testSparseArrayLastIndexOf030
     * @tc.desc lastIndexOf byte element returns last matching index in SparseArray<byte>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(10 as byte, 20 as byte, 10 as byte);
        const index = arr.lastIndexOf(10 as byte);
        expect(index).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0031
     * @tc.name testSparseArrayLastIndexOf031
     * @tc.desc lastIndexOf null element with fromIndex in SparseArray<string|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string | null>("a", null, "b", null);
        expect(arr.lastIndexOf(null)).assertEqual(3);
        expect(arr.lastIndexOf(null, 2)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0032
     * @tc.name testSparseArrayLastIndexOf032
     * @tc.desc lastIndexOf locates octal literal element 0o5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 0o5, 3);
        expect(arr.lastIndexOf(0o5)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0033
     * @tc.name testSparseArrayLastIndexOf033
     * @tc.desc Compare one-argument and two-argument lastIndexOf on repeated int elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 2, 4);
        expect(arr.lastIndexOf(2)).assertEqual(3);
        expect(arr.lastIndexOf(2, 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0034
     * @tc.name testSparseArrayLastIndexOf034
     * @tc.desc Compare one-argument and two-argument lastIndexOf when fromIndex is the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 2);
        expect(arr.lastIndexOf(2)).assertEqual(3);
        expect(arr.lastIndexOf(2, 3)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0035
     * @tc.name testSparseArrayLastIndexOf035
     * @tc.desc Compare one-argument and two-argument lastIndexOf when fromIndex is 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 2, 9, 2);
        expect(arr.lastIndexOf(2)).assertEqual(3);
        expect(arr.lastIndexOf(2, 0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0036
     * @tc.name testSparseArrayLastIndexOf036
     * @tc.desc Compare one-argument and two-argument lastIndexOf on sparse int elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(8);
        arr[0] = 7;
        arr[3] = 7;
        arr[6] = 7;
        expect(arr.lastIndexOf(7)).assertEqual(6);
        expect(arr.lastIndexOf(7, 4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0037
     * @tc.name testSparseArrayLastIndexOf037
     * @tc.desc Compare one-argument and two-argument lastIndexOf on repeated string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("x", "y", "x", "z", "x");
        expect(arr.lastIndexOf("x")).assertEqual(4);
        expect(arr.lastIndexOf("x", 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_0038
     * @tc.name testSparseArrayLastIndexOf038
     * @tc.desc Compare one-argument and two-argument lastIndexOf on repeated object references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const target = new LastIndexOfIdBox(7);
        const arr = new SparseArray<LastIndexOfIdBox>(target, new LastIndexOfIdBox(8), target);
        expect(arr.lastIndexOf(target)).assertEqual(2);
        expect(arr.lastIndexOf(target, 1)).assertEqual(0);
    });

  });
}
