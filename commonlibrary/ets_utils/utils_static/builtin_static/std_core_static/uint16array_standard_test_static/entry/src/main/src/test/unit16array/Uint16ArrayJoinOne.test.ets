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
import Utils from '../Util.test';

export default function uint16ArrayJoin01Test(): void {
  describe('Uint16ArrayJoin01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_0100
     * @tc.name testUint16ArrayJoin01_001
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_0200
     * @tc.name testUint16ArrayJoin01_002
     * @tc.desc Verify join(",")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join(",");
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_0300
     * @tc.name testUint16ArrayJoin01_003
     * @tc.desc Verify join("")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.join("");
      expect(result).assertEqual("102030");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_0400
     * @tc.name testUint16ArrayJoin01_004
     * @tc.desc Verify join("|")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.join("|");
      expect(result).assertEqual("10|20|30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_0500
     * @tc.name testUint16ArrayJoin01_005
     * @tc.desc Verify join("::")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join("::");
      expect(result).assertEqual("1::2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_0600
     * @tc.name testUint16ArrayJoin01_006
     * @tc.desc Verify join(" and ")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.join(" and ");
      expect(result).assertEqual("10 and 20 and 30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_0700
     * @tc.name testUint16ArrayJoin01_007
     * @tc.desc Verify join(" ")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join(" ");
      expect(result).assertEqual("1 2 3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_0800
     * @tc.name testUint16ArrayJoin01_008
     * @tc.desc Verify join("\t")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("\t");
      expect(result).assertEqual("1\t2\t3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_0900
     * @tc.name testUint16ArrayJoin01_009
     * @tc.desc Verify join("\n")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("\n");
      expect(result).assertEqual("1\n2\n3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1000
     * @tc.name testUint16ArrayJoin01_010
     * @tc.desc Verify join("\\")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("\\");
      expect(result).assertEqual("1\\2\\3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1100
     * @tc.name testUint16ArrayJoin01_011
     * @tc.desc Verify join("'")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("'");
      expect(result).assertEqual("1'2'3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1200
     * @tc.name testUint16ArrayJoin01_012
     * @tc.desc Verify join('"')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join('"');
      expect(result).assertEqual('1"2"3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1300
     * @tc.name testUint16ArrayJoin01_013
     * @tc.desc Verify join("-")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.join("-");
      expect(result).assertEqual("10-20-30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1400
     * @tc.name testUint16ArrayJoin01_014
     * @tc.desc Verify join("_")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("_");
      expect(result).assertEqual("1_2_3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1500
     * @tc.name testUint16ArrayJoin01_015
     * @tc.desc Verify join("?")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("?");
      expect(result).assertEqual("1?2?3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1600
     * @tc.name testUint16ArrayJoin01_016
     * @tc.desc Verify join("!")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("!");
      expect(result).assertEqual("1!2!3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1700
     * @tc.name testUint16ArrayJoin01_017
     * @tc.desc Verify join(".")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join(".");
      expect(result).assertEqual("1.2.3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1800
     * @tc.name testUint16ArrayJoin01_018
     * @tc.desc Verify join("/")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("/");
      expect(result).assertEqual("1/2/3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_1900
     * @tc.name testUint16ArrayJoin01_019
     * @tc.desc Verify join("+")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("+");
      expect(result).assertEqual("1+2+3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2000
     * @tc.name testUint16ArrayJoin01_020
     * @tc.desc Verify join("=")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("=");
      expect(result).assertEqual("1=2=3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2100
     * @tc.name testUint16ArrayJoin01_021
     * @tc.desc Verify join("0")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("0");
      expect(result).assertEqual("10203");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2200
     * @tc.name testUint16ArrayJoin01_022
     * @tc.desc Verify join(" => ")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join(" => ");
      expect(result).assertEqual("1 => 2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2300
     * @tc.name testUint16ArrayJoin01_023
     * @tc.desc Verify join("...")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("...");
      expect(result).assertEqual("1...2...3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2400
     * @tc.name testUint16ArrayJoin01_024
     * @tc.desc Verify join with the Unicode replacement-character and question-mark separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("\uFFFD?");
      expect(result).assertEqual("1\uFFFD?2\uFFFD?3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2500
     * @tc.name testUint16ArrayJoin01_025
     * @tc.desc Verify join with the Chinese separator string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("你好");
      expect(result).assertEqual("1你好2你好3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2600
     * @tc.name testUint16ArrayJoin01_026
     * @tc.desc Verify join with the Greek alpha separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("α");
      expect(result).assertEqual("1α2α3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2700
     * @tc.name testUint16ArrayJoin01_027
     * @tc.desc Verify join("!!")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("!!");
      expect(result).assertEqual("1!!2!!3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2800
     * @tc.name testUint16ArrayJoin01_028
     * @tc.desc Verify join("--")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("--");
      expect(result).assertEqual("1--2--3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_2900
     * @tc.name testUint16ArrayJoin01_029
     * @tc.desc Verify at join("@")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("@");
      expect(result).assertEqual("1@2@3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3000
     * @tc.name testUint16ArrayJoin01_030
     * @tc.desc Verify join("#")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("#");
      expect(result).assertEqual("1#2#3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3100
     * @tc.name testUint16ArrayJoin01_031
     * @tc.desc Verify join("%")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3);
      const result = arr.join("%");
      expect(result).assertEqual("1%2%3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3200
     * @tc.name testUint16ArrayJoin01_032
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array();
      const result = arr.join();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3300
     * @tc.name testUint16ArrayJoin01_033
     * @tc.desc Verify length 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(0);
      const result = arr.join();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3400
     * @tc.name testUint16ArrayJoin01_034
     * @tc.desc Verify join() "65535"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535);
      const result = arr.join();
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3500
     * @tc.name testUint16ArrayJoin01_035
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join();
      expect(result).assertEqual("1,2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3600
     * @tc.name testUint16ArrayJoin01_036
     * @tc.desc Verify join("")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join("");
      expect(result).assertEqual("12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3700
     * @tc.name testUint16ArrayJoin01_037
     * @tc.desc Verify join("|")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join("|");
      expect(result).assertEqual("1|2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3800
     * @tc.name testUint16ArrayJoin01_038
     * @tc.desc Verify join(" ")
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2);
      const result = arr.join(" ");
      expect(result).assertEqual("1 2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_3900
     * @tc.name testUint16ArrayJoin01_039
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(10, 20, 30);
      const result = arr.join();
      expect(result).assertEqual("10,20,30");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4000
     * @tc.name testUint16ArrayJoin01_040
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join();
      expect(result).assertEqual("1,2,3,4,5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4100
     * @tc.name testUint16ArrayJoin01_041
     * @tc.desc Verify join with an empty separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join("");
      expect(result).assertEqual("12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4200
     * @tc.name testUint16ArrayJoin01_042
     * @tc.desc Verify join with a vertical bar separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join("|");
      expect(result).assertEqual("1|2|3|4|5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4300
     * @tc.name testUint16ArrayJoin01_043
     * @tc.desc Verify join with a space separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join(" ");
      expect(result).assertEqual("1 2 3 4 5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4400
     * @tc.name testUint16ArrayJoin01_044
     * @tc.desc Verify join with a hyphen separator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 2, 3, 4, 5);
      const result = arr.join("-");
      expect(result).assertEqual("1-2-3-4-5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4500
     * @tc.name testUint16ArrayJoin01_045
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0);
      const result = arr.join();
      expect(result).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4600
     * @tc.name testUint16ArrayJoin01_046
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535);
      const result = arr.join();
      expect(result).assertEqual("65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4700
     * @tc.name testUint16ArrayJoin01_047
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535, 32768);
      const result = arr.join();
      expect(result).assertEqual("0,65535,32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4800
     * @tc.name testUint16ArrayJoin01_048
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7);
      const result = arr.join();
      expect(result).assertEqual("7,7,7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_4900
     * @tc.name testUint16ArrayJoin01_049
     * @tc.desc Verify join repeats a separator between equal values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(7, 7, 7);
      const result = arr.join("|");
      expect(result).assertEqual("7|7|7");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5000
     * @tc.name testUint16ArrayJoin01_050
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0, 0, 0, 0);
      const result = arr.join();
      expect(result).assertEqual("0,0,0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5100
     * @tc.name testUint16ArrayJoin01_051
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535, 65535);
      const result = arr.join();
      expect(result).assertEqual("65535,65535,65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5200
     * @tc.name testUint16ArrayJoin01_052
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(32768, 32768, 32768);
      const result = arr.join();
      expect(result).assertEqual("32768,32768,32768");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5300
     * @tc.name testUint16ArrayJoin01_053
     * @tc.desc Verify join formats minimum and maximum values with a hyphen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1, 65535);
      const result = arr.join("-");
      expect(result).assertEqual("1-65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5400
     * @tc.name testUint16ArrayJoin01_054
     * @tc.desc Verify join formats boundary values with a colon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 32768, 65535);
      const result = arr.join(":");
      expect(result).assertEqual("0:32768:65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5500
     * @tc.name testUint16ArrayJoin01_055
     * @tc.desc Verify join formats alternating maximum and zero values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 0, 65535);
      const result = arr.join("|");
      expect(result).assertEqual("65535|0|65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5600
     * @tc.name testUint16ArrayJoin01_056
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65534, 65535, 0, 1);
      const result = arr.join();
      expect(result).assertEqual("65534,65535,0,1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5700
     * @tc.name testUint16ArrayJoin01_057
     * @tc.desc Verify join formats two zero values with a vertical bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 0);
      const result = arr.join("|");
      expect(result).assertEqual("0|0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5800
     * @tc.name testUint16ArrayJoin01_058
     * @tc.desc Verify join formats two maximum values with a vertical bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535, 65535);
      const result = arr.join("|");
      expect(result).assertEqual("65535|65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_5900
     * @tc.name testUint16ArrayJoin01_059
     * @tc.desc Verify join formats zero and maximum with a vertical bar
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 65535);
      const result = arr.join("|");
      expect(result).assertEqual("0|65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6000
     * @tc.name testUint16ArrayJoin01_060
     * @tc.desc Verify 65536 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6100
     * @tc.name testUint16ArrayJoin01_061
     * @tc.desc Verify -1 65535 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-1);
      const result = arr.join();
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6200
     * @tc.name testUint16ArrayJoin01_062
     * @tc.desc Verify -2 65534 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-2);
      const result = arr.join();
      expect(result).assertEqual("65534");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6300
     * @tc.name testUint16ArrayJoin01_063
     * @tc.desc Verify 3.14 3 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(3.14);
      const result = arr.join();
      expect(result).assertEqual("3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6400
     * @tc.name testUint16ArrayJoin01_064
     * @tc.desc Verify 65535.9 65535 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65535.9);
      const result = arr.join();
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6500
     * @tc.name testUint16ArrayJoin01_065
     * @tc.desc Verify -0.5 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-0.5);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6600
     * @tc.name testUint16ArrayJoin01_066
     * @tc.desc Verify NaN 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(Number.NaN);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6700
     * @tc.name testUint16ArrayJoin01_067
     * @tc.desc Verify Infinity 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(Number.POSITIVE_INFINITY);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6800
     * @tc.name testUint16ArrayJoin01_068
     * @tc.desc Verify -Infinity 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-Number.POSITIVE_INFINITY);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_6900
     * @tc.name testUint16ArrayJoin01_069
     * @tc.desc Verify 65536*2 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536 * 2);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7000
     * @tc.name testUint16ArrayJoin01_070
     * @tc.desc Verify 65536+1 1 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536 + 1);
      const result = arr.join();
      expect(result).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7100
     * @tc.name testUint16ArrayJoin01_071
     * @tc.desc Verify 65536+65535 65535 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536 + 65535);
      const result = arr.join();
      expect(result).assertEqual("65535");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7200
     * @tc.name testUint16ArrayJoin01_072
     * @tc.desc Verify -65536 0 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(-65536);
      const result = arr.join();
      expect(result).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7300
     * @tc.name testUint16ArrayJoin01_073
     * @tc.desc Verify join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(65536, -1, 3.14, Number.NaN, Number.POSITIVE_INFINITY);
      const result = arr.join();
      expect(result).assertEqual("0,65535,3,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7400
     * @tc.name testUint16ArrayJoin01_074
     * @tc.desc Verify 1.999 1 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(1.999);
      const result = arr.join();
      expect(result).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7500
     * @tc.name testUint16ArrayJoin01_075
     * @tc.desc Verify 10 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const result = arr.join();
      expect(result).assertEqual("0,1,2,3,4,5,6,7,8,9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7600
     * @tc.name testUint16ArrayJoin01_076
     * @tc.desc Verify 10 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const result = arr.join("");
      expect(result).assertEqual("0123456789");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7700
     * @tc.name testUint16ArrayJoin01_077
     * @tc.desc Verify 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
      const result = arr.join("|");
      expect(result).assertEqual("0|1|2|3|4|5|6|7|8|9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7800
     * @tc.name testUint16ArrayJoin01_078
     * @tc.desc Verify 100 1 join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(100);
      arr.fill(1);
      const result = arr.join();
      const expected = "1" + ",1".repeat(99);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_7900
     * @tc.name testUint16ArrayJoin01_079
     * @tc.desc Verify 100 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(100);
      arr.fill(1);
      const result = arr.join("|");
      const expected = "1" + "|1".repeat(99);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_8000
     * @tc.name testUint16ArrayJoin01_080
     * @tc.desc Verify 100 500join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.of(100, 200, 300, 400, 500);
      const result = arr.join();
      expect(result).assertEqual("100,200,300,400,500");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_8100
     * @tc.name testUint16ArrayJoin01_081
     * @tc.desc Verify new Uint16Array(FixedArray) join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const src: FixedArray<int> = [1, 2, 3];
      const arr = new Uint16Array(src);
      const result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_8200
     * @tc.name testUint16ArrayJoin01_082
     * @tc.desc Verify new Uint16Array(length) join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = new Uint16Array(3);
      const result = arr.join();
      expect(result).assertEqual("0,0,0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_8300
     * @tc.name testUint16ArrayJoin01_083
     * @tc.desc Verify Uint16Array.from() join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.from([1, 2, 3]);
      const result = arr.join();
      expect(result).assertEqual("1,2,3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_JOIN01_8400
     * @tc.name testUint16ArrayJoin01_084
     * @tc.desc Verify Uint16Array.from() join()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayJoin01_084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr = Uint16Array.from([1, 2, 3]);
      const result = arr.join("|");
      expect(result).assertEqual("1|2|3");
    });

  });
}
