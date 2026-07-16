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

export default function SparseArraySplice2Test(): void {
  describe('SparseArraySplice2Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_0100
     * @tc.name testSparseArraySplice001
     * @tc.desc Test SparseArray.splice, verify method result (arr.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        arr.splice(1)
        expect(arr.length).assertEqual(1)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_0200
     * @tc.name testSparseArraySplice002
     * @tc.desc splice(0) on [10,20,30], verify all deleted, arr empty, return type is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(10, 20, 30)
        const deleted = arr.splice(0)
        expect(deleted.length).assertEqual(3)
        expect(deleted[0]).assertEqual(10)
        expect(arr.length).assertEqual(0)
        expect(typeof deleted).assertEqual("object")
        expect(deleted !== null && deleted !== undefined).assertTrue()

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_0300
     * @tc.name testSparseArraySplice003
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30, 40, 50)
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(-2)
        expect(deleted.length).assertEqual(2)
        expect(deleted[0]).assertEqual(40)
        expect(deleted[1]).assertEqual(50)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_0400
     * @tc.name testSparseArraySplice004
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(2147483647)
        expect(deleted.length).assertEqual(0)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_0500
     * @tc.name testSparseArraySplice005
     * @tc.desc Test SparseArray.splice, verify method result (deleted.length equals 0, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        const deleted = arr.splice(3)
        expect(deleted.length).assertEqual(0)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_0600
     * @tc.name testSparseArraySplice006
     * @tc.desc Test SparseArray.splice error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        try {
          arr.splice((null as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_0700
     * @tc.name testSparseArraySplice007
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice((2147483647 + 1) as int)
        expect(deleted instanceof SparseArray).assertTrue();
        expect(deleted.length).assertEqual(3);
        expect(deleted[0]).assertEqual(10);
        expect(deleted[1]).assertEqual(20);
        expect(deleted[2]).assertEqual(30);
        expect(arr.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_0800
     * @tc.name testSparseArraySplice008
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice((-2147483648 - 1) as int)
        expect(deleted instanceof SparseArray).assertTrue();
        expect(deleted.length).assertEqual(0);
        expect(arr.length).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_0900
     * @tc.name testSparseArraySplice009
     * @tc.desc Test SparseArray.splice, verify deleted.length equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const deleted = arr.splice(10, 1);
        expect(deleted.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1000
     * @tc.name testSparseArraySplice010
     * @tc.desc Test SparseArray.splice, verify method result (deleted.length equals 0, deleted instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        const deleted = arr.splice(5)
        expect(deleted.length).assertEqual(0)
        expect(deleted instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1100
     * @tc.name testSparseArraySplice011
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6)
        expect(arr instanceof SparseArray).assertTrue();
        arr[2] = 10
        arr[4] = 20
        const deleted = arr.splice(1)
        expect(deleted.length).assertEqual(5)
        expect(deleted[1]).assertEqual(10)
        expect(deleted[3]).assertEqual(20)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1200
     * @tc.name testSparseArraySplice012
     * @tc.desc Test SparseArray.splice, verify method result (deleted[0] equals "banana", deleted[1] equals "cherry")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("apple", "banana", "cherry")
        const deleted: SparseArray<string> = arr.splice(1)
        expect(deleted[0]).assertEqual("banana")
        expect(deleted[1]).assertEqual("cherry")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1300
     * @tc.name testSparseArraySplice013
     * @tc.desc Test SparseArray.splice, verify method result (finallyExecuted is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        let finallyExecuted = false
        try {
          arr.splice(1)
        } finally {
          finallyExecuted = true
        }
        expect(finallyExecuted).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1400
     * @tc.name testSparseArraySplice014
     * @tc.desc Test SparseArray.splice, verify method result (deleted.length equals 0, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        const deleted = arr.splice(0)
        expect(deleted.length).assertEqual(0)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1500
     * @tc.name testSparseArraySplice015
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6)
        expect(arr instanceof SparseArray).assertTrue();
        arr[2] = 10
        arr[4] = 20
        const deleted = arr.splice(3)
        expect(deleted.length).assertEqual(3);
        expect(deleted[1]).assertEqual(20);
        expect(arr.length).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1600
     * @tc.name testSparseArraySplice016
     * @tc.desc splice(1) on [10,20,30], verify deleted [20,30] and return type is object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(10, 20, 30)
        const deleted: SparseArray<int> = arr.splice(1)
        expect(deleted[0]).assertEqual(20)
        expect(deleted[1]).assertEqual(30)
        expect(typeof deleted).assertEqual("object")
        expect(deleted !== null && deleted !== undefined).assertTrue()

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1700
     * @tc.name testSparseArraySplice017
     * @tc.desc Test SparseArray.splice, verify method result (deleted[0] equals inner)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<SparseArray<int>>()
        const inner = new SparseArray<int>(1, 2, 3)
        arr.push(inner)
        const deleted: SparseArray<SparseArray<int>> = arr.splice(0)
        expect(deleted[0]).assertEqual(inner)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1800
     * @tc.name testSparseArraySplice018
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(-100)
        expect(deleted.length).assertEqual(3)
        expect(deleted[0]).assertEqual(10)
        expect(deleted[1]).assertEqual(20)
        expect(deleted[2]).assertEqual(30)
        expect(arr.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_1900
     * @tc.name testSparseArraySplice019
     * @tc.desc Test SparseArray.splice, verify method result (deleted1.length equals 3, deleted2.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30, 40, 50)
        let deleted1 = arr.splice(2)
        expect(deleted1.length).assertEqual(3)
        let deleted2 = arr.splice(0)
        expect(deleted2.length).assertEqual(2)
        let deleted3 = arr.splice(0)
        expect(deleted3.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2000
     * @tc.name testSparseArraySplice020
     * @tc.desc Test SparseArray.splice, verify method result (deleted === arr is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30, 40, 50)
        const deleted = arr.splice(2)
        expect(deleted === arr).assertFalse()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2100
     * @tc.name testSparseArraySplice021
     * @tc.desc Test SparseArray.splice, verify method result (arr.length equals 5, deleted.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        const deleted = arr.splice(5)
        expect(arr.length).assertEqual(5)
        expect(deleted.length).assertEqual(5)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2200
     * @tc.name testSparseArraySplice022
     * @tc.desc Test SparseArray.splice, verify method result (arr.length equals 2, deleted.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        const deleted = arr.splice(2)
        expect(arr.length).assertEqual(2)
        expect(deleted.length).assertEqual(1)
        expect(deleted[0]).assertEqual(30)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2300
     * @tc.name testSparseArraySplice023
     * @tc.desc splice from index on SparseArray<short> returns deleted short elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
        const deleted = arr.splice(1);
        expect(arr.length).assertEqual(1);
        expect(deleted.length).assertEqual(2);
        expect(deleted[0]).assertEqual(20 as short);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2400
     * @tc.name testSparseArraySplice024
     * @tc.desc splice at 0x0 removing 0b1 element uses hex and binary index literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const deleted = arr.splice(0x0, 0b1);
        expect(deleted.length).assertEqual(1);
        expect(deleted[0]).assertEqual(10);
        expect(arr[0]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2500
     * @tc.name testSparseArraySplice025
     * @tc.desc splice from index on SparseArray<boolean> keeps false in deleted array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        const deleted = arr.splice(1);
        expect(arr.length).assertEqual(1);
        expect(deleted.length).assertEqual(2);
        expect(deleted[0]).assertFalse();
        expect(deleted[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2600
     * @tc.name testSparseArraySplice026
     * @tc.desc splice from index on SparseArray<byte> returns byte boundary tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(0 as byte, (-128 as byte), 127 as byte);
        const deleted = arr.splice(1);
        expect(arr.length).assertEqual(1);
        expect(deleted[0]).assertEqual(-128 as byte);
        expect(deleted[1]).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2700
     * @tc.name testSparseArraySplice027
     * @tc.desc splice from index on SparseArray<long> returns long tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(1 as long, 10000000000 as long, 20000000000 as long);
        const deleted = arr.splice(1);
        expect(arr.length).assertEqual(1);
        expect(deleted[0]).assertEqual(10000000000 as long);
        expect(deleted[1]).assertEqual(20000000000 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2800
     * @tc.name testSparseArraySplice028
     * @tc.desc splice from index on SparseArray<float> returns float tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
        const deleted = arr.splice(1);
        expect(arr.length).assertEqual(1);
        expect(deleted[0]).assertEqual(2.5f);
        expect(deleted[1]).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_2900
     * @tc.name testSparseArraySplice029
     * @tc.desc splice from index on SparseArray<double> returns double tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<double>(1.25, 2.5, 3.75);
        const deleted = arr.splice(1);
        expect(arr.length).assertEqual(1);
        expect(deleted[0]).assertEqual(2.5);
        expect(deleted[1]).assertEqual(3.75);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_2_3000
     * @tc.name testSparseArraySplice030
     * @tc.desc splice from index on SparseArray<char> returns char tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B', c'C');
        const deleted = arr.splice(1);
        expect(arr.length).assertEqual(1);
        expect(deleted[0]).assertEqual(c'B');
        expect(deleted[1]).assertEqual(c'C');
    });

  });
}
