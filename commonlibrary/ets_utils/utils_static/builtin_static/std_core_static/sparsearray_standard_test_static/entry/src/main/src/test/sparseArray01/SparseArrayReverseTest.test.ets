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

export default function SparseArrayReverseTest(): void {
  describe('SparseArrayReverseTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_0100
     * @tc.name testSparseArrayReverse001
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 3, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reverse();
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_0200
     * @tc.name testSparseArrayReverse002
     * @tc.desc Test SparseArray.reverse, verify method result (result equals arr, arr[0] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.reverse();
        expect(result).assertEqual(arr);
        expect(arr[0]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_0300
     * @tc.name testSparseArrayReverse003
     * @tc.desc Test SparseArray.reverse, verify method result (result equals arr, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const result = arr.reverse();
        expect(result).assertEqual(arr);
        expect(arr.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_0400
     * @tc.name testSparseArrayReverse004
     * @tc.desc Test SparseArray.reverse, verify method result (arr.length equals 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(42);
        arr.reverse();
        expect(arr.length).assertEqual(42);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_0500
     * @tc.name testSparseArrayReverse005
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 3, arr[2] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(3);
        arr[0] = 1;
        arr[1] = undefined;
        arr[2] = 3;
        arr.reverse();
        expect(arr[0]).assertEqual(3);
        expect(arr[2]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_0600
     * @tc.name testSparseArrayReverse006
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 1, arr[3] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        arr.reverse().reverse();
        expect(arr[0]).assertEqual(1);
        expect(arr[3]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_0700
     * @tc.name testSparseArrayReverse007
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 3, arr[3] equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.reverse().push(4);
        expect(arr[0]).assertEqual(3);
        expect(arr[3]).assertEqual(4);
        expect(result).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_0800
     * @tc.name testSparseArrayReverse008
     * @tc.desc Test SparseArray.reverse, verify method result (arr.length equals 1000, arr[0] equals 999)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr.push(i);
        }
        arr.reverse();
        expect(arr.length).assertEqual(1000);
        expect(arr[0]).assertEqual(999);
        expect(arr[999]).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_0900
     * @tc.name testSparseArrayReverse009
     * @tc.desc Test SparseArray.reverse, verify method result (arr.length equals 5, arr[0] equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[2] = 10;
        arr[4] = 20;
        arr.reverse();
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(20);
        expect(arr[2]).assertEqual(10);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1000
     * @tc.name testSparseArrayReverse010
     * @tc.desc Test SparseArray.reverse, verify method result (arr.length equals 3, arr[0] equals 30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3);
        arr[0] = 10;
        arr[2] = 30;
        arr.reverse();
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(30);
        expect(arr[2]).assertEqual(10);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1100
     * @tc.name testSparseArrayReverse011
     * @tc.desc Test SparseArray.reverse, verify method result (arr.length equals 10, arr[0] equals 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[9] = 100;
        arr.reverse();
        expect(arr.length).assertEqual(10);
        expect(arr[0]).assertEqual(100);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1200
     * @tc.name testSparseArrayReverse012
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 5, arr[4] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.reverse();
        expect(arr[0]).assertEqual(5);
        expect(arr[4]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1300
     * @tc.name testSparseArrayReverse013
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 3.3, arr[2] equals 1.1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1.1, 2.2, 3.3);
        arr.reverse();
        expect(arr[0]).assertEqual(3.3);
        expect(arr[2]).assertEqual(1.1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1400
     * @tc.name testSparseArrayReverse014
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals "c", arr[2] equals "a")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        arr.reverse();
        expect(arr[0]).assertEqual("c");
        expect(arr[2]).assertEqual("a");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1500
     * @tc.name testSparseArrayReverse015
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals true, arr[1] equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        arr.reverse();
        expect(arr[0]).assertEqual(true);
        expect(arr[1]).assertEqual(false);
        expect(arr[2]).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1600
     * @tc.name testSparseArrayReverse016
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals true, arr[1] equals "a")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string | boolean>(1, "a", true);
        arr.reverse();
        expect(arr[0]).assertEqual(true);
        expect(arr[1]).assertEqual("a");
        expect(arr[2]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1700
     * @tc.name testSparseArrayReverse017
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 1, arr[4] equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.reverse();
        arr.reverse();
        expect(arr[0]).assertEqual(1);
        expect(arr[4]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1800
     * @tc.name testSparseArrayReverse018
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 3, arr[2] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reverse().reverse().reverse();
        expect(arr[0]).assertEqual(3);
        expect(arr[2]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_1900
     * @tc.name testSparseArrayReverse019
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 3, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reverse();
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(1);
        arr.push(4);
        expect(arr.length).assertEqual(4);
        expect(arr[3]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2000
     * @tc.name testSparseArrayReverse020
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 3, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.reverse();
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(1);
        const popped = arr.pop();
        expect(popped).assertEqual(1);
        expect(arr.length).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2100
     * @tc.name testSparseArrayReverse021
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 5, arr[1] equals 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        arr.reverse();
        arr.splice(1, 2, 99);
        expect(arr[0]).assertEqual(5);
        expect(arr[1]).assertEqual(99);
        expect(arr[2]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2200
     * @tc.name testSparseArrayReverse022
     * @tc.desc Test SparseArray.reverse, verify method result (arr.length equals 10000, arr[0] equals 42)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        arr[9999] = 42;
        arr.reverse();
        expect(arr.length).assertEqual(10000);
        expect(arr[0]).assertEqual(42);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2300
     * @tc.name testSparseArrayReverse023
     * @tc.desc Test SparseArray.reverse, verify method result (arr[0] equals 2, arr[999] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000);
        arr[0] = 1;
        arr[999] = 2;
        arr.reverse();
        expect(arr[0]).assertEqual(2);
        expect(arr[999]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2400
     * @tc.name testSparseArrayReverse024
     * @tc.desc Test SparseArray.reverse, verify method result (arr2[0] equals 3, arr2[2] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2, 3);
        const arr2 = arr1;
        arr1.reverse();
        expect(arr2[0]).assertEqual(3);
        expect(arr2[2]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2500
     * @tc.name testSparseArrayReverse025
     * @tc.desc Test SparseArray.reverse, verify method result (reversed equals arr1, arr1[0] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2, 3);
        const reversed = arr1.reverse();
        expect(reversed).assertEqual(arr1);
        expect(arr1[0]).assertEqual(3);

        const arr2 = new SparseArray<int>(1, 2, 3);
        const toReversedArr = arr2.toReversed();
        expect(toReversedArr[0]).assertEqual(3);
        expect(arr2[0]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2600
     * @tc.name testSparseArrayReverse026
     * @tc.desc Test SparseArray.reverse, verify method result (arr1[0] equals 3, arr2[0] equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2, 3);
        arr1.reverse();
        expect(arr1[0]).assertEqual(3);

        const arr2 = new SparseArray<int>();
        arr2.push(1, 2, 3);
        arr2.reverse();
        expect(arr2[0]).assertEqual(3);

        const arr3 = SparseArray.of<int>(1, 2, 3);
        arr3.reverse();
        expect(arr3[0]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2700
     * @tc.name testSparseArrayReverse027
     * @tc.desc Test SparseArray.reverse, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>(1, 2, 3);
        arr1.reverse();
        expect(arr1.toString()).assertEqual('3,2,1');
        const arr2 = new SparseArray<int>();
        arr2.push(1, 2, 3);
        arr2.reverse();
        expect(arr2.toString()).assertEqual('3,2,1');
        const arr3 = SparseArray.of<int>(1, 2, 3);
        arr3.reverse();
        expect(arr3.toString()).assertEqual('3,2,1');

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2800
     * @tc.name testSparseArrayReverse028
     * @tc.desc Test SparseArray.reverse, verify method result (arr.toString equals '5,4,3,2,1')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = SparseArray.from<int>([1, 2, 3, 4, 5]);
        arr.reverse();
        expect(arr.toString()).assertEqual('5,4,3,2,1');

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_2900
     * @tc.name testSparseArrayReverse029
     * @tc.desc reverse on SparseArray<long> reverses long element order in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(1 as long, 10000000000 as long);
        arr.reverse();
        expect(arr[0]).assertEqual(10000000000 as long);
        expect(arr[1]).assertEqual(1 as long);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_3000
     * @tc.name testSparseArrayReverse030
     * @tc.desc reverse in place orders 0x3 0b10 0o5 literals to 0o5 0b10 0x3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0x3, 0b10, 0o5);
        arr.reverse();
        expect(arr[0]).assertEqual(0o5);
        expect(arr[2]).assertEqual(0x3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_3100
     * @tc.name testSparseArrayReverse031
     * @tc.desc reverse on SparseArray<char> reverses char element order in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B', c'C');
        const result = arr.reverse();
        expect(result).assertEqual(arr);
        expect(arr[0]).assertEqual(c'C');
        expect(arr[2]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_3200
     * @tc.name testSparseArrayReverse032
     * @tc.desc reverse on SparseArray<boolean> preserves false value after reversal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        arr.reverse();
        expect(arr.length).assertEqual(3);
        expect(arr[1]).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_3300
     * @tc.name testSparseArrayReverse033
     * @tc.desc reverse preserves explicit undefined element in SparseArray<int|undefined>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, undefined, 3);
        arr.reverse();
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertUndefined();
        expect(arr[2]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_REVERSE_3400
     * @tc.name testSparseArrayReverse034
     * @tc.desc reverse moves high sparse assigned value to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayReverse034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(6);
        arr[5] = "tail";
        arr.reverse();
        expect(arr.length).assertEqual(6);
        expect(arr[0]).assertEqual("tail");
        expect(arr[5]).assertUndefined();
    });


  });
}
