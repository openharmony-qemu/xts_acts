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

class Person008 {
    name: string = "";
  }

export default function SparseArrayConstructorTest(): void {
  describe('SparseArrayConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_0100
     * @tc.name testSparseArrayConstructor001
     * @tc.desc Constructor with valid lengths and overflow bounds, verify length and instanceof
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr1 = new SparseArray<int>(1);
        expect(arr1.length).assertEqual(1);
        const arr2 = new SparseArray<int>(10000);
        expect(arr2.length).assertEqual(10000);
        const arr3 = new SparseArray<int>((2147483647 + 1) as int);
        expect(arr3 instanceof SparseArray).assertTrue();
        expect(arr3.length).assertEqual(0);
        const arr4 = new SparseArray<int>((-2147483648 - 1) as int);
        expect(arr4 instanceof SparseArray).assertTrue();
        expect(arr4.length).assertEqual(2147483647);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_0200
     * @tc.name testSparseArrayConstructor002
     * @tc.desc Constructor with hex and binary numeric literals, verify length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arrHex = new SparseArray<int>(0x1234);
        expect(arrHex.length).assertEqual(4660);
        const arrBin = new SparseArray<int>(0b1010);
        expect(arrBin.length).assertEqual(10);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_0300
     * @tc.name testSparseArrayConstructor003
     * @tc.desc Test SparseArray constructor with (-2147483648), verify length and elements (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-2147483648);
        expect(arr.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_0400
     * @tc.name testSparseArrayConstructor004
     * @tc.desc Test SparseArray.constructor rejects invalid length types with ClassCastError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr1 = new SparseArray<int>(("" as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
        try {
          const arr2 = new SparseArray<int>((null as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
        try {
          const arr3 = new SparseArray<int>((undefined as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
        try {
          const arr4 = new SparseArray<int>(("invalid" as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_0500
     * @tc.name testSparseArrayConstructor005
     * @tc.desc Constructor with 0 and -1, verify length coerced to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(0);
        expect(arr.length).assertEqual(0);
        const arrNeg = new SparseArray<int>(-1);
        expect(arrNeg.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_0600
     * @tc.name testSparseArrayConstructor006
     * @tc.desc Constructor length 5, verify instance metadata and undefined sparse slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(5);
        expect(arr !== null && arr !== undefined).assertTrue();
        expect(arr instanceof SparseArray).assertTrue();
        expect(arr instanceof Array).assertFalse();
        expect(typeof arr).assertEqual("object");
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(undefined);
        expect(arr[1]).assertEqual(undefined);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_0700
     * @tc.name testSparseArrayConstructor007
     * @tc.desc Test SparseArray constructor with length 10, verify sparse length and slot assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        expect(arr.length).assertEqual(10);
        arr[5] = 42;
        expect(arr[5]).assertEqual(42);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_0800
     * @tc.name testSparseArrayConstructor008
     * @tc.desc Test SparseArray constructor with different generic types, verify length equals 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        expect(new SparseArray<int>(5).length).assertEqual(5);
        expect(new SparseArray<string>(5).length).assertEqual(5);
        expect(new SparseArray<Person008>(5).length).assertEqual(5);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_0900
     * @tc.name testSparseArrayConstructor009
     * @tc.desc Test SparseArray constructor with (2147483647), verify length and elements (arr.length equals 2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2147483647);
        expect(arr.length).assertEqual(2147483647);
    
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_1000
     * @tc.name testSparseArrayConstructor010
     * @tc.desc length constructor SparseArray<float> stores float elements by index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(2);
        arr[0] = 1.5f;
        arr[1] = 2.5f;
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(1.5f);
        expect(arr[1]).assertEqual(2.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_CONSTRUCTOR_1100
     * @tc.name testSparseArrayConstructor011
     * @tc.desc constructor length 0o10 creates SparseArray with length 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayConstructor011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0o10);
        expect(arr.length).assertEqual(8);
        arr[0x7] = 99;
        expect(arr[0x7]).assertEqual(99);
    });

  });
}
