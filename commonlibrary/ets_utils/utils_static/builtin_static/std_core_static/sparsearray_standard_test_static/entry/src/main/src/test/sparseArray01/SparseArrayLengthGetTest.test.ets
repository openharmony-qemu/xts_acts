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

export default function SparseArrayLengthGetTest(): void {
  describe('SparseArrayLengthGetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0001
     * @tc.name testSparseArrayLengthGet001
     * @tc.desc Construct SparseArray(10), verify length getter returns 10 and int arithmetic (len + 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(10);
        const len: int = arr.length;
        expect(len).assertEqual(10);
        expect(arr.length).assertEqual(10 as int);
        expect(len + 5).assertEqual(15 as int);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0002
     * @tc.name testSparseArrayLengthGet002
     * @tc.desc Test SparseArray default constructor, verify empty array (arr1.length equals 0, arr2.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>();
        expect(arr1.length).assertEqual(0);
        const arr2 = new SparseArray<int>(5);
        expect(arr2.length).assertEqual(5);
        const arr3 = new SparseArray<int>(1, 2, 3);
        expect(arr3.length).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0003
     * @tc.name testSparseArrayLengthGet003
     * @tc.desc length getter after length setter: constructor (10) then arr.length=5, verify getter reflects setter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr.length = 5;
        expect(arr.length).assertEqual(5);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0004
     * @tc.name testSparseArrayLengthGet004
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 1, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.push(1);
        expect(arr.length).assertEqual(1);
        arr.push(2, 3);
        expect(arr.length).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0005
     * @tc.name testSparseArrayLengthGet005
     * @tc.desc Test SparseArray.pop, verify method result (arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.pop();
        expect(arr.length).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0006
     * @tc.name testSparseArrayLengthGet006
     * @tc.desc Test SparseArray.splice, verify method result (arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30, 40, 50);
        arr.splice(2);
        expect(arr.length).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0007
     * @tc.name testSparseArrayLengthGet007
     * @tc.desc Test SparseArray constructor with (10000), verify length and elements (arr.length equals 10000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        expect(arr.length).assertEqual(10000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0008
     * @tc.name testSparseArrayLengthGet008
     * @tc.desc Test SparseArray constructor with length 6, verify sparse length and undefined slots (arr.length equals 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        arr[2] = 10;
        arr[4] = 20;
        expect(arr.length).assertEqual(6);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0009
     * @tc.name testSparseArrayLengthGet009
     * @tc.desc Test SparseArray length Get, verify expected behavior (arr.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.of<int>(1, 2, 3, 4, 5);
        expect(arr.length).assertEqual(5);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0010
     * @tc.name testSparseArrayLengthGet010
     * @tc.desc Test SparseArray.unshift, verify method result (arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4);
        arr.unshift(1, 2);
        expect(arr.length).assertEqual(4);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0011
     * @tc.name testSparseArrayLengthGet011
     * @tc.desc Test SparseArray.shift, verify method result (arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.shift();
        expect(arr.length).assertEqual(2);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0012
     * @tc.name testSparseArrayLengthGet012
     * @tc.desc Test SparseArray constructor with (5), verify length and elements (arr1.length equals 5, arr2.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(5);
        expect(arr1.length).assertEqual(5);

        const arr2 = new SparseArray<string>(5);
        expect(arr2.length).assertEqual(5);

        const arr3 = new SparseArray<boolean>(5);
        expect(arr3.length).assertEqual(5);

        const arr4 = new SparseArray<SparseArray<int>>(5);
        expect(arr4.length).assertEqual(5);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0013
     * @tc.name testSparseArrayLengthGet013
     * @tc.desc Test SparseArray.push, verify method result (arr.length equals 3, arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr.length).assertEqual(3);
        arr.push(4);
        expect(arr.length).assertEqual(4);
        arr.pop();
        expect(arr.length).assertEqual(3);
        arr.shift();
        expect(arr.length).assertEqual(2);
        arr.unshift(0);
        expect(arr.length).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0014
     * @tc.name testSparseArrayLengthGet014
     * @tc.desc Test SparseArray constructor with length 10, verify sparse length and undefined slots (arr.length equals 10, arr.length equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        expect(arr.length).assertEqual(10);

        arr[5] = 100;
        expect(arr.length).assertEqual(10);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0015
     * @tc.name testSparseArrayLengthGet015
     * @tc.desc Test SparseArray constructor with length 5, verify sparse length and undefined slots (arr.length equals 11)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[10] = 100;
        expect(arr.length).assertEqual(11);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0016
     * @tc.name testSparseArrayLengthGet016
     * @tc.desc Test SparseArray.slice, verify method result (sliced.length equals 2, arr.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const sliced = arr.slice(1, 3);
        expect(sliced.length).assertEqual(2);
        expect(arr.length).assertEqual(5);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0017
     * @tc.name testSparseArrayLengthGet017
     * @tc.desc Test SparseArray.concat, verify method result (arr1.length equals 2, newArr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2);
        const arr2 = [3, 4] as Array<int>;
        const newArr = arr1.concat(arr2);
        expect(arr1.length).assertEqual(2);
        expect(newArr.length).assertEqual(4);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0018
     * @tc.name testSparseArrayLengthGet018
     * @tc.desc length getter on SparseArray<long> after push reflects element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>();
        arr.push(10000000000 as long, 20000000000 as long);
        expect(arr.length).assertEqual(2);
    });




    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0019
     * @tc.name testSparseArrayLengthGet019
     * @tc.desc length getter after push long near LONG_MAX boundary element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>();
        const nearMax: long = 9223372036854775806 as long;
        arr.push(nearMax);
        expect(arr.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0020
     * @tc.name testSparseArrayLengthGet020
     * @tc.desc length getter on SparseArray with null element reflects element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, null, 3);
        expect(arr.length).assertEqual(3);
        expect(arr[1]).assertEqual(null);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0021
     * @tc.name testSparseArrayLengthGet021
     * @tc.desc length getter on array with 0x1 and 0b10 elements equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0x1, 0b10);
        expect(arr.length).assertEqual(2);
        expect(arr[0x1]).assertEqual(0b10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0022
     * @tc.name testSparseArrayLengthGet022
     * @tc.desc length getter on SparseArray<char> reflects char element count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B', c'C');
        expect(arr.length).assertEqual(3);
        expect(arr[2]).assertEqual(c'C');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0023
     * @tc.name testSparseArrayLengthGet023
     * @tc.desc length getter on SparseArray<boolean> reflects false element slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false);
        expect(arr.length).assertEqual(2);
        expect(arr[1]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0024
     * @tc.name testSparseArrayLengthGet024
     * @tc.desc length getter expands to high sparse assigned index plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        arr[31] = "tail";
        expect(arr.length).assertEqual(32);
        expect(arr[30]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_GET_0025
     * @tc.name testSparseArrayLengthGet025
     * @tc.desc length getter decreases after shift removes first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthGet025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30);
        const first = arr.shift();
        expect(first).assertEqual(10);
        expect(arr.length).assertEqual(2);
    });

  });
}
