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

/** 将多层嵌套的 SparseArray 作为 T=int|SparseArray<int> 的元素写入（push 仅接受该联合，不接受更深泛型）。 */
function pushNestedElement(arr: SparseArray<int | SparseArray<int>>, nested: SparseArray<int | SparseArray<int>>): void {
  arr.push(nested as int | SparseArray<int>);
}

function makeNestedArr(): SparseArray<int | SparseArray<int>> {
  const inner = new SparseArray<int>(44, 55, 66);
  const arr = new SparseArray<int | SparseArray<int>>(1);
  arr.push(1, 3, 5);
  arr.push(inner);
  return arr;
}

export default function SparseArrayFlatTest(): void {
  describe('SparseArrayFlatTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_0100
     * @tc.name testSparseArrayFlat001
     * @tc.desc Test SparseArray.flat, verify method result (res instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        const res = arr.flat();
        expect(res instanceof SparseArray).assertTrue();
        expect(res.toString()).assertEqual('1,3,5,44,55,66');
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_0200
     * @tc.name testSparseArrayFlat002
     * @tc.desc Test SparseArray.flat(2), verify result type and flattened values; ArkTS-Sta flat 仅支持可选 depth:int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        const res = arr.flat(2);
        expect(res instanceof SparseArray).assertTrue();
        expect(res.toString()).assertEqual('1,3,5,44,55,66');
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_0300
     * @tc.name testSparseArrayFlat003
     * @tc.desc Test SparseArray.flat, verify method result (arr.length equals 5, res0.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        const res0 = arr.flat(0);
        const res1 = arr.flat(1);
        const res2 = arr.flat(2);
        expect(arr.length).assertEqual(5);
        expect(res0.length).assertEqual(4);
        expect(res1.toString()).assertEqual('1,3,5,44,55,66');
        expect(res2.toString()).assertEqual('1,3,5,44,55,66');
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_0400
     * @tc.name testSparseArrayFlat004
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          arr.flat((Number.MIN_VALUE as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_0500
     * @tc.name testSparseArrayFlat005
     * @tc.desc Test SparseArray.flat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        const res = arr.flat(2147483647);
        expect(res.toString()).assertEqual('1,3,5,44,55,66');
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_0600
     * @tc.name testSparseArrayFlat006
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          arr.flat((null as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_0700
     * @tc.name testSparseArrayFlat007
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          arr.flat((undefined as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_0800
     * @tc.name testSparseArrayFlat008
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          arr.flat(('2' as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_0900
     * @tc.name testSparseArrayFlat009
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          arr.flat((1.5 as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1000
     * @tc.name testSparseArrayFlat010
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          arr.flat(({} as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1100
     * @tc.name testSparseArrayFlat011
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          const badDepth = ([1, 2] as Object as int);
          arr.flat(badDepth);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1200
     * @tc.name testSparseArrayFlat012
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          arr.flat((Double.NaN as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1300
     * @tc.name testSparseArrayFlat013
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          arr.flat((Double.POSITIVE_INFINITY as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1400
     * @tc.name testSparseArrayFlat014
     * @tc.desc Test SparseArray.flat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner2 = new SparseArray<int>(7, 8, 9);
        const inner1 = new SparseArray<int | SparseArray<int>>();
        inner1.push(4);
        inner1.push(5);
        inner1.push(inner2);
        const arr = new SparseArray<int | SparseArray<int>>();
        arr.push(1);
        arr.push(2);
        arr.push(3);
        pushNestedElement(arr, inner1);
        const res1 = arr.flat(1);
        const res2 = arr.flat(2);
        expect(res1.length).assertLarger(3);
        expect(res2.toString()).assertEqual('1,2,3,4,5,7,8,9');
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1500
     * @tc.name testSparseArrayFlat015
     * @tc.desc Test SparseArray constructor with (44, 55, 66), verify length and elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | SparseArray<int>>(5);
        arr[1] = 1;
        const inner = new SparseArray<int>(44, 55, 66);
        arr[3] = inner;
        const res = arr.flat<int>(1);
        expect(res.$_get(0)).assertEqual(1);
        expect(res.$_get(1)).assertEqual(44);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1600
     * @tc.name testSparseArrayFlat016
     * @tc.desc Test SparseArray.flat, verify method result (res.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | SparseArray<int>>();
        const res = arr.flat(1);
        expect(res.length).assertEqual(0);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1700
     * @tc.name testSparseArrayFlat017
     * @tc.desc Test SparseArray.flat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const res = arr.flat(1);
        expect(res.toString()).assertEqual('1,2,3,4,5');
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1800
     * @tc.name testSparseArrayFlat018
     * @tc.desc Test SparseArray.flat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        const res = arr.flat(2);
        expect((typeof res[0] == 'int')).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_1900
     * @tc.name testSparseArrayFlat019
     * @tc.desc Test SparseArray.flat, verify method result (arr.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        const before = arr.toString();
        const res = arr.flat(2);
        expect(arr.length).assertEqual(5);
        expect(arr.toString()).assertEqual(before);
        expect(res.toString()).assertEqual('1,3,5,44,55,66');
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2000
     * @tc.name testSparseArrayFlat020
     * @tc.desc Test SparseArray.flat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner3 = new SparseArray<int>(7, 8, 9);
        const inner2 = new SparseArray<int | SparseArray<int>>();
        inner2.push(4);
        inner2.push(5);
        inner2.push(inner3);
        const inner1 = new SparseArray<int | SparseArray<int>>();
        inner1.push(2);
        inner1.push(3);
        pushNestedElement(inner1, inner2);
        const arr = new SparseArray<int | SparseArray<int>>();
        arr.push(1);
        pushNestedElement(arr, inner1);
        const res = arr.flat(10);
        expect(res.toString()).assertEqual('1,2,3,4,5,7,8,9');
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2100
     * @tc.name testSparseArrayFlat021
     * @tc.desc Test SparseArray.flat, verify method result (res.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner = new SparseArray<int>(44, 55, 66);
        const arr = new SparseArray<double | SparseArray<int>>();
        arr.push(1.1, 2.2);
        arr.push(inner);
        const res = arr.flat<double>(1);
        expect(res.length).assertEqual(5);
        expect(res.$_get(0)).assertEqual(1.1);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2200
     * @tc.name testSparseArrayFlat022
     * @tc.desc Test SparseArray.flat, verify method result (res instanceof SparseArray is true, res.length equals res0.length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        const res = arr.flat(-1);
        const res0 = arr.flat(0);
        expect(res instanceof SparseArray).assertTrue();
        expect(res.length).assertEqual(res0.length);
        expect(res.toString()).assertEqual(res0.toString());
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2300
     * @tc.name testSparseArrayFlat023
     * @tc.desc Test SparseArray.flat error path, verify expected exception is thrown (res !== null && res !== undefined is true, assertFail is triggered)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = makeNestedArr();
        try {
          arr.flat((false as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2400
     * @tc.name testSparseArrayFlat024
     * @tc.desc Test SparseArray.flat, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner = new SparseArray<string>('a', 'b', 'c');
        const arr = new SparseArray<double | SparseArray<string>>();
        arr.push(1, 2);
        arr.push(inner);
        const res = arr.flat<double | string>(1);
        expect((res.$_get(2) as string)).assertEqual('a');
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2500
     * @tc.name testSparseArrayFlat025
     * @tc.desc Test SparseArray.flat, verify method result (res.length equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner = new SparseArray<int>();
        for (let i = 0; i < 100; i++) {
          inner.push(i);
        }
        const arr = new SparseArray<int | SparseArray<int>>();
        for (let i = 0; i < 10; i++) {
          arr.push(inner);
        }
        const res = arr.flat(1);
        expect(res.length).assertEqual(1000);
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2600
     * @tc.name testSparseArrayFlat026
     * @tc.desc Test SparseArray.flat, verify method result (res instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | SparseArray<int>>();
        let current: SparseArray<int | SparseArray<int>> = new SparseArray<int | SparseArray<int>>();
        pushNestedElement(arr, current);
        for (let i = 0; i < 20; i++) {
          const next = new SparseArray<int | SparseArray<int>>();
          pushNestedElement(current, next);
          current = next;
        }
        const res = arr.flat(20);
        expect(res instanceof SparseArray).assertTrue();
    
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2700
     * @tc.name testSparseArrayFlat027
     * @tc.desc flat depth 1 flattens nested SparseArray<float> into float elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner = new SparseArray<float>(1.0f, 2.5f);
        const arr = new SparseArray<float | SparseArray<float>>();
        arr.push(inner as float | SparseArray<float>);
        const res = arr.flat(1);
        expect(res.length).assertEqual(2);
        expect((res[0] as float)).assertEqual(1.0f);
        expect((res[1] as float)).assertEqual(2.5f);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2800
     * @tc.name testSparseArrayFlat028
     * @tc.desc flat depth 1 on nested array containing null inner SparseArray slot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner = new SparseArray<int>(1, 2);
        const arr = new SparseArray<int | SparseArray<int> | null>(inner, null, 9);
        const res = arr.flat<int | null>(1);
        expect(res.length).assertEqual(4);
        expect((res[0] as int)).assertEqual(1);
        expect((res[1] as int)).assertEqual(2);
        expect((res[2] as int | null)).assertEqual(null);
        expect((res[3] as int)).assertEqual(9);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_2900
     * @tc.name testSparseArrayFlat029
     * @tc.desc flat empty nested SparseArray<int> yields zero-length result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const emptyInner = new SparseArray<int>();
        const arr = new SparseArray<SparseArray<int>>();
        arr.push(emptyInner);
        const res = arr.flat(1);
        expect(res.length).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_3000
     * @tc.name testSparseArrayFlat030
     * @tc.desc flat depth 1 flattens 2x2 nested SparseArray<int> matrix to four ints
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const row0 = new SparseArray<int>(1, 2);
        const row1 = new SparseArray<int>(3, 4);
        const matrix = new SparseArray<SparseArray<int>>();
        matrix.push(row0);
        matrix.push(row1);
        const flat = matrix.flat(1);
        expect(flat.length).assertEqual(4);
        expect((flat[0] as int)).assertEqual(1);
        expect((flat[2] as int)).assertEqual(3);
        expect((flat[3] as int)).assertEqual(4);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_FLAT_3100
     * @tc.name testSparseArrayFlat031
     * @tc.desc flat depth 1 flattens nested row with 0xA and 0b101 literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayFlat031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const row = new SparseArray<int>(0xA, 0b101);
        const matrix = new SparseArray<SparseArray<int>>();
        matrix.push(row);
        const flat = matrix.flat(1);
        expect(flat.length).assertEqual(2);
        expect((flat[0] as int)).assertEqual(0xA);
        expect((flat[1] as int)).assertEqual(0b101);
    });

  });
}
