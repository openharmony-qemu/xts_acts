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
import Utils from './../Util.test';

class Item010 {
  value: int = 0;
  constructor(v: int) { this.value = v; }
}

class ComboObjarr {
  id: int = 1;
}

export default function ReadonlyArraySliceTest(): void {
  describe('ReadonlyArraySliceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0010
     * @tc.name testReadonlyArraySlice001
     * @tc.desc Verify ReadonlyArray.slice behavior: slice parameter returns shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(1);
      expect(result[4]).assertEqual(5);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0020
     * @tc.name testReadonlyArraySlice002
     * @tc.desc Verify ReadonlyArray.slice behavior: slice start passing start parameter returns start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(2);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0030
     * @tc.name testReadonlyArraySlice003
     * @tc.desc Verify ReadonlyArray.slice behavior: slice start, end passing parameter returns start end before
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(1, 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(4);
      expect(result === values).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0040
     * @tc.name testReadonlyArraySlice004
     * @tc.desc Verify ReadonlyArray.slice behavior: start=0 end before
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const result = values.slice(0, 3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(10);
      expect(result[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0050
     * @tc.name testReadonlyArraySlice005
     * @tc.desc Verify ReadonlyArray.slice behavior: start length when returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.slice(3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0060
     * @tc.name testReadonlyArraySlice006
     * @tc.desc Verify ReadonlyArray.slice behavior: start length when returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.slice(10);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0070
     * @tc.name testReadonlyArraySlice007
     * @tc.desc Verify ReadonlyArray.slice behavior: start is when length + start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(-2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0080
     * @tc.name testReadonlyArraySlice008
     * @tc.desc Verify ReadonlyArray.slice behavior: start length when index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.slice(-10);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0090
     * @tc.name testReadonlyArraySlice009
     * @tc.desc Verify ReadonlyArray.slice behavior: start passing null 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.slice(undefined, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0100
     * @tc.name testReadonlyArraySlice010
     * @tc.desc Verify ReadonlyArray.slice behavior: end=0 when returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(0, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0110
     * @tc.name testReadonlyArraySlice011
     * @tc.desc Verify ReadonlyArray.slice behavior: end length when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(2, 5);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0120
     * @tc.name testReadonlyArraySlice012
     * @tc.desc Verify ReadonlyArray.slice behavior: end length when
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(2, 100);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0130
     * @tc.name testReadonlyArraySlice013
     * @tc.desc Verify ReadonlyArray.slice behavior: end is when length + end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(1, -1);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(2);
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0140
     * @tc.name testReadonlyArraySlice014
     * @tc.desc Verify ReadonlyArray.slice behavior: end start when returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(3, 1);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0150
     * @tc.name testReadonlyArraySlice015
     * @tc.desc Verify ReadonlyArray.slice behavior: start=1, end=3 returns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const result = values.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0160
     * @tc.name testReadonlyArraySlice016
     * @tc.desc Verify ReadonlyArray.slice behavior: start end is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(-2, -1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0170
     * @tc.name testReadonlyArraySlice017
     * @tc.desc Verify ReadonlyArray.slice behavior: start end returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(4, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0180
     * @tc.name testReadonlyArraySlice018
     * @tc.desc Verify ReadonlyArray.slice behavior: calling without parameters slice returns original array shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.slice();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0190
     * @tc.name testReadonlyArraySlice019
     * @tc.desc Verify ReadonlyArray.slice behavior: passing start parameter returns start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(4);
      expect(result[1]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0200
     * @tc.name testReadonlyArraySlice020
     * @tc.desc Verify ReadonlyArray.slice behavior: empty array slice returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [];
      const result = values.slice();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0210
     * @tc.name testReadonlyArraySlice021
     * @tc.desc Verify ReadonlyArray.slice behavior: element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [42];
      const result1 = values.slice();
      expect(result1.length).assertEqual(1);
      expect(result1[0]).assertEqual(42);
      const result2 = values.slice(0);
      expect(result2.length).assertEqual(1);
      const result3 = values.slice(0, 1);
      expect(result3.length).assertEqual(1);
      const result4 = values.slice(1);
      expect(result4.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0220
     * @tc.name testReadonlyArraySlice022
     * @tc.desc Verify ReadonlyArray.slice behavior: string type ReadonlyArray slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["a", "b", "c", "d"];
      const result = values.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("b");
      expect(result[1]).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0230
     * @tc.name testReadonlyArraySlice023
     * @tc.desc Verify ReadonlyArray.slice behavior: double type ReadonlyArray slice
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<double> = [1.1, 2.2, 3.3, 4.4];
      const result = values.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertClose(2.2, 0.001);
      expect(result[1]).assertClose(3.3, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0240
     * @tc.name testReadonlyArraySlice024
     * @tc.desc Verify ReadonlyArray.slice behavior: verify result element is end - start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      const result = values.slice(3, 7);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
      expect(result[2]).assertEqual(5);
      expect(result[3]).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0250
     * @tc.name testReadonlyArraySlice025
     * @tc.desc Verify ReadonlyArray.slice behavior: slice returns new array original array reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.slice();
      expect(result !== values).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0260
     * @tc.name testReadonlyArraySlice026
     * @tc.desc Verify ReadonlyArray.slice behavior: modifying returns does not affect original array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original: Array<int> = [1, 2, 3];
      const readonlyArr: ReadonlyArray<int> = original;
      const result = readonlyArr.slice();
      result[0] = 999;
      expect(original[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0270
     * @tc.name testReadonlyArraySlice027
     * @tc.desc Verify ReadonlyArray.slice behavior: result element and original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const result = values.slice(1, 4);
      expect(result[0]).assertEqual(values[1]);
      expect(result[1]).assertEqual(values[2]);
      expect(result[2]).assertEqual(values[3]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0280
     * @tc.name testReadonlyArraySlice028
     * @tc.desc Verify ReadonlyArray.slice behavior: reference type element slice shallow copy reference same
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Item010 = new Item010(42);
      const values: ReadonlyArray<Item010> = [obj];
      const result = values.slice();
      expect(result[0] === values[0]).assertTrue();
      expect(result[0].value).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0290
     * @tc.name testReadonlyArraySlice029
     * @tc.desc Verify ReadonlyArray.slice behavior: slice returns type is Array<T> element modifying
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result: Array<int> = values.slice();
      expect(result.length).assertEqual(3);
      result.push(4);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0300
     * @tc.name testReadonlyArraySlice030
     * @tc.desc Verify ReadonlyArray.slice behavior: returns element type and ReadonlyArray generic type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<string> = ["hello", "world"];
      const result: Array<string> = values.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0310
     * @tc.name testReadonlyArraySlice031
     * @tc.desc Verify ReadonlyArray.slice behavior: is empty when returns empty array length=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0320
     * @tc.name testReadonlyArraySlice032
     * @tc.desc Verify ReadonlyArray.slice behavior: element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: Array<int> = [];
      for (let i = 0; i < 10000; i++) {
        values.push(i);
      }
      const readonlyValues: ReadonlyArray<int> = values;
      const result = readonlyValues.slice(5000, 5003);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(5000);
      expect(result[2]).assertEqual(5002);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0330
     * @tc.name testReadonlyArraySlice033
     * @tc.desc Verify ReadonlyArray.slice behavior: slice parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = values.slice(0, 5);
      expect(result.length).assertEqual(5);
      for (let i = 0; i < 5; i++) {
        expect(result[i]).assertEqual(values[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0340
     * @tc.name testReadonlyArraySlice034
     * @tc.desc Verify ReadonlyArray.slice behavior: result single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const result = values.slice(2, 3);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0350
     * @tc.name testReadonlyArraySlice035
     * @tc.desc Verify ReadonlyArray.slice behavior: slice returns different reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result1 = values.slice();
      const result2 = values.slice();
      expect(result1 !== result2).assertTrue();
      expect(result1).assertDeepEquals(result2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0360
     * @tc.name testReadonlyArraySlice036
     * @tc.desc Verify ReadonlyArray.slice behavior: slice returns reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const r1 = values.slice(0, 3);
      const r2 = values.slice(0, 3);
      const r3 = values.slice(0, 3);
      expect(r1 !== r2).assertTrue();
      expect(r2 !== r3).assertTrue();
      expect(r1 !== r3).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0370
     * @tc.name testReadonlyArraySlice037
     * @tc.desc Verify ReadonlyArray.slice behavior: and API 1,2,3. slice 1,3 returns length is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0380
     * @tc.name testReadonlyArraySlice038
     * @tc.desc Verify ReadonlyArray.slice behavior: ReadonlyArray <boolean> slice returns boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false];
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertFalse();
      expect(result[1]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0390
     * @tc.name testReadonlyArraySlice039
     * @tc.desc Verify ReadonlyArray.slice behavior: slice int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b10, 99];
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0o10);
      expect(result[1]).assertEqual(0b10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0400
     * @tc.name testReadonlyArraySlice040
     * @tc.desc Verify ReadonlyArray.slice behavior: slice empty Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cn: string = "\u4e2d\u6587";
      const arr: ReadonlyArray<string> = ["a", "", cn, "b"];
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("");
      expect(result[1]).assertEqual(cn);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0410
     * @tc.name testReadonlyArraySlice041
     * @tc.desc Verify ReadonlyArray.slice behavior: byte slice 1,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 30 as byte, 40 as byte];
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20 as byte);
      expect(result[1]).assertEqual(30 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0420
     * @tc.name testReadonlyArraySlice042
     * @tc.desc Verify ReadonlyArray.slice behavior: short slice 1,3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 200 as short, 300 as short];
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(200 as short);
      expect(result[1]).assertEqual(300 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0430
     * @tc.name testReadonlyArraySlice043
     * @tc.desc Verify ReadonlyArray.slice behavior: ReadonlyArray <string> slice - string - ko
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["테스트", "a", "b"];
      const result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual("테스트");
      expect(result[1]).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0440
     * @tc.name testReadonlyArraySlice044
     * @tc.desc Verify ReadonlyArray.slice behavior: ReadonlyArray <int> slice - negative - start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = arr.slice(-3, 5);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(3);
      expect(result[2]).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0450
     * @tc.name testReadonlyArraySlice045
     * @tc.desc Verify ReadonlyArray.slice behavior: ReadonlyArray <int> slice - omit - end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      const result = arr.slice(2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(3);
      expect(result[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0460
     * @tc.name testReadonlyArraySlice046
     * @tc.desc Verify ReadonlyArray.slice behavior: float - 0.0f slice result assertClose
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f, 2.0f];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertClose(0.0, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0470
     * @tc.name testReadonlyArraySlice047
     * @tc.desc Verify ReadonlyArray.slice behavior: slice array containing float NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 3.0f];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(Number.isNaN(result[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0480
     * @tc.name testReadonlyArraySlice048
     * @tc.desc Verify ReadonlyArray.slice behavior: string Japanese テスト slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["テスト", "en", "cn"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("テスト");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0490
     * @tc.name testReadonlyArraySlice049
     * @tc.desc Verify ReadonlyArray.slice behavior: slice octal format string element 0o123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0123", "tail"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("0123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0500
     * @tc.name testReadonlyArraySlice050
     * @tc.desc Verify ReadonlyArray.slice behavior: slice binary format string element 0b1010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0b1010", "tail"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("0b1010");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0510
     * @tc.name testReadonlyArraySlice051
     * @tc.desc Verify ReadonlyArray.slice behavior: slice scientific notation string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["123.45e6", "tail"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("123.45e6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0520
     * @tc.name testReadonlyArraySlice052
     * @tc.desc Verify ReadonlyArray.slice behavior: slice mojibake string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["æµè¯", "tail"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("æµè¯");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0530
     * @tc.name testReadonlyArraySlice053
     * @tc.desc Verify ReadonlyArray.slice behavior: slice replacement character string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\uFFFD", "tail"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0540
     * @tc.name testReadonlyArraySlice054
     * @tc.desc Verify ReadonlyArray.slice behavior: slice lone surrogate string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\udc04", "tail"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("\udc04");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0550
     * @tc.name testReadonlyArraySlice055
     * @tc.desc Verify ReadonlyArray.slice behavior: slice XSS script string element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["<script>alert(1)</script>", "tail"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0560
     * @tc.name testReadonlyArraySlice056
     * @tc.desc Verify ReadonlyArray.slice behavior: slice fullwidth dash string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["—", "tail"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("—");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0570
     * @tc.name testReadonlyArraySlice057
     * @tc.desc Verify ReadonlyArray.slice behavior: slice 100 character string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i: int = 0; i < 100; i++) {
        longStr = longStr + "a";
      }
      const arr: ReadonlyArray<string> = [longStr, "b"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0].length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0580
     * @tc.name testReadonlyArraySlice058
     * @tc.desc Verify ReadonlyArray.slice behavior: slice mixed language string element Test extended case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["Test 測試", "tail"];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("Test 測試");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0590
     * @tc.name testReadonlyArraySlice059
     * @tc.desc Verify ReadonlyArray.slice behavior: slice result is new reference not same as source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 4];
      const result = values.slice(1, 3);
      expect(result === values).assertFalse();
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0600
     * @tc.name testReadonlyArraySlice060
     * @tc.desc Verify ReadonlyArray.slice behavior: modifying slice result does not change source array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [10, 20, 30];
      const result: Array<int> = values.slice(1, 3);
      result[0] = 99;
      expect(values[1]).assertEqual(20);
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0610
     * @tc.name testReadonlyArraySlice061
     * @tc.desc Verify ReadonlyArray.slice behavior: slice preserves object element reference shallow copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj: Item010 = new Item010(7);
      const values: ReadonlyArray<Item010> = [obj, new Item010(8)];
      const result = values.slice(0, 1);
      expect(result[0] === values[0]).assertTrue();
      expect(result[0].value).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0620
     * @tc.name testReadonlyArraySlice062
     * @tc.desc Verify ReadonlyArray.slice behavior: slice start equals length returns empty segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3];
      const result = values.slice(3, 3);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0630
     * @tc.name testReadonlyArraySlice063
     * @tc.desc Verify ReadonlyArray.slice behavior: float negative zero preserved in slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f, 2.0f];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(-0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0640
     * @tc.name testReadonlyArraySlice064
     * @tc.desc Verify ReadonlyArray.slice behavior: slice full 1000 element array segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) {
        data.push(i);
      }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      const result = arr.slice(0, 1000);
      expect(result.length).assertEqual(1000);
      expect(result[0]).assertEqual(0);
      expect(result[999]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0650
     * @tc.name testReadonlyArraySlice065
     * @tc.desc Verify ReadonlyArray.slice behavior: slice duplicate element array returns middle segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 1, 1];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0660
     * @tc.name testReadonlyArraySlice066
     * @tc.desc Verify ReadonlyArray.slice behavior: byte array slice middle segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, 127 as byte, -128 as byte, 0x0A as byte];
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(127 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0670
     * @tc.name testReadonlyArraySlice067
     * @tc.desc Verify ReadonlyArray.slice behavior: short array slice first two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short, -32768 as short, 0 as short];
      const result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(-32768 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0680
     * @tc.name testReadonlyArraySlice068
     * @tc.desc Verify ReadonlyArray.slice behavior: long array slice boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, -9223372036854775807, 0];
      const result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(9223372036854775807);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0690
     * @tc.name testReadonlyArraySlice069
     * @tc.desc Verify ReadonlyArray.slice behavior: double array slice with NaN element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, Number.NaN, 3.3];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(Number.isNaN(result[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0700
     * @tc.name testReadonlyArraySlice070
     * @tc.desc Verify ReadonlyArray.slice behavior: double positive infinity slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, Number.POSITIVE_INFINITY, 2.0];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0710
     * @tc.name testReadonlyArraySlice071
     * @tc.desc Verify ReadonlyArray.slice behavior: double negative infinity slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, Number.NEGATIVE_INFINITY, 2.0];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0720
     * @tc.name testReadonlyArraySlice072
     * @tc.desc Verify ReadonlyArray.slice behavior: float positive infinity slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const inf: float = Double.toFloat(Number.POSITIVE_INFINITY);
      const arr: ReadonlyArray<float> = [1.0f, inf, 2.0f];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(inf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0730
     * @tc.name testReadonlyArraySlice073
     * @tc.desc Verify ReadonlyArray.slice behavior: float negative infinity slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const ninf: float = Double.toFloat(Number.NEGATIVE_INFINITY);
      const arr: ReadonlyArray<float> = [1.0f, ninf, 2.0f];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(ninf);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0740
     * @tc.name testReadonlyArraySlice074
     * @tc.desc Verify ReadonlyArray.slice behavior: float MIN_VALUE slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const minVal: float = Double.toFloat(Number.MIN_VALUE);
      const arr: ReadonlyArray<float> = [1.0f, minVal, 2.0f];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(minVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0750
     * @tc.name testReadonlyArraySlice075
     * @tc.desc Verify ReadonlyArray.slice behavior: double MIN_VALUE slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [5.0, Number.MIN_VALUE, 6.0];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0760
     * @tc.name testReadonlyArraySlice076
     * @tc.desc Verify ReadonlyArray.slice behavior: char null character slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000', c'a', c'b'];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0770
     * @tc.name testReadonlyArraySlice077
     * @tc.desc Verify ReadonlyArray.slice behavior: char max character slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'\uffff', c'b'];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(c'\uffff');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0780
     * @tc.name testReadonlyArraySlice078
     * @tc.desc Verify ReadonlyArray.slice behavior: boolean array slice middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0790
     * @tc.name testReadonlyArraySlice079
     * @tc.desc Verify ReadonlyArray.slice behavior: int literal radix array slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0x10, 0o10, 0b1010, 99];
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(0o10);
      expect(result[1]).assertEqual(0b1010);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0800
     * @tc.name testReadonlyArraySlice080
     * @tc.desc Verify ReadonlyArray.slice behavior: chained slice calls narrow segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = arr.slice(1, 4).slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0810
     * @tc.name testReadonlyArraySlice081
     * @tc.desc Verify ReadonlyArray.slice behavior: 1000 element array slice middle range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      const result = arr.slice(500, 600);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(500);
      expect(result[99]).assertEqual(599);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0820
     * @tc.name testReadonlyArraySlice082
     * @tc.desc Verify ReadonlyArray.slice behavior: 1000 element array slice last element only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      const result = arr.slice(-1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0830
     * @tc.name testReadonlyArraySlice083
     * @tc.desc Verify ReadonlyArray.slice behavior: 1000 element array slice negative range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      const result = arr.slice(-10, -5);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(990);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0840
     * @tc.name testReadonlyArraySlice084
     * @tc.desc Verify ReadonlyArray.slice behavior: slice start beyond array length returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.slice(10, 20);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0850
     * @tc.name testReadonlyArraySlice085
     * @tc.desc Verify ReadonlyArray.slice behavior: slice negative start beyond length treated as zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.slice(-10, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0860
     * @tc.name testReadonlyArraySlice086
     * @tc.desc Verify ReadonlyArray.slice behavior: slice end zero returns empty segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4];
      const result = arr.slice(1, 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0870
     * @tc.name testReadonlyArraySlice087
     * @tc.desc Verify ReadonlyArray.slice behavior: slice single element array full copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["only"];
      const result = arr.slice();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual("only");
      expect(result === arr).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0880
     * @tc.name testReadonlyArraySlice088
     * @tc.desc Verify ReadonlyArray.slice behavior: string email array slice preserves email segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["test@example.com", "other"];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual("test@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0890
     * @tc.name testReadonlyArraySlice089
     * @tc.desc Verify ReadonlyArray.slice behavior: string phone array slice preserves phone segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000", "x"];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual("13800138000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0900
     * @tc.name testReadonlyArraySlice090
     * @tc.desc Verify ReadonlyArray.slice behavior: string hex array slice middle element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "0x123", "b"];
      const result = arr.slice(1, 2);
      expect(result[0]).assertEqual("0x123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0910
     * @tc.name testReadonlyArraySlice091
     * @tc.desc Verify ReadonlyArray.slice behavior: Russian string array slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["АБВГД", "en"];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual("АБВГД");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0920
     * @tc.name testReadonlyArraySlice092
     * @tc.desc Verify ReadonlyArray.slice behavior: Arabic string array slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["الاختبار", "en"];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual("الاختبار");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0930
     * @tc.name testReadonlyArraySlice093
     * @tc.desc Verify ReadonlyArray.slice behavior: Korean string array slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["테스트", "en"];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual("테스트");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0940
     * @tc.name testReadonlyArraySlice094
     * @tc.desc Verify ReadonlyArray.slice behavior: double near max value slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nearMax: double = 1.7976931348623157E308;
      const arr: ReadonlyArray<double> = [1.0, nearMax, 2.0];
      const result = arr.slice(1, 2);
      expect(result[0]).assertEqual(nearMax);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0950
     * @tc.name testReadonlyArraySlice095
     * @tc.desc Verify ReadonlyArray.slice behavior: int max and min slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, -2147483648, 0];
      const result = arr.slice(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0960
     * @tc.name testReadonlyArraySlice096
     * @tc.desc Verify ReadonlyArray.slice behavior: slice returns writable Array can assign element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result: Array<int> = arr.slice(1, 2);
      result[0] = 99;
      expect(result[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0970
     * @tc.name testReadonlyArraySlice097
     * @tc.desc Verify ReadonlyArray.slice behavior: slice with only negative end excludes last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = arr.slice(0, -1);
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0980
     * @tc.name testReadonlyArraySlice098
     * @tc.desc Verify ReadonlyArray.slice behavior: slice negative start and negative end combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const result = arr.slice(-4, -2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(20);
      expect(result[1]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_0990
     * @tc.name testReadonlyArraySlice099
     * @tc.desc Verify ReadonlyArray.slice behavior: float array slice zero width at middle index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 2.0f, 3.0f];
      const result = arr.slice(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1000
     * @tc.name testReadonlyArraySlice100
     * @tc.desc Verify ReadonlyArray.slice behavior: string zero width slice at end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b"];
      const result = arr.slice(2, 2);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1010
     * @tc.name testReadonlyArraySlice101
     * @tc.desc Verify ReadonlyArray.slice behavior: slice large start int on small array empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      const result = arr.slice(2147483647);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1020
     * @tc.name testReadonlyArraySlice102
     * @tc.desc Verify ReadonlyArray.slice behavior: slice negative end int on small array empty result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2];
      const result = arr.slice(0, -2147483648);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1030
     * @tc.name testReadonlyArraySlice103
     * @tc.desc Verify ReadonlyArray.slice behavior: two element int array slice first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1040
     * @tc.name testReadonlyArraySlice104
     * @tc.desc Verify ReadonlyArray.slice behavior: two element int array slice second element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [7, 8];
      const result = arr.slice(1, 2);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1050
     * @tc.name testReadonlyArraySlice105
     * @tc.desc Verify ReadonlyArray.slice behavior: three duplicate strings slice middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "x", "x"];
      const result = arr.slice(1, 2);
      expect(result[0]).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1060
     * @tc.name testReadonlyArraySlice106
     * @tc.desc Verify ReadonlyArray.slice behavior: float NaN at start slice includes NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [nan, 1.0f, 2.0f];
      const result = arr.slice(0, 1);
      expect(result.length).assertEqual(1);
      expect(Number.isNaN(result[0])).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1070
     * @tc.name testReadonlyArraySlice107
     * @tc.desc Verify ReadonlyArray.slice behavior: float zero and negative zero slice both segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, -0.0f, 1.0f];
      const r1 = arr.slice(0, 1);
      const r2 = arr.slice(1, 2);
      expect(r1[0]).assertEqual(0.0f);
      expect(r2[0]).assertEqual(-0.0f);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1080
     * @tc.name testReadonlyArraySlice108
     * @tc.desc Verify ReadonlyArray.slice behavior: long zero slice single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 1, 2];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1090
     * @tc.name testReadonlyArraySlice109
     * @tc.desc Verify ReadonlyArray.slice behavior: byte single element slice full
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [42 as byte];
      const result = arr.slice();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42 as byte);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1100
     * @tc.name testReadonlyArraySlice110
     * @tc.desc Verify ReadonlyArray.slice behavior: short negative slice last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [1 as short, 2 as short, 3 as short];
      const result = arr.slice(-1);
      expect(result[0]).assertEqual(3 as short);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1110
     * @tc.name testReadonlyArraySlice111
     * @tc.desc Verify ReadonlyArray.slice behavior: char array slice all elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'c'];
      const result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual(c'c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1120
     * @tc.name testReadonlyArraySlice112
     * @tc.desc Verify ReadonlyArray.slice behavior: boolean all true array slice subset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, true, true];
      const result = arr.slice(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1130
     * @tc.name testReadonlyArraySlice113
     * @tc.desc Verify ReadonlyArray.slice behavior: string tab and newline slice segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\t", "\n", "z"];
      const result = arr.slice(0, 2);
      expect(result[0]).assertEqual("\t");
      expect(result[1]).assertEqual("\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1140
     * @tc.name testReadonlyArraySlice114
     * @tc.desc Verify ReadonlyArray.slice behavior: string zwsp slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u200B", "a"];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual("\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1150
     * @tc.name testReadonlyArraySlice115
     * @tc.desc Verify ReadonlyArray.slice behavior: int alternating sign slice middle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, -1, 2, -2, 3];
      const result = arr.slice(2, 4);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(2);
      expect(result[1]).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1160
     * @tc.name testReadonlyArraySlice116
     * @tc.desc Verify ReadonlyArray.slice behavior: double array slice start only from index 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, 2.2, 3.3, 4.4];
      const result = arr.slice(2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(3.3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1170
     * @tc.name testReadonlyArraySlice117
     * @tc.desc Verify ReadonlyArray.slice behavior: float array slice end before last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 2.0f, 3.0f, 4.0f];
      const result = arr.slice(0, 3);
      expect(result.length).assertEqual(3);
      expect(result[2]).assertClose(3.0, 0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1180
     * @tc.name testReadonlyArraySlice118
     * @tc.desc Verify ReadonlyArray.slice behavior: string emoji array slice emoji segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\uD83D\uDE00", "plain"];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual("\uD83D\uDE00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1190
     * @tc.name testReadonlyArraySlice119
     * @tc.desc Verify ReadonlyArray.slice behavior: string unicode Chinese slice segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "en"];
      const result = arr.slice(0, 1);
      expect(result[0]).assertEqual("\u4e2d\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_SLICE_1200
     * @tc.name testReadonlyArraySlice120
     * @tc.desc Verify ReadonlyArray.slice behavior: int five elements slice middle three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArraySlice120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 30, 40, 50];
      const result = arr.slice(1, 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(20);
      expect(result[2]).assertEqual(40);
    });

  });
}
