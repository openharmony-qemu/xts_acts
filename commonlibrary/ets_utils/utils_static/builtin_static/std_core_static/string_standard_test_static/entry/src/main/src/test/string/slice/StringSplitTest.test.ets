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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

export default function StringSplitTest(): void {
  describe('StringSplitTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_0100
     * @tc.name testSplit001
     * @tc.desc Verify split() with comma separator splits into multiple parts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,c");
      let result: String[] = text.split(",");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_0200
     * @tc.name testSplit002
     * @tc.desc Verify split() with empty separator splits each character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: String[] = text.split("");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_0300
     * @tc.name testSplit003
     * @tc.desc Verify split() with limit parameter caps result array size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,c,d,e");
      let result: String[] = text.split(",", 3);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_0400
     * @tc.name testSplit004
     * @tc.desc Verify split() with separator not found returns single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("no-delimiter");
      let result: String[] = text.split(".");
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_0500
     * @tc.name testSplit005
     * @tc.desc Verify split() with dot separator parses IP-like format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("192.168.1.1");
      let result: String[] = text.split(".");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_0600
     * @tc.name testSplit006
     * @tc.desc Verify split() with whitespace separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world arkts");
      let result: String[] = text.split(" ");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_0700
     * @tc.name testSplit007
     * @tc.desc Verify split() with tab separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\tb\tc");
      let result: String[] = text.split("\t");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_0800
     * @tc.name testSplit008
     * @tc.desc Verify split() with newline separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2\nline3");
      let result: String[] = text.split("\n");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_0900
     * @tc.name testSplit009
     * @tc.desc Verify split() with RegExp separator matches digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let result: String[] = text.split(new RegExp("[0-9]"));
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1000
     * @tc.name testSplit010
     * @tc.desc Verify split() with underscore separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("snake_case_name");
      let result: String[] = text.split("_");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1100
     * @tc.name testSplit011
     * @tc.desc Verify split() with empty string returns array with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: String[] = text.split(",");
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1200
     * @tc.name testSplit012
     * @tc.desc Verify split() with Chinese separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好,世界,测试");
      let result: String[] = text.split(",");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1300
     * @tc.name testSplit013
     * @tc.desc Verify split() with consecutive separators produces empty elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,,b");
      let result: String[] = text.split(",");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1400
     * @tc.name testSplit014
     * @tc.desc Verify split() with limit 1 returns single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,c,d");
      let result: String[] = text.split(",", 1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1500
     * @tc.name testSplit015
     * @tc.desc Verify split() accessing elements verifies correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("red,green,blue");
      let result: String[] = text.split(",");
      expect(result[0].toString()).assertEqual("red");
      expect(result[2].toString()).assertEqual("blue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1600
     * @tc.name testSplit016
     * @tc.desc Verify split() with separator at beginning produces empty first element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String(",a,b");
      let result: String[] = text.split(",");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1700
     * @tc.name testSplit017
     * @tc.desc Verify split() with separator at end produces empty last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,");
      let result: String[] = text.split(",");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1800
     * @tc.name testSplit018
     * @tc.desc Verify split() with multi-character separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a::b::c");
      let result: String[] = text.split("::");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_1900
     * @tc.name testSplit019
     * @tc.desc Verify split() with GBK Chinese separator splits correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文、测试、文本");
      let result: String[] = text.split("、");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2000
     * @tc.name testSplit020
     * @tc.desc Verify split() with emoji separator splits correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a😀b😀c");
      let result: String[] = text.split("😀");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2100
     * @tc.name testSplit021
     * @tc.desc Verify split() with dynamic separator and limit variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("1-2-3-4-5");
      let sep: string = "-";
      let limit: int = 3;
      let result: String[] = text.split(sep, limit);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2200
     * @tc.name testSplit022
     * @tc.desc Verify split() with separator not found returns single element with entire string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("EntireStringHere");
      let result: String[] = text.split(",");
      expect(result.length).assertEqual(1);
      expect(result[0].toString()).assertEqual("EntireStringHere");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2300
     * @tc.name testSplit023
     * @tc.desc Verify split() with limit 0 returns empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,c");
      let result: String[] = text.split(",", 0);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2400
     * @tc.name testSplit024
     * @tc.desc Verify split() with limit exceeding actual parts returns all parts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,c");
      let result: String[] = text.split(",", 10);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2500
     * @tc.name testSplit025
     * @tc.desc Verify split() with negative limit returns all parts like no limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,c,d");
      let result: String[] = text.split(",", -1);
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2600
     * @tc.name testSplit026
     * @tc.desc Verify split() with RegExp digit separator and limit returns exact elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let result: String[] = text.split(new RegExp("[0-9]"), 2);
      expect(result.length).assertEqual(2);
      expect(result[0].toString()).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2700
     * @tc.name testSplit027
     * @tc.desc Verify split() with RegExp not matched returns single-element array with entire string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdef");
      let result: String[] = text.split(new RegExp("[0-9]"));
      expect(result.length).assertEqual(1);
      expect(result[0].toString()).assertEqual("abcdef");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2800
     * @tc.name testSplit028
     * @tc.desc Verify split() with RegExp multi-char word separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("red, blue, green");
      let result: String[] = text.split(new RegExp(", "));
      expect(result.length).assertEqual(3);
      expect(result[1].toString()).assertEqual("blue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_2900
     * @tc.name testSplit029
     * @tc.desc Verify split() with RegExp alternation separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b-c.d");
      let result: String[] = text.split(new RegExp("[,\\-.]"));
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3000
     * @tc.name testSplit030
     * @tc.desc Verify split() with dynamic RegExp variable splits correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("x1y22z");
      let pattern: RegExp = new RegExp("[0-9]+");
      let result: String[] = text.split(pattern);
      expect(result.length).assertEqual(3);
      expect(result[0].toString()).assertEqual("x");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3100
     * @tc.name testSplit031
     * @tc.desc Verify split() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,c");
      let result: String[] = text.split(",");
      expect(text.toString()).assertEqual("a,b,c");
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3200
     * @tc.name testSplit032
     * @tc.desc Verify split() and join() roundtrip restores original separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("apple,banana,orange");
      let parts: String[] = text.split(",");
      let restored: string = parts.join(",");
      expect(restored).assertEqual("apple,banana,orange");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3300
     * @tc.name testSplit033
     * @tc.desc Verify split() by whitespace to extract words
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world arkts");
      let words: String[] = text.split(" ");
      expect(words.length).assertEqual(3);
      expect(words[0].toString()).assertEqual("hello");
      expect(words[2].toString()).assertEqual("arkts");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3400
     * @tc.name testSplit034
     * @tc.desc Verify split() by newline to extract lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2\nline3");
      let lines: String[] = text.split("\n");
      expect(lines.length).assertEqual(3);
      expect(lines[1].toString()).assertEqual("line2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3500
     * @tc.name testSplit035
     * @tc.desc Verify split() includes captured groups from RegExp separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c");
      let result: String[] = text.split(new RegExp("([0-9])"));
      expect(result.length).assertEqual(5);
      expect(result[0].toString()).assertEqual("a");
      expect(result[1].toString()).assertEqual("1");
      expect(result[3].toString()).assertEqual("2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3600
     * @tc.name testSplit036
     * @tc.desc Verify split() with captured groups and limit truncates result array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c");
      let result: String[] = text.split(new RegExp("([0-9])"), 3);
      expect(result.length).assertEqual(3);
      expect(result[0].toString()).assertEqual("a");
      expect(result[1].toString()).assertEqual("1");
      expect(result[2].toString()).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3700
     * @tc.name testSplit037
     * @tc.desc Verify split() separates mixed character set tokens
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D|\u0391|\u0410|\u0627|\u05D0");
      let parts: String[] = text.split("|");
      expect(parts.length).assertEqual(5);
      expect(parts[0].toString()).assertEqual("\u4E2D");
      expect(parts[3].toString()).assertEqual("\u0627");
      expect(parts[4].toString()).assertEqual("\u05D0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3800
     * @tc.name testSplit038
     * @tc.desc Verify split() with trailing separator produces empty last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b,");
      let result: String[] = text.split(",");
      expect(result.length).assertEqual(3);
      expect(result[2].toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_3900
     * @tc.name testSplit039
     * @tc.desc Verify split() with limit larger than segment count returns all segments
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a,b");
      let result: String[] = text.split(",", 10);
      expect(result.length).assertEqual(2);
      expect(result[1].toString()).assertEqual("b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4000
     * @tc.name testSplit040
     * @tc.desc Verify split() treats string separator with regex metacharacters as literal text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a[sep]b[sep]c");
      let result: String[] = text.split("[sep]");
      expect(result.length).assertEqual(3);
      expect(result[2].toString()).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4100
     * @tc.name testSplit041
     * @tc.desc Verify split() with emoji separator handles surrogate pair delimiter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\uD83D\uDE00B\uD83D\uDE00C");
      let result: String[] = text.split("\uD83D\uDE00");
      expect(result.length).assertEqual(3);
      expect(result[0].toString()).assertEqual("A");
      expect(result[1].toString()).assertEqual("B");
      expect(result[2].toString()).assertEqual("C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4200
     * @tc.name testSplit042
     * @tc.desc Verify split() with RegExp whitespace quantifier handles spaces, tabs and newlines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("red   blue\tgreen\norange");
      let result: String[] = text.split(new RegExp("\\s+"));
      expect(result.length).assertEqual(4);
      expect(result[0].toString()).assertEqual("red");
      expect(result[1].toString()).assertEqual("blue");
      expect(result[3].toString()).assertEqual("orange");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4300
     * @tc.name testSplit043
     * @tc.desc Verify split() with RegExp ignore-case flag matches upper and lower case separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AlphaXbetaXGamma");
      let result: String[] = text.split(new RegExp("x", "i"));
      expect(result.length).assertEqual(3);
      expect(result[0].toString()).assertEqual("Alpha");
      expect(result[1].toString()).assertEqual("beta");
      expect(result[2].toString()).assertEqual("Gamma");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4400
     * @tc.name testSplit044
     * @tc.desc Verify split() with RegExp alternation branches for comma, pipe and semicolon separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("csv,json|xml;yaml");
      let result: String[] = text.split(new RegExp(",|\\||;"));
      expect(result.length).assertEqual(4);
      expect(result[0].toString()).assertEqual("csv");
      expect(result[2].toString()).assertEqual("xml");
      expect(result[3].toString()).assertEqual("yaml");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4500
     * @tc.name testSplit045
     * @tc.desc Verify split() with RegExp dot metacharacter splits at every character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let result: String[] = text.split(new RegExp("."));
      expect(result.length).assertEqual(4);
      expect(result[0].toString()).assertEqual("");
      expect(result[1].toString()).assertEqual("");
      expect(result[2].toString()).assertEqual("");
      expect(result[3].toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4600
     * @tc.name testSplit046
     * @tc.desc Verify split() with escaped RegExp dot treats dot as a literal separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("192.168.1.1");
      let result: String[] = text.split(new RegExp("\\."));
      expect(result.length).assertEqual(4);
      expect(result[0].toString()).assertEqual("192");
      expect(result[1].toString()).assertEqual("168");
      expect(result[3].toString()).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4700
     * @tc.name testSplit047
     * @tc.desc Verify split() with escaped RegExp square brackets treats bracketed text as literal separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a[sep]b[sep]c");
      let result: String[] = text.split(new RegExp("\\[sep\\]"));
      expect(result.length).assertEqual(3);
      expect(result[0].toString()).assertEqual("a");
      expect(result[1].toString()).assertEqual("b");
      expect(result[2].toString()).assertEqual("c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4800
     * @tc.name testSplit048
     * @tc.desc Verify split() includes multiple captured groups from a RegExp separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let result: String[] = text.split(new RegExp("([0-9])([A-Za-z])"));
      expect(result.length).assertEqual(7);
      expect(result[0].toString()).assertEqual("a");
      expect(result[1].toString()).assertEqual("1");
      expect(result[2].toString()).assertEqual("b");
      expect(result[3].toString()).assertEqual("");
      expect(result[5].toString()).assertEqual("c");
      expect(result[6].toString()).assertEqual("3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_4900
     * @tc.name testSplit049
     * @tc.desc Verify split() includes captured RegExp punctuation delimiters in key-value text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("key=value;mode=debug");
      let result: String[] = text.split(new RegExp("([;=])"));
      expect(result.length).assertEqual(7);
      expect(result[0].toString()).assertEqual("key");
      expect(result[1].toString()).assertEqual("=");
      expect(result[3].toString()).assertEqual(";");
      expect(result[6].toString()).assertEqual("debug");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_5000
     * @tc.name testSplit050
     * @tc.desc Verify split() with RegExp separator over mixed Unicode scripts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text =
        new String("\u4E2D\u6587\u3001Latin\u3001\u0395\u03BB\u03BB\u03B7\u03BD\u03B9\u03BA\u03AC\u3001\u0627\u0644\u0639\u0631\u0628\u064A\u0629");
      let result: String[] = text.split(new RegExp("\u3001"));
      expect(result.length).assertEqual(4);
      expect(result[0].toString()).assertEqual("\u4E2D\u6587");
      expect(result[1].toString()).assertEqual("Latin");
      expect(result[3].toString()).assertEqual("\u0627\u0644\u0639\u0631\u0628\u064A\u0629");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_5100
     * @tc.name testSplit051
     * @tc.desc Verify split() with RegExp separator built from supplementary-plane emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = String.fromCodePoint(128512);
      const text = new String("A" + emoji + "B" + emoji + "C");
      let result: String[] = text.split(new RegExp(emoji));
      expect(result.length).assertEqual(3);
      expect(result[0].toString()).assertEqual("A");
      expect(result[1].toString()).assertEqual("B");
      expect(result[2].toString()).assertEqual("C");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_5200
     * @tc.name testSplit052
     * @tc.desc Verify split() with malformed RegExp separator construction throws before splitting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let splitSucceeded: boolean = false;
      let isThrown: boolean = false;
      try {
        let result: String[] = text.split(new RegExp("[abc"));
        splitSucceeded = result.length > 0;
      } catch (_error) {
        isThrown = true;
      }
      expect(splitSucceeded).assertFalse();
      expect(isThrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_5300
     * @tc.name testSplit053
     * @tc.desc Verify split() handles overlong UTF-8 sequence spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xc0\\x81");
      let result: String[] = source.split("|");
      expect(result.length).assertEqual(1);
      expect(result[0].toString()).assertEqual("\\xc0\\x81");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_5400
     * @tc.name testSplit054
     * @tc.desc Verify split() handles replacement character U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uFFFD");
      let result: String[] = source.split("|");
      expect(result.length).assertEqual(1);
      expect(result[0].toString()).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_5500
     * @tc.name testSplit055
     * @tc.desc Verify Split handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string[] = source.split("\u6D4B\u8BD5");
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual("!@#$%^&*() <script>alert(1)</script> ");
      expect(result[1]).assertEqual(" 分割符  ");
      expect(result[2]).assertEqual(" \n 换行  ");
      expect(result[3]).assertEqual(" \r\n 回车换行  ");
      expect(result[4]).assertEqual(" \\ 转义符");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SPLIT_5600
     * @tc.name testSplit056
     * @tc.desc Verify Split handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSplit056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string[] = source.split(" ");
      expect(result.length).assertEqual(6);
      expect(result[4]).assertEqual("АБВГД");
      expect(result[5]).assertEqual("الاختبار");
    });
  });
}
