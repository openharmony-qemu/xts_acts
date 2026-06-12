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

class IncludesRefObj {
  name: string;
  constructor(name: string) {
    this.name = name
  }
}

export default function SparseArrayIncludesTest(): void {
  describe('SparseArrayIncludesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_0100
     * @tc.name testSparseArrayIncludes001
     * @tc.desc Test SparseArray.includes, verify hit returns true and result type is boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        let result = arr.includes(20)
        expect(result).assertEqual(true)
        expect(typeof result).assertEqual("boolean")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_0200
     * @tc.name testSparseArrayIncludes002
     * @tc.desc Test SparseArray.includes after push, verify MAX_INT element found (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(2147483647)
        let result = arr.includes(2147483647)
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_0300
     * @tc.name testSparseArrayIncludes003
     * @tc.desc Test SparseArray.includes, verify method result (result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        let result = arr.includes(0)
        expect(result).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_0400
     * @tc.name testSparseArrayIncludes004
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(10, Double.NaN, 30)
        let result = arr.includes(Double.NaN)
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_0500
     * @tc.name testSparseArrayIncludes005
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true)
        let result = arr.includes(true)
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_0600
     * @tc.name testSparseArrayIncludes006
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(false, true, false)
        let result = arr.includes(false)
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_0700
     * @tc.name testSparseArrayIncludes007
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("apple", "banana", "cherry")
        let result = arr.includes("banana")
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_0800
     * @tc.name testSparseArrayIncludes008
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("中文", "日本語", "한글")
        let result = arr.includes("中文")
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_0900
     * @tc.name testSparseArrayIncludes009
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("hello​world")
        let result = arr.includes("hello​world")
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1000
     * @tc.name testSparseArrayIncludes010
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const obj = new IncludesRefObj("test")
        const arr = new SparseArray<IncludesRefObj>(obj)
        let result = arr.includes(obj)
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1100
     * @tc.name testSparseArrayIncludes011
     * @tc.desc Test SparseArray.includes, verify method result (result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const first = new IncludesRefObj("test")
        const arr = new SparseArray<IncludesRefObj>(first)
        let result = arr.includes(new IncludesRefObj("test"))
        expect(result).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1200
     * @tc.name testSparseArrayIncludes012
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(10, "hello", 30)
        let result = arr.includes("hello")
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1300
     * @tc.name testSparseArrayIncludes013
     * @tc.desc Test SparseArray.includes, verify method result (result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let result = arr.includes(1)
        expect(result).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1400
     * @tc.name testSparseArrayIncludes014
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 10
        arr[2] = 30
        arr[4] = 50
        let result = arr.includes(30)
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1500
     * @tc.name testSparseArrayIncludes015
     * @tc.desc Test SparseArray.includes, verify method result (result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 10
        arr[2] = 30
        arr[4] = 50
        let result = arr.includes(20)
        expect(result).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1600
     * @tc.name testSparseArrayIncludes016
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>()
        arr[0] = 10
        arr[1] = undefined
        let result = arr.includes(undefined)
        expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1700
     * @tc.name testSparseArrayIncludes017
     * @tc.desc Test SparseArray.includes, verify method result (result is false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>()
        arr[0] = 10
        let result = arr.includes(undefined)
        expect(result).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1800
     * @tc.name testSparseArrayIncludes018
     * @tc.desc Test SparseArray.includes, verify method result (result is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>()
        arr[0] = undefined
        let result = arr.includes(undefined)
        expect(result).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_1900
     * @tc.name testSparseArrayIncludes019
     * @tc.desc includes byte element 127 in SparseArray<byte>, verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(10 as byte, 127 as byte, 20 as byte)
        expect(arr.includes(127 as byte)).assertEqual(true)
        expect(arr.includes(99 as byte)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2000
     * @tc.name testSparseArrayIncludes020
     * @tc.desc includes float element 3.14f in SparseArray<float>, verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 3.14f, 2.0f)
        expect(arr.includes(3.14f)).assertEqual(true)
        expect(arr.includes(9.9f)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2100
     * @tc.name testSparseArrayIncludes021
     * @tc.desc includes float NaN in SparseArray<float> via SameValueZero, verify true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const nan = Double.toFloat(Double.NaN)
        const arr = new SparseArray<float>(1.0f, nan, 3.0f)
        expect(arr.includes(nan)).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2200
     * @tc.name testSparseArrayIncludes022
     * @tc.desc includes returns true for XSS script string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const xss = "<script>alert(1)</script>"
        const arr = new SparseArray<string>("ok", xss)
        expect(arr.includes(xss)).assertEqual(true)
        expect(arr.includes("missing")).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2300
     * @tc.name testSparseArrayIncludes023
     * @tc.desc includes returns true for zero-width space element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const zw = "\u200B"
        const arr = new SparseArray<string>(zw, "x")
        expect(arr.includes(zw)).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2400
     * @tc.name testSparseArrayIncludes024
     * @tc.desc includes matches null stored element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const withNull = new SparseArray<int | null>(1, null, 3)
        expect(withNull.includes(null)).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2500
     * @tc.name testSparseArrayIncludes025
     * @tc.desc includes finds element stored as hex literal 0xFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr[0] = 0xFF
        expect(arr.includes(0xFF)).assertEqual(true)
        expect(arr.includes(0xFE)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2600
     * @tc.name testSparseArrayIncludes026
     * @tc.desc includes matches empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("", "x")
        expect(arr.includes("")).assertEqual(true)
        expect(arr.includes("y")).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2700
     * @tc.name testSparseArrayIncludes027
     * @tc.desc includes with positive fromIndex skips earlier matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 5, 9, 2)
        expect(arr.includes(2, 0)).assertEqual(true)
        expect(arr.includes(2, 1)).assertEqual(true)
        expect(arr.includes(2, 3)).assertEqual(true)
        expect(arr.includes(2, 4)).assertEqual(false)
        expect(arr.includes(5, 2)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2800
     * @tc.name testSparseArrayIncludes028
     * @tc.desc includes with negative fromIndex resolves offset from length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        expect(arr.includes(10, -3)).assertEqual(true)
        expect(arr.includes(20, -2)).assertEqual(true)
        expect(arr.includes(10, -2)).assertEqual(false)
        expect(arr.includes(30, -1)).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_2900
     * @tc.name testSparseArrayIncludes029
     * @tc.desc includes with fromIndex beyond length returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        expect(arr.includes(1, 100)).assertEqual(false)
        expect(arr.includes(3, 99)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_INCLUDES_3000
     * @tc.name testSparseArrayIncludes030
     * @tc.desc includes with fromIndex on sparse array skips holes before start index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIncludes030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 10
        arr[2] = 20
        arr[4] = 30
        expect(arr.includes(10, 1)).assertEqual(false)
        expect(arr.includes(20, 2)).assertEqual(true)
        expect(arr.includes(30, 3)).assertEqual(true)
    });
  });
}
