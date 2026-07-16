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
import Utils from './../Util.test';

class ComboObjarr {
  id: int = 1;
}

function toByteValue(value: int): byte {
  return Int.toByte(value);
}

function toShortValue(value: int): short {
  return Int.toShort(value);
}

export default function ReadonlyArrayIndexOfTest(): void {
  describe('ReadonlyArrayIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0010
     * @tc.name testReadonlyArrayIndexOf001
     * @tc.desc Verify ReadonlyArray.indexOf behavior: passing searchElement parameter verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = arr.indexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0020
     * @tc.name testReadonlyArrayIndexOf002
     * @tc.desc Verify ReadonlyArray.indexOf behavior: passing searchElement fromIndex parameter verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.indexOf(2, 2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0030
     * @tc.name testReadonlyArrayIndexOf003
     * @tc.desc Verify ReadonlyArray.indexOf behavior: searchElement fromIndex fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.indexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0040
     * @tc.name testReadonlyArrayIndexOf004
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex=1 element verify indexOf is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.indexOf(2, 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0050
     * @tc.name testReadonlyArrayIndexOf005
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex length not found verify indexOf is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.indexOf(2, 10);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0060
     * @tc.name testReadonlyArrayIndexOf006
     * @tc.desc Verify ReadonlyArray.indexOf behavior: element not found returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.indexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0070
     * @tc.name testReadonlyArrayIndexOf007
     * @tc.desc Verify ReadonlyArray.indexOf behavior: empty array element returns not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      const result = arr.indexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0080
     * @tc.name testReadonlyArrayIndexOf008
     * @tc.desc Verify ReadonlyArray.indexOf behavior: element element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      const result = arr.indexOf(42);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0090
     * @tc.name testReadonlyArrayIndexOf009
     * @tc.desc Verify ReadonlyArray.indexOf behavior: int boundary value 2147483647 verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647];
      const result = arr.indexOf(2147483647);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0100
     * @tc.name testReadonlyArrayIndexOf010
     * @tc.desc Verify ReadonlyArray.indexOf behavior: int boundary value -2147483648 verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [-2147483648];
      const result = arr.indexOf(-2147483648);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0110
     * @tc.name testReadonlyArrayIndexOf011
     * @tc.desc Verify ReadonlyArray.indexOf behavior: int 0 -1 verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 2];
      const result = arr.indexOf(-1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0120
     * @tc.name testReadonlyArrayIndexOf012
     * @tc.desc Verify ReadonlyArray.indexOf behavior: byte -128 verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte];
      const result = arr.indexOf(-128 as byte);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0130
     * @tc.name testReadonlyArrayIndexOf013
     * @tc.desc Verify ReadonlyArray.indexOf behavior: byte 127 verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, 127 as byte];
      const result = arr.indexOf(127 as byte);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0140
     * @tc.name testReadonlyArrayIndexOf014
     * @tc.desc Verify ReadonlyArray.indexOf behavior: byte 0x0A verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0x0A as byte];
      const result = arr.indexOf(0x0A as byte);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0150
     * @tc.name testReadonlyArrayIndexOf015
     * @tc.desc Verify ReadonlyArray.indexOf behavior: short -32768 verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short];
      const result = arr.indexOf(-32768 as short);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0160
     * @tc.name testReadonlyArrayIndexOf016
     * @tc.desc Verify ReadonlyArray.indexOf behavior: short 32767 verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short];
      const result = arr.indexOf(32767 as short);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0170
     * @tc.name testReadonlyArrayIndexOf017
     * @tc.desc Verify ReadonlyArray.indexOf behavior: long verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807];
      const result = arr.indexOf(9223372036854775807);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0180
     * @tc.name testReadonlyArrayIndexOf018
     * @tc.desc Verify ReadonlyArray.indexOf behavior: long verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [-9223372036854775808];
      const result = arr.indexOf(-9223372036854775808);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0190
     * @tc.name testReadonlyArrayIndexOf019
     * @tc.desc Verify ReadonlyArray.indexOf behavior: float 0.0f verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, 1.0f];
      const result = arr.indexOf(0.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0200
     * @tc.name testReadonlyArrayIndexOf020
     * @tc.desc Verify ReadonlyArray.indexOf behavior: float -0.0f verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f];
      const result = arr.indexOf(-0.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0210
     * @tc.name testReadonlyArrayIndexOf021
     * @tc.desc Verify ReadonlyArray.indexOf behavior: boolean false verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.indexOf(false);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0220
     * @tc.name testReadonlyArrayIndexOf022
     * @tc.desc Verify ReadonlyArray.indexOf behavior: string type test example.com verify indexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["test@example.com", "other"];
      const result = arr.indexOf("test@example.com");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0230
     * @tc.name testReadonlyArrayIndexOf023
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-int重复元素-fromIndex=3，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 10, 30, 10];
      const result = arr.indexOf(10, 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0240
     * @tc.name testReadonlyArrayIndexOf024
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-byte重复元素-fromIndex=1，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 10 as byte, 30 as byte, 10 as byte];
      const result = arr.indexOf(10 as byte, 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0250
     * @tc.name testReadonlyArrayIndexOf025
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-byte重复元素-fromIndex=-5，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 10 as byte, 30 as byte, 10 as byte];
      const result = arr.indexOf(10 as byte, -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0260
     * @tc.name testReadonlyArrayIndexOf026
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-short重复元素-fromIndex=5，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 200 as short, 100 as short, 300 as short, 100 as short];
      const result = arr.indexOf(100 as short, 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0270
     * @tc.name testReadonlyArrayIndexOf027
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-long重复元素-fromIndex=1，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [100, 200, 100, 300, 100];
      const result = arr.indexOf(100, 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0280
     * @tc.name testReadonlyArrayIndexOf028
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-double重复元素-fromIndex=3，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [10.0, 20.0, 10.0, 30.0, 10.0];
      const result = arr.indexOf(10.0, 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0290
     * @tc.name testReadonlyArrayIndexOf029
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-double重复元素-fromIndex=5，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [10.0, 20.0, 10.0, 30.0, 10.0];
      const result = arr.indexOf(10.0, 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0300
     * @tc.name testReadonlyArrayIndexOf030
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-double重复元素-fromIndex=-5，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [10.0, 20.0, 10.0, 30.0, 10.0];
      const result = arr.indexOf(10.0, -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0310
     * @tc.name testReadonlyArrayIndexOf031
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-char重复元素-fromIndex=0，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'a', c'c', c'a'];
      const result = arr.indexOf(c'a', 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0320
     * @tc.name testReadonlyArrayIndexOf032
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-char重复元素-fromIndex=1，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'a', c'c', c'a'];
      const result = arr.indexOf(c'a', 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0330
     * @tc.name testReadonlyArrayIndexOf033
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-char重复元素-fromIndex=3，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'a', c'c', c'a'];
      const result = arr.indexOf(c'a', 3);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0340
     * @tc.name testReadonlyArrayIndexOf034
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-char重复元素-fromIndex=5，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'a', c'c', c'a'];
      const result = arr.indexOf(c'a', 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0350
     * @tc.name testReadonlyArrayIndexOf035
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-boolean重复元素-fromIndex=0，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false, true];
      const result = arr.indexOf(true, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0360
     * @tc.name testReadonlyArrayIndexOf036
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-boolean重复元素-fromIndex=1，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false, true];
      const result = arr.indexOf(true, 1);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0370
     * @tc.name testReadonlyArrayIndexOf037
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-boolean重复元素-fromIndex=5，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false, true];
      const result = arr.indexOf(true, 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0380
     * @tc.name testReadonlyArrayIndexOf038
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-string-空串-fromIndex=0，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "", "y", "z", ""];
      const result = arr.indexOf("", 0);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0390
     * @tc.name testReadonlyArrayIndexOf039
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-string-空串-fromIndex=2，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "", "y", "z", ""];
      const result = arr.indexOf("", 2);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0400
     * @tc.name testReadonlyArrayIndexOf040
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-string-空串-fromIndex=5，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "", "y", "z", ""];
      const result = arr.indexOf("", 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0410
     * @tc.name testReadonlyArrayIndexOf041
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-string-Unicode中文-fromIndex=5，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\u4e2d\u6587", "y", "z", "\u4e2d\u6587"];
      const result = arr.indexOf("\u4e2d\u6587", 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0420
     * @tc.name testReadonlyArrayIndexOf042
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-100元素数组-fromIndex=0，验证indexOf搜索末尾元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) {
      source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.indexOf(99, 0);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0430
     * @tc.name testReadonlyArrayIndexOf043
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-100元素数组-fromIndex=100，验证indexOf搜索末尾元素
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) {
      source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.indexOf(99, 100);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0440
     * @tc.name testReadonlyArrayIndexOf044
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-float NaN-fromIndex=0，验证indexOf搜索NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f, nan, 3.0f];
      const result = arr.indexOf(nan, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0450
     * @tc.name testReadonlyArrayIndexOf045
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-double NaN-fromIndex=0，验证indexOf搜索NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.0, nan, 2.0, nan, 3.0];
      const result = arr.indexOf(nan, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0460
     * @tc.name testReadonlyArrayIndexOf046
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-int边界2147483647-fromIndex=0，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, 0, 2147483647, -1, 2147483647];
      const result = arr.indexOf(2147483647, 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0470
     * @tc.name testReadonlyArrayIndexOf047
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-int边界2147483647-fromIndex=2，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, 0, 2147483647, -1, 2147483647];
      const result = arr.indexOf(2147483647, 2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0480
     * @tc.name testReadonlyArrayIndexOf048
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-int边界2147483647-fromIndex=5，验证indexOf从指定位置搜索
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, 0, 2147483647, -1, 2147483647];
      const result = arr.indexOf(2147483647, 5);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0490
     * @tc.name testReadonlyArrayIndexOf049
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex矩阵-int跳过前序唯一元素-fromIndex=2，验证indexOf未找到20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 10, 30, 10];
      const result = arr.indexOf(20, 2);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0500
     * @tc.name testReadonlyArrayIndexOf050
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex length plus one search double returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.indexOf(0.0, arr.length + 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0510
     * @tc.name testReadonlyArrayIndexOf051
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex length plus one search char returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.indexOf(c'x', arr.length + 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0520
     * @tc.name testReadonlyArrayIndexOf052
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex length plus one search boolean returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.indexOf(false, arr.length + 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0530
     * @tc.name testReadonlyArrayIndexOf053
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex length plus one search string returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.indexOf("z", arr.length + 1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0540
     * @tc.name testReadonlyArrayIndexOf054
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex -1 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.indexOf(0 as byte, -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0550
     * @tc.name testReadonlyArrayIndexOf055
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex -1 short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.indexOf(0 as short, -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0560
     * @tc.name testReadonlyArrayIndexOf056
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex -1 int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 0];
      expect(arr.indexOf(0, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0570
     * @tc.name testReadonlyArrayIndexOf057
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex -1 long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [1, 2, 0];
      expect(arr.indexOf(0, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0580
     * @tc.name testReadonlyArrayIndexOf058
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex -1 float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 2.0f, 0.0f];
      expect(arr.indexOf(0.0f, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0590
     * @tc.name testReadonlyArrayIndexOf059
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex -1 double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 2.0, 0.0];
      expect(arr.indexOf(0.0, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0600
     * @tc.name testReadonlyArrayIndexOf060
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex -1 char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'x'];
      expect(arr.indexOf(c'x', -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0610
     * @tc.name testReadonlyArrayIndexOf061
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex -1 boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, true, false];
      expect(arr.indexOf(false, -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0620
     * @tc.name testReadonlyArrayIndexOf062
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex -1 string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "b", "z"];
      expect(arr.indexOf("z", -1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0630
     * @tc.name testReadonlyArrayIndexOf063
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative length byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.indexOf(0 as byte, -arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0640
     * @tc.name testReadonlyArrayIndexOf064
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative length short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.indexOf(0 as short, -arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0650
     * @tc.name testReadonlyArrayIndexOf065
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative length int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.indexOf(0, -arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0660
     * @tc.name testReadonlyArrayIndexOf066
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative length long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [1, 0, 2];
      expect(arr.indexOf(0, -arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0670
     * @tc.name testReadonlyArrayIndexOf067
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative length float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.indexOf(0.0f, -arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0680
     * @tc.name testReadonlyArrayIndexOf068
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative length double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.indexOf(0.0, -arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0690
     * @tc.name testReadonlyArrayIndexOf069
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative length char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.indexOf(c'x', -arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0700
     * @tc.name testReadonlyArrayIndexOf070
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative length boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.indexOf(false, -arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0710
     * @tc.name testReadonlyArrayIndexOf071
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative length string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.indexOf("z", -arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0720
     * @tc.name testReadonlyArrayIndexOf072
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative beyond length byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.indexOf(0 as byte, -(arr.length + 1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0730
     * @tc.name testReadonlyArrayIndexOf073
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative beyond length short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.indexOf(0 as short, -(arr.length + 1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0740
     * @tc.name testReadonlyArrayIndexOf074
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative beyond length int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.indexOf(0, -(arr.length + 1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0750
     * @tc.name testReadonlyArrayIndexOf075
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative beyond length long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [1, 0, 2];
      expect(arr.indexOf(0, -(arr.length + 1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0760
     * @tc.name testReadonlyArrayIndexOf076
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative beyond length float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.indexOf(0.0f, -(arr.length + 1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0770
     * @tc.name testReadonlyArrayIndexOf077
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative beyond length double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.indexOf(0.0, -(arr.length + 1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0780
     * @tc.name testReadonlyArrayIndexOf078
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative beyond length char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.indexOf(c'x', -(arr.length + 1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0790
     * @tc.name testReadonlyArrayIndexOf079
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative beyond length boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.indexOf(false, -(arr.length + 1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0800
     * @tc.name testReadonlyArrayIndexOf080
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex negative beyond length string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.indexOf("z", -(arr.length + 1))).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0810
     * @tc.name testReadonlyArrayIndexOf081
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int max search byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.indexOf(0 as byte, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0820
     * @tc.name testReadonlyArrayIndexOf082
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int max search short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.indexOf(0 as short, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0830
     * @tc.name testReadonlyArrayIndexOf083
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int max search int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.indexOf(0, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0840
     * @tc.name testReadonlyArrayIndexOf084
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int max search long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [1, 0, 2];
      expect(arr.indexOf(0, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0850
     * @tc.name testReadonlyArrayIndexOf085
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int max search float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.indexOf(0.0f, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0860
     * @tc.name testReadonlyArrayIndexOf086
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int max search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.indexOf(0.0, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0870
     * @tc.name testReadonlyArrayIndexOf087
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int max search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.indexOf(c'x', 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0880
     * @tc.name testReadonlyArrayIndexOf088
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int max search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.indexOf(false, 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0890
     * @tc.name testReadonlyArrayIndexOf089
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int max search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.indexOf("z", 2147483647)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0900
     * @tc.name testReadonlyArrayIndexOf090
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int min search byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.indexOf(0 as byte, -2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0910
     * @tc.name testReadonlyArrayIndexOf091
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int min search short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.indexOf(0 as short, -2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0920
     * @tc.name testReadonlyArrayIndexOf092
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int min search int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.indexOf(0, -2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0930
     * @tc.name testReadonlyArrayIndexOf093
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int min search long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [1, 0, 2];
      expect(arr.indexOf(0, -2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0940
     * @tc.name testReadonlyArrayIndexOf094
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int min search float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.indexOf(0.0f, -2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0950
     * @tc.name testReadonlyArrayIndexOf095
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int min search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.indexOf(0.0, -2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0960
     * @tc.name testReadonlyArrayIndexOf096
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int min search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.indexOf(c'x', -2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0970
     * @tc.name testReadonlyArrayIndexOf097
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int min search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.indexOf(false, -2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0980
     * @tc.name testReadonlyArrayIndexOf098
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex int min search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.indexOf("z", -2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_0990
     * @tc.name testReadonlyArrayIndexOf099
     * @tc.desc Verify ReadonlyArray.indexOf behavior: duplicate search first occurrence index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      expect(arr.indexOf(2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1000
     * @tc.name testReadonlyArrayIndexOf100
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search missing value returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      expect(arr.indexOf(9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1010
     * @tc.name testReadonlyArrayIndexOf101
     * @tc.desc Verify ReadonlyArray.indexOf behavior: single element miss returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      expect(arr.indexOf(43)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1020
     * @tc.name testReadonlyArrayIndexOf102
     * @tc.desc Verify ReadonlyArray.indexOf behavior: NaN strict equality returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan];
      expect(arr.indexOf(nan)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1030
     * @tc.name testReadonlyArrayIndexOf103
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search 0.0f matches negative zero index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f];
      expect(arr.indexOf(0.0f)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1040
     * @tc.name testReadonlyArrayIndexOf104
     * @tc.desc Verify ReadonlyArray.indexOf behavior: 1000 element array search last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      expect(arr.indexOf(999)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1050
     * @tc.name testReadonlyArrayIndexOf105
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search zero int falsy value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 0, 7];
      expect(arr.indexOf(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1060
     * @tc.name testReadonlyArrayIndexOf106
     * @tc.desc Verify ReadonlyArray.indexOf behavior: string array search empty string index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = [""];
      expect(arr.indexOf("")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1070
     * @tc.name testReadonlyArrayIndexOf107
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search zero width space string index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u200B", "a"];
      expect(arr.indexOf("\u200B")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1080
     * @tc.name testReadonlyArrayIndexOf108
     * @tc.desc Verify ReadonlyArray.indexOf behavior: fromIndex skips earlier duplicate index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 1];
      expect(arr.indexOf(1, 2)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1090
     * @tc.name testReadonlyArrayIndexOf109
     * @tc.desc Verify ReadonlyArray.indexOf behavior: call does not change source array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const len: int = arr.length;
      arr.indexOf(2);
      expect(arr.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1100
     * @tc.name testReadonlyArrayIndexOf110
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["", "other"];
      expect(arr.indexOf("")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1110
     * @tc.name testReadonlyArrayIndexOf111
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search unicode Chinese element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "other"];
      expect(arr.indexOf("\u4e2d\u6587")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1120
     * @tc.name testReadonlyArrayIndexOf112
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search emoji element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\uD83D\uDE00", "other"];
      expect(arr.indexOf("\uD83D\uDE00")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1130
     * @tc.name testReadonlyArrayIndexOf113
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search tab element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\t", "other"];
      expect(arr.indexOf("\t")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1140
     * @tc.name testReadonlyArrayIndexOf114
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search crlf element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\r\n", "other"];
      expect(arr.indexOf("\r\n")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1150
     * @tc.name testReadonlyArrayIndexOf115
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search Japanese element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["テスト", "other"];
      expect(arr.indexOf("テスト")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1160
     * @tc.name testReadonlyArrayIndexOf116
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search Korean element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["테스트", "other"];
      expect(arr.indexOf("테스트")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1170
     * @tc.name testReadonlyArrayIndexOf117
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search Russian element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["АБВГД", "other"];
      expect(arr.indexOf("АБВГД")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1180
     * @tc.name testReadonlyArrayIndexOf118
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search Arabic element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["الاختبار", "other"];
      expect(arr.indexOf("الاختبار")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1190
     * @tc.name testReadonlyArrayIndexOf119
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search phone element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["13800138000", "other"];
      expect(arr.indexOf("13800138000")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1200
     * @tc.name testReadonlyArrayIndexOf120
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search mojibake element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["æµè¯", "other"];
      expect(arr.indexOf("æµè¯")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1210
     * @tc.name testReadonlyArrayIndexOf121
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search replacement element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\uFFFD", "other"];
      expect(arr.indexOf("\uFFFD")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1220
     * @tc.name testReadonlyArrayIndexOf122
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search lone surrogate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\udc04", "other"];
      expect(arr.indexOf("\udc04")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1230
     * @tc.name testReadonlyArrayIndexOf123
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search XSS element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["<script>alert(1)</script>", "other"];
      expect(arr.indexOf("<script>alert(1)</script>")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1240
     * @tc.name testReadonlyArrayIndexOf124
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search fullwidth dash element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["—", "other"];
      expect(arr.indexOf("—")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1250
     * @tc.name testReadonlyArrayIndexOf125
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search 100 char element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "";
      for (let i: int = 0; i < 100; i++) { s = s + "a"; }
      const arr: ReadonlyArray<string> = [s];
      expect(arr.indexOf(s)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1260
     * @tc.name testReadonlyArrayIndexOf126
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search mixed language element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["Test 測試", "other"];
      expect(arr.indexOf("Test 測試")).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1270
     * @tc.name testReadonlyArrayIndexOf127
     * @tc.desc Verify ReadonlyArray.indexOf behavior: search int boundary 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, 1];
      expect(arr.indexOf(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1280
     * @tc.name testReadonlyArrayIndexOf128
     * @tc.desc Verify ReadonlyArray.indexOf behavior: byte max+1 overflow wraps to min and is found at first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte, -128 as byte];
      const overflow: int = 127 + 1;
      expect(arr.indexOf(toByteValue(overflow))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1290
     * @tc.name testReadonlyArrayIndexOf129
     * @tc.desc Verify ReadonlyArray.indexOf behavior: byte min-1 overflow wraps to max and is found at first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [127 as byte, 0 as byte, 127 as byte];
      const overflow: int = -128 - 1;
      expect(arr.indexOf(toByteValue(overflow))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1300
     * @tc.name testReadonlyArrayIndexOf130
     * @tc.desc Verify ReadonlyArray.indexOf behavior: short max+1 overflow wraps to min and is found at first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 0 as short, -32768 as short];
      const overflow: int = 32767 + 1;
      expect(arr.indexOf(toShortValue(overflow))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1310
     * @tc.name testReadonlyArrayIndexOf131
     * @tc.desc Verify ReadonlyArray.indexOf behavior: short min-1 overflow wraps to max and is found at first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short, 0 as short, 32767 as short];
      const overflow: int = -32768 - 1;
      expect(arr.indexOf(toShortValue(overflow))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1320
     * @tc.name testReadonlyArrayIndexOf132
     * @tc.desc Verify ReadonlyArray.indexOf behavior: int max+1 overflow wraps to min and is found at first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [-2147483648, 0, -2147483648];
      expect(arr.indexOf(2147483647 + 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1330
     * @tc.name testReadonlyArrayIndexOf133
     * @tc.desc Verify ReadonlyArray.indexOf behavior: int min-1 overflow wraps to max and is found at first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, 0, 2147483647];
      expect(arr.indexOf(-2147483648 - 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1340
     * @tc.name testReadonlyArrayIndexOf134
     * @tc.desc Verify ReadonlyArray.indexOf behavior: long max+1 overflow wraps to min and is found at first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [-9223372036854775808, 0, -9223372036854775808];
      expect(arr.indexOf(9223372036854775807 + 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INDEX_OF_1350
     * @tc.name testReadonlyArrayIndexOf135
     * @tc.desc Verify ReadonlyArray.indexOf behavior: long min-1 overflow wraps to max and is found at first index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIndexOf135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, 0, 9223372036854775807];
      expect(arr.indexOf(-9223372036854775808 - 1)).assertEqual(0);
    });

  });
}
