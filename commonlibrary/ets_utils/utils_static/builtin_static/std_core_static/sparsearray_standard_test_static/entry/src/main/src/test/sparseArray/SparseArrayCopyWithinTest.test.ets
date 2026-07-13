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
export default function SparseArrayCopyWithinTest(): void {
  describe('SparseArrayCopyWithinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_0100
     * @tc.name testSparseArrayCopyWithin001
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr instanceof SparseArray is true, arr.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        expect(arr instanceof SparseArray).assertTrue();
        arr.copyWithin(0)
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_0200
     * @tc.name testSparseArrayCopyWithin002
     * @tc.desc copyWithin(2,0,2) on [3,4,5], verify index 2 receives value from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4, 5);
        arr.copyWithin(2, 0, 2);
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(4);
        expect(arr[2]).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_0300
     * @tc.name testSparseArrayCopyWithin003
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr instanceof SparseArray is true, arr[0] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        expect(arr instanceof SparseArray).assertTrue();
        arr.copyWithin(0, 2)
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(4);
        expect(arr[2]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_0400
     * @tc.name testSparseArrayCopyWithin004
     * @tc.desc copyWithin(0,3,4) on [1,2,3,4,5], verify returns this, length unchanged, arr[0]=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        expect(arr instanceof SparseArray).assertTrue()
        const originalLength = arr.length
        const result = arr.copyWithin(0, 3, 4)
        expect(result === arr).assertTrue()
        expect(arr.length === originalLength).assertTrue()
        expect(arr[0]).assertEqual(4)
        expect(arr[1]).assertEqual(2)
        expect(arr[2]).assertEqual(3)
        expect(arr[3]).assertEqual(4)
        expect(arr[4]).assertEqual(5)

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_0500
     * @tc.name testSparseArrayCopyWithin005
     * @tc.desc copyWithin on empty array: (0) and (0, MAX_INT) leave length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        expect(arr instanceof SparseArray).assertTrue()
        let result = arr.copyWithin(0)
        expect(arr.length).assertEqual(0)
        expect(result.length === 0).assertTrue()
        const arr2 = new SparseArray<int>()
        result = arr2.copyWithin(0, 2147483647)
        expect(arr2.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_0600
     * @tc.name testSparseArrayCopyWithin006
     * @tc.desc copyWithin(1,0,1) on [4,2,4], verify index 1 receives value from index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(4, 2, 4);
        arr.copyWithin(1, 0, 1);
        expect(arr[0]).assertEqual(4);
        expect(arr[1]).assertEqual(4);
        expect(arr[2]).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_0700
     * @tc.name testSparseArrayCopyWithin007
     * @tc.desc copyWithin(0,1,2) on [2,2,3], verify index 0 receives value from index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 2, 3);
        arr.copyWithin(0, 1, 2);
        expect(arr[0]).assertEqual(2);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_0800
     * @tc.name testSparseArrayCopyWithin008
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr instanceof SparseArray is true, arr[0] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        expect(arr instanceof SparseArray).assertTrue();
        arr.copyWithin(0, -2)
        expect(arr[0]).assertEqual(4);
        expect(arr[1]).assertEqual(5);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_0900
     * @tc.name testSparseArrayCopyWithin009
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr instanceof SparseArray is true, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        expect(arr instanceof SparseArray).assertTrue();
        arr.copyWithin(0, 0, -2)
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1000
     * @tc.name testSparseArrayCopyWithin010
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr instanceof SparseArray is true, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        expect(arr instanceof SparseArray).assertTrue();
        arr.copyWithin(0, 4, 2)
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1100
     * @tc.name testSparseArrayCopyWithin011
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr instanceof SparseArray is true, arr[0] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        expect(arr instanceof SparseArray).assertTrue();
        arr[0] = 1
        arr[2] = 3
        arr[4] = 5
        arr.copyWithin(0, 2, 5)
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(undefined);
        expect(arr[2]).assertEqual(5);
        expect(arr[3]).assertEqual(undefined);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1200
     * @tc.name testSparseArrayCopyWithin012
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr instanceof SparseArray is true, arr[0] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        expect(arr instanceof SparseArray).assertTrue();
        arr.copyWithin(0, 1, 4)
        expect(arr[0]).assertEqual(2);
        expect(arr[1]).assertEqual(3);
        expect(arr[2]).assertEqual(4);
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1300
     * @tc.name testSparseArrayCopyWithin013
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr instanceof SparseArray is true, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        expect(arr instanceof SparseArray).assertTrue();
        arr.copyWithin(3, 0, 3)
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(1);
        expect(arr[4]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1400
     * @tc.name testSparseArrayCopyWithin014
     * @tc.desc OOB target/start/end/MAX/MIN on [1,2,3], verify array unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(1, 2, 3)
        expect(arr instanceof SparseArray).assertTrue()
        arr.copyWithin(5, 0, 3)
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual(2)
        expect(arr[2]).assertEqual(3)
        const arr2 = new SparseArray<int>(1, 2, 3)
        arr2.copyWithin(0, 5)
        expect(arr2.length).assertEqual(3)
        expect(arr2[0]).assertEqual(1)
        expect(arr2[1]).assertEqual(2)
        expect(arr2[2]).assertEqual(3)
        const arr3 = new SparseArray<int>(1, 2, 3)
        arr3.copyWithin(0, 0, 10)
        expect(arr3.length).assertEqual(3)
        expect(arr3[0]).assertEqual(1)
        expect(arr3[1]).assertEqual(2)
        expect(arr3[2]).assertEqual(3)
        const arr4 = new SparseArray<int>(1, 2, 3)
        arr4.copyWithin(2147483647)
        expect(arr4.length).assertEqual(3)
        expect(arr4[0]).assertEqual(1)
        expect(arr4[1]).assertEqual(2)
        expect(arr4[2]).assertEqual(3)
        const arr5 = new SparseArray<int>(1, 2, 3)
        arr5.copyWithin(0, -2147483648)
        expect(arr5.length).assertEqual(3)
        expect(arr5[0]).assertEqual(1)
        expect(arr5[1]).assertEqual(2)
        expect(arr5[2]).assertEqual(3)

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1500
     * @tc.name testSparseArrayCopyWithin015
     * @tc.desc Test SparseArray.copyWithin, verify method result (result === arr is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        const result = arr.copyWithin(0, 3, 4).copyWithin(1, 0, 2)
        expect(result === arr).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1600
     * @tc.name testSparseArrayCopyWithin016
     * @tc.desc Test SparseArray.copyWithin, verify method result (result === arr is true, result.length === 42 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(42)
        const result = arr.copyWithin(0)
        expect(result === arr).assertTrue()
        expect(result.length === 42).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1700
     * @tc.name testSparseArrayCopyWithin017
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr instanceof SparseArray is true, arr.length equals 10000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000)
        expect(arr instanceof SparseArray).assertTrue();
        arr.copyWithin(0, 5000, 10000)
        expect(arr.length).assertEqual(10000);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1800
     * @tc.name testSparseArrayCopyWithin018
     * @tc.desc Test SparseArray.copy Within error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        try {
          arr.copyWithin((null as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_1900
     * @tc.name testSparseArrayCopyWithin019
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr[0] === 3 is true, arr[1] === 4 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6, 7)
        arr.copyWithin(0, 2, 5)
        expect(arr[0] === 3).assertTrue()
        expect(arr[1] === 4).assertTrue()
        expect(arr[2] === 5).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2000
     * @tc.name testSparseArrayCopyWithin020
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr[2] === 1 is true, arr[3] === 2 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        arr.copyWithin(2, 0, 4)
        expect(arr[2] === 1).assertTrue()
        expect(arr[3] === 2).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2100
     * @tc.name testSparseArrayCopyWithin021
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr[0] === 1 is true, arr[2] === 3 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 1
        arr[2] = 3
        arr[4] = 5
        arr.copyWithin(0, 0, 5)
        expect(arr[0] === 1).assertTrue()
        expect(arr[2] === 3).assertTrue()
        expect(arr[4] === 5).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2200
     * @tc.name testSparseArrayCopyWithin022
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr[2] === 4 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        arr.copyWithin(0, 3, 5)
        arr.copyWithin(2, 0, 2)
        expect(arr[2] === 4).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2300
     * @tc.name testSparseArrayCopyWithin023
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr[0] === "d" is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c", "d", "e")
        arr.copyWithin(0, 3, 4)
        expect(arr[0] === "d").assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2400
     * @tc.name testSparseArrayCopyWithin024
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr[0] === true is true, arr[1] === false is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true, false)
        arr.copyWithin(0, 2, 4)
        expect(arr[0] === true).assertTrue()
        expect(arr[1] === false).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2500
     * @tc.name testSparseArrayCopyWithin025
     * @tc.desc Test SparseArray.copyWithin, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        const original = arr.toString()
        arr.copyWithin(0, 2, 2)
        expect(arr.toString() === original).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2600
     * @tc.name testSparseArrayCopyWithin026
     * @tc.desc Test SparseArray.copyWithin, verify method result (arr[4] === 1 is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        arr.copyWithin(4, 0, 1)
        expect(arr[4] === 1).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2700
     * @tc.name testSparseArrayCopyWithin027
     * @tc.desc copyWithin on SparseArray<float> copies float range to target index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.0f, 3.0f, 4.0f);
        arr.copyWithin(0, 2, 4);
        expect(arr[0]).assertEqual(3.0f);
        expect(arr[1]).assertEqual(4.0f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2800
     * @tc.name testSparseArrayCopyWithin028
     * @tc.desc copyWithin on SparseArray<byte> copies byte range to target index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(10 as byte, 20 as byte, 30 as byte, 40 as byte);
        arr.copyWithin(0, 2, 4);
        expect(arr[0]).assertEqual(30 as byte);
        expect(arr[1]).assertEqual(40 as byte);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_2900
     * @tc.name testSparseArrayCopyWithin029
     * @tc.desc copyWithin with 0x2 target and byte -128 as start index literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testSparseArrayCopyWithin029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(130 as int);
        arr[2] = 30 as byte;
        arr[3] = 40 as byte;
        arr.copyWithin(0x0, (-128) as int, 0x4);
        expect(arr[0]).assertEqual(30 as byte);
        expect(arr[1]).assertEqual(40 as byte);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_3000
     * @tc.name testSparseArrayCopyWithin030
     * @tc.desc copyWithin uses 0x7F and 0x80 as int start/end index literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6, 7, 8);
        arr.copyWithin(0, 0x7F as int, 0x80 as int);
        expect(arr[0]).assertEqual(1);
        expect(arr[7]).assertEqual(8);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_3100
     * @tc.name testSparseArrayCopyWithin031
     * @tc.desc copyWithin with target index -1 copies from start index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        arr.copyWithin(-1, 0, 1);
        expect(arr[2]).assertEqual(10);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_3200
     * @tc.name testSparseArrayCopyWithin032
     * @tc.desc copyWithin throws ClassCastError when target is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.copyWithin((undefined as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_3300
     * @tc.name testSparseArrayCopyWithin033
     * @tc.desc copyWithin throws ClassCastError when target is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.copyWithin(("1" as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_3400
     * @tc.name testSparseArrayCopyWithin034
     * @tc.desc copyWithin throws ClassCastError when start is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.copyWithin(0, (null as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_3500
     * @tc.name testSparseArrayCopyWithin035
     * @tc.desc copyWithin throws ClassCastError when start is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.copyWithin(0, (undefined as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_3600
     * @tc.name testSparseArrayCopyWithin036
     * @tc.desc copyWithin throws ClassCastError when end is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.copyWithin(0, 1, (null as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_COPY_WITHIN_3700
     * @tc.name testSparseArrayCopyWithin037
     * @tc.desc copyWithin throws ClassCastError when end is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayCopyWithin037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.copyWithin(0, 1, ("2" as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

  });
}
