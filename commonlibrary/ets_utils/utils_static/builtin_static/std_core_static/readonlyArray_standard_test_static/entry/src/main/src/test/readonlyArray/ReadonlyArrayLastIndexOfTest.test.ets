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

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0600
     * @tc.name testReadonlyArrayLastIndexOf060
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex - 1 search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.lastIndexOf(0.0, -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0610
     * @tc.name testReadonlyArrayLastIndexOf061
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex - 1 search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.lastIndexOf(c'x', -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0620
     * @tc.name testReadonlyArrayLastIndexOf062
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex - 1 search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.lastIndexOf(false, -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0630
     * @tc.name testReadonlyArrayLastIndexOf063
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex - 1 search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.lastIndexOf("z", -1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0640
     * @tc.name testReadonlyArrayLastIndexOf064
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative length search byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, 1 as byte];
      expect(arr.lastIndexOf(0 as byte, -arr.length)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0650
     * @tc.name testReadonlyArrayLastIndexOf065
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative length search short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [0 as short, 1 as short];
      expect(arr.lastIndexOf(0 as short, -arr.length)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0660
     * @tc.name testReadonlyArrayLastIndexOf066
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative length search int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, 1, 2];
      expect(arr.lastIndexOf(0, -arr.length)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0670
     * @tc.name testReadonlyArrayLastIndexOf067
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative length search long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [0, 1, 2];
      expect(arr.lastIndexOf(0, -arr.length)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0680
     * @tc.name testReadonlyArrayLastIndexOf068
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative length search float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, 1.0f, 2.0f];
      expect(arr.lastIndexOf(0.0f, -arr.length)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0690
     * @tc.name testReadonlyArrayLastIndexOf069
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative length search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [0.0, 1.0, 2.0];
      expect(arr.lastIndexOf(0.0, -arr.length)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0700
     * @tc.name testReadonlyArrayLastIndexOf070
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative length search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'x', c'a', c'b'];
      expect(arr.lastIndexOf(c'x', -arr.length)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0710
     * @tc.name testReadonlyArrayLastIndexOf071
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative length search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [false, true, true];
      expect(arr.lastIndexOf(false, -arr.length)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0720
     * @tc.name testReadonlyArrayLastIndexOf072
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative length search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["z", "a", "b"];
      expect(arr.lastIndexOf("z", -arr.length)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0730
     * @tc.name testReadonlyArrayLastIndexOf073
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative beyond length search byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.lastIndexOf(0 as byte, -(arr.length + 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0740
     * @tc.name testReadonlyArrayLastIndexOf074
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative beyond length search short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.lastIndexOf(0 as short, -(arr.length + 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0750
     * @tc.name testReadonlyArrayLastIndexOf075
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative beyond length search int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.lastIndexOf(0, -(arr.length + 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0760
     * @tc.name testReadonlyArrayLastIndexOf076
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative beyond length search long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [1, 0, 2];
      expect(arr.lastIndexOf(0, -(arr.length + 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0770
     * @tc.name testReadonlyArrayLastIndexOf077
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative beyond length search float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.lastIndexOf(0.0f, -(arr.length + 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0780
     * @tc.name testReadonlyArrayLastIndexOf078
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative beyond length search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.lastIndexOf(0.0, -(arr.length + 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0790
     * @tc.name testReadonlyArrayLastIndexOf079
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative beyond length search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.lastIndexOf(c'x', -(arr.length + 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0800
     * @tc.name testReadonlyArrayLastIndexOf080
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative beyond length search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.lastIndexOf(false, -(arr.length + 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0810
     * @tc.name testReadonlyArrayLastIndexOf081
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex negative beyond length search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.lastIndexOf("z", -(arr.length + 1))).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0820
     * @tc.name testReadonlyArrayLastIndexOf082
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int max search byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.lastIndexOf(0 as byte, 2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0830
     * @tc.name testReadonlyArrayLastIndexOf083
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int max search short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.lastIndexOf(0 as short, 2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0840
     * @tc.name testReadonlyArrayLastIndexOf084
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int max search int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.lastIndexOf(0, 2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0850
     * @tc.name testReadonlyArrayLastIndexOf085
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int max search long
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [1, 0, 2];
      expect(arr.lastIndexOf(0, 2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0860
     * @tc.name testReadonlyArrayLastIndexOf086
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int max search float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.lastIndexOf(0.0f, 2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0870
     * @tc.name testReadonlyArrayLastIndexOf087
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int max search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.lastIndexOf(0.0, 2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0880
     * @tc.name testReadonlyArrayLastIndexOf088
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int max search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.lastIndexOf(c'x', 2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0890
     * @tc.name testReadonlyArrayLastIndexOf089
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int max search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.lastIndexOf(false, 2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0900
     * @tc.name testReadonlyArrayLastIndexOf090
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int max search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.lastIndexOf("z", 2147483647)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0910
     * @tc.name testReadonlyArrayLastIndexOf091
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int min search byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [1 as byte, 0 as byte];
      expect(arr.lastIndexOf(0 as byte, -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0920
     * @tc.name testReadonlyArrayLastIndexOf092
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int min search short
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [1 as short, 0 as short];
      expect(arr.lastIndexOf(0 as short, -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0930
     * @tc.name testReadonlyArrayLastIndexOf093
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int min search int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 0, 2];
      expect(arr.lastIndexOf(0, -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0940
     * @tc.name testReadonlyArrayLastIndexOf094
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int min search float
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, 0.0f, 2.0f];
      expect(arr.lastIndexOf(0.0f, -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0950
     * @tc.name testReadonlyArrayLastIndexOf095
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int min search double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.0, 0.0, 2.0];
      expect(arr.lastIndexOf(0.0, -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0960
     * @tc.name testReadonlyArrayLastIndexOf096
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int min search char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'x', c'b'];
      expect(arr.lastIndexOf(c'x', -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0970
     * @tc.name testReadonlyArrayLastIndexOf097
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int min search boolean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true];
      expect(arr.lastIndexOf(false, -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0980
     * @tc.name testReadonlyArrayLastIndexOf098
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex int min search string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", "z", "b"];
      expect(arr.lastIndexOf("z", -2147483648)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_0990
     * @tc.name testReadonlyArrayLastIndexOf099
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: duplicate search last occurrence index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      expect(arr.lastIndexOf(2)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1000
     * @tc.name testReadonlyArrayLastIndexOf100
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search missing value returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      expect(arr.lastIndexOf(9)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1010
     * @tc.name testReadonlyArrayLastIndexOf101
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: empty array search returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      expect(arr.lastIndexOf(1)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1020
     * @tc.name testReadonlyArrayLastIndexOf102
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: single element hit returns index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      expect(arr.lastIndexOf(42)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1030
     * @tc.name testReadonlyArrayLastIndexOf103
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: single element miss returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      expect(arr.lastIndexOf(43)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1040
     * @tc.name testReadonlyArrayLastIndexOf104
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: NaN strict equality returns - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f];
      expect(arr.lastIndexOf(nan)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1050
     * @tc.name testReadonlyArrayLastIndexOf105
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search 0.0f matches last zero index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, -0.0f, 0.0f];
      expect(arr.lastIndexOf(0.0f)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1060
     * @tc.name testReadonlyArrayLastIndexOf106
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: 100 element array search last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      expect(arr.lastIndexOf(99)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1070
     * @tc.name testReadonlyArrayLastIndexOf107
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: 1000 element array search last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      expect(arr.lastIndexOf(999)).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1080
     * @tc.name testReadonlyArrayLastIndexOf108
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search zero int last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [5, 0, 7, 0];
      expect(arr.lastIndexOf(0)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1090
     * @tc.name testReadonlyArrayLastIndexOf109
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: boolean array search false last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false];
      expect(arr.lastIndexOf(false)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1100
     * @tc.name testReadonlyArrayLastIndexOf110
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: fromIndex limits backward search upper bound
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2, 1];
      expect(arr.lastIndexOf(2, 2)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1110
     * @tc.name testReadonlyArrayLastIndexOf111
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: call does not change source array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const len: int = arr.length;
      arr.lastIndexOf(2);
      expect(arr.length).assertEqual(len);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1120
     * @tc.name testReadonlyArrayLastIndexOf112
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search empty string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "", ""];
      expect(arr.lastIndexOf("")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1130
     * @tc.name testReadonlyArrayLastIndexOf113
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search unicode Chinese element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\u4e2d\u6587", "\u4e2d\u6587"];
      expect(arr.lastIndexOf("\u4e2d\u6587")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1140
     * @tc.name testReadonlyArrayLastIndexOf114
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search emoji element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\uD83D\uDE00", "\uD83D\uDE00"];
      expect(arr.lastIndexOf("\uD83D\uDE00")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1150
     * @tc.name testReadonlyArrayLastIndexOf115
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search zwsp element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\u200B", "\u200B"];
      expect(arr.lastIndexOf("\u200B")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1160
     * @tc.name testReadonlyArrayLastIndexOf116
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search tab element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\t", "\t"];
      expect(arr.lastIndexOf("\t")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1170
     * @tc.name testReadonlyArrayLastIndexOf117
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search crlf element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\r\n", "\r\n"];
      expect(arr.lastIndexOf("\r\n")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1180
     * @tc.name testReadonlyArrayLastIndexOf118
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search Japanese element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\u30C6\u30B9\u30C8", "\u30C6\u30B9\u30C8"];
      expect(arr.lastIndexOf("\u30C6\u30B9\u30C8")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1190
     * @tc.name testReadonlyArrayLastIndexOf119
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search Korean element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\uD14C\uC2A4\uD2B8", "\uD14C\uC2A4\uD2B8"];
      expect(arr.lastIndexOf("\uD14C\uC2A4\uD2B8")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1200
     * @tc.name testReadonlyArrayLastIndexOf120
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search Russian element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "袗袘袙袚袛", "袗袘袙袚袛"];
      expect(arr.lastIndexOf("袗袘袙袚袛")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1210
     * @tc.name testReadonlyArrayLastIndexOf121
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search Arabic element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "丕賱丕禺鬲亘丕乇", "丕賱丕禺鬲亘丕乇"];
      expect(arr.lastIndexOf("丕賱丕禺鬲亘丕乇")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1220
     * @tc.name testReadonlyArrayLastIndexOf122
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search email element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "test@example.com", "test@example.com"];
      expect(arr.lastIndexOf("test@example.com")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1230
     * @tc.name testReadonlyArrayLastIndexOf123
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search phone element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "13800138000", "13800138000"];
      expect(arr.lastIndexOf("13800138000")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1240
     * @tc.name testReadonlyArrayLastIndexOf124
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search mojibake element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "忙碌猫炉", "忙碌猫炉"];
      expect(arr.lastIndexOf("忙碌猫炉")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1250
     * @tc.name testReadonlyArrayLastIndexOf125
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search replacement element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\uFFFD", "\uFFFD"];
      expect(arr.lastIndexOf("\uFFFD")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1260
     * @tc.name testReadonlyArrayLastIndexOf126
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search lone surrogate element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\udc04", "\udc04"];
      expect(arr.lastIndexOf("\udc04")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1270
     * @tc.name testReadonlyArrayLastIndexOf127
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search XSS element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "<script>alert(1)</script>", "<script>alert(1)</script>"];
      expect(arr.lastIndexOf("<script>alert(1)</script>")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1280
     * @tc.name testReadonlyArrayLastIndexOf128
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search fullwidth dash element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "\uFF0D", "\uFF0D"];
      expect(arr.lastIndexOf("\uFF0D")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1290
     * @tc.name testReadonlyArrayLastIndexOf129
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search 100 char element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "";
      for (let i: int = 0; i < 100; i++) { s = s + "a"; }
      const arr: ReadonlyArray<string> = ["x", s, s];
      expect(arr.lastIndexOf(s)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1300
     * @tc.name testReadonlyArrayLastIndexOf130
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search mixed language element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "Test 娓│", "Test 娓│"];
      expect(arr.lastIndexOf("Test 娓│")).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1310
     * @tc.name testReadonlyArrayLastIndexOf131
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search int boundary 0 last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 0, 0];
      expect(arr.lastIndexOf(0)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1320
     * @tc.name testReadonlyArrayLastIndexOf132
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search int boundary 2147483647 last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, 2147483647, 2147483647];
      expect(arr.lastIndexOf(2147483647)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1330
     * @tc.name testReadonlyArrayLastIndexOf133
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: search int boundary - 2147483648 last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -2147483648];
      expect(arr.lastIndexOf(-2147483648)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1340
     * @tc.name testReadonlyArrayLastIndexOf134
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: NaN - lastIndexOf NaN - 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [nan, 1.0];
      expect(arr.lastIndexOf(nan)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1350
     * @tc.name testReadonlyArrayLastIndexOf135
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: readonly constraint - original array length unchanged after call - length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const before: int = arr.length;
      arr.lastIndexOf(1);
      expect(arr.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1360
     * @tc.name testReadonlyArrayLastIndexOf136
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: byte max+1 overflow wraps to min and is found at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte, -128 as byte];
      const overflow: int = 127 + 1;
      expect(arr.lastIndexOf(toByteValue(overflow))).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1370
     * @tc.name testReadonlyArrayLastIndexOf137
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: byte min-1 overflow wraps to max and is found at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [127 as byte, 0 as byte, 127 as byte];
      const overflow: int = -128 - 1;
      expect(arr.lastIndexOf(toByteValue(overflow))).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1380
     * @tc.name testReadonlyArrayLastIndexOf138
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: short max+1 overflow wraps to min and is found at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short, 0 as short, -32768 as short];
      const overflow: int = 32767 + 1;
      expect(arr.lastIndexOf(toShortValue(overflow))).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1390
     * @tc.name testReadonlyArrayLastIndexOf139
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: short min-1 overflow wraps to max and is found at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short, 0 as short, 32767 as short];
      const overflow: int = -32768 - 1;
      expect(arr.lastIndexOf(toShortValue(overflow))).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1400
     * @tc.name testReadonlyArrayLastIndexOf140
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: int max+1 overflow wraps to min and is found at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [-2147483648, 0, -2147483648];
      expect(arr.lastIndexOf(2147483647 + 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1410
     * @tc.name testReadonlyArrayLastIndexOf141
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: int min-1 overflow wraps to max and is found at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, 0, 2147483647];
      expect(arr.lastIndexOf(-2147483648 - 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1420
     * @tc.name testReadonlyArrayLastIndexOf142
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: long max+1 overflow wraps to min and is found at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [-9223372036854775808, 0, -9223372036854775808];
      expect(arr.lastIndexOf(9223372036854775807 + 1)).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_LAST_INDEX_OF_1430
     * @tc.name testReadonlyArrayLastIndexOf143
     * @tc.desc Verify ReadonlyArray.lastIndexOf behavior: long min-1 overflow wraps to max and is found at last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayLastIndexOf143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807, 0, 9223372036854775807];
      expect(arr.lastIndexOf(-9223372036854775808 - 1)).assertEqual(2);
    });

  });
}

