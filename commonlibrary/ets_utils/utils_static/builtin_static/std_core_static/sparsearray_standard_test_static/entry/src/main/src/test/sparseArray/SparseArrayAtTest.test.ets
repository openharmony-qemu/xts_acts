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

class Person039 {
    name: string = "";
    age: int = 0;
}

export default function SparseArrayAtTest(): void {
  describe('SparseArrayAtTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_0100
     * @tc.name testSparseArrayAt001
     * @tc.desc Test SparseArray.at, verify method result (result equals 1, arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.at(0);
        expect(result).assertEqual(1);
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_0200
     * @tc.name testSparseArrayAt002
     * @tc.desc Test SparseArray.at, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.at(1);
        expect(result).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_0300
     * @tc.name testSparseArrayAt003
     * @tc.desc at(0) on [4,5,3], verify returns first element 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4, 5, 3);
        const result = arr.at(0);
        expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_0400
     * @tc.name testSparseArrayAt004
     * @tc.desc Test SparseArray.at, verify method result (result equals 3, arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.at(2);
        expect(result).assertEqual(3);
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_0500
     * @tc.name testSparseArrayAt005
     * @tc.desc Test SparseArray.at, verify method result (result equals undefined, arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1);
        const result = arr.at(2147483647);
        expect(result).assertEqual(undefined);
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_0600
     * @tc.name testSparseArrayAt006
     * @tc.desc Test SparseArray.at, verify method result (result equals undefined, arr instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1);
        const result = arr.at(-2147483648);
        expect(result).assertEqual(undefined);
        expect(arr instanceof SparseArray).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_0700
     * @tc.name testSparseArrayAt007
     * @tc.desc Test SparseArray.at, verify method result (result equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.at(-1);
        expect(result).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_0800
     * @tc.name testSparseArrayAt008
     * @tc.desc Test SparseArray.at, verify method result (result equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.at(-2);
        expect(result).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_0900
     * @tc.name testSparseArrayAt009
     * @tc.desc Test SparseArray.at error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.at((null as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1000
     * @tc.name testSparseArrayAt010
     * @tc.desc Test SparseArray.at error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.at((undefined as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1100
     * @tc.name testSparseArrayAt011
     * @tc.desc Test SparseArray.at error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.at(("" as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1200
     * @tc.name testSparseArrayAt012
     * @tc.desc Test SparseArray.at error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try { 
          arr.at((1.5 as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1300
     * @tc.name testSparseArrayAt013
     * @tc.desc Test SparseArray.at error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.at((4294967296 as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1400
     * @tc.name testSparseArrayAt014
     * @tc.desc at(1) on [1,6,5], verify returns middle element 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 6, 5);
        const result = arr.at(1);
        expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1500
     * @tc.name testSparseArrayAt015
     * @tc.desc at(0) on [2,2,3], verify returns first element 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 2, 3);
        const result = arr.at(0);
        expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1600
     * @tc.name testSparseArrayAt016
     * @tc.desc Test SparseArray.at, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3);
        arr.push(10, 20, 30);
        const result = arr.at(0);
        expect(result).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1700
     * @tc.name testSparseArrayAt017
     * @tc.desc Test SparseArray.at, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.at(10);
        expect(result).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1800
     * @tc.name testSparseArrayAt018
     * @tc.desc Test SparseArray.at, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, 2, undefined);
        const result = arr.at(2);
        expect(result).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_1900
     * @tc.name testSparseArrayAt019
     * @tc.desc Test SparseArray.at, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const result = arr.at(0);
        expect(result).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2000
     * @tc.name testSparseArrayAt020
     * @tc.desc Test SparseArray.at, verify method result (result equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.at(2);
        expect(result).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2100
     * @tc.name testSparseArrayAt021
     * @tc.desc Test SparseArray.at, verify method result (result equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.at(-3);
        expect(result).assertEqual(1);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2200
     * @tc.name testSparseArrayAt022
     * @tc.desc Test SparseArray.at, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.at(-10);
        expect(result).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2300
     * @tc.name testSparseArrayAt023
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result: int | undefined = arr.at(1);
        expect(result).assertEqual(2);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2400
     * @tc.name testSparseArrayAt024
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const strArr = new SparseArray<string>("a", "b", "c");
        const strResult = strArr.at(0);
        expect(strResult).assertEqual("a");

        const boolArr = new SparseArray<boolean>(true, false);
        const boolResult = boolArr.at(0);
        expect(boolResult).assertTrue();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2500
     * @tc.name testSparseArrayAt025
     * @tc.desc Test SparseArray.at error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.at(("1" as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2600
     * @tc.name testSparseArrayAt026
     * @tc.desc Test SparseArray.at error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.at((true as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2700
     * @tc.name testSparseArrayAt027
     * @tc.desc Test SparseArray.at error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.at(({} as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2800
     * @tc.name testSparseArrayAt028
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[4] = 50;
        expect(arr.at(1)).assertEqual(undefined);
        expect(arr.at(2)).assertEqual(undefined);
        expect(arr.at(3)).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_2900
     * @tc.name testSparseArrayAt029
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4);
        arr[0] = 10;
        arr[2] = 30;
        expect(arr.at(1)).assertEqual(undefined);
        expect(arr.at(3)).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3000
     * @tc.name testSparseArrayAt030
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 10;
        arr[5] = 50;
        expect(arr.at(5)).assertEqual(50);
        expect(arr.at(6)).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3100
     * @tc.name testSparseArrayAt031
     * @tc.desc Test SparseArray.at, verify method result (result equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3);
        arr.push(10, 20);
        const result = arr.at(-3);
        expect(result).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3200
     * @tc.name testSparseArrayAt032
     * @tc.desc Test SparseArray.at, verify method result (result1 equals result2, result2 equals result3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result1 = arr.at(1);
        const result2 = arr.at(1);
        const result3 = arr.at(1);
        expect(result1).assertEqual(result2);
        expect(result2).assertEqual(result3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3300
     * @tc.name testSparseArrayAt033
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr.at(0)).assertEqual(1);
        expect(arr.at(1)).assertEqual(2);
        expect(arr.at(2)).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3400
     * @tc.name testSparseArrayAt034
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr.at(0)).assertEqual(1);
        expect(arr.at(-1)).assertEqual(5);
        expect(arr.at(2)).assertEqual(3);
        expect(arr.at(-3)).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3500
     * @tc.name testSparseArrayAt035
     * @tc.desc Test SparseArray.at, verify method result (arr.length equals 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3);
        arr.push(10, 20, 30);
        expect(arr.length).assertEqual(6);
        expect(arr.at(0)).assertUndefined();
        expect(arr.at(3)).assertEqual(10);
        expect(arr.at(4)).assertEqual(20);
        expect(arr.at(5)).assertEqual(30);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3600
     * @tc.name testSparseArrayAt036
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        expect(arr.at(0)).assertEqual("a");
        expect(arr.at(-1)).assertEqual("c");
        expect(arr.at(10)).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3700
     * @tc.name testSparseArrayAt037
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        expect(arr.at(0)).assertEqual(true);
        expect(arr.at(1)).assertEqual(false);
        expect(arr.at(-1)).assertEqual(true);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3800
     * @tc.name testSparseArrayAt038
     * @tc.desc Test SparseArray.at, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "hello", 3);
        expect(arr.at(0)).assertEqual(1);
        expect(arr.at(1)).assertEqual("hello");
        expect(arr.at(2)).assertEqual(3);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_3900
     * @tc.name testSparseArrayAt039
     * @tc.desc Test SparseArray.at, verify method result (result !== null && result !== undefined is true, result!.name equals "Alice")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person039>();
        const p1 = new Person039();
        p1.name = "Alice";
        p1.age = 25;
        const p2 = new Person039();
        p2.name = "Bob";
        p2.age = 30;
        arr.push(p1, p2);
        const result = arr.at(0);
        expect(result !== null && result !== undefined).assertTrue();
        expect(result!.name).assertEqual("Alice");
        expect(result!.age).assertEqual(25);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_4000
     * @tc.name testSparseArrayAt040
     * @tc.desc Test SparseArray.at, verify method result (arr.length equals 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(42);
        expect(arr.length).assertEqual(42);
        expect(arr.at(0)).assertUndefined();
        expect(arr.at(-1)).assertUndefined();
        expect(arr.at(1)).assertUndefined();
        expect(arr.at(-2)).assertUndefined();
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_4100
     * @tc.name testSparseArrayAt041
     * @tc.desc Test SparseArray.at, verify method result (result equals 999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[1000] = 999;
        const result = arr.at(1000);
        expect(result).assertEqual(999);
        expect(arr.at(999)).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_4200
     * @tc.name testSparseArrayAt042
     * @tc.desc Test SparseArray.at, verify method result (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        expect(arr.length).assertEqual(0);
        expect(arr.at(0)).assertEqual(undefined);
        expect(arr.at(-1)).assertEqual(undefined);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_4300
     * @tc.name testSparseArrayAt043
     * @tc.desc at short element index 0, verify short boundary value returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>();
        arr.$_set(0, 32767 as short);
        expect(arr.at(0)).assertEqual(32767 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_4400
     * @tc.name testSparseArrayAt044
     * @tc.desc at float element index 1, verify float value returned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 3.14f, 2.0f);
        expect(arr.at(1)).assertEqual(3.14f);
        expect(arr.at(-1)).assertEqual(2.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_4500
     * @tc.name testSparseArrayAt045
     * @tc.desc at(0x7) and at(0b111) read elements at hex and binary indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 2, 3, 4, 5, 6, 7);
        expect(arr.at(0x7)).assertEqual(7);
        expect(arr.at(0b111)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_4600
     * @tc.name testSparseArrayAt046
     * @tc.desc at with overflow index literal 2147483648 wraps per int rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const overflowIndex: int = (2147483647 as int + 1 as int) as int;
        expect(arr.at(overflowIndex)).assertEqual(undefined);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_4700
     * @tc.name testSparseArrayAt047
     * @tc.desc at returns null element at index 1 in SparseArray<int|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3);
        expect(arr.at(1)).assertEqual(null);
        expect(arr.at(0o5 - 0o5)).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_AT_4800
     * @tc.name testSparseArrayAt048
     * @tc.desc at(-1) on string SparseArray returns last empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayAt048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "");
        expect(arr.at(-1)).assertEqual("");
    });

  });
}
