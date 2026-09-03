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
  return "XY";
}

function padRightGeneric<T extends String>(input: T, len: int, ch: char): String {
  return input.padRight(ch, len);
}

export default function StringPadRight2Test(): void {
  describe('StringPadRight2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_0100
     * @tc.name testPadRight001
     * @tc.desc Verify padRight() on new String() instance returns same result as String literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String("ABC");
      let str2: String = "ABC";
      let result1: String = str1.padRight(c'0', 6);
      let result2: String = str2.padRight(c'0', 6);
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual("ABC000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_0200
     * @tc.name testPadRight002
     * @tc.desc Verify padRight() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = getShort().padRight(c'z', 5);
      expect(result).assertEqual("XYzzz");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_0300
     * @tc.name testPadRight003
     * @tc.desc Verify padRight() with 0 length returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "abc";
      let result: String = str.padRight(c'0', 0);
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_0400
     * @tc.name testPadRight004
     * @tc.desc Verify padRight() with length 100 pads to specified length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "A";
      let result: String = str.padRight(c'0', 100);
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_0500
     * @tc.name testPadRight005
     * @tc.desc Verify padRight() on emoji target string returns correct padded result with expected length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "😀";
      let result: String = str.padRight(c'0', 3);
      expect(result).assertEqual("😀0");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_0600
     * @tc.name testPadRight006
     * @tc.desc Verify chained padRight().toUpperCase() correctly pads right then uppercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "abc";
      let result: String = str.padRight(c'x', 8).toUpperCase();
      expect(result).assertEqual("ABCXXXXX");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_0700
     * @tc.name testPadRight007
     * @tc.desc Verify padRight() in generic function with T extends String constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = padRightGeneric("GO" as String, 6, c'*');
      expect(result).assertEqual("GO****");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_0800
     * @tc.name testPadRight008
     * @tc.desc Verify padRight() return value with combined typeof content and length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = "multi";
      let result: String = str.padRight(c'.', 10);
      expect(result).assertEqual("multi.....");
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_0900
     * @tc.name testPadRight009
     * @tc.desc Verify padRight(char) and padEnd(string) produce identical result for single-character padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "CD";
      let r1: string = s.padRight(c'0', 6).toString();
      let r2: string = s.padEnd(6, "0");
      expect(r1).assertEqual("CD0000");
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1000
     * @tc.name testPadRight010
     * @tc.desc Verify padRight with negative targetLength returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "hi";
      let result: String = str.padRight(c'*', -1);
      expect(result).assertEqual("hi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1100
     * @tc.name testPadRight011
     * @tc.desc Verify padRight on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = "42";
      let result: String = str.padRight(c'*', 5);
      expect(result.toString()).assertEqual("42***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1200
     * @tc.name testPadRight012
     * @tc.desc Verify String instance padRight returns String object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("42");
      let result: String = str.padRight(c'0', 5);
      expect(result.toString()).assertEqual("42000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1300
     * @tc.name testPadRight013
     * @tc.desc Verify padRight with number as fill char converted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "42".padRight(c'0', 5);
      expect(result.toString()).assertEqual("42000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1400
     * @tc.name testPadRight014
     * @tc.desc Verify padRight with targetLength equal to actual length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "hello".padRight(c'*', 5);
      expect(result.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1500
     * @tc.name testPadRight015
     * @tc.desc Verify padRight post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "hi  ".padRight(c'*', 5);
      expect(result.toString()).assertEqual("hi  *");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1600
     * @tc.name testPadRight016
     * @tc.desc Verify triple chain trim-padEnd-toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "  HI  ".trim().padEnd(5, "*").toLowerCase();
      expect(result).assertEqual("hi***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1700
     * @tc.name testPadRight017
     * @tc.desc Verify real-world: padEnd with spaces for alignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let label: string = "Item";
      let result: string = label.padEnd(10).concat("$10");
      expect(result).assertEqual("Item      $10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1800
     * @tc.name testPadRight018
     * @tc.desc Verify padRight typeof is object (String)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "hi".padRight(c'*', 5);
      expect(result.toString()).assertEqual("hi***");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_1900
     * @tc.name testPadRight019
     * @tc.desc Verify padRight on empty string with padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "".padRight(c'0', 5);
      expect(result.toString()).assertEqual("00000");
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_2000
     * @tc.name testPadRight020
     * @tc.desc Verify padRight with NUL char as fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "hi".padRight(c'\0', 5);
      expect(result.getLength()).assertEqual(5);
      expect(result.charAt(2).toString()).assertEqual("\0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_2100
     * @tc.name testPadRight021
     * @tc.desc Verify padRight with CJK fill character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = "hi".padRight(c'中', 5);
      expect(result.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_2200
     * @tc.name testPadRight022
     * @tc.desc Verify padRight on concatenation expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: String = ("4" + "2").padRight(c'0', 5);
      expect(result.toString()).assertEqual("42000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADRIGHT2_2300
     * @tc.name testPadRight023
     * @tc.desc Verify padRight() on empty string returns all padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadRight023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".padRight("0".charAt(0), 5);
      expect(result).assertEqual("00000");
      expect(result.length).assertEqual(5);
    });

  });
}