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

class LastIndexOf2Name {
  name: string;
  constructor(name: string) {
    this.name = name;
  }
}

class LastIndexOf2Id {
  id: int;
  constructor(id: int) {
    this.id = id;
  }
}

export default function SparseArrayLastIndexOf2Test(): void {
  describe('SparseArrayLastIndexOf2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0001
     * @tc.name testSparseArrayLastIndexOf001
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr[0] = 2147483647
        arr[2] = 2147483647
        const result = arr.lastIndexOf(2147483647)
        expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0002
     * @tc.name testSparseArrayLastIndexOf002
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        const result = arr.lastIndexOf(5)
        expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0003
     * @tc.name testSparseArrayLastIndexOf003
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr[0] = 2
        arr[2] = 9
        arr[3] = 2
        const result = arr.lastIndexOf(2)
        expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0004
     * @tc.name testSparseArrayLastIndexOf004
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(42);
      const result = arr.lastIndexOf(42);
      expect(result).assertEqual(-1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0005
     * @tc.name testSparseArrayLastIndexOf005
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<string>("a", "b", "a");
      const result = arr.lastIndexOf("a", 1);
      expect(result).assertEqual(0);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0006
     * @tc.name testSparseArrayLastIndexOf006
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        const result = arr.lastIndexOf(1)
        expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0007
     * @tc.name testSparseArrayLastIndexOf007
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(100)
        const result = arr.lastIndexOf(100)
        expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0008
     * @tc.name testSparseArrayLastIndexOf008
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(false, true, false)
        const result = arr.lastIndexOf(false)
        expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0009
     * @tc.name testSparseArrayLastIndexOf009
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result >= 0 && result < arr.length is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 2)
        const result = arr.lastIndexOf(2)
        expect(result >= 0 && result < arr.length).assertTrue()
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0010
     * @tc.name testSparseArrayLastIndexOf010
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result1 equals result2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 5, 9, 2)
        const result1 = arr.lastIndexOf(2)
        const result2 = arr.lastIndexOf(2, 3)
        expect(result1).assertEqual(result2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0011
     * @tc.name testSparseArrayLastIndexOf011
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 5, 9, 2)
        const result = arr.lastIndexOf(2, undefined)
        expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0012
     * @tc.name testSparseArrayLastIndexOf012
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "a")
        const result = arr.lastIndexOf("a", 2)
        expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0013
     * @tc.name testSparseArrayLastIndexOf013
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true)
        const result = arr.lastIndexOf(true, 2)
        expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0014
     * @tc.name testSparseArrayLastIndexOf014
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1.5, 2.5, 1.5)
        const result = arr.lastIndexOf(1.5, 2)
        expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0015
     * @tc.name testSparseArrayLastIndexOf015
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const obj = new LastIndexOf2Id(1)
        const arr = new SparseArray<LastIndexOf2Id>(obj, new LastIndexOf2Id(2), obj)
        const result = arr.lastIndexOf(obj, 2)
        expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0016
     * @tc.name testSparseArrayLastIndexOf016
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "a", 2, "a")
        const result = arr.lastIndexOf("a", 3)
        expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0017
     * @tc.name testSparseArrayLastIndexOf017
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(null, 1, null)
        const result = arr.lastIndexOf(null, 2)
        expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0018
     * @tc.name testSparseArrayLastIndexOf018
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(undefined, 1, undefined)
        const result = arr.lastIndexOf(undefined, 2)
        expect(result).assertEqual(2)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0019
     * @tc.name testSparseArrayLastIndexOf019
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (first equals 0, last equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 1, 2, 1)
        const first = arr.indexOf(1)
        const last = arr.lastIndexOf(1)
        expect(first).assertEqual(0)
        expect(last).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0020
     * @tc.name testSparseArrayLastIndexOf020
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 995)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        for (let i = 0; i < 1000; i++) {
          arr[i] = i % 10
        }
        const result = arr.lastIndexOf(5)
        expect(result).assertEqual(995)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0021
     * @tc.name testSparseArrayLastIndexOf021
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 495)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        for (let i = 0; i < 1000; i++) {
          arr[i] = i % 10
        }
        const result = arr.lastIndexOf(5, 500)
        expect(result).assertEqual(495)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0022
     * @tc.name testSparseArrayLastIndexOf022
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 9999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000)
        arr[0] = 1
        arr[9999] = 1
        const result = arr.lastIndexOf(1)
        expect(result).assertEqual(9999)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0023
     * @tc.name testSparseArrayLastIndexOf023
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 1000000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr[1000000] = 42
        const result = arr.lastIndexOf(42, 1000000)
        expect(result).assertEqual(1000000)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0024
     * @tc.name testSparseArrayLastIndexOf024
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr[0] = 2
        arr[2] = 5
        arr[3] = 9
        arr[5] = 2
        const result = arr.lastIndexOf(2, 4)
        expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0025
     * @tc.name testSparseArrayLastIndexOf025
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>()
        arr[0] = 1
        arr[2] = "a"
        arr[4] = 1
        const result = arr.lastIndexOf(1, 3)
        expect(result).assertEqual(0)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0026
     * @tc.name testSparseArrayLastIndexOf026
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        const result = arr.lastIndexOf(1, 0)
        expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0027
     * @tc.name testSparseArrayLastIndexOf027
     * @tc.desc Test SparseArray.lastIndexOf, verify method result (result equals -1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(100)
        const result = arr.lastIndexOf(100, 0)
        expect(result).assertEqual(-1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0028
     * @tc.name testSparseArrayLastIndexOf028
     * @tc.desc lastIndexOf float element with fromIndex in SparseArray<float>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f, 1.0f, 3.0f);
        const index = arr.lastIndexOf(1.0f, 2);
        expect(index).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0029
     * @tc.name testSparseArrayLastIndexOf029
     * @tc.desc lastIndexOf finds last null element in SparseArray<int|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3, null);
        expect(arr.lastIndexOf(null)).assertEqual(3);
        expect(arr.lastIndexOf(null, 2)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LAST_INDEX_OF_2_0030
     * @tc.name testSparseArrayLastIndexOf030
     * @tc.desc lastIndexOf finds last hex literal 0xFF element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLastIndexOf030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0xFF, 1, 0xFF);
        expect(arr.lastIndexOf(0xFF)).assertEqual(2);
    });

  });
}