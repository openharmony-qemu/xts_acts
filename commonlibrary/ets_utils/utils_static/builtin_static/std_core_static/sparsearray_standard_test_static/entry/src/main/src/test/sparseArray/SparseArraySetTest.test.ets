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

interface Person025 {
  name: string
  age: int
}

interface Nested027Inner { value: int }

interface Nested026 { inner: Nested027Inner }

interface Complex051Data {
  name: string
  tags: Array<string>
}

interface Complex049 {
  id: int
  data: Complex051Data
}

enum ColorSet055 {
  Red,
  Green,
  Blue
}

export default function SparseArraySetTest(): void {
  describe('SparseArraySetTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_0100
     * @tc.name testSparseArraySet001
     * @tc.desc Verify SparseArray $_set with index and value parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 42)
        expect(arr.$_get(0)).assertEqual(42)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_0200
     * @tc.name testSparseArraySet002
     * @tc.desc Verify SparseArray $_set when value parameter is missing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>()
        arr.$_set(0, undefined)
        expect(arr instanceof SparseArray).assertTrue()
        expect(arr.$_get(0)).assertUndefined()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_0300
     * @tc.name testSparseArraySet003
     * @tc.desc Verify $_set throws when index is undefined cast (cannot pass missing index)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int | undefined>()
          arr.$_set((undefined as Object as int), undefined)
          expect().assertFail()
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError")
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_0400
     * @tc.name testSparseArraySet004
     * @tc.desc Verify SparseArray $_set with positive index in valid range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(5, 100)
        expect(arr.$_get(5)).assertEqual(100)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_0500
     * @tc.name testSparseArraySet005
     * @tc.desc Verify SparseArray $_set at index zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 200)
        expect(arr.$_get(0)).assertEqual(200)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_0600
     * @tc.name testSparseArraySet006
     * @tc.desc Verify $_set at int max index does not store (length would overflow); $_get returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(2147483647, 1)
        expect(arr instanceof SparseArray).assertTrue()
        expect(arr.$_get(2147483647)).assertUndefined()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_0700
     * @tc.name testSparseArraySet007
     * @tc.desc Verify $_set with minimum int negative index does not write slot 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(-2147483648, 1)
        expect(arr.$_get(0)).assertUndefined()
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_0800
     * @tc.name testSparseArraySet008
     * @tc.desc Verify $_set(-1) does not write slot 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(-1, 42)
        expect(arr.$_get(0)).assertUndefined()
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_0900
     * @tc.name testSparseArraySet009
     * @tc.desc Verify $_set(-100) does not write slot 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(-100, 42)
        expect(arr.$_get(0)).assertUndefined()
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1000
     * @tc.name testSparseArraySet010
     * @tc.desc Verify SparseArray $_set throws ClassCastError when index is null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        try {
          arr.$_set((null as Object as int), 42)
          expect().assertFail()
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError")
        }
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1100
     * @tc.name testSparseArraySet011
     * @tc.desc Verify SparseArray $_set throws ClassCastError when index is undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        try {
          arr.$_set((undefined as Object as int), 42)
          expect().assertFail()
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError")
        }
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1200
     * @tc.name testSparseArraySet012
     * @tc.desc Verify SparseArray $_set throws ClassCastError when index is a floating-point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        try {
          arr.$_set((3.14 as Object as int), 42)
          expect().assertFail()
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError")
        }
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1300
     * @tc.name testSparseArraySet013
     * @tc.desc Verify SparseArray $_set throws ClassCastError when index is a string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        try {
          arr.$_set(("0" as Object as int), 42)
          expect().assertFail()
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError")
        }
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1400
     * @tc.name testSparseArraySet014
     * @tc.desc $_set(1, 7) on [2,2,3], verify index 1 updated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 2, 3)
        arr.$_set(1, 7)
        expect(arr[1]).assertEqual(7)
        expect(arr[0]).assertEqual(2)
        expect(arr[2]).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1500
     * @tc.name testSparseArraySet015
     * @tc.desc Verify SparseArray $_set with a positive value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 999)
        expect(arr.$_get(0)).assertEqual(999)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1600
     * @tc.name testSparseArraySet016
     * @tc.desc Verify SparseArray $_set with a negative value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, -100)
        expect(arr.$_get(0)).assertEqual(-100)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1700
     * @tc.name testSparseArraySet017
     * @tc.desc Verify SparseArray $_set with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 0)
        expect(arr.$_get(0)).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1800
     * @tc.name testSparseArraySet018
     * @tc.desc Verify SparseArray $_set with int boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 2147483647)
        expect(arr.$_get(0)).assertEqual(2147483647)
        arr.$_set(1, -2147483648)
        expect(arr.$_get(1)).assertEqual(-2147483648)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_1900
     * @tc.name testSparseArraySet019
     * @tc.desc Verify SparseArray $_set with a normal string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        arr.$_set(0, "hello")
        expect(arr.$_get(0)).assertEqual("hello")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2000
     * @tc.name testSparseArraySet020
     * @tc.desc Verify SparseArray $_set with an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        arr.$_set(0, "")
        expect(arr.$_get(0)).assertEqual("")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2100
     * @tc.name testSparseArraySet021
     * @tc.desc Verify SparseArray $_set with Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        arr.$_set(0, "中文测试")
        expect(arr.$_get(0)).assertEqual("中文测试")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2200
     * @tc.name testSparseArraySet022
     * @tc.desc Verify SparseArray $_set with special characters in string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        arr.$_set(0, "!@#$%^&*()")
        expect(arr.$_get(0)).assertEqual("!@#$%^&*()")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2300
     * @tc.name testSparseArraySet023
     * @tc.desc Verify SparseArray $_set with boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>()
        arr.$_set(0, true)
        expect(arr.$_get(0)).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2400
     * @tc.name testSparseArraySet024
     * @tc.desc Verify SparseArray $_set with boolean false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>()
        arr.$_set(0, false)
        expect(arr.$_get(0)).assertFalse()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2500
     * @tc.name testSparseArraySet025
     * @tc.desc Verify SparseArray $_set with a plain object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Person025>()
        const _p025: Person025 = { name: "Alice", age: 30 }
        arr.$_set(0, _p025)
        expect(arr.$_get(0)!.name).assertEqual("Alice")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2600
     * @tc.name testSparseArraySet026
     * @tc.desc Verify SparseArray $_set with a nested object value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Nested026>()
        const _i026: Nested027Inner = { value: 100 }
        const _o026: Nested026 = { inner: _i026 }
        arr.$_set(0, _o026)
        expect(arr.$_get(0)!.inner.value).assertEqual(100)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2700
     * @tc.name testSparseArraySet027
     * @tc.desc Verify SparseArray $_set with an array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Array<int>>()
        arr.$_set(0, [1, 2, 3])
        expect(arr.$_get(0)!.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2800
     * @tc.name testSparseArraySet028
     * @tc.desc Verify SparseArray $_set with an empty array value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Array<int>>()
        arr.$_set(0, [])
        expect(arr.$_get(0)!.length).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_2900
     * @tc.name testSparseArraySet029
     * @tc.desc Verify SparseArray $_set with null value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>()
        arr.$_set(0, null)
        expect(arr.$_get(0)).assertNull()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3000
     * @tc.name testSparseArraySet030
     * @tc.desc Verify SparseArray $_set stores XSS-like string as literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        arr.$_set(0, "<script>alert(1)</script>")
        expect(arr.$_get(0)).assertEqual("<script>alert(1)</script>")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3100
     * @tc.name testSparseArraySet031
     * @tc.desc Verify SparseArray $_set with a very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        let longStr = "a".repeat(10000)
        arr.$_set(0, longStr)
        expect(arr.$_get(0)!.length).assertEqual(10000)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3200
     * @tc.name testSparseArraySet032
     * @tc.desc Verify SparseArray $_set with zero-width space string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        arr.$_set(0, "\u200B")
        expect(arr.$_get(0)).assertEqual("\u200B")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3300
     * @tc.name testSparseArraySet033
     * @tc.desc Verify SparseArray $_set on consecutive indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 10)
        arr.$_set(1, 20)
        arr.$_set(2, 30)
        expect(arr.length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3400
     * @tc.name testSparseArraySet034
     * @tc.desc Verify SparseArray $_set on sparse non-contiguous indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 10)
        arr.$_set(100, 1000)
        expect(arr.$_get(0)).assertEqual(10)
        expect(arr.$_get(100)).assertEqual(1000)
        expect(arr.$_get(50)).assertUndefined()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3500
     * @tc.name testSparseArraySet035
     * @tc.desc Verify SparseArray $_set overwrites existing index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 10)
        arr.$_set(0, 20)
        expect(arr.$_get(0)).assertEqual(20)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3600
     * @tc.name testSparseArraySet036
     * @tc.desc Verify SparseArray $_set returns void and updates storage
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let result = arr.$_set(0, 42)
        expect(result).assertUndefined()
        expect(arr.$_get(0)).assertEqual(42)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3700
     * @tc.name testSparseArraySet037
     * @tc.desc $_set(1, 14) on [5,6,3], verify index 1 updated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5, 6, 3)
        arr.$_set(1, 14)
        expect(arr[1]).assertEqual(14)
        expect(arr[0]).assertEqual(5)
        expect(arr[2]).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3800
     * @tc.name testSparseArraySet038
     * @tc.desc $_set(1, 12) on [6,2,4], verify index 1 updated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6, 2, 4)
        arr.$_set(1, 12)
        expect(arr[1]).assertEqual(12)
        expect(arr[0]).assertEqual(6)
        expect(arr[2]).assertEqual(4)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_3900
     * @tc.name testSparseArraySet039
     * @tc.desc Verify $_set with negative index (-999) does not write slot 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(-999, 42)
        expect(arr.$_get(0)).assertUndefined()
        expect(arr instanceof SparseArray).assertTrue()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4000
     * @tc.name testSparseArraySet040
     * @tc.desc Verify $_set(-1) on populated array keeps existing slots unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 10)
        arr.$_set(1, 20)
        arr.$_set(-1, 99)
        expect(arr.$_get(0)).assertEqual(10)
        expect(arr.$_get(1)).assertEqual(20)
        expect(arr.length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4100
     * @tc.name testSparseArraySet041
     * @tc.desc Verify SparseArray $_set when index is not int type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        try {
          arr.$_set(("invalid" as Object as int), 42)
          expect().assertFail()
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError")
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4200
     * @tc.name testSparseArraySet042
     * @tc.desc Verify SparseArray $_set on an empty SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        expect(arr.length).assertEqual(0)
        arr.$_set(0, 42)
        expect(arr.$_get(0)).assertEqual(42)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4300
     * @tc.name testSparseArraySet043
     * @tc.desc Verify SparseArray $_set on pre-sized SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        arr.$_set(5, 42)
        expect(arr.$_get(5)).assertEqual(42)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4400
     * @tc.name testSparseArraySet044
     * @tc.desc Verify SparseArray $_set on initialized SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        expect(arr.$_get(1)).assertEqual(2)
        arr.$_set(1, 99)
        expect(arr.$_get(1)).assertEqual(99)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4500
     * @tc.name testSparseArraySet045
     * @tc.desc Verify sparse holes remain undefined between set indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(0, 1)
        arr.$_set(5, 6)
        expect(arr.$_get(0)).assertEqual(1)
        expect(arr.$_get(5)).assertEqual(6)
        expect(arr.$_get(1)).assertUndefined()
        expect(arr.$_get(2)).assertUndefined()
        expect(arr.$_get(3)).assertUndefined()
        expect(arr.$_get(4)).assertUndefined()
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4600
     * @tc.name testSparseArraySet046
     * @tc.desc Verify many consecutive SparseArray $_set operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        for (let i = 0; i < 1000; i++) {
          arr.$_set(i, i * 2)
        }
        expect(arr.length).assertEqual(1000)
        expect(arr.$_get(999)).assertEqual(1998)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4700
     * @tc.name testSparseArraySet047
     * @tc.desc Verify many sparse SparseArray $_set operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(100, 100)
        arr.$_set(1000, 1000)
        arr.$_set(10000, 10000)
        expect(arr.$_get(100)).assertEqual(100)
        expect(arr.$_get(1000)).assertEqual(1000)
        expect(arr.$_get(10000)).assertEqual(10000)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4800
     * @tc.name testSparseArraySet048
     * @tc.desc Verify SparseArray $_set with a large index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(999999, 42)
        expect(arr.$_get(999999)).assertEqual(42)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_4900
     * @tc.name testSparseArraySet049
     * @tc.desc Verify SparseArray $_set with complex nested object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Complex049>()
        const _d049: Complex051Data = { name: "test", tags: ["a", "b"] }
        const _c049: Complex049 = { id: 1, data: _d049 }
        arr.$_set(0, _c049)
        expect(arr.$_get(0)!.data.tags.length).assertEqual(2)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_5000
     * @tc.name testSparseArraySet050
     * @tc.desc Verify $_get reads value after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet050', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.$_set(10, 100)
        expect(arr.$_get(10)).assertEqual(100)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_5100
     * @tc.name testSparseArraySet051
     * @tc.desc Verify SparseArray length after $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet051', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        expect(arr.length).assertEqual(0)
        arr.$_set(5, 42)
        expect(arr.length).assertLarger(5)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_5200
     * @tc.name testSparseArraySet052
     * @tc.desc Verify mixing push and $_set on SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet052', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(1, 2, 3)
        arr.$_set(5, 6)
        expect(arr.$_get(0)).assertEqual(1)
        expect(arr.$_get(5)).assertEqual(6)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_5300
     * @tc.name testSparseArraySet053
     * @tc.desc $_set and $_get byte boundary elements at indices 0 and 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet053', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>()
        arr.$_set(0, 127 as byte)
        arr.$_set(1, (-128 as byte))
        expect(arr.$_get(0)).assertEqual(127 as byte)
        expect(arr.$_get(1)).assertEqual(-128 as byte)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_5400
     * @tc.name testSparseArraySet054
     * @tc.desc $_set stores replacement char and malformed UTF-8-like string literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet054', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        arr.$_set(0, "\uFFFD")
        arr.$_set(1, "\xe4")
        expect(arr.$_get(0)).assertEqual("\uFFFD")
        expect(arr.$_get(1)).assertEqual("\xe4")
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_5500
     * @tc.name testSparseArraySet055
     * @tc.desc $_set stores enum via numeric literal 1 cast to ColorSet055
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet055', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<ColorSet055>()
        arr.$_set(0, ColorSet055.fromValue(1))
        expect(arr.$_get(0)).assertEqual(ColorSet055.Green)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SET_5600
     * @tc.name testSparseArraySet056
     * @tc.desc $_set at index 0x2 stores null element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySet056', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>()
        arr.$_set(0x2, null)
        expect(arr.$_get(0x2)).assertEqual(null)
    });
  });
}
