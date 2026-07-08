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

export default function CharToStringTest(): void {
  describe('CharToStringTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_0100
     * @tc.name testCharToString0001
     * @tc.desc Verify toString method accepts no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      expect(str !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_0300
     * @tc.name testCharToString0003
     * @tc.desc Verify toString does not require any parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      expect(typeof str).assertEqual("string");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_0500
     * @tc.name testCharToString0005
     * @tc.desc Verify uppercase letter converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      expect(str).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_0600
     * @tc.name testCharToString0006
     * @tc.desc Verify lowercase letter converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'a');
      const str = c.toString();
      expect(str).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_0700
     * @tc.name testCharToString0007
     * @tc.desc Verify digit character converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'0');
      const str = c.toString();
      expect(str).assertEqual("0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_0800
     * @tc.name testCharToString0008
     * @tc.desc Verify multiple digit characters converted to strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c1 = new Char(c'1');
      const c2 = new Char(c'9');
      expect(c1.toString()).assertEqual("1");
      expect(c2.toString()).assertEqual("9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_0900
     * @tc.name testCharToString0009
     * @tc.desc Verify space character converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c' ');
      const str = c.toString();
      expect(str).assertEqual(" ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1000
     * @tc.name testCharToString0010
     * @tc.desc Verify special symbol characters converted to strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'@');
      expect(c.toString()).assertEqual("@");
      const c2 = new Char(c'#');
      expect(c2.toString()).assertEqual("#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1100
     * @tc.name testCharToString0011
     * @tc.desc Verify that an ASCII character can be correctly converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'Z');
      const str = c.toString();
      expect(str).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1200
     * @tc.name testCharToString0012
     * @tc.desc Verify multiple characters converted to strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c1 = new Char(c'X');
      const c2 = new Char(c'Y');
      expect(c1.toString()).assertEqual("X");
      expect(c2.toString()).assertEqual("Y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1300
     * @tc.name testCharToString0013
     * @tc.desc Verify null character \\u0000 converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\u0000');
      const str = c.toString();
      expect(str.length).assertEqual(1);
      expect(str.charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1400
     * @tc.name testCharToString0014
     * @tc.desc Verify newline character \\n converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\n');
      const str = c.toString();
      expect(str).assertEqual("\n");
      expect(str.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1500
     * @tc.name testCharToString0015
     * @tc.desc Verify tab character \\t converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\t');
      const str = c.toString();
      expect(str).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1600
     * @tc.name testCharToString0016
     * @tc.desc Verify carriage return character \\r converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\r');
      const str = c.toString();
      expect(str).assertEqual("\r");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1700
     * @tc.name testCharToString0017
     * @tc.desc Verify high surrogate character \\uD800 converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\uD800');
      const str = c.toString();
      expect(str.length).assertEqual(1);
      expect(str.charCodeAt(0)).assertEqual(0xD800);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1800
     * @tc.name testCharToString0018
     * @tc.desc Verify high surrogate maximum value \\uDBFF converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\uDBFF');
      const str = c.toString();
      expect(str.charCodeAt(0)).assertEqual(0xDBFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_1900
     * @tc.name testCharToString0019
     * @tc.desc Verify low surrogate character \\uDC00 converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\uDC00');
      const str = c.toString();
      expect(str.length).assertEqual(1);
      expect(str.charCodeAt(0)).assertEqual(0xDC00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_2000
     * @tc.name testCharToString0020
     * @tc.desc Verify low surrogate maximum value \\uDFFF converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\uDFFF');
      const str = c.toString();
      expect(str.charCodeAt(0)).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_2100
     * @tc.name testCharToString0021
     * @tc.desc Verify minimum character value converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(Char.MIN_VALUE);
      const str = c.toString();
      expect(str.charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_2200
     * @tc.name testCharToString0022
     * @tc.desc Verify maximum character value converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(Char.MAX_VALUE);
      const str = c.toString();
      expect(str.charCodeAt(0)).assertEqual(0xFFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_2300
     * @tc.name testCharToString0023
     * @tc.desc Verify toString return value is String type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      expect(typeof str).assertEqual("string");
      expect(typeof str === "string").assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_2500
     * @tc.name testCharToString0025
     * @tc.desc Verify toString returns string with length of 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      expect(str.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_2600
     * @tc.name testCharToString0026
     * @tc.desc Verify multiple calls return the same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str1 = c.toString();
      const str2 = c.toString();
      const str3 = c.toString();
      expect(str1).assertEqual(str2);
      expect(str2).assertEqual(str3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_2700
     * @tc.name testCharToString0027
     * @tc.desc Verify different Char instances with same value produce same toString result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c1 = new Char(c'A');
      const c2 = new Char(c'A');
      expect(c1.toString()).assertEqual(c2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_2800
     * @tc.name testCharToString0028
     * @tc.desc Verify large number of conversions return correct results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      for (let i = 0; i < 1000; i++) {
        expect(c.toString()).assertEqual("A");
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_3100
     * @tc.name testCharToString0031
     * @tc.desc Verify toString() works correctly in a try-finally context regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let finallyExecuted = false;
      try {
        const c = new Char(c'A');
        const str = c.toString();
      } finally {
        finallyExecuted = true;
      }
      expect(finallyExecuted).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_3300
     * @tc.name testCharToString0033
     * @tc.desc Verify Char.toString exists as a function on the Char class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(typeof Char.toString).assertEqual("function");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_3400
     * @tc.name testCharToString0034
     * @tc.desc Verify toString is inherited from Object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      expect(str !== undefined).assertTrue();
      expect(typeof str).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_3500
     * @tc.name testCharToString0035
     * @tc.desc Verify toString is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const startTime = Date.now();
      const str = c.toString();
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_3600
     * @tc.name testCharToString0036
     * @tc.desc Verify toString returns string while toChar returns char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      const ch = c.toChar();
      expect(typeof str).assertEqual("string");
      expect(typeof ch).assertEqual("char");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_3700
     * @tc.name testCharToString0037
     * @tc.desc Verify toString and toChar values correspond to each other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      const ch = c.toChar();
      expect(str).assertEqual("A");
      expect(str.charCodeAt(0)).assertEqual(ch as number);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_3800
     * @tc.name testCharToString0038
     * @tc.desc Verify toString returns character while toInt returns numeric value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      const num = c.toInt();
      expect(str).assertEqual("A");
      expect(num).assertEqual(65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_3900
     * @tc.name testCharToString0039
     * @tc.desc Verify BMP character converts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      expect(str).assertEqual("A");
      expect(Char.isInBasicMultilingualPlane(c.toChar())).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_4000
     * @tc.name testCharToString0040
     * @tc.desc Verify surrogate character can be converted to string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'\uD800');
      const str = c.toString();
      expect(str.length).assertEqual(1);
      expect(c.isPartOfSurrogatePair()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_4100
     * @tc.name testCharToString0041
     * @tc.desc Verify toString result can be used for string concatenation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = "Char: " + c.toString();
      expect(result).assertEqual("Char: A");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_4300
     * @tc.name testCharToString0043
     * @tc.desc Verify toString result can call string methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const str = c.toString();
      expect(str.toLowerCase()).assertEqual("a");
      expect(str.toUpperCase()).assertEqual("A");
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_4500
     * @tc.name testCharToString0045
     * @tc.desc Verify null character instance toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c1 = new Char();
      const c2 = new Char(c'\u0000');
      expect(c1.toString()).assertEqual("\u0000");
      expect(c2.toString()).assertEqual("\u0000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHAR_TOSTRINGTEST_4600
     * @tc.name testCharToString0046
     * @tc.desc Verify toString result can be used in template string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharToString0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const c = new Char(c'A');
      const result = `Character: ${c.toString()}`;
      expect(result).assertEqual("Character: A");
    });

  });
}

