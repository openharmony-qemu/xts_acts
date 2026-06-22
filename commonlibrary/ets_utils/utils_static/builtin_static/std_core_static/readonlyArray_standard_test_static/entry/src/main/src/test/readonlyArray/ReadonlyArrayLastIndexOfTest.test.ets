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
import Utils from './../Util.test';

class ComboObjarr {
  id: int = 1;
}

export default function ReadonlyArrayLastIndexOfTest(): void {
  describe('ReadonlyArrayLastIndexOfTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0010
     * @tc.name testReadonlyArrayLastIndexOf001
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: passing searchElement parameter verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = arr.lastIndexOf(3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0020
     * @tc.name testReadonlyArrayLastIndexOf002
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: passing searchElement fromIndex parameter verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.lastIndexOf(2, 2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0030
     * @tc.name testReadonlyArrayLastIndexOf003
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: searchElement fromIndex fromIndex=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.lastIndexOf(2);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0040
     * @tc.name testReadonlyArrayLastIndexOf004
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex=0 verify lastIndexOf is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.lastIndexOf(2, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0050
     * @tc.name testReadonlyArrayLastIndexOf005
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length not found verify lastIndexOf is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.lastIndexOf(2, 10);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0060
     * @tc.name testReadonlyArrayLastIndexOf006
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: element exists when returns correctly result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = values.lastIndexOf(2);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0070
     * @tc.name testReadonlyArrayLastIndexOf007
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: element exists when returns not found result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.lastIndexOf(99);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0080
     * @tc.name testReadonlyArrayLastIndexOf008
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: empty array element returns not found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      const result = arr.lastIndexOf(1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0090
     * @tc.name testReadonlyArrayLastIndexOf009
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: lastIndexOf returns after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2, 1, 2, 3, 2];
      const result = arr.lastIndexOf(2);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0100
     * @tc.name testReadonlyArrayLastIndexOf010
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: lastIndexOf fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2, 1, 2, 3, 2];
      const result = arr.lastIndexOf(2, 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0110
     * @tc.name testReadonlyArrayLastIndexOf011
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: int boundary value 2147483647 verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647];
      const result = arr.lastIndexOf(2147483647);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0120
     * @tc.name testReadonlyArrayLastIndexOf012
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: int boundary value - 2147483648 verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [-2147483648];
      const result = arr.lastIndexOf(-2147483648);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0130
     * @tc.name testReadonlyArrayLastIndexOf013
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: int 0 - 1 verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 2];
      const result = arr.lastIndexOf(-1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0140
     * @tc.name testReadonlyArrayLastIndexOf014
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: byte - 128 verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte];
      const result = arr.lastIndexOf(-128 as byte);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0150
     * @tc.name testReadonlyArrayLastIndexOf015
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: byte 127 verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, 127 as byte];
      const result = arr.lastIndexOf(127 as byte);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0160
     * @tc.name testReadonlyArrayLastIndexOf016
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: byte 0x0A verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0x0A as byte];
      const result = arr.lastIndexOf(0x0A as byte);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0170
     * @tc.name testReadonlyArrayLastIndexOf017
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: short - 32768 verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short];
      const result = arr.lastIndexOf(-32768 as short);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0180
     * @tc.name testReadonlyArrayLastIndexOf018
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: short 32767 verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short];
      const result = arr.lastIndexOf(32767 as short);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0190
     * @tc.name testReadonlyArrayLastIndexOf019
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: long verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807];
      const result = arr.lastIndexOf(9223372036854775807);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0200
     * @tc.name testReadonlyArrayLastIndexOf020
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: long verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [-9223372036854775808];
      const result = arr.lastIndexOf(-9223372036854775808);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0210
     * @tc.name testReadonlyArrayLastIndexOf021
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: float 0.0f verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, 1.0f];
      const result = arr.lastIndexOf(0.0f);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0220
     * @tc.name testReadonlyArrayLastIndexOf022
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: boolean true verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [false, true];
      const result = arr.lastIndexOf(true);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0230
     * @tc.name testReadonlyArrayLastIndexOf023
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: string type string 0x123 verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0x123", "other"];
      const result = arr.lastIndexOf("0x123");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0240
     * @tc.name testReadonlyArrayLastIndexOf024
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: string type Test verify lastIndexOf
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["Test 娓│", "other"];
      const result = arr.lastIndexOf("Test 娓│");
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0250
     * @tc.name testReadonlyArrayLastIndexOf025
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex matrix - int repeated elements - fromIndex= - 1, verify lastIndexOf search upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 10, 30, 10];
      const result = arr.lastIndexOf(10, -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0260
     * @tc.name testReadonlyArrayLastIndexOf026
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex matrix - int repeated elements - fromIndex= - 2, verify lastIndexOf search upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 10, 30, 10];
      const result = arr.lastIndexOf(10, -2);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0270
     * @tc.name testReadonlyArrayLastIndexOf027
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex matrix - short repeated elements - fromIndex= - 5, verify lastIndexOf search upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [100 as short, 200 as short, 100 as short, 300 as short, 100 as short];
      const result = arr.lastIndexOf(100 as short, -5);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0280
     * @tc.name testReadonlyArrayLastIndexOf028
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex matrix - boolean repeated elements - fromIndex=4, verify lastIndexOf search upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false, true];
      const result = arr.lastIndexOf(true, 4);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0290
     * @tc.name testReadonlyArrayLastIndexOf029
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex matrix - string - emoji - fromIndex= - 1, verify lastIndexOf search upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\uD83D\uDE00", "y", "z", "\uD83D\uDE00"];
      const result = arr.lastIndexOf("\uD83D\uDE00", -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0300
     * @tc.name testReadonlyArrayLastIndexOf030
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex matrix - string - Russian - fromIndex= - 1, verify lastIndexOf search upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "袗袘袙袚袛", "y", "z", "袗袘袙袚袛"];
      const result = arr.lastIndexOf("袗袘袙袚袛", -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0310
     * @tc.name testReadonlyArrayLastIndexOf031
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex matrix - string - extended case count extended case - fromIndex= - 1, verify lastIndexOf search upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "123.45e6", "y", "z", "123.45e6"];
      const result = arr.lastIndexOf("123.45e6", -1);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0320
     * @tc.name testReadonlyArrayLastIndexOf032
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: float NaN uses strict equality and returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f, nan, 3.0f];
      const result = arr.lastIndexOf(nan, 0);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0330
     * @tc.name testReadonlyArrayLastIndexOf033
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length minus one search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.lastIndexOf(0.0, arr.length - 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0340
     * @tc.name testReadonlyArrayLastIndexOf034
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length minus one search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.lastIndexOf(c'x', arr.length - 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0350
     * @tc.name testReadonlyArrayLastIndexOf035
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length minus one search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.lastIndexOf(false, arr.length - 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0360
     * @tc.name testReadonlyArrayLastIndexOf036
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length minus one search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.lastIndexOf("z", arr.length - 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0370
     * @tc.name testReadonlyArrayLastIndexOf037
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length search byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.lastIndexOf(0 as byte, arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0380
     * @tc.name testReadonlyArrayLastIndexOf038
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length search short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.lastIndexOf(0 as short, arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0390
     * @tc.name testReadonlyArrayLastIndexOf039
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length search int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.lastIndexOf(0, arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0400
     * @tc.name testReadonlyArrayLastIndexOf040
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length search long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<long> = [1, 0, 2];
      expect(arr.lastIndexOf(0, arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0410
     * @tc.name testReadonlyArrayLastIndexOf041
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length search float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.lastIndexOf(0.0f, arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0420
     * @tc.name testReadonlyArrayLastIndexOf042
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.lastIndexOf(0.0, arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0430
     * @tc.name testReadonlyArrayLastIndexOf043
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.lastIndexOf(c'x', arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0440
     * @tc.name testReadonlyArrayLastIndexOf044
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.lastIndexOf(false, arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0450
     * @tc.name testReadonlyArrayLastIndexOf045
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.lastIndexOf("z", arr.length)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0460
     * @tc.name testReadonlyArrayLastIndexOf046
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length plus one search byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.lastIndexOf(0 as byte, arr.length + 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0470
     * @tc.name testReadonlyArrayLastIndexOf047
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length plus one search short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.lastIndexOf(0 as short, arr.length + 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0480
     * @tc.name testReadonlyArrayLastIndexOf048
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length plus one search int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.lastIndexOf(0, arr.length + 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0490
     * @tc.name testReadonlyArrayLastIndexOf049
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length plus one search long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<long> = [1, 0, 2];
      expect(arr.lastIndexOf(0, arr.length + 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0500
     * @tc.name testReadonlyArrayLastIndexOf050
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length plus one search float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.lastIndexOf(0.0f, arr.length + 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0510
     * @tc.name testReadonlyArrayLastIndexOf051
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length plus one search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.lastIndexOf(0.0, arr.length + 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0520
     * @tc.name testReadonlyArrayLastIndexOf052
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length plus one search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.lastIndexOf(c'x', arr.length + 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0530
     * @tc.name testReadonlyArrayLastIndexOf053
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length plus one search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.lastIndexOf(false, arr.length + 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0540
     * @tc.name testReadonlyArrayLastIndexOf054
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex length plus one search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.lastIndexOf("z", arr.length + 1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0550
     * @tc.name testReadonlyArrayLastIndexOf055
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex - 1 search byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.lastIndexOf(0 as byte, -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0560
     * @tc.name testReadonlyArrayLastIndexOf056
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex - 1 search short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.lastIndexOf(0 as short, -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0570
     * @tc.name testReadonlyArrayLastIndexOf057
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex - 1 search int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.lastIndexOf(0, -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0580
     * @tc.name testReadonlyArrayLastIndexOf058
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex - 1 search long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<long> = [1, 0, 2];
      expect(arr.lastIndexOf(0, -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0590
     * @tc.name testReadonlyArrayLastIndexOf059
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex - 1 search float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {

      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.lastIndexOf(0.0f, -1)).assertEqual(1);
    });
  })
}
