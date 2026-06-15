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

export default function SparseArrayValuesTest(): void {
  describe('SparseArrayValuesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_0100
     * @tc.name testSparseArrayValues001
     * @tc.desc Test SparseArray.values, verify method result (result!.done equals true, result!.value equals undefined)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        const iterator = arr.values();
        const result = iterator.next();
        expect(result!.done).assertEqual(true);
        expect(result!.value).assertEqual(undefined);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_0200
     * @tc.name testSparseArrayValues002
     * @tc.desc Test SparseArray.values, verify method result (result!.value equals "x", result!.value equals "y")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("x", "y", "z");
        const iterator = arr.values();
        let result = iterator.next();
        expect(result!.value).assertEqual("x");
        result = iterator.next();
        expect(result!.value).assertEqual("y");
        result = iterator.next();
        expect(result!.value).assertEqual("z");
        result = iterator.next();
        expect(result!.done).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_0300
     * @tc.name testSparseArrayValues003
     * @tc.desc Test SparseArray.values, verify method result (result!.value equals "a", result!.value equals "c")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(3);
        arr[0] = "a";
        arr[2] = "c";
        const iterator = arr.values();
        let result = iterator.next();
        expect(result!.value).assertEqual("a");
        result = iterator.next();
        expect(result!.value).assertEqual("c");
        result = iterator.next();
        expect(result!.done).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_0400
     * @tc.name testSparseArrayValues004
     * @tc.desc Test SparseArray.values, verify method result (typeof iterator.next equals "function")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2);
        const iterator = arr.values();
        expect(typeof iterator.next).assertEqual("function");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_0500
     * @tc.name testSparseArrayValues005
     * @tc.desc Test SparseArray.values, verify method result (count equals 1000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr[i] = i;
        }
        const iterator = arr.values();
        let count = 0;
        let result = iterator.next();
        while (!result.done) {
          count++;
          result = iterator.next();
        }
        expect(count).assertEqual(1000);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_0600
     * @tc.name testSparseArrayValues006
     * @tc.desc Test SparseArray.values, verify method result (result!.done equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        const iterator = arr.values();
        const result = iterator.next();
        expect(result!.done).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_0700
     * @tc.name testSparseArrayValues007
     * @tc.desc values on arr[0]=10 arr[1]=undefined: explicit undefined is not yielded (same as hole)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>();
        arr[0] = 10;
        arr[1] = undefined;
        const iterator = arr.values();
        let result = iterator.next();
        expect(result!.value).assertEqual(10);
        expect(result!.done).assertEqual(false);
        result = iterator.next();
        expect(result!.done).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_0800
     * @tc.name testSparseArrayValues008
     * @tc.desc Test SparseArray.values, verify method result (result!.value equals null, result!.value equals "a")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string | null>(null, "a");
        const iterator = arr.values();
        let result = iterator.next();
        expect(result!.value).assertEqual(null);
        result = iterator.next();
        expect(result!.value).assertEqual("a");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_0900
     * @tc.name testSparseArrayValues009
     * @tc.desc Test SparseArray.values, verify method result (result1.value equals "a", result2.value equals "a")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const iter1 = arr.values();
        const iter2 = arr.values();
        const result1 = iter1.next();
        const result2 = iter2.next();
        expect(result1.value).assertEqual("a");
        expect(result2.value).assertEqual("a");
        iter1.next();
        const result3 = iter2.next();
        expect(result3.value).assertEqual("b");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1000
     * @tc.name testSparseArrayValues010
     * @tc.desc Test SparseArray.values, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1);
        const iterator = arr.values();
        const result = iterator.next();
        expect(result.hasOwnProperty("value")).assertTrue();
        expect(result.hasOwnProperty("done")).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1100
     * @tc.name testSparseArrayValues011
     * @tc.desc Test SparseArray.values, verify method result (values.length equals 3, values[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const values: int[] = [];
        const iter = arr.values();
        let step = iter.next();
        while (!step.done) {
          values.push(step.value as int);
          step = iter.next();
        }
        expect(values.length).assertEqual(3);
        expect(values[0]).assertEqual(1);
        expect(values[1]).assertEqual(2);
        expect(values[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1200
     * @tc.name testSparseArrayValues012
     * @tc.desc Test SparseArray.values, verify method result (typeof result.value equals "string")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b");
        const iterator = arr.values();
        let result = iterator.next();
        expect(typeof result.value).assertEqual("string");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1300
     * @tc.name testSparseArrayValues013
     * @tc.desc Test SparseArray.values, verify method result (result!.value instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const inner = new SparseArray<int>(1, 2);
        const outer = new SparseArray<SparseArray<int>>(inner);
        const iterator = outer.values();
        const result = iterator.next();
        expect(result!.value instanceof SparseArray).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1400
     * @tc.name testSparseArrayValues014
     * @tc.desc Test SparseArray.values, verify method result (result!.value equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2);
        const iterator = arr.values();
        iterator.next();
        arr.push(3);
        let result = iterator.next();
        expect(result!.value).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1500
     * @tc.name testSparseArrayValues015
     * @tc.desc Test SparseArray.values, verify method result (result!.value equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const iterator = arr.values();
        arr[0] = 10;
        let result = iterator.next();
        expect(result!.value).assertEqual(10);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1600
     * @tc.name testSparseArrayValues016
     * @tc.desc Test SparseArray.values, verify method result (result!.done equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const iterator = arr.values();
        iterator.next();
        arr.length = 1;
        let result = iterator.next();
        expect(result!.done).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1700
     * @tc.name testSparseArrayValues017
     * @tc.desc Test SparseArray.values, verify method result (result!.done equals false, result!.value equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.push(1);
        const iterator = arr.values();
        iterator.next();
        arr.push(2);
        let result = iterator.next();
        expect(result!.done).assertEqual(false);
        expect(result!.value).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1800
     * @tc.name testSparseArrayValues018
     * @tc.desc Test SparseArray.values, verify method result (result!.value equals 1, result!.done equals true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[100] = 1;
        const iterator = arr.values();
        let result = iterator.next();
        expect(result!.value).assertEqual(1);
        result = iterator.next();
        expect(result!.done).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_1900
     * @tc.name testSparseArrayValues019
     * @tc.desc Test SparseArray.values, verify method result (count equals 10000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 10000; i++) {
          arr[i] = i;
        }
        const iterator = arr.values();
        let count = 0;
        const startTime = Date.now();
        let result = iterator.next();
        while (!result.done) {
          count++;
          result = iterator.next();
        }
        const endTime = Date.now();
        expect(count).assertEqual(10000);
        expect(endTime - startTime).assertLess(1000);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2000
     * @tc.name testSparseArrayValues020
     * @tc.desc Test SparseArray.values, verify method result (count equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000);
        arr[0] = 1;
        arr[9999] = 2;
        const iterator = arr.values();
        let count = 0;
        let result = iterator.next();
        while (!result.done) {
          count++;
          result = iterator.next();
        }
        expect(count).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2100
     * @tc.name testSparseArrayValues021
     * @tc.desc Test SparseArray.values, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20);
        const valIter = arr.values();
        const keyIter = arr.keys();
        expect(valIter.next().value).assertEqual(10);
        expect(keyIter.next().value).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2200
     * @tc.name testSparseArrayValues022
     * @tc.desc Test SparseArray.values, verify method result (v0.done is true, entStep.done is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        const valIter = arr.values();
        const entIter = arr.entries();
        const v0 = valIter.next();
        expect(v0.done).assertTrue();
        const entStep = entIter.next();
        expect(entStep.done).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2300
     * @tc.name testSparseArrayValues023
     * @tc.desc Test SparseArray.values, verify method result (valuesFromMethod.length equals valuesFromDefault.length, valuesFromMethod[i] equals valuesFromDefault[i])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const valuesFromMethod: int[] = [];
        const iterMethod = arr.values();
        let stepM = iterMethod.next();
        while (!stepM.done) {
          const v = stepM.value;
          if (v !== undefined) {
            valuesFromMethod.push(v as int);
          }
          stepM = iterMethod.next();
        }
        const valuesFromDefault: int[] = [];
        arr.forEach((value: int) => {
          valuesFromDefault.push(value);
        });
        expect(valuesFromMethod.length).assertEqual(valuesFromDefault.length);
        for (let i = 0; i < valuesFromMethod.length; i++) {
          expect(valuesFromMethod[i]).assertEqual(valuesFromDefault[i]);
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2400
     * @tc.name testSparseArrayValues024
     * @tc.desc Test SparseArray.values, verify method result (result!.value equals "single", result!.done equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("single");
        const iterator = arr.values();
        let result = iterator.next();
        expect(result!.value).assertEqual("single");
        expect(result!.done).assertEqual(false);
        result = iterator.next();
        expect(result!.value).assertEqual(undefined);
        expect(result!.done).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2500
     * @tc.name testSparseArrayValues025
     * @tc.desc Test SparseArray.values, verify method result (result!.value equals 1, result!.value equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        arr[0] = 1;
        arr[9] = 10;
        const iterator = arr.values();
        let result = iterator.next();
        expect(result!.value).assertEqual(1);
        result = iterator.next();
        expect(result!.value).assertEqual(10);
        result = iterator.next();
        expect(result!.done).assertEqual(true);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2600
     * @tc.name testSparseArrayValues026
     * @tc.desc Test SparseArray.values, verify method result (result!.value equals 5, result!.done equals false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[2] = 5;
        const iterator = arr.values();
        const result = iterator.next();
        expect(result!.value).assertEqual(5);
        expect(result!.done).assertEqual(false);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2700
     * @tc.name testSparseArrayValues027
     * @tc.desc values with hole at index 1: arr[2]=undefined does not create iterable slot (count 1, only arr[0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>();
        arr[0] = 1;
        arr[2] = undefined;
        const iterator = arr.values();
        let count = 0;
        let result = iterator.next();
        while (!result.done) {
          if (count === 0) {
            expect(result!.value).assertEqual(1);
          }
          count++;
          result = iterator.next();
        }
        expect(count).assertEqual(1);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2800
     * @tc.name testSparseArrayValues028
     * @tc.desc values iterator on SparseArray<char> yields char elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B');
        const iterator = arr.values();
        const first = iterator.next();
        expect(first!.value).assertEqual(c'A');
        const second = iterator.next();
        expect(second!.value).assertEqual(c'B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_2900
     * @tc.name testSparseArrayValues029
     * @tc.desc values iterator on SparseArray<short> yields short elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(100 as short, 200 as short);
        const iterator = arr.values();
        expect(iterator.next()!.value).assertEqual(100 as short);
        expect(iterator.next()!.value).assertEqual(200 as short);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_3000
     * @tc.name testSparseArrayValues030
     * @tc.desc values iterator yields null element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string | null>("x", null);
        const it = arr.values();
        expect(it.next().value).assertEqual("x");
        expect(it.next().value).assertEqual(null);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_3100
     * @tc.name testSparseArrayValues031
     * @tc.desc values iterator yields octal 0o5 then binary 0b11 literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0o5, 0b11);
        const it = arr.values();
        expect(it.next().value).assertEqual(0o5);
        expect(it.next().value).assertEqual(0b11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_3200
     * @tc.name testSparseArrayValues032
     * @tc.desc values iterator on SparseArray<boolean> yields false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false);
        const it = arr.values();
        expect(it.next().value).assertTrue();
        expect(it.next().value).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_3300
     * @tc.name testSparseArrayValues033
     * @tc.desc values iterator on SparseArray<byte> yields byte boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>((-128 as byte), 127 as byte);
        const it = arr.values();
        expect(it.next().value).assertEqual(-128 as byte);
        expect(it.next().value).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_3400
     * @tc.name testSparseArrayValues034
     * @tc.desc values iterator on SparseArray<long> yields long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(1 as long, 10000000000 as long);
        const it = arr.values();
        expect(it.next().value).assertEqual(1 as long);
        expect(it.next().value).assertEqual(10000000000 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_3500
     * @tc.name testSparseArrayValues035
     * @tc.desc values iterator on SparseArray<float> yields float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f);
        const it = arr.values();
        expect(it.next().value).assertEqual(1.0f);
        expect(it.next().value).assertEqual(2.5f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_VALUES_3600
     * @tc.name testSparseArrayValues036
     * @tc.desc values iterator on SparseArray<double> yields double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayValues036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<double>(1.25, 2.5);
        const it = arr.values();
        expect(it.next().value).assertEqual(1.25);
        expect(it.next().value).assertEqual(2.5);
    });

  });
}
