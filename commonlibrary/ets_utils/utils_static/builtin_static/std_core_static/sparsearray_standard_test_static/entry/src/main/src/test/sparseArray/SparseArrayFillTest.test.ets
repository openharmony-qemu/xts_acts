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
export default function SparseArrayFillTest(): void {
  describe('SparseArrayFillTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_0100
     * @tc.name testSparseArrayFill001
     * @tc.desc fill(7, 0, 2) on [3,4,5], verify partial range [0,2) is filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4, 5);
        arr.fill(7, 0, 2);
        expect(arr[0]).assertEqual(7);
        expect(arr[1]).assertEqual(7);
        expect(arr[2]).assertEqual(5);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_0200
     * @tc.name testSparseArrayFill002
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.fill(9, 2);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(9);
        expect(arr[3]).assertEqual(9);
        expect(arr[4]).assertEqual(9);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_0300
     * @tc.name testSparseArrayFill003
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 9, arr[1] equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.fill(9, 0, 3);
        expect(arr[0]).assertEqual(9);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(9);
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_0400
     * @tc.name testSparseArrayFill004
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.fill(9, 1, 3);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(9);
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_0500
     * @tc.name testSparseArrayFill005
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 3, arr[1] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | string>(1, "a", 2);
        arr.fill(3);
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(3);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_0600
     * @tc.name testSparseArrayFill006
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 2147483647, arr[1] equals 2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 0, 0);
        arr.fill(2147483647);
        expect(arr[0]).assertEqual(2147483647);
        expect(arr[1]).assertEqual(2147483647);
        expect(arr[2]).assertEqual(2147483647);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_0700
     * @tc.name testSparseArrayFill007
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals -2147483648, arr[1] equals -2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 0, 0);
        arr.fill(-2147483648);
        expect(arr[0]).assertEqual(-2147483648);
        expect(arr[1]).assertEqual(-2147483648);
        expect(arr[2]).assertEqual(-2147483648);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_0800
     * @tc.name testSparseArrayFill008
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 0, arr[1] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.fill(0);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(0);
        expect(arr[2]).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_0900
     * @tc.name testSparseArrayFill009
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals "", arr[1] equals "")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        arr.fill("");
        expect(arr[0]).assertEqual("");
        expect(arr[1]).assertEqual("");
        expect(arr[2]).assertEqual("");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1000
     * @tc.name testSparseArrayFill010
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals "\u4e2d\u6587", arr[1] equals "\u4e2d\u6587")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        arr.fill("\u4e2d\u6587");
        expect(arr[0]).assertEqual("\u4e2d\u6587");
        expect(arr[1]).assertEqual("\u4e2d\u6587");
        expect(arr[2]).assertEqual("\u4e2d\u6587");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1100
     * @tc.name testSparseArrayFill011
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals "<script>alert(1, arr[1] equals "<script>alert(1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        arr.fill("<script>alert(1)</script>");
        expect(arr[0]).assertEqual("<script>alert(1)</script>");
        expect(arr[1]).assertEqual("<script>alert(1)</script>");
        expect(arr[2]).assertEqual("<script>alert(1)</script>");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1200
     * @tc.name testSparseArrayFill012
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.fill(9, 2, 4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(9);
        expect(arr[3]).assertEqual(9);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1300
     * @tc.name testSparseArrayFill013
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.fill(9, -3, 5);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(9);
        expect(arr[3]).assertEqual(9);
        expect(arr[4]).assertEqual(9);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1400
     * @tc.name testSparseArrayFill014
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.fill(9, 3, 5);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1500
     * @tc.name testSparseArrayFill015
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.fill(4, 1);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(4);
        expect(arr[2]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1600
     * @tc.name testSparseArrayFill016
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 9, arr[1] equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.fill(9, 0, 3);
        expect(arr[0]).assertEqual(9);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(9);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1700
     * @tc.name testSparseArrayFill017
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.fill(9, 1, 10);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(9);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1800
     * @tc.name testSparseArrayFill018
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 9, arr[1] equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.fill(9, 0, -2);
        expect(arr[0]).assertEqual(9);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(9);
        expect(arr[3]).assertEqual(4);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_1900
     * @tc.name testSparseArrayFill019
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.fill(9, 1, 1);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2000
     * @tc.name testSparseArrayFill020
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.fill(9, 2, 1);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2100
     * @tc.name testSparseArrayFill021
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.fill(9, 1, 4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(9);
        expect(arr[3]).assertEqual(9);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2200
     * @tc.name testSparseArrayFill022
     * @tc.desc fill(4) returns this (result equals arr) and fills all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.fill(4);
        expect(result).assertEqual(arr);
        expect(arr[0]).assertEqual(4);
        expect(arr[1]).assertEqual(4);
        expect(arr[2]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2300
     * @tc.name testSparseArrayFill023
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 5, arr[1] equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.fill(4).fill(5);
        expect(arr[0]).assertEqual(5);
        expect(arr[1]).assertEqual(5);
        expect(arr[2]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2400
     * @tc.name testSparseArrayFill024
     * @tc.desc Test SparseArray.fill, verify method result (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.fill(1);
        expect(arr.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2500
     * @tc.name testSparseArrayFill025
     * @tc.desc Test SparseArray.fill, verify method result (arr[0] equals 1, arr[1] equals 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[4] = 5;
        arr.fill(9, 1, 4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(9);
        expect(arr[2]).assertEqual(9);
        expect(arr[3]).assertEqual(9);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2600
     * @tc.name testSparseArrayFill026
     * @tc.desc fill SparseArray<char> with char value c'X', verify all slots filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(3);
        arr.fill(c'X');
        expect(arr[0]).assertEqual(c'X');
        expect(arr[1]).assertEqual(c'X');
        expect(arr[2]).assertEqual(c'X');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2700
     * @tc.name testSparseArrayFill027
     * @tc.desc fill SparseArray<short> with short value, verify all slots filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(3);
        arr.fill(100 as short);
        expect(arr[0]).assertEqual(100 as short);
        expect(arr[1]).assertEqual(100 as short);
        expect(arr[2]).assertEqual(100 as short);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2800
     * @tc.name testSparseArrayFill028
     * @tc.desc fill SparseArray<long> with long value, verify slot filled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(2);
        const val: long = 10000000000 as long;
        arr.fill(val);
        expect(arr[0]).assertEqual(val);
        expect(arr[1]).assertEqual(val);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_2900
     * @tc.name testSparseArrayFill029
     * @tc.desc fill(null) on SparseArray<int|null>, verify all slots hold null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, 2, 3);
        arr.fill(null);
        expect(arr[0]).assertEqual(null);
        expect(arr[1]).assertEqual(null);
        expect(arr[2]).assertEqual(null);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_3000
     * @tc.name testSparseArrayFill030
     * @tc.desc fill(undefined) on SparseArray<int|undefined>, verify stored undefined slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, 2, 3);
        arr.fill(undefined);
        expect(arr[0]).assertEqual(undefined);
        expect(arr[1]).assertEqual(undefined);
        expect(arr[2]).assertEqual(undefined);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_3100
     * @tc.name testSparseArrayFill031
     * @tc.desc fill with 0b1010 and 0x4 range indices on int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 0, 0, 0, 0);
        arr.fill(7, 0x1, 0b100);
        expect(arr[0]).assertEqual(0);
        expect(arr[1]).assertEqual(7);
        expect(arr[2]).assertEqual(7);
        expect(arr[3]).assertEqual(7);
        expect(arr[4]).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_3200
     * @tc.name testSparseArrayFill032
     * @tc.desc fill zero-width space string as element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3);
        arr.fill("\u200B");
        expect(arr[0]).assertEqual("\u200B");
        expect(arr[1]).assertEqual("\u200B");
        expect(arr[2]).assertEqual("\u200B");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_3300
     * @tc.name testSparseArrayFill033
     * @tc.desc fill single-space string as element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3);
        arr.fill(" ");
        expect(arr[0]).assertEqual(" ");
        expect(arr[1]).assertEqual(" ");
        expect(arr[2]).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_3400
     * @tc.name testSparseArrayFill034
     * @tc.desc fill SparseArray<boolean> with range and preserves values outside range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, true, true, true);
        arr.fill(false, 1, 3);
        expect(arr[0]).assertEqual(true);
        expect(arr[1]).assertEqual(false);
        expect(arr[2]).assertEqual(false);
        expect(arr[3]).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_3500
     * @tc.name testSparseArrayFill035
     * @tc.desc fill SparseArray<byte> with byte value over sparse length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const value: byte = 7 as byte;
        const arr = new SparseArray<byte>(4);
        arr[3] = 1 as byte;
        arr.fill(value, 1);
        expect(arr[0]).assertUndefined();
        expect(arr[1]).assertEqual(value);
        expect(arr[2]).assertEqual(value);
        expect(arr[3]).assertEqual(value);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_3600
     * @tc.name testSparseArrayFill036
     * @tc.desc fill with start equal end leaves SparseArray unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.fill(9, 2, 2);
        expect(result).assertEqual(arr);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FILL_3700
     * @tc.name testSparseArrayFill037
     * @tc.desc fill with negative start fills from computed start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFill037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B', c'C');
        arr.fill(c'Z', -2);
        expect(arr[0]).assertEqual(c'A');
        expect(arr[1]).assertEqual(c'Z');
        expect(arr[2]).assertEqual(c'Z');
    });

  });
}
