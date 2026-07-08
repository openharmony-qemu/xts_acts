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


interface Person038 {
    name: string;
    age: int;
  }

export default function SparseArraySpliceTest(): void {
  describe('SparseArraySpliceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0001
     * @tc.name testSparseArraySplice001
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(2);
        expect(result.length).assertEqual(3);
        expect(result[0]).assertEqual(3);
        expect(result[1]).assertEqual(4);
        expect(result[2]).assertEqual(5);

        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0002
     * @tc.name testSparseArraySplice002
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(2, 2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(3);
        expect(result[1]).assertEqual(4);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0003
     * @tc.name testSparseArraySplice003
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, arr.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(2, 2, 100, 200);
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(100);
        expect(arr[3]).assertEqual(200);
        expect(arr[4]).assertEqual(5);


    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0004
     * @tc.name testSparseArraySplice004
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1, 1);
        expect(result instanceof SparseArray).assertTrue();
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(2);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0005
     * @tc.name testSparseArraySplice005
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(2147483647, 1);
        expect(result.length).assertEqual(0);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0006
     * @tc.name testSparseArraySplice006
     * @tc.desc Test SparseArray.splice error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        try {
          const arr = new SparseArray<int>(1, 2, 3);
          const result = arr.splice((null as Object as int), 1);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0007
     * @tc.name testSparseArraySplice007
     * @tc.desc Test SparseArray.splice, verify arr[1] equals 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(10, 20, 30);
      arr.splice(1, 0, 15);
      expect(arr.length).assertEqual(4);
      expect(arr[1]).assertEqual(15);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0008
     * @tc.name testSparseArraySplice008
     * @tc.desc Test SparseArray.splice, verify arr.length equals 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(10, 20, 30);
      const deleted = arr.splice(1, 1);
      expect(deleted.length).assertEqual(1);
      expect(deleted[0]).assertEqual(20);
      expect(arr.length).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0009
     * @tc.name testSparseArraySplice009
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1, 100);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2);
        expect(result[1]).assertEqual(3);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0010
     * @tc.name testSparseArraySplice010
     * @tc.desc Test SparseArray.splice, verify arr[1] equals 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<int>(10, 20, 30);
      arr.splice(0, 2, 5, 6);
      expect(arr[0]).assertEqual(5);
      expect(arr[1]).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0011
     * @tc.name testSparseArraySplice011
     * @tc.desc Test SparseArray.splice, verify deleted[0] equals 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30, 40);
        const deleted = arr.splice(-2, 1);
        expect(deleted[0]).assertEqual(30);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0012
     * @tc.name testSparseArraySplice012
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2);
        expect(result[1]).assertEqual(3);
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0013
     * @tc.name testSparseArraySplice013
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1, undefined);
        expect(result.length).assertEqual(0);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0014
     * @tc.name testSparseArraySplice014
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1, 1, " ", "  ");
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual("b");
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual("a");
        expect(arr[1]).assertEqual(" ");
        expect(arr[2]).assertEqual("  ");
        expect(arr[3]).assertEqual("c");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0015
     * @tc.name testSparseArraySplice015
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1, 1, "\u200B");
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual("b");
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual("a");
        expect(arr[1]).assertEqual("​");
        expect(arr[2]).assertEqual("c");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0016
     * @tc.name testSparseArraySplice016
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1, 1, "<script>alert(1)</script>");
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual("b");
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual("a");
        expect(arr[1]).assertEqual("<script>alert(1)</script>");
        expect(arr[2]).assertEqual("c");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0017
     * @tc.name testSparseArraySplice017
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        expect(arr instanceof SparseArray).assertTrue();
        const longStr = "x".repeat(10000);
        const result = arr.splice(1, 1, longStr);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual("b");
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual("a");
        expect(arr[1]).assertEqual("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        expect(arr[2]).assertEqual("c");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0018
     * @tc.name testSparseArraySplice018
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "b", 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1, 1, 100);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual("b");
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(100);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0019
     * @tc.name testSparseArraySplice019
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "b", 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1, 1, "x");
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual("b");
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual("x");
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0020
     * @tc.name testSparseArraySplice020
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string | null>(1, "b", 3);
        expect(arr instanceof SparseArray).assertTrue();
        const result = arr.splice(1, 1, null);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual("b");
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(null);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0021
     * @tc.name testSparseArraySplice021
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const items: int[] = [100, 200, 300];
        const result = arr.splice(1, 1, ...items);
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(2);
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(100);
        expect(arr[2]).assertEqual(200);
        expect(arr[3]).assertEqual(300);
        expect(arr[4]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0022
     * @tc.name testSparseArraySplice022
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(1, 3);
        expect(deleted.length).assertEqual(3);
        expect(deleted[0]).assertEqual(2);
        expect(deleted[1]).assertEqual(3);
        expect(deleted[2]).assertEqual(4);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0023
     * @tc.name testSparseArraySplice023
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(1, 0, 100);
        expect(deleted.length).assertEqual(0);
        expect(deleted.toString()).assertEqual('');
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(100);
        expect(arr[2]).assertEqual(2);
        expect(arr[3]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0024
     * @tc.name testSparseArraySplice024
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6);
        expect(arr instanceof SparseArray).assertTrue();
        arr[2] = 10;
        arr[4] = 20;
        const deleted = arr.splice(2, 2, 50);
        expect(deleted.length).assertEqual(2);
        expect(deleted[0]).assertEqual(10);
        expect(arr.length).assertEqual(5);
        expect(arr[2]).assertEqual(50);
        expect(arr[3]).assertEqual(20);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0025
     * @tc.name testSparseArraySplice025
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(0, 3);
        expect(deleted.length).assertEqual(3);
        expect(deleted[0]).assertEqual(1);
        expect(deleted[1]).assertEqual(2);
        expect(deleted[2]).assertEqual(3);
        expect(arr.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0026
     * @tc.name testSparseArraySplice026
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(-1, 1);
        expect(deleted.length).assertEqual(1);
        expect(deleted[0]).assertEqual(5);
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);
        expect(arr[3]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0027
     * @tc.name testSparseArraySplice027
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(3, 100);
        expect(deleted.length).assertEqual(2);
        expect(deleted[0]).assertEqual(4);
        expect(deleted[1]).assertEqual(5);
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(2);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0028
     * @tc.name testSparseArraySplice028
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        expect(arr instanceof SparseArray).assertTrue();
        arr[2] = 100;
        arr[5] = 200;
        const deleted = arr.splice(3, 2, 300);
        expect(deleted.length).assertEqual(2);
        expect(arr.length).assertEqual(9);
        expect(arr[2]).assertEqual(100);
        expect(arr[3]).assertEqual(300);
        expect(arr[4]).assertEqual(200);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0029
     * @tc.name testSparseArraySplice029
     * @tc.desc Test SparseArray.splice, verify method result (result.length equals 1, arr[1] equals 99)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.splice(1, 1, 99);
        expect(result.length).assertEqual(1);
        expect(arr[1]).assertEqual(99);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0030
     * @tc.name testSparseArraySplice030
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(0, 0);
        expect(deleted.length).assertEqual(0);
        expect(arr.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0031
     * @tc.name testSparseArraySplice031
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(0, 0, 100, 200);
        expect(deleted.length).assertEqual(0);
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(100);
        expect(arr[1]).assertEqual(200);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0032
     * @tc.name testSparseArraySplice032
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        expect(arr instanceof SparseArray).assertTrue();
        arr[1] = 100;
        arr[3] = 200;
        arr[5] = 300;
        const deleted = arr.splice(1, 5);
        expect(deleted.length).assertEqual(5);
        expect(deleted[0]).assertEqual(100);
        expect(deleted[2]).assertEqual(200);
        expect(deleted[4]).assertEqual(300);
        expect(arr.length).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0033
     * @tc.name testSparseArraySplice033
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(5, 0, 100);
        expect(deleted.length).assertEqual(0);
        expect(arr.length).assertEqual(11);
        expect(arr[5]).assertEqual(100);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0034
     * @tc.name testSparseArraySplice034
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10);
        expect(arr instanceof SparseArray).assertTrue();
        arr[3] = 100;
        const deleted = arr.splice(2, 2, 200);
        expect(deleted.length).assertEqual(2);
        expect(deleted[1]).assertEqual(100);
        expect(arr.length).assertEqual(9);
        expect(arr[2]).assertEqual(200);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0035
     * @tc.name testSparseArraySplice035
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, arr.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5, 6);
        expect(arr instanceof SparseArray).assertTrue();
        arr.splice(0, 2);
        arr.splice(1, 1, 100);
        arr.splice(3, 0, 200);
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(3);
        expect(arr[1]).assertEqual(100);
        expect(arr[2]).assertEqual(5);
        expect(arr[3]).assertEqual(200);
        expect(arr[4]).assertEqual(6);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0036
     * @tc.name testSparseArraySplice036
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c", "d");
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(1, 2, "x", "y");
        expect(deleted.length).assertEqual(2);
        expect(deleted[0]).assertEqual("b");
        expect(deleted[1]).assertEqual("c");
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual("a");
        expect(arr[1]).assertEqual("x");
        expect(arr[2]).assertEqual("y");
        expect(arr[3]).assertEqual("d");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0037
     * @tc.name testSparseArraySplice037
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, deleted.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "b", 3, "d");
        expect(arr instanceof SparseArray).assertTrue();
        const deleted = arr.splice(1, 2, 100, "x");
        expect(deleted.length).assertEqual(2);
        expect(deleted[0]).assertEqual("b");
        expect(deleted[1]).assertEqual(3);
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(100);
        expect(arr[2]).assertEqual("x");
        expect(arr[3]).assertEqual("d");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0038
     * @tc.name testSparseArraySplice038
     * @tc.desc Test SparseArray.splice, verify method result (arr instanceof SparseArray is true, d0 !== null && d0 !== undefined is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Person038>();
      expect(arr instanceof SparseArray).assertTrue();
        arr.push({ name: "Alice", age: 25 });
        arr.push({ name: "Bob", age: 30 });
        const deleted = arr.splice(0, 1, { name: "Charlie", age: 35 });
        const d0 = deleted[0];
        const a0 = arr[0];
        expect(d0 !== null && d0 !== undefined).assertTrue();
        expect(a0 !== null && a0 !== undefined).assertTrue();

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0039
     * @tc.name testSparseArraySplice039
     * @tc.desc Test SparseArray.splice, verify method result (deleted.length equals 100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 1000; i++) {
          arr.push(i);
        }
        const deleted = arr.splice(500, 100);
        expect(deleted.length).assertEqual(100);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0040
     * @tc.name testSparseArraySplice040
     * @tc.desc Test SparseArray.splice, verify method result (arr.length equals 1003)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const items: int[] = [];
        for (let i = 0; i < 1000; i++) {
          items.push(i);
        }
        const deleted = arr.splice(1, 0, ...items);
        expect(arr.length).assertEqual(1003);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0041
     * @tc.name testSparseArraySplice041
     * @tc.desc splice replaces byte element at index 1 with new byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(10 as byte, 20 as byte, 30 as byte);
        const deleted = arr.splice(1, 1, 99 as byte);
        expect(deleted.length).assertEqual(1);
        expect(deleted[0]).assertEqual(20 as byte);
        expect(arr[1]).assertEqual(99 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0042
     * @tc.name testSparseArraySplice042
     * @tc.desc splice inserts float element at index 1 in SparseArray<float>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 3.0f);
        arr.splice(1, 0, 2.0f);
        expect(arr.length).assertEqual(3);
        expect(arr[1]).assertEqual(2.0f);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0043
     * @tc.name testSparseArraySplice043
     * @tc.desc splice at overflow index literal 2147483648 on int array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const deleted = arr.splice((2147483647 as int + 1 as int) as int, 1);
        expect(deleted.length).assertEqual(1);
        expect(deleted[0]).assertEqual(1);
        expect(arr.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_0044
     * @tc.name testSparseArraySplice044
     * @tc.desc splice at byte-boundary int index 0x7F with count 0b1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30, 40, 50);
        const deleted = arr.splice(0x7F as int, 0b1);
        expect(deleted.length).assertEqual(0);
        expect(arr.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_4500
     * @tc.name testSparseArraySplice045
     * @tc.desc splice inserts empty string element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "c");
        const removed = arr.splice(1, 0, "");
        expect(removed.length).assertEqual(0);
        expect(arr[1]).assertEqual("");
        expect(arr.toString()).assertEqual("a,,c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_4600
     * @tc.name testSparseArraySplice046
     * @tc.desc splice on SparseArray<boolean> replaces false with true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        const removed = arr.splice(1, 1, true);
        expect(removed.length).assertEqual(1);
        expect(removed[0]).assertFalse();
        expect(arr[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_4700
     * @tc.name testSparseArraySplice047
     * @tc.desc splice on SparseArray<short> inserts short value without deletion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice047', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(10 as short, 30 as short);
        const removed = arr.splice(1, 0, 20 as short);
        expect(removed.length).assertEqual(0);
        expect(arr[1]).assertEqual(20 as short);
        expect(arr[2]).assertEqual(30 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_4800
     * @tc.name testSparseArraySplice048
     * @tc.desc splice on SparseArray<long> replaces long value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice048', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(1 as long, 10000000000 as long, 3 as long);
        const removed = arr.splice(1, 1, 20000000000 as long);
        expect(removed[0]).assertEqual(10000000000 as long);
        expect(arr[1]).assertEqual(20000000000 as long);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_4900
     * @tc.name testSparseArraySplice049
     * @tc.desc splice on SparseArray<double> replaces double value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice049', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<double>(1.25, 2.5, 3.75);
        const removed = arr.splice(1, 1, 4.5);
        expect(removed[0]).assertEqual(2.5);
        expect(arr[1]).assertEqual(4.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SPLICE_5000
     * @tc.name testSparseArraySplice050
     * @tc.desc splice on SparseArray<char> replaces char value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySplice050', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B', c'C');
        const removed = arr.splice(1, 1, c'Z');
        expect(removed[0]).assertEqual(c'B');
        expect(arr[1]).assertEqual(c'Z');
    });

  });
}
