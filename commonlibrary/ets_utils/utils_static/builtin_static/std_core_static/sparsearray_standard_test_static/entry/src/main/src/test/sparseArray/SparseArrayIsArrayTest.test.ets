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

class IsArrayPlainObj {
  name: string = '';
}

class IsArrayPlainArrayChild extends Array<int> {
  label: string = 'child';
}

function isArrayProcessSparseArray(arr: Any): void {
  expect(SparseArray.isArray(arr)).assertTrue();
}

export default function SparseArrayIsArrayTest(): void {
  describe('SparseArrayIsArrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_0100
     * @tc.name testSparseArrayIsArray001
     * @tc.desc Verify isArray returns true for new SparseArray instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(new SparseArray<int>())).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_0200
     * @tc.name testSparseArrayIsArray002
     * @tc.desc Verify isArray returns false for plain Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = [] as Array<int>
        const result = SparseArray.isArray(arr)
        expect(result).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_0300
     * @tc.name testSparseArrayIsArray003
     * @tc.desc Verify isArray returns false for number literal 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(100)).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_0400
     * @tc.name testSparseArrayIsArray004
     * @tc.desc Verify isArray returns false for number literal 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(0)).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_0500
     * @tc.name testSparseArrayIsArray005
     * @tc.desc Verify isArray returns false for non-empty string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray("test")).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_0600
     * @tc.name testSparseArrayIsArray006
     * @tc.desc Verify isArray returns false for empty string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray("")).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_0700
     * @tc.name testSparseArrayIsArray007
     * @tc.desc Verify isArray returns false for Unicode string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray("测试")).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_0800
     * @tc.name testSparseArrayIsArray008
     * @tc.desc Verify isArray returns false for boolean true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(true)).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_0900
     * @tc.name testSparseArrayIsArray009
     * @tc.desc Verify isArray returns false for char literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(c'A')).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1000
     * @tc.name testSparseArrayIsArray010
     * @tc.desc Verify isArray returns false for bigint literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(100n)).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1100
     * @tc.name testSparseArrayIsArray011
     * @tc.desc Verify isArray returns false for plain Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(new Object())).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1200
     * @tc.name testSparseArrayIsArray012
     * @tc.desc Verify isArray returns false for custom class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const o = new IsArrayPlainObj()
        o.name = 'test'
        expect(SparseArray.isArray(o)).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1300
     * @tc.name testSparseArrayIsArray013
     * @tc.desc Verify isArray returns false for null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(null)).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1400
     * @tc.name testSparseArrayIsArray014
     * @tc.desc Verify isArray returns false for undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(undefined)).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1500
     * @tc.name testSparseArrayIsArray015
     * @tc.desc Verify isArray returns false for arrow function literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(() => {})).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1600
     * @tc.name testSparseArrayIsArray016
     * @tc.desc Verify isArray returns false for Map instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(new Map<string, int>())).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1700
     * @tc.name testSparseArrayIsArray017
     * @tc.desc Verify isArray returns false for Set instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(new Set<int>())).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1800
     * @tc.name testSparseArrayIsArray018
     * @tc.desc Verify isArray returns false for Date instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(new Date())).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_1900
     * @tc.name testSparseArrayIsArray019
     * @tc.desc Verify isArray returns false for Promise instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(new Promise<void>(() => {}))).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2000
     * @tc.name testSparseArrayIsArray020
     * @tc.desc Verify isArray returns true for SparseArray string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>()
        expect(SparseArray.isArray(arr)).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2100
     * @tc.name testSparseArrayIsArray021
     * @tc.desc Verify isArray returns true for SparseArray object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<object>()
        expect(SparseArray.isArray(arr)).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2200
     * @tc.name testSparseArrayIsArray022
     * @tc.desc Verify isArray returns true for populated SparseArray int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        expect(SparseArray.isArray(arr)).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2300
     * @tc.name testSparseArrayIsArray023
     * @tc.desc Verify isArray returns true for sparse-hole SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[2] = 10
        expect(SparseArray.isArray(arr)).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2400
     * @tc.name testSparseArrayIsArray024
     * @tc.desc Verify isArray return type is boolean true for SparseArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        const result = SparseArray.isArray(arr)
        expect(typeof result).assertEqual('boolean')
        expect(result).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2500
     * @tc.name testSparseArrayIsArray025
     * @tc.desc Verify isArray return type is boolean false for plain Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = [] as Array<int>
        const result = SparseArray.isArray(arr)
        expect(typeof result).assertEqual('boolean')
        expect(result).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2600
     * @tc.name testSparseArrayIsArray026
     * @tc.desc Verify isArray returns false for Infinity NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(Double.POSITIVE_INFINITY)).assertEqual(false)
        expect(SparseArray.isArray(Double.NEGATIVE_INFINITY)).assertEqual(false)
        expect(SparseArray.isArray(Double.NaN)).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2700
     * @tc.name testSparseArrayIsArray027
     * @tc.desc Verify isArray returns false for String Number Boolean wrappers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(String(123))).assertEqual(false)
        expect(SparseArray.isArray(Number("123"))).assertEqual(false)
        expect(SparseArray.isArray(Boolean(1))).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2800
     * @tc.name testSparseArrayIsArray028
     * @tc.desc Verify isArray returns false for Any-typed number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
    */
    it('testSparseArrayIsArray028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const value: Any = 1
        expect(SparseArray.isArray(value)).assertEqual(false)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_2900
     * @tc.name testSparseArrayIsArray029
     * @tc.desc Verify isArray vs Array.isArray on SparseArray and plain Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const sparseArr = new SparseArray<int>()
        const normalArr = [] as Array<int>

        expect(SparseArray.isArray(sparseArr)).assertEqual(true)
        expect(Array.isArray(sparseArr)).assertEqual(false)

        expect(SparseArray.isArray(normalArr)).assertEqual(false)
        expect(Array.isArray(normalArr)).assertEqual(true)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3000
     * @tc.name testSparseArrayIsArray030
     * @tc.desc Verify isArray repeated calls stay stable on the same SparseArray instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const testCount = 10000
        const arr = new SparseArray<int>()
        for (let i = 0; i < testCount; i++) {
          expect(SparseArray.isArray(arr)).assertTrue()
        }
        expect(SparseArray.isArray(arr)).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3100
     * @tc.name testSparseArrayIsArray031
     * @tc.desc Verify isArray used from helper with SparseArray argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const sparseArr = new SparseArray<int>(1, 2, 3)
        expect(sparseArr instanceof SparseArray).assertTrue()
        isArrayProcessSparseArray(sparseArr)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3200
     * @tc.name testSparseArrayIsArray032
     * @tc.desc isArray returns true for SparseArray<byte> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(new SparseArray<byte>(10 as byte, 20 as byte))).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3300
     * @tc.name testSparseArrayIsArray033
     * @tc.desc isArray returns true for SparseArray<long> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(new SparseArray<long>(100 as long))).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3400
     * @tc.name testSparseArrayIsArray034
     * @tc.desc isArray returns true for SparseArray constructed with 0x1 and 0b10 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(SparseArray.isArray(new SparseArray<int>(0x1, 0b10))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3500
     * @tc.name testSparseArrayIsArray035
     * @tc.desc isArray returns false for Array subclass instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new IsArrayPlainArrayChild()
        arr.push(1)
        expect(arr.label).assertEqual('child')
        expect(SparseArray.isArray(arr)).assertEqual(false)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3600
     * @tc.name testSparseArrayIsArray036
     * @tc.desc isArray returns false for Array created by Array.create
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = Array.create<int>(3, 7)
        expect(arr.length).assertEqual(3)
        expect(arr[0]).assertEqual(7)
        expect(SparseArray.isArray(arr)).assertEqual(false)
        expect(Array.isArray(arr)).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3700
     * @tc.name testSparseArrayIsArray037
     * @tc.desc isArray returns false for non-empty plain Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = [1, 2, 3] as Array<int>
        expect(SparseArray.isArray(arr)).assertEqual(false)
        expect(Array.isArray(arr)).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3800
     * @tc.name testSparseArrayIsArray038
     * @tc.desc isArray returns false for nested plain Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const first = [1, 2] as Array<int>
        const second = [3, 4] as Array<int>
        const arr = [first, second] as Array<Array<int>>
        expect(SparseArray.isArray(arr)).assertEqual(false)
        expect(Array.isArray(arr)).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_3900
     * @tc.name testSparseArrayIsArray039
     * @tc.desc isArray returns false for plain Array of objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = [new IsArrayPlainObj(), new IsArrayPlainObj()] as Array<IsArrayPlainObj>
        expect(SparseArray.isArray(arr)).assertEqual(false)
        expect(Array.isArray(arr)).assertEqual(true)
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_IS_ARRAY_4000
     * @tc.name testSparseArrayIsArray040
     * @tc.desc isArray returns false for Array converted from SparseArray elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayIsArray040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const sparseArr = new SparseArray<int>(1, 2, 3)
        const arr = [sparseArr[0], sparseArr[1], sparseArr[2]] as Array<int | undefined>
        expect(SparseArray.isArray(sparseArr)).assertTrue()
        expect(SparseArray.isArray(arr)).assertEqual(false)
        expect(Array.isArray(arr)).assertEqual(true)
    });
  });
}
