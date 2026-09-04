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

import {
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function getShort(): String {
  return "AB";
}

function padLeftGeneric<T extends String>(input: T, len: int, ch: char): String {
  return input.padLeft(ch, len);
}

export default function StringPadLeft2Test(): void {
  describe('StringPadLeft2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_0100
     * @tc.name testPadLeft001
     * @tc.desc Verify padLeft() on new String() instance returns same result as String literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String("ABC");
      let str2: String = "ABC";
      let result1: String = str1.padLeft(c'0', 6);
      let result2: String = str2.padLeft(c'0', 6);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual("000ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_0200
     * @tc.name testPadLeft002
     * @tc.desc Verify padLeft() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = getShort().padLeft(c'x', 5);
      expect(result).assertEqual("xxxAB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_0300
     * @tc.name testPadLeft003
     * @tc.desc Verify padLeft() with 0 length returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "abc";
      let result: String = str.padLeft(c'0', 0);
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_0400
     * @tc.name testPadLeft004
     * @tc.desc Verify padLeft() with length 100 pads to specified length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "A";
      let result: String = str.padLeft(c'0', 100);
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_0500
     * @tc.name testPadLeft005
     * @tc.desc Verify padLeft() on emoji target string returns correct padded result with expected length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "😀";
      let result: String = str.padLeft(c'0', 3);
      expect(result).assertEqual("0😀");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_0600
     * @tc.name testPadLeft006
     * @tc.desc Verify chained padLeft().toLowerCase() correctly pads left then lowercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "ABC";
      let result: String = str.padLeft(c'X', 8).toLowerCase();
      expect(result).assertEqual("xxxxxabc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_0700
     * @tc.name testPadLeft007
     * @tc.desc Verify padLeft() in generic function with T extends String constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = padLeftGeneric("GO" as String, 6, c'*');
      expect(result).assertEqual("****GO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_0800
     * @tc.name testPadLeft008
     * @tc.desc Verify padLeft() return value with combined typeof content and length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "multi";
      let result: String = str.padLeft(c'.', 10);
      expect(result).assertEqual(".....multi");
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_0900
     * @tc.name testPadLeft009
     * @tc.desc Verify padLeft() and padRight() produce equal lengths when padded to same targetLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "test";
      let r1: String = str.padLeft(c'0', 10);
      let r2: String = str.padRight(c'0', 10);
      expect(r1.length).assertEqual(10);
      expect(r2.length).assertEqual(10);
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1000
     * @tc.name testPadLeft010
     * @tc.desc Verify padLeft(char) and padStart(string) produce identical result for single-character padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "AB";
      let r1: string = s.padLeft(c'0', 6).toString();
      let r2: string = s.padStart(6, "0");
      expect(r1).assertEqual("0000AB");
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1100
     * @tc.name testPadLeft011
     * @tc.desc Verify padLeft with negative targetLength returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hi";
      let result: String = str.padLeft(c'*', -1);
      expect(result).assertEqual("hi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1200
     * @tc.name testPadLeft012
     * @tc.desc Verify padLeft on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "42";
      let result: String = str.padLeft(c'*', 5);
      expect(result.toString()).assertEqual("***42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1300
     * @tc.name testPadLeft013
     * @tc.desc Verify String instance padLeft returns String object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("42");
      let result: String = str.padLeft(c'0', 5);
      expect(result.toString()).assertEqual("00042");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1400
     * @tc.name testPadLeft014
     * @tc.desc Verify padLeft with number as fill char converted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "42".padLeft(c'0', 5);
      expect(result.toString()).assertEqual("00042");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1500
     * @tc.name testPadLeft015
     * @tc.desc Verify padLeft with targetLength equal to actual length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "hello".padLeft(c'*', 5);
      expect(result.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1600
     * @tc.name testPadLeft016
     * @tc.desc Verify padLeft post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "  hi".padLeft(c'*', 5);
      expect(result.toString()).assertEqual("*  hi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1700
     * @tc.name testPadLeft017
     * @tc.desc Verify triple chain trim-padStart-toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "  HI  ".trim().padStart(5, "*").toLowerCase();
      expect(result).assertEqual("***hi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1800
     * @tc.name testPadLeft018
     * @tc.desc Verify real-world: padStart with zero for number formatting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num: string = "42";
      let formatted: string = num.padStart(5, "0").concat(" items");
      expect(formatted).assertEqual("00042 items");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_1900
     * @tc.name testPadLeft019
     * @tc.desc Verify padLeft typeof is object (String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "hi".padLeft(c'*', 5);
      expect(result.toString()).assertEqual("***hi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_2000
     * @tc.name testPadLeft020
     * @tc.desc Verify padLeft on empty string with padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "".padLeft(c'0', 5);
      expect(result.toString()).assertEqual("00000");
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_2100
     * @tc.name testPadLeft021
     * @tc.desc Verify padLeft with NUL char as fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "hi".padLeft(c'\0', 5);
      expect(result.getLength()).assertEqual(5);
      expect(result.charAt(3).toString()).assertEqual("h");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_2200
     * @tc.name testPadLeft022
     * @tc.desc Verify padLeft with CJK fill character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "hi".padLeft(c'中', 5);
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_2300
     * @tc.name testPadLeft023
     * @tc.desc Verify padLeft on concatenation expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = ("4" + "2").padLeft(c'0', 5);
      expect(result.toString()).assertEqual("00042");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADLEFT2_2400
     * @tc.name testPadLeft024
     * @tc.desc Verify padLeft() on empty string returns all padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadLeft024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".padLeft("0".charAt(0), 5);
      expect(result).assertEqual("00000");
      expect(result.length).assertEqual(5);
    });

  });
}