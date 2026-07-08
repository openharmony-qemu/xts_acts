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

export default function SparseArrayUnshiftTest(): void {
  describe('SparseArrayUnshiftTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_0100
     * @tc.name testSparseArrayUnshift001
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        let result = arr.unshift()
        expect(result).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_0200
     * @tc.name testSparseArrayUnshift002
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 4, arr[0] equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        let result = arr.unshift(0)
        expect(result).assertEqual(4)
        expect(arr[0]).assertEqual(0)
        expect(arr[1]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_0300
     * @tc.name testSparseArrayUnshift003
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4)
        let result = arr.unshift(1, 2)
        expect(result).assertEqual(4)
        expect(arr.toString()).assertEqual("1,2,3,4")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_0400
     * @tc.name testSparseArrayUnshift004
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let result = arr.unshift(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
        expect(result).assertEqual(10)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_0500
     * @tc.name testSparseArrayUnshift005
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 1, arr[0] equals "hello")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        let result = arr.unshift("hello")
        expect(result).assertEqual(1)
        expect(arr[0]).assertEqual("hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_0600
     * @tc.name testSparseArrayUnshift006
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>()
        let result = arr.unshift(c'\n')
        expect(result).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_0700
     * @tc.name testSparseArrayUnshift007
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 2, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | string>()
        let result = arr.unshift(1, "hello")
        expect(result).assertEqual(2)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual("hello")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_0800
     * @tc.name testSparseArrayUnshift008
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 2, arr[0] equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | undefined>()
        let result = arr.unshift(undefined, 100)
        expect(result).assertEqual(2)
        expect(arr[0]).assertEqual(undefined)
        expect(arr[1]).assertEqual(100)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_0900
     * @tc.name testSparseArrayUnshift009
     * @tc.desc Test SparseArray.unshift error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        try {
          arr.unshift((null as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1000
     * @tc.name testSparseArrayUnshift010
     * @tc.desc Test SparseArray.unshift error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        try {
          arr.unshift((undefined as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1100
     * @tc.name testSparseArrayUnshift011
     * @tc.desc Test SparseArray.unshift error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        try {
          arr.unshift(("" as Object as int))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1200
     * @tc.name testSparseArrayUnshift012
     * @tc.desc Test SparseArray.unshift error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>()
        try {
          arr.unshift(("" as Object as number))
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1300
     * @tc.name testSparseArrayUnshift013
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 1, arr.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let result = arr.unshift(1)
        expect(result).assertEqual(1)
        expect(arr.length).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1400
     * @tc.name testSparseArrayUnshift014
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 4, arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4)
        let result = arr.unshift(1, 2)
        expect(result).assertEqual(4)
        expect(arr.length).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1500
     * @tc.name testSparseArrayUnshift015
     * @tc.desc Test SparseArray.unshift, verify method result (result1 equals 1, result2 equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let result1 = arr.unshift(1)
        let result2 = arr.unshift(2)
        let result3 = arr.unshift(3)
        expect(result1).assertEqual(1)
        expect(result2).assertEqual(2)
        expect(result3).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1600
     * @tc.name testSparseArrayUnshift016
     * @tc.desc Test SparseArray.unshift, verify method result (result equals originalLength, arr.length equals originalLength)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        let originalLength = arr.length
        let result = arr.unshift()
        expect(result).assertEqual(originalLength)
        expect(arr.length).assertEqual(originalLength)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1700
     * @tc.name testSparseArrayUnshift017
     * @tc.desc Test SparseArray.unshift, verify method result (doubleLength equals 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let result = arr.unshift(1, 2, 3)
        let doubleLength = result * 2
        expect(doubleLength).assertEqual(6)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1800
     * @tc.name testSparseArrayUnshift018
     * @tc.desc Test SparseArray.unshift, verify method result (arr[0] equals 1, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4)
        arr.unshift(1, 2)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual(2)
        expect(arr[2]).assertEqual(3)
        expect(arr[3]).assertEqual(4)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_1900
     * @tc.name testSparseArrayUnshift019
     * @tc.desc Test SparseArray.unshift, verify method result (arr[0] equals 1, arr[1] equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.unshift(3)
        arr.unshift(2)
        arr.unshift(1)
        expect(arr[0]).assertEqual(1)
        expect(arr[1]).assertEqual(2)
        expect(arr[2]).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2000
     * @tc.name testSparseArrayUnshift020
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 20, arr.length equals 20)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let result = arr.unshift(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20)
        expect(result).assertEqual(20)
        expect(arr.length).assertEqual(20)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2100
     * @tc.name testSparseArrayUnshift021
     * @tc.desc Test SparseArray.unshift, verify method result (result equals 4, arr[0] equals "zero")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number | string>()
        arr.unshift(1, "two", 3)
        let result = arr.unshift("zero")
        expect(result).assertEqual(4)
        expect(arr[0]).assertEqual("zero")
        expect(arr[1]).assertEqual(1)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2200
     * @tc.name testSparseArrayUnshift022
     * @tc.desc Test SparseArray.unshift, verify method result (arr[0] equals 0, arr[3] equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[2] = 10
        arr.unshift(0)
        expect(arr[0]).assertEqual(0)
        expect(arr[3]).assertEqual(10)
        expect(arr[1]).assertEqual(undefined)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2300
     * @tc.name testSparseArrayUnshift023
     * @tc.desc Test SparseArray.unshift, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4)
        arr.unshift(1, 2)
        arr.push(5)
        expect(arr.toString()).assertEqual("1,2,3,4,5")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2400
     * @tc.name testSparseArrayUnshift024
     * @tc.desc Test SparseArray.unshift, verify method result (first equals 1, arr.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4)
        arr.unshift(1, 2)
        let first = arr.shift()
        expect(first).assertEqual(1)
        expect(arr.length).assertEqual(3)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2500
     * @tc.name testSparseArrayUnshift025
     * @tc.desc Test SparseArray.unshift, verify method result (str equals "1,2,3,4")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4)
        arr.unshift(1, 2)
        let str = arr.toString()
        expect(str).assertEqual("1,2,3,4")
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2600
     * @tc.name testSparseArrayUnshift026
     * @tc.desc unshift byte elements to head, verify order and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(30 as byte, 40 as byte);
        const len = arr.unshift(10 as byte, 20 as byte);
        expect(len).assertEqual(4);
        expect(arr[0]).assertEqual(10 as byte);
        expect(arr[1]).assertEqual(20 as byte);
        expect(arr[2]).assertEqual(30 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2700
     * @tc.name testSparseArrayUnshift027
     * @tc.desc unshift float elements to head, verify order and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(3.0f, 4.0f);
        const len = arr.unshift(1.0f, 2.0f);
        expect(len).assertEqual(4);
        expect(arr[0]).assertEqual(1.0f);
        expect(arr[3]).assertEqual(4.0f);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2800
     * @tc.name testSparseArrayUnshift028
     * @tc.desc unshift stores carriage-return and form-feed whitespace string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("tail");
        arr.unshift("\r", "\f");
        expect(arr[0]).assertEqual("\r");
        expect(arr[1]).assertEqual("\f");
        expect(arr[2]).assertEqual("tail");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_2900
     * @tc.name testSparseArrayUnshift029
     * @tc.desc unshift null element to head of SparseArray<string|null>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string | null>("tail");
        arr.unshift(null);
        expect(arr[0]).assertEqual(null);
        expect(arr[1]).assertEqual("tail");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_3000
     * @tc.name testSparseArrayUnshift030
     * @tc.desc unshift prepends hex literal 0xFF element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 3);
        arr.unshift(0xFF);
        expect(arr[0]).assertEqual(0xFF);
        expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_3100
     * @tc.name testSparseArrayUnshift031
     * @tc.desc unshift boolean false value to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true);
        const len = arr.unshift(false);
        expect(len).assertEqual(2);
        expect(arr[0]).assertFalse();
        expect(arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_3200
     * @tc.name testSparseArrayUnshift032
     * @tc.desc unshift short values to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>();
        arr.push(30 as short);
        const len = arr.unshift(10 as short, 20 as short);
        expect(len).assertEqual(3);
        expect(arr[0]).assertEqual(10 as short);
        expect(arr[2]).assertEqual(30 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_3300
     * @tc.name testSparseArrayUnshift033
     * @tc.desc unshift long value to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(2 as long);
        const len = arr.unshift(10000000000 as long);
        expect(len).assertEqual(2);
        expect(arr[0]).assertEqual(10000000000 as long);
        expect(arr[1]).assertEqual(2 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_UNSHIFT_3400
     * @tc.name testSparseArrayUnshift034
     * @tc.desc unshift double value to head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayUnshift034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<double>(2.5);
        const len = arr.unshift(1.25);
        expect(len).assertEqual(2);
        expect(arr[0]).assertEqual(1.25);
        expect(arr[1]).assertEqual(2.5);
    });

  });
}
