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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';


class Test015 {
    value: number = 0;
  }

class Test026 {
    value: number = 0;
  }

export default function SparseArraySliceTest(): void {
  describe('SparseArraySliceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0001
     * @tc.name testSparseArraySlice001
     * @tc.desc Test SparseArray.slice, verify method result (result!.length equals 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.slice();
        expect(result!.length).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0002
     * @tc.name testSparseArraySlice002
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.slice(1);
        expect(result.toString()).assertEqual("2,3,4");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0003
     * @tc.name testSparseArraySlice003
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.slice(1, 3);
        expect(result.toString()).assertEqual("2,3");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0004
     * @tc.name testSparseArraySlice004
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.slice(2);
        expect(result.toString()).assertEqual("3,4,5");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0005
     * @tc.name testSparseArraySlice005
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.slice(0, 2);
        expect(result.toString()).assertEqual("1,2");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0006
     * @tc.name testSparseArraySlice006
     * @tc.desc Test SparseArray.slice, verify method result (result!.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.slice(10);
        expect(result!.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0007
     * @tc.name testSparseArraySlice007
     * @tc.desc Test SparseArray.slice, verify method result (result!.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.slice(1, 1);
        expect(result!.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0008
     * @tc.name testSparseArraySlice008
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.slice(3, 1);
        expect(result.toString()).assertEqual("");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0009
     * @tc.name testSparseArraySlice009
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result = arr.slice(1, 4);
        expect(result.toString()).assertEqual("2,3,4");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0010
     * @tc.name testSparseArraySlice010
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.slice(2);
        expect(result.toString()).assertEqual("3,4");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0011
     * @tc.name testSparseArraySlice011
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;
        arr[4] = 5;
        const result = arr.slice(0, 5);
        expect(result.toString()).assertEqual("1,,3,,5");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0012
     * @tc.name testSparseArraySlice012
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;
        arr[4] = 5;
        const result = arr.slice(1, 4);
        expect(result.toString()).assertEqual(",3,");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0013
     * @tc.name testSparseArraySlice013
     * @tc.desc Test SparseArray.slice, verify method result (result instanceof SparseArray is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.slice(1, 3);
        expect(result instanceof SparseArray).assertTrue();
        expect(result.toString()).assertEqual("2,3");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0014
     * @tc.name testSparseArraySlice014
     * @tc.desc Test SparseArray.slice, verify method result (arr.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4);
        const result = arr.slice(1, 3);
        expect(arr.toString()).assertEqual("1,2,3,4");
        expect(arr.length).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0015
     * @tc.name testSparseArraySlice015
     * @tc.desc Test SparseArray.slice, verify method result (r0 != null is true, a0 != null is true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new SparseArray<Test015>();
        const obj1 = new Test015();
        obj1.value = 1;
        arr.push(obj1);
        const result = arr.slice();
        const r0 = result[0];
        expect(r0 != null).assertTrue();
        (r0 as Test015).value = 2;
        const a0 = arr[0];
        expect(a0 != null).assertTrue();
        expect((a0 as Test015).value).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0016
     * @tc.name testSparseArraySlice016
     * @tc.desc Test SparseArray.slice, verify method result (result!.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.slice(3, 1);
        expect(result!.length).assertEqual(0);
        expect(result.toString()).assertEqual("");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0017
     * @tc.name testSparseArraySlice017
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result1 = arr.slice();
        const result2 = arr.slice(0, arr.length);
        expect(result1.toString()).assertEqual(arr.toString());
        expect(result2.toString()).assertEqual(arr.toString());

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0018
     * @tc.name testSparseArraySlice018
     * @tc.desc Test SparseArray.slice, verify method result (result instanceof SparseArray is true, result.length equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.slice(1, 2);
        expect(result instanceof SparseArray).assertTrue();
        expect(result.length).assertEqual(1);
        expect(result[0]).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0019
     * @tc.name testSparseArraySlice019
     * @tc.desc Test SparseArray.slice, verify method result (firstOpt != null is true, firstOpt as string equals "a")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c");
        const result = arr.slice(0, 2);
        const firstOpt = result[0];
        expect(firstOpt != null).assertTrue();
        expect(firstOpt as string).assertEqual("a");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0020
     * @tc.name testSparseArraySlice020
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result1 = arr.slice(-3, -1);
        expect(result1.toString()).assertEqual("3,4");
        const result2 = arr.slice(-10, 10);
        expect(result2.toString()).assertEqual("1,2,3,4,5");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0021
     * @tc.name testSparseArraySlice021
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.slice(1);
        expect(result.toString()).assertEqual("2,3");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0022
     * @tc.name testSparseArraySlice022
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.slice(1, arr.length);
        expect(result.toString()).assertEqual("2,3");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0023
     * @tc.name testSparseArraySlice023
     * @tc.desc Test SparseArray.slice error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          const result = arr.slice((null as Object as int));
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0024
     * @tc.name testSparseArraySlice024
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1.5, 2.5, 3.5);
        const result = arr.slice(1, 3);
        expect(result.toString()).assertEqual("2.5,3.5");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0025
     * @tc.name testSparseArraySlice025
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>("a", "b", "c", "d");
        const result = arr.slice(1, 3);
        expect(result.toString()).assertEqual("b,c");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0026
     * @tc.name testSparseArraySlice026
     * @tc.desc Test SparseArray.slice, verify method result (result!.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<Test026>();
        arr.push(new Test026());
        arr.push(new Test026());
        const result = arr.slice(0, 2);
        expect(result!.length).assertEqual(2);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0027
     * @tc.name testSparseArraySlice027
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string>(1, "a", 2, "b");
        const result = arr.slice(1, 3);
        expect(result.toString()).assertEqual("a,2");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0028
     * @tc.name testSparseArraySlice028
     * @tc.desc Test SparseArray.slice, verify method result (result3.length equals 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        const result1 = arr.slice();
        expect(result1.toString()).assertEqual(",,,,");
        const result2 = arr.slice(0, 1);
        expect(result2.toString()).assertEqual("");
        const result3 = arr.slice(1);
        expect(result3.length).assertEqual(4);
        expect(result3.toString()).assertEqual(",,,");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0029
     * @tc.name testSparseArraySlice029
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.slice(0, 2147483647);
        expect(result.toString()).assertEqual("1,2,3");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0030
     * @tc.name testSparseArraySlice030
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        const result1 = arr.slice(0, 5);
        const result2 = result1.slice(1, 4);
        const result3 = result2.slice(0, 2);
        expect(result3.toString()).assertEqual("2,3");

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0031
     * @tc.name testSparseArraySlice031
     * @tc.desc Test SparseArray.slice, verify method result (result!.length equals 8000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        for (let i = 0; i < 10000; i++) {
          arr.push(i);
        }
        const result = arr.slice(1000, 9000);
        expect(result!.length).assertEqual(8000);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0032
     * @tc.name testSparseArraySlice032
     * @tc.desc Test SparseArray.slice, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5);
        for (let i = 0; i < 100; i++) {
          const result = arr.slice(1, 4);
          expect(result.toString()).assertEqual("2,3,4");
        }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0033
     * @tc.name testSparseArraySlice033
     * @tc.desc slice on SparseArray<long> returns sub-range of long elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(10000000000 as long, 20000000000 as long, 30000000000 as long);
        const result = arr.slice(1, 3);
        expect(result!.length).assertEqual(2);
        expect(result![0]).assertEqual(20000000000 as long);
        expect(result![1]).assertEqual(30000000000 as long);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0034
     * @tc.name testSparseArraySlice034
     * @tc.desc slice with hex start 0x1 and binary end 0b100 extracts middle range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 2, 3, 4, 5);
        const result = arr.slice(0x1, 0b100);
        expect(result!.length).assertEqual(3);
        expect(result![0]).assertEqual(1);
        expect(result![2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0035
     * @tc.name testSparseArraySlice035
     * @tc.desc slice with end index -1 excludes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const part = arr.slice(0, -1);
        expect(part.length).assertEqual(2);
        expect(part[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0036
     * @tc.name testSparseArraySlice036
     * @tc.desc slice on SparseArray<boolean> preserves false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true);
        const result = arr.slice(1, 3);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertFalse();
        expect(result[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0037
     * @tc.name testSparseArraySlice037
     * @tc.desc slice on SparseArray<byte> returns byte boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(0 as byte, (-128 as byte), 127 as byte);
        const result = arr.slice(1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(-128 as byte);
        expect(result[1]).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0038
     * @tc.name testSparseArraySlice038
     * @tc.desc slice on SparseArray<short> returns selected short values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(10 as short, 20 as short, 30 as short);
        const result = arr.slice(0, 2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(10 as short);
        expect(result[1]).assertEqual(20 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0039
     * @tc.name testSparseArraySlice039
     * @tc.desc slice on SparseArray<float> returns float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f, 3.0f);
        const result = arr.slice(1, 3);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(2.5f);
        expect(result[1]).assertEqual(3.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0040
     * @tc.name testSparseArraySlice040
     * @tc.desc slice on SparseArray<double> returns double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<double>(1.25, 2.5, 3.75);
        const result = arr.slice(0, 2);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(1.25);
        expect(result[1]).assertEqual(2.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_SLICE_0041
     * @tc.name testSparseArraySlice041
     * @tc.desc slice on SparseArray<char> returns selected char elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArraySlice041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B', c'C');
        const result = arr.slice(1);
        expect(result.length).assertEqual(2);
        expect(result[0]).assertEqual(c'B');
        expect(result[1]).assertEqual(c'C');
    });

  });
}
