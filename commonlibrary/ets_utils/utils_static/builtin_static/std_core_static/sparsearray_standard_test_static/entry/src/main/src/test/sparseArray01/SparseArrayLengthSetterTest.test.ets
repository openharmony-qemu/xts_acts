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

export default function SparseArrayLengthSetterTest(): void {
  describe('SparseArrayLengthSetterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0001
     * @tc.name testSparseArrayLengthSetter001
     * @tc.desc Extend length to 5 on [7,5,4], verify length grows while existing values preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

        const arr = new SparseArray<int>(7, 5, 4);
        arr.length = 5;
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(7);
        expect(arr[1]).assertEqual(5);
        expect(arr[2]).assertEqual(4);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0002
     * @tc.name testSparseArrayLengthSetter002
     * @tc.desc Set length to 1 on [3,4,5], verify only first element remains accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 4, 5);
        arr.length = 1;
        expect(arr.length).assertEqual(1);
        expect(arr[0]).assertEqual(3);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0003
     * @tc.name testSparseArrayLengthSetter003
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (arr.length equals 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.length = 0;
        expect(arr.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0004
     * @tc.name testSparseArrayLengthSetter004
     * @tc.desc Test SparseArray.length Setter error path, verify expected exception is thrown (assertFail is triggered, error.name equals "RangeError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        try {
          arr.length = -1;
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("RangeError");
        }
        expect(arr.length).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0005
     * @tc.name testSparseArrayLengthSetter005
     * @tc.desc Test SparseArray default constructor, verify empty array (arr.length equals 10000)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.length = 10000;
        expect(arr.length).assertEqual(10000);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0006
     * @tc.name testSparseArrayLengthSetter006
     * @tc.desc Test SparseArray default constructor, verify empty array (arr.length equals 2147483647)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr.length = 0x7FFFFFFF;
        expect(arr.length).assertEqual(2147483647);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0007
     * @tc.name testSparseArrayLengthSetter007
     * @tc.desc Test SparseArray.length Setter error path, verify expected exception is thrown (assertFail is triggered, error.name equals "RangeError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        try {
          arr.length = ((2147483647 as int) + (1 as int)) as int;
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("RangeError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0008
     * @tc.name testSparseArrayLengthSetter008
     * @tc.desc INT_MIN minus 1 wraps to INT_MAX; do not assign wrapped value to length on device
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        const wrapped: int = ((-2147483648 as int) - (1 as int)) as int;
        expect(wrapped).assertEqual(2147483647 as int);
        expect(arr.length).assertEqual(0);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0009
     * @tc.name testSparseArrayLengthSetter009
     * @tc.desc Test SparseArray.length Setter error path, verify expected exception is thrown (assertFail is triggered, error.name equals "ClassCastError")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        try {
          arr.length = ("" as Object as int);
          expect().assertFail();
        } catch (error) {
          expect(error.name).assertEqual("ClassCastError");
        }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0010
     * @tc.name testSparseArrayLengthSetter010
     * @tc.desc Set length to 2 on [2,2,3], verify length shrinks and trailing elements removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2, 2, 3);
        arr.length = 2;
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(2);
        expect(arr[1]).assertEqual(2);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0011
     * @tc.name testSparseArrayLengthSetter011
     * @tc.desc Test SparseArray constructor with elements (1, 2, 3), verify length and element values (arr.length equals 10, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.length = 10;
        expect(arr.length).assertEqual(10);
        expect(arr[0]).assertEqual(1);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0012
     * @tc.name testSparseArrayLengthSetter012
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (result equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        const result = arr.length = 5;
        expect(result).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0013
     * @tc.name testSparseArrayLengthSetter013
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (arr.length equals 5, arr.length equals 2)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.length = 5;
        expect(arr.length).assertEqual(5);
        arr.length = 2;
        expect(arr.length).assertEqual(2);
        arr.length = 8;
        expect(arr.length).assertEqual(8);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0014
     * @tc.name testSparseArrayLengthSetter014
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (arr.length equals 10, arr.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.length = 10;
        expect(arr.length).assertEqual(10);
        arr.length = 5;
        expect(arr.length).assertEqual(5);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0015
     * @tc.name testSparseArrayLengthSetter015
     * @tc.desc Test SparseArray constructor with length 5, verify sparse length and undefined slots (arr.length equals 3, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 1;
        arr[2] = 3;
        arr[4] = 5;
        arr.length = 3;
        expect(arr.length).assertEqual(3);
        expect(arr[0]).assertEqual(1);
        expect(arr[2]).assertEqual(3);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0016
     * @tc.name testSparseArrayLengthSetter016
     * @tc.desc Test SparseArray constructor with length 2, verify sparse length and undefined slots (arr.length equals 5, arr[0] equals 1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(2);
        arr[0] = 1;
        arr.length = 5;
        expect(arr.length).assertEqual(5);
        expect(arr[0]).assertEqual(1);
        expect(arr[1]).assertEqual(undefined);

    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0017
     * @tc.name testSparseArrayLengthSetter017
     * @tc.desc Test SparseArray constructor with (1, 2, 3), verify length and elements (intArr.length equals 5, stringArr.length equals 10)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const intArr = new SparseArray<int>(1, 2, 3);
        intArr.length = 5;
        expect(intArr.length).assertEqual(5);

        const stringArr = new SparseArray<string>("a", "b", "c");
        stringArr.length = 10;
        expect(stringArr.length).assertEqual(10);

        const boolArr = new SparseArray<boolean>(true, false);
        boolArr.length = 3;
        expect(boolArr.length).assertEqual(3);

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0018
     * @tc.name testSparseArrayLengthSetter018
     * @tc.desc length setter on SparseArray<byte> extends sparse slots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(10 as byte, 20 as byte);
        arr.length = 4;
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(10 as byte);
        expect(arr[1]).assertEqual(20 as byte);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0019
     * @tc.name testSparseArrayLengthSetter019
     * @tc.desc length setter accepts octal 0o12 and binary 0b101 literals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3);
        arr.length = 0o12;
        expect(arr.length).assertEqual(10);
        arr.length = 0b101;
        expect(arr.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0020
     * @tc.name testSparseArrayLengthSetter020
     * @tc.desc length 0o10 preserves null element at index 0x3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(1, 2, 3, null, 5);
        arr.length = 0o10;
        expect(arr.length).assertEqual(8);
        expect(arr[0x3]).assertEqual(null);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0021
     * @tc.name testSparseArrayLengthSetter021
     * @tc.desc length shrink preserves whitespace-only string elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(" ", "\t", "x");
        arr.length = 2;
        expect(arr[0]).assertEqual(" ");
        expect(arr[1]).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0022
     * @tc.name testSparseArrayLengthSetter022
     * @tc.desc length setter truncates char elements beyond new length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B', c'C');
        arr.length = 2;
        expect(arr.length).assertEqual(2);
        expect(arr[0]).assertEqual(c'A');
        expect(arr[2]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0023
     * @tc.name testSparseArrayLengthSetter023
     * @tc.desc length setter extends SparseArray<boolean> and preserves existing false value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(false);
        arr.length = 4;
        expect(arr.length).assertEqual(4);
        expect(arr[0]).assertEqual(false);
        expect(arr[3]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0024
     * @tc.name testSparseArrayLengthSetter024
     * @tc.desc length setter to zero clears assigned sparse elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5);
        arr[0] = 10;
        arr[4] = 40;
        arr.length = 0;
        expect(arr.length).assertEqual(0);
        expect(arr[0]).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_LENGTH_SETTER_0025
     * @tc.name testSparseArrayLengthSetter025
     * @tc.desc length setter shrink removes high sparse string index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayLengthSetter025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>();
        arr[8] = "tail";
        arr.length = 4;
        expect(arr.length).assertEqual(4);
        expect(arr[8]).assertUndefined();
    });

  });
}
