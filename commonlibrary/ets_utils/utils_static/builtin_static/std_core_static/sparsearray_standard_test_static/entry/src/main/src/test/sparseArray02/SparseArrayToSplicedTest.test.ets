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

export default function SparseArrayToSplicedTest(): void {
  describe('SparseArrayToSplicedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_0100
     * @tc.name testSparseArrayToSpliced001
     * @tc.desc Test SparseArray.toSpliced, verify method result (result!.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(0, 1);
        expect(result!.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_0200
     * @tc.name testSparseArrayToSpliced002
     * @tc.desc Test SparseArray.toSpliced, verify method result (result!.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(1, 1);
        expect(result!.length).assertEqual(2);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_0300
     * @tc.name testSparseArrayToSpliced003
     * @tc.desc Test SparseArray.toSpliced, verify method result (result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(1, 1, 10);
        expect(result!.length).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_0400
     * @tc.name testSparseArrayToSpliced004
     * @tc.desc Test SparseArray.toSpliced, verify method result (result!.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(1, 1, 10, 20, 30);
        expect(result!.length).assertEqual(5);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_0500
     * @tc.name testSparseArrayToSpliced005
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(1, 1);
        expect(result.toString()).assertEqual("1,3");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_0600
     * @tc.name testSparseArrayToSpliced006
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(0, 1);
        expect(result.toString()).assertEqual("2,3");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_0700
     * @tc.name testSparseArrayToSpliced007
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(100, 1, 10);
        expect(result.toString()).assertEqual("1,2,3,10");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_0800
     * @tc.name testSparseArrayToSpliced008
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.toSpliced(-2, 1, 20);
        expect(result.toString()).assertEqual("1,2,3,20,5");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_0900
     * @tc.name testSparseArrayToSpliced009
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(-1, 1);
        expect(result.toString()).assertEqual("1,2");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1000
     * @tc.name testSparseArrayToSpliced010
     * @tc.desc Test SparseArray.to Spliced error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced((null as Object as int), 1);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1100
     * @tc.name testSparseArrayToSpliced011
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(1, 0, 10, 20);
        expect(result.toString()).assertEqual("1,10,20,2,3");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1200
     * @tc.name testSparseArrayToSpliced012
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(1, -1, 10);
        expect(result.toString()).assertEqual("1,10,2,3");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1300
     * @tc.name testSparseArrayToSpliced013
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(1, 100);
        expect(result.toString()).assertEqual("1");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1400
     * @tc.name testSparseArrayToSpliced014
     * @tc.desc Test SparseArray.to Spliced error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(0, (null as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1500
     * @tc.name testSparseArrayToSpliced015
     * @tc.desc Test SparseArray.to Spliced error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.toSpliced(0, (undefined as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1600
     * @tc.name testSparseArrayToSpliced016
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.toSpliced(1, 2, 100);
        expect(result.toString()).assertEqual("1,100,4,5");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1700
     * @tc.name testSparseArrayToSpliced017
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(1, 1, 10, 20, 30);
        expect(result.toString()).assertEqual("1,10,20,30,3");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1800
     * @tc.name testSparseArrayToSpliced018
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.toSpliced(1, 1, "x", "y");
        expect(result.toString()).assertEqual("a,x,y,c");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_1900
     * @tc.name testSparseArrayToSpliced019
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string | number>(1, 2, 3);
        const result = arr.toSpliced(1, 1, "a", "b");
        expect(result.toString()).assertEqual("1,a,b,3");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2000
     * @tc.name testSparseArrayToSpliced020
     * @tc.desc Test SparseArray.toSpliced, verify method result (result!.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, 2, 3);
        const result = arr.toSpliced(1, 1, null, null);
        expect(result!.length).assertEqual(4);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2100
     * @tc.name testSparseArrayToSpliced021
     * @tc.desc Test SparseArray.toSpliced, verify method result (result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, 2, 3);
        const result = arr.toSpliced(1, 1, undefined);
        expect(result!.length).assertEqual(3);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2200
     * @tc.name testSparseArrayToSpliced022
     * @tc.desc Test SparseArray.toSpliced, verify method result (result instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.toSpliced(1, 2, 10, 20);
        expect(result instanceof SparseArray).assertTrue();
        expect(result.toString()).assertEqual("1,10,20,4,5");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2300
     * @tc.name testSparseArrayToSpliced023
     * @tc.desc Test SparseArray.toSpliced, verify method result (arr !== result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.toSpliced(1, 2, 10);
        expect(arr.toString()).assertEqual("1,2,3,4,5");
        expect(result.toString()).assertEqual("1,10,4,5");
        expect(arr !== result).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2400
     * @tc.name testSparseArrayToSpliced024
     * @tc.desc Test SparseArray.toSpliced, verify method result (result!.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(0, 3);
        expect(result!.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2500
     * @tc.name testSparseArrayToSpliced025
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const result = arr.toSpliced(0, 0, 10);
        expect(result.toString()).assertEqual("10");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2600
     * @tc.name testSparseArrayToSpliced026
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;
        arr[4] = 5;
        const result = arr.toSpliced(1, 2, 10);
        expect(result.toString()).assertEqual("1,10,,5");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2700
     * @tc.name testSparseArrayToSpliced027
     * @tc.desc Test SparseArray.toSpliced, verify method result (result instanceof SparseArray is true, result[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(1, 1);
        expect(result instanceof SparseArray).assertTrue();
        expect(result[0]).assertEqual(1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2800
     * @tc.name testSparseArrayToSpliced028
     * @tc.desc Test SparseArray.toSpliced, verify method result (typeof result[1] equals "string")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.toSpliced(1, 1, "x");
        expect(typeof result[1]).assertEqual("string");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_2900
     * @tc.name testSparseArrayToSpliced029
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(2, 10, 10);
        expect(result.toString()).assertEqual("1,2,10");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3000
     * @tc.name testSparseArrayToSpliced030
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(10, 0, 10, 20);
        expect(result.toString()).assertEqual("1,2,3,10,20");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3100
     * @tc.name testSparseArrayToSpliced031
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.toSpliced(3, 5);
        expect(result.toString()).assertEqual("1,2,3");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3200
     * @tc.name testSparseArrayToSpliced032
     * @tc.desc Test SparseArray.toSpliced, verify method result (result![0] equals 1, result[1] equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[3] = 4;
        const result = arr.toSpliced(1, 2, 10);
        expect(result![0]).assertEqual(1);
        expect(result[1]).assertEqual(10);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3300
     * @tc.name testSparseArrayToSpliced033
     * @tc.desc Test SparseArray.toSpliced, verify method result (result!.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[4] = 5;
        const result = arr.toSpliced(2, 1, 10);
        expect(result!.length).assertEqual(5);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3400
     * @tc.name testSparseArrayToSpliced034
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6);
        const result = arr.toSpliced(1, 3, 10, 20, 30, 40);
        expect(result.toString()).assertEqual("1,10,20,30,40,5,6");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3500
     * @tc.name testSparseArrayToSpliced035
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(3, 0, 4, 5);
        expect(result.toString()).assertEqual("1,2,3,4,5");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3600
     * @tc.name testSparseArrayToSpliced036
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.toSpliced(-3, 2);
        expect(result.toString()).assertEqual("1,2,5");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3700
     * @tc.name testSparseArrayToSpliced037
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.toSpliced(-2, 0, 100);
        expect(result.toString()).assertEqual("1,2,3,100,4,5");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3800
     * @tc.name testSparseArrayToSpliced038
     * @tc.desc Test SparseArray.toSpliced, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(-10, 1, 10);
        expect(result.toString()).assertEqual("10,2,3");
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_3900
     * @tc.name testSparseArrayToSpliced039
     * @tc.desc toSpliced on SparseArray<short> removes middle elements without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short, 40 as short);
        const result = arr.toSpliced(1, 2);
        expect(arr.length).assertEqual(4);
        expect(result.toString()).assertEqual("10,40");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_SPLICED_4000
     * @tc.name testSparseArrayToSpliced040
     * @tc.desc toSpliced at index 0x1 inserts value 99 without mutating source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToSpliced040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.toSpliced(0x1, 0, 99);
        expect(arr.length).assertEqual(3);
        expect(result[1]).assertEqual(99);
        expect(result[2]).assertEqual(2);
    });


  });
}
