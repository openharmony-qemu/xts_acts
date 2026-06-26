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

class MyObject003 {
    name: string;
    constructor(name: string) {
      this.name = name;
    }
  }

export default function SparseArrayConstructorNoArgTest(): void {
  describe('SparseArrayConstructorNoArgTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0001
     * @tc.name testSparseArrayConstructorNoArg001
     * @tc.desc Test SparseArray default constructor, verify empty array (arr instanceof SparseArray is true, arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        expect(arr instanceof SparseArray).assertTrue();
        expect(arr.length).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0002
     * @tc.name testSparseArrayConstructorNoArg002
     * @tc.desc Test SparseArray default constructor, verify instance isolation (arr2[0] is undefined, arr1.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr1 = new SparseArray<int>();
        const arr2 = new SparseArray<int>();
        arr1[0] = 10;
        expect(arr2[0]).assertUndefined();
        expect(arr1.length).assertEqual(1);
        expect(arr2.length).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0003
     * @tc.name testSparseArrayConstructorNoArg003
     * @tc.desc Test SparseArray default constructor with object generic, verify assigned element is non-null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<MyObject003>();
        arr[0] = new MyObject003("test");
        const el = arr[0];
        expect(el !== null && el !== undefined).assertTrue();
        expect((el as MyObject003).name).assertEqual("test");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0004
     * @tc.name testSparseArrayConstructorNoArg004
     * @tc.desc Test SparseArray default constructor with union generic, verify int and string assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>();
        arr[0] = 42;
        arr[1] = "hello";
        expect(arr[0]).assertEqual(42);
        expect(arr[1]).assertEqual("hello");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0005
     * @tc.name testSparseArrayConstructorNoArg005
     * @tc.desc Test SparseArray default constructor, verify unassigned indices return undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        expect(arr[0]).assertUndefined();
        expect(arr[100]).assertUndefined();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0006
     * @tc.name testSparseArrayConstructorNoArg006
     * @tc.desc Test SparseArray constructor, verify sparse hole after index assignment (arr.length equals 6, arr[0] is undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[5] = 10;
        expect(arr.length).assertEqual(6);
        expect(arr[0]).assertUndefined();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0007
     * @tc.name testSparseArrayConstructorNoArg007
     * @tc.desc Test SparseArray default constructor, verify $_get on empty array returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const val = arr.$_get(0);
        expect(val).assertUndefined();

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0008
     * @tc.name testSparseArrayConstructorNoArg008
     * @tc.desc Test SparseArray default constructor, verify $_set stores value at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.$_set(0, 100);
        expect(arr[0]).assertEqual(100);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0009
     * @tc.name testSparseArrayConstructorNoArg009
     * @tc.desc Test SparseArray default constructor, verify large index assignment updates length and value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[999999] = 1;
        expect(arr[999999]).assertEqual(1);
        expect(arr.length).assertEqual(1000000);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0010
     * @tc.name testSparseArrayConstructorNoArg010
     * @tc.desc Verify negative index access via bracket and $_get returns undefined without changing length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        expect(arr[-1]).assertUndefined();
        const val = arr.$_get(-1);
        expect(val).assertUndefined();
        expect(arr.length).assertEqual(0);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0011
     * @tc.name testSparseArrayConstructorNoArg011
     * @tc.desc default constructor $_set at index 0x2 stores binary literal 0b11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.$_set(0x2, 0b11);
        expect(arr.$_get(0x2)).assertEqual(0b11);
        expect(arr.length).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0012
     * @tc.name testSparseArrayConstructorNoArg012
     * @tc.desc default constructor SparseArray<boolean> stores boolean values by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>();
        arr[0] = false;
        arr[2] = true;
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertFalse();
        expect(arr[1]).assertUndefined();
        expect(arr[2]).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0013
     * @tc.name testSparseArrayConstructorNoArg013
     * @tc.desc default constructor SparseArray<char> stores char value at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>();
        arr[0] = c'Z';
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(c'Z');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0014
     * @tc.name testSparseArrayConstructorNoArg014
     * @tc.desc default constructor SparseArray<long> stores long value at sparse index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>();
        arr[1] = 10000000000 as long;
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertUndefined();
        expect(arr[1]).assertEqual(10000000000 as long);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_NO_ARG_0015
     * @tc.name testSparseArrayConstructorNoArg015
     * @tc.desc default constructor SparseArray<int|null> stores null element explicitly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructorNoArg015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>();
        arr[0] = null;
        arr[1] = 7;
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(null);
        expect(arr[1]).assertEqual(7);
    });

  });
}
