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

class ComboObjarr {
  id: int = 1;
}

function toByteValue(value: int): byte {
  return Int.toByte(value);
}

function toShortValue(value: int): short {
  return Int.toShort(value);
}

export default function ReadonlyArrayIncludesTest(): void {
  describe('ReadonlyArrayIncludesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0010
     * @tc.name testReadonlyArrayIncludes001
     * @tc.desc Verify ReadonlyArray.includes behavior: passing searchElement parameter verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 4, 5];
      const result = arr.includes(3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0020
     * @tc.name testReadonlyArrayIncludes002
     * @tc.desc Verify ReadonlyArray.includes behavior: passing searchElement fromIndex parameter verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.includes(2, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0030
     * @tc.name testReadonlyArrayIncludes003
     * @tc.desc Verify ReadonlyArray.includes behavior: searchElement basic lookup without fromIndex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.includes(2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0040
     * @tc.name testReadonlyArrayIncludes004
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex length not found verify includes is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.includes(2, 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0050
     * @tc.name testReadonlyArrayIncludes005
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex is verify includes is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.includes(2, -2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0060
     * @tc.name testReadonlyArrayIncludes006
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex length 0 verify includes is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      const result = arr.includes(2, -10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0070
     * @tc.name testReadonlyArrayIncludes007
     * @tc.desc Verify ReadonlyArray.includes behavior: element not found returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const result = arr.includes(99);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0080
     * @tc.name testReadonlyArrayIncludes008
     * @tc.desc Verify ReadonlyArray.includes behavior: element element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      const result = arr.includes(42);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0090
     * @tc.name testReadonlyArrayIncludes009
     * @tc.desc Verify ReadonlyArray.includes behavior: int boundary value 2147483647 verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647];
      const result = arr.includes(2147483647);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0100
     * @tc.name testReadonlyArrayIncludes010
     * @tc.desc Verify ReadonlyArray.includes behavior: int boundary value - 2147483648 verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [-2147483648];
      const result = arr.includes(-2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0110
     * @tc.name testReadonlyArrayIncludes011
     * @tc.desc Verify ReadonlyArray.includes behavior: int 0 - 1 verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, -1, 2];
      const result = arr.includes(-1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0120
     * @tc.name testReadonlyArrayIncludes012
     * @tc.desc Verify ReadonlyArray.includes behavior: byte - 128 verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte, 0 as byte];
      const result = arr.includes(-128 as byte);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0130
     * @tc.name testReadonlyArrayIncludes013
     * @tc.desc Verify ReadonlyArray.includes behavior: byte 127 verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, 127 as byte];
      const result = arr.includes(127 as byte);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0140
     * @tc.name testReadonlyArrayIncludes014
     * @tc.desc Verify ReadonlyArray.includes behavior: byte 0x0A verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0x0A as byte];
      const result = arr.includes(0x0A as byte);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0150
     * @tc.name testReadonlyArrayIncludes015
     * @tc.desc Verify ReadonlyArray.includes behavior: short - 32768 verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short];
      const result = arr.includes(-32768 as short);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0160
     * @tc.name testReadonlyArrayIncludes016
     * @tc.desc Verify ReadonlyArray.includes behavior: short 32767 verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short];
      const result = arr.includes(32767 as short);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0170
     * @tc.name testReadonlyArrayIncludes017
     * @tc.desc Verify ReadonlyArray.includes behavior: long verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807];
      const result = arr.includes(9223372036854775807);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0180
     * @tc.name testReadonlyArrayIncludes018
     * @tc.desc Verify ReadonlyArray.includes behavior: long verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [-9223372036854775808];
      const result = arr.includes(-9223372036854775808);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0190
     * @tc.name testReadonlyArrayIncludes019
     * @tc.desc Verify ReadonlyArray.includes behavior: float 0.0f verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [0.0f, 1.0f];
      const result = arr.includes(0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0200
     * @tc.name testReadonlyArrayIncludes020
     * @tc.desc Verify ReadonlyArray.includes behavior: float - 0.0f verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f];
      const result = arr.includes(-0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0210
     * @tc.name testReadonlyArrayIncludes021
     * @tc.desc Verify ReadonlyArray.includes behavior: float verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [1.0f, Double.toFloat(Number.POSITIVE_INFINITY)];
      const result = arr.includes(Double.toFloat(Number.POSITIVE_INFINITY));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0220
     * @tc.name testReadonlyArrayIncludes022
     * @tc.desc Verify ReadonlyArray.includes behavior: double type element verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<double> = [1.1, 2.2];
      const result = arr.includes(2.2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0230
     * @tc.name testReadonlyArrayIncludes023
     * @tc.desc Verify ReadonlyArray.includes behavior: char empty u0000 verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\u0000'];
      const result = arr.includes(c'\u0000');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0240
     * @tc.name testReadonlyArrayIncludes024
     * @tc.desc Verify ReadonlyArray.includes behavior: char uffff verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'\uffff', c'a'];
      const result = arr.includes(c'\uffff');
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0250
     * @tc.name testReadonlyArrayIncludes025
     * @tc.desc Verify ReadonlyArray.includes behavior: boolean true verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [false, true];
      const result = arr.includes(true);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0260
     * @tc.name testReadonlyArrayIncludes026
     * @tc.desc Verify ReadonlyArray.includes behavior: boolean false verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.includes(false);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0270
     * @tc.name testReadonlyArrayIncludes027
     * @tc.desc Verify ReadonlyArray.includes behavior: string type empty string element verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["", "other"];
      const result = arr.includes("");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0280
     * @tc.name testReadonlyArrayIncludes028
     * @tc.desc Verify ReadonlyArray.includes behavior: string type Unicode verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\u4e2d\u6587", "other"];
      const result = arr.includes("\u4e2d\u6587");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0290
     * @tc.name testReadonlyArrayIncludes029
     * @tc.desc Verify ReadonlyArray.includes behavior: string type emoji Unicode verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\uD83D\uDE00", "other"];
      const result = arr.includes("\uD83D\uDE00");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0300
     * @tc.name testReadonlyArrayIncludes030
     * @tc.desc Verify ReadonlyArray.includes behavior: string type string 0x123 verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["0x123", "other"];
      const result = arr.includes("0x123");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0310
     * @tc.name testReadonlyArrayIncludes031
     * @tc.desc Verify ReadonlyArray.includes behavior: string type t verify includes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["\t", "other"];
      const result = arr.includes("\t");
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0320
     * @tc.name testReadonlyArrayIncludes032
     * @tc.desc Verify ReadonlyArray.includes behavior: element 0 verify falsy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, 1, 2];
      const result = arr.includes(0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0330
     * @tc.name testReadonlyArrayIncludes033
     * @tc.desc Verify ReadonlyArray.includes behavior: includes after original array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3];
      const len = arr.length;
      const result = arr.includes(2);
      expect(result).assertTrue();
      expect(arr.length).assertEqual(len);
      expect(arr[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0340
     * @tc.name testReadonlyArrayIncludes034
     * @tc.desc Verify ReadonlyArray.includes behavior: float NaN element SameValueZero match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f];
      const result = arr.includes(nan);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0350
     * @tc.name testReadonlyArrayIncludes035
     * @tc.desc Verify ReadonlyArray.includes behavior: search 0.0f matches - 0.0f array element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<float> = [-0.0f, 1.0f];
      const result = arr.includes(0.0f);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0360
     * @tc.name testReadonlyArrayIncludes036
     * @tc.desc Verify ReadonlyArray.includes behavior: double NaN element match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.1, nan, 2.2];
      const result = arr.includes(nan);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0370
     * @tc.name testReadonlyArrayIncludes037
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - int repeated elements - fromIndex=2, verify includes searches from the specified position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 10, 30, 10];
      const result = arr.includes(10, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0380
     * @tc.name testReadonlyArrayIncludes038
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - int repeated elements - fromIndex=1, verify includes searches from the specified position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 10, 30, 10];
      const result = arr.includes(10, 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0390
     * @tc.name testReadonlyArrayIncludes039
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - byte repeated elements - fromIndex=2, verify includes searches from the specified position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [10 as byte, 20 as byte, 10 as byte, 30 as byte, 10 as byte];
      const result = arr.includes(10 as byte, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0400
     * @tc.name testReadonlyArrayIncludes040
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - char repeated elements - fromIndex=2, verify includes searches from the specified position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b', c'a', c'c', c'a'];
      const result = arr.includes(c'a', 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0410
     * @tc.name testReadonlyArrayIncludes041
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - boolean repeated elements - fromIndex=2, verify includes searches from the specified position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false, true, false, true];
      const result = arr.includes(true, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0420
     * @tc.name testReadonlyArrayIncludes042
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - string - empty string - fromIndex=2, verify includes searches from the specified position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "", "y", "z", ""];
      const result = arr.includes("", 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0430
     * @tc.name testReadonlyArrayIncludes043
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - 100 elements array - fromIndex=50, verify includes extended case middle extended case search extended case elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: Array<int> = [];
      for (let i: int = 0; i < 100; i++) {
        source.push(i);
      }
      const arr: ReadonlyArray<int> = source as ReadonlyArray<int>;
      const result = arr.includes(99, 50);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0440
     * @tc.name testReadonlyArrayIncludes044
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - float NaN - fromIndex=3, verify includes searches the second NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: float = Double.toFloat(Number.NaN);
      const arr: ReadonlyArray<float> = [1.0f, nan, 2.0f, nan, 3.0f];
      const result = arr.includes(nan, 3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0450
     * @tc.name testReadonlyArrayIncludes045
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - double NaN - fromIndex=3, verify includes searches the second NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const nan: double = Number.NaN;
      const arr: ReadonlyArray<double> = [1.0, nan, 2.0, nan, 3.0];
      const result = arr.includes(nan, 3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0460
     * @tc.name testReadonlyArrayIncludes046
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - int boundary 2147483647 - fromIndex=2, verify includes searches from the specified position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647, 0, 2147483647, -1, 2147483647];
      const result = arr.includes(2147483647, 2);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0470
     * @tc.name testReadonlyArrayIncludes047
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex matrix - int extended case elements - fromIndex=2, verify includes not found 20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [10, 20, 10, 30, 10];
      const result = arr.includes(20, 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0480
     * @tc.name testReadonlyArrayIncludes048
     * @tc.desc Verify ReadonlyArray.includes behavior: empty array search returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [];
      const result = arr.includes(1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0490
     * @tc.name testReadonlyArrayIncludes049
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex negative beyond length search empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["a", ""];
      const result = arr.includes("", -(arr.length + 1));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0500
     * @tc.name testReadonlyArrayIncludes050
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int max search byte element out of range returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, 1 as byte];
      const result = arr.includes(0 as byte, 2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0510
     * @tc.name testReadonlyArrayIncludes051
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int max search int element out of range returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, 1];
      const result = arr.includes(0, 2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0520
     * @tc.name testReadonlyArrayIncludes052
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int max search char element out of range returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b'];
      const result = arr.includes(c'a', 2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0530
     * @tc.name testReadonlyArrayIncludes053
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int max search boolean element out of range returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.includes(true, 2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0540
     * @tc.name testReadonlyArrayIncludes054
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int max search string element out of range returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "y"];
      const result = arr.includes("x", 2147483647);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0550
     * @tc.name testReadonlyArrayIncludes055
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int min search byte element from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [0 as byte, 1 as byte];
      const result = arr.includes(0 as byte, -2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0560
     * @tc.name testReadonlyArrayIncludes056
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int min search int element from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [0, 1];
      const result = arr.includes(0, -2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0570
     * @tc.name testReadonlyArrayIncludes057
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int min search char element from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<char> = [c'a', c'b'];
      const result = arr.includes(c'a', -2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0580
     * @tc.name testReadonlyArrayIncludes058
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int min search boolean element from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<boolean> = [true, false];
      const result = arr.includes(true, -2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0590
     * @tc.name testReadonlyArrayIncludes059
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex int min search string element from start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<string> = ["x", "y"];
      const result = arr.includes("x", -2147483648);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0600
     * @tc.name testReadonlyArrayIncludes060
     * @tc.desc Verify ReadonlyArray.includes behavior: duplicate element search middle value found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      expect(arr.includes(2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0610
     * @tc.name testReadonlyArrayIncludes061
     * @tc.desc Verify ReadonlyArray.includes behavior: duplicate element search missing value returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 3, 2];
      expect(arr.includes(9)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0620
     * @tc.name testReadonlyArrayIncludes062
     * @tc.desc Verify ReadonlyArray.includes behavior: single element array search miss returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [42];
      expect(arr.includes(43)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0630
     * @tc.name testReadonlyArrayIncludes063
     * @tc.desc Verify ReadonlyArray.includes behavior: 100 element array search last index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 100; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      expect(arr.includes(99)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0640
     * @tc.name testReadonlyArrayIncludes064
     * @tc.desc Verify ReadonlyArray.includes behavior: 1000 element array search last index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const data: Array<int> = [];
      for (let i: int = 0; i < 1000; i++) { data.push(i); }
      const arr: ReadonlyArray<int> = data as ReadonlyArray<int>;
      expect(arr.includes(999)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0650
     * @tc.name testReadonlyArrayIncludes065
     * @tc.desc Verify ReadonlyArray.includes behavior: fromIndex limits search range for duplicate int
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [1, 2, 1];
      expect(arr.includes(1, 2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0660
     * @tc.name testReadonlyArrayIncludes066
     * @tc.desc Verify ReadonlyArray.includes behavior: byte max+1 overflow wraps to min and is included
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [-128 as byte];
      const overflow: int = 127 + 1;
      expect(arr.includes(toByteValue(overflow))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0670
     * @tc.name testReadonlyArrayIncludes067
     * @tc.desc Verify ReadonlyArray.includes behavior: byte min-1 overflow wraps to max and is included
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<byte> = [127 as byte];
      const overflow: int = -128 - 1;
      expect(arr.includes(toByteValue(overflow))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0680
     * @tc.name testReadonlyArrayIncludes068
     * @tc.desc Verify ReadonlyArray.includes behavior: short max+1 overflow wraps to min and is included
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [-32768 as short];
      const overflow: int = 32767 + 1;
      expect(arr.includes(toShortValue(overflow))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0690
     * @tc.name testReadonlyArrayIncludes069
     * @tc.desc Verify ReadonlyArray.includes behavior: short min-1 overflow wraps to max and is included
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<short> = [32767 as short];
      const overflow: int = -32768 - 1;
      expect(arr.includes(toShortValue(overflow))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0700
     * @tc.name testReadonlyArrayIncludes070
     * @tc.desc Verify ReadonlyArray.includes behavior: int max+1 overflow wraps to min and is included
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [-2147483648];
      expect(arr.includes(2147483647 + 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0710
     * @tc.name testReadonlyArrayIncludes071
     * @tc.desc Verify ReadonlyArray.includes behavior: int min-1 overflow wraps to max and is included
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<int> = [2147483647];
      expect(arr.includes(-2147483648 - 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0720
     * @tc.name testReadonlyArrayIncludes072
     * @tc.desc Verify ReadonlyArray.includes behavior: long max+1 overflow wraps to min and is included
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [-9223372036854775808];
      expect(arr.includes(9223372036854775807 + 1)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_READONLY_ARRAY_INCLUDES_0730
     * @tc.name testReadonlyArrayIncludes073
     * @tc.desc Verify ReadonlyArray.includes behavior: long min-1 overflow wraps to max and is included
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReadonlyArrayIncludes073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: ReadonlyArray<long> = [9223372036854775807];
      expect(arr.includes(-9223372036854775808 - 1)).assertTrue();
    });
  });
}
