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

export default function StringSearchTest(): void {
  describe('StringSearchTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_0100
     * @tc.name testSearch001
     * @tc.desc Verify search() with string pattern returns matching index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS ArkTS");
      let pos: int = text.search("TS");
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_0200
     * @tc.name testSearch002
     * @tc.desc Verify search() with RegExp returns first match index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc123def");
      let pos: int = text.search(new RegExp("[0-9]+"));
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_0300
     * @tc.name testSearch003
     * @tc.desc Verify search() with not-found pattern returns -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdef");
      let pos: int = text.search(new RegExp("[0-9]"));
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_0400
     * @tc.name testSearch004
     * @tc.desc Verify search() finds pattern at beginning of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCdef");
      let pos: int = text.search("ABC");
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_0500
     * @tc.name testSearch005
     * @tc.desc Verify search() finds pattern at end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("startXYZ");
      let pos: int = text.search("XYZ");
      expect(pos).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_0600
     * @tc.name testSearch006
     * @tc.desc Verify search() with digit pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc456xyz");
      let pos: int = text.search(new RegExp("[0-9]"));
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_0700
     * @tc.name testSearch007
     * @tc.desc Verify search() with Chinese character pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc你好def");
      let pos: int = text.search("你好");
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_0800
     * @tc.name testSearch008
     * @tc.desc Verify search() with empty pattern returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let pos: int = text.search("");
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_0900
     * @tc.name testSearch009
     * @tc.desc Verify search() with special regex character as literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a.b.c");
      let pos: int = text.search(".");
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1000
     * @tc.name testSearch010
     * @tc.desc Verify search() with digit pattern returns position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello😀world");
      let pos: int = text.search("😀");
      expect(pos).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1100
     * @tc.name testSearch011
     * @tc.desc Verify search() on GBK Chinese text finds correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let pos: int = text.search("测试");
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1200
     * @tc.name testSearch012
     * @tc.desc Verify search() with C0 control tab character finds position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("col1\tcol2");
      let pos: int = text.search("\t");
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1300
     * @tc.name testSearch013
     * @tc.desc Verify search() with dynamic pattern variable returns correct position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let pattern: string = "world";
      let pos: int = text.search(pattern);
      expect(pos).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1400
     * @tc.name testSearch014
     * @tc.desc Verify search() with case-insensitive flag finds match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let pos: int = text.search(new RegExp("hello", "i"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1500
     * @tc.name testSearch015
     * @tc.desc Verify search() returns -1 deterministically when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let pos: int = text.search("xyz");
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1600
     * @tc.name testSearch016
     * @tc.desc Verify search() on empty source returns -1 for any non-empty pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let pos: int = text.search("a");
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1700
     * @tc.name testSearch017
     * @tc.desc Verify search() with \\d digit class finds first digit position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc123def");
      let pos: int = text.search(new RegExp("\\d"));
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1800
     * @tc.name testSearch018
     * @tc.desc Verify search() with \\w word class finds first word character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("!!!hello");
      let pos: int = text.search(new RegExp("\\w"));
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_1900
     * @tc.name testSearch019
     * @tc.desc Verify search() with ^ anchor only matches at string beginning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcabc");
      let pos: int = text.search(new RegExp("^abc"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2000
     * @tc.name testSearch020
     * @tc.desc Verify search() with $ anchor only matches at string end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcabc");
      let pos: int = text.search(new RegExp("abc$"));
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2100
     * @tc.name testSearch021
     * @tc.desc Verify search() with \\b word boundary for whole word match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("cat category catch");
      let pos: int = text.search(new RegExp("\\bcat\\b"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2200
     * @tc.name testSearch022
     * @tc.desc Verify search() finds @ position in email-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("user@example.com");
      let pos: int = text.search("@");
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2300
     * @tc.name testSearch023
     * @tc.desc Verify search() checks URL protocol pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("https://example.com");
      let pos: int = text.search(new RegExp("^https?://"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2400
     * @tc.name testSearch024
     * @tc.desc Verify search() for password digit check pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Password1");
      let pos: int = text.search(new RegExp("\\d"));
      expect(pos).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2500
     * @tc.name testSearch025
     * @tc.desc Verify search() on single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let found: int = text.search("A");
      let notFound: int = text.search("B");
      expect(found).assertEqual(0);
      expect(notFound).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2600
     * @tc.name testSearch026
     * @tc.desc Verify search() on very long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a".repeat(10000) + "X" + "a".repeat(10000));
      let pos: int = text.search("X");
      expect(pos).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2700
     * @tc.name testSearch027
     * @tc.desc Verify search() with \\s whitespace class finds first space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let pos: int = text.search(new RegExp("\\s"));
      expect(pos).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2800
     * @tc.name testSearch028
     * @tc.desc Verify search() with [aeiou] custom character set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("bcdfg hijkl");
      let pos: int = text.search(new RegExp("[aeiou]"));
      expect(pos).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_2900
     * @tc.name testSearch029
     * @tc.desc Verify search() with + quantifier finds one or more digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc123def");
      let pos: int = text.search(new RegExp("\\d+"));
      expect(pos).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3000
     * @tc.name testSearch030
     * @tc.desc Verify search() with capturing group finds match and returns position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2021-12-25");
      let pos: int = text.search(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3100
     * @tc.name testSearch031
     * @tc.desc Verify search() finds date separator slash position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2021/12/25");
      let pos: int = text.search("/");
      expect(pos).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3200
     * @tc.name testSearch032
     * @tc.desc Verify search() finds HTML tag start in string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("<div>content</div>");
      let pos: int = text.search(new RegExp("<\\w+>"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3300
     * @tc.name testSearch033
     * @tc.desc Verify search() with m flag: ^ matches start of each line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello\nworld\nfoo");
      let pos: int = text.search(new RegExp("^world", "m"));
      expect(pos).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3400
     * @tc.name testSearch034
     * @tc.desc Verify search() on string with only spaces finds nothing for \\w
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("     ");
      let pos: int = text.search(new RegExp("\\w"));
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3500
     * @tc.name testSearch035
     * @tc.desc Verify search() on string with only digits finds \\d at position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("123456");
      let pos: int = text.search(new RegExp("\\d"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3600
     * @tc.name testSearch036
     * @tc.desc Verify search() for simple email validation: has @ and domain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("user@example.com");
      let atPos: int = text.search("@");
      let dotPos: int = text.search(new RegExp("\\.\\w+$"));
      expect(atPos).assertLarger(0);
      expect(dotPos).assertLarger(atPos);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3700
     * @tc.name testSearch037
     * @tc.desc Verify search() checks password contains uppercase letter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Passw0rd");
      expect(text.search(new RegExp("[A-Z]"))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3800
     * @tc.name testSearch038
     * @tc.desc Verify search() checks password contains special character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Pass@word");
      expect(text.search(new RegExp("[!@#$%^&*]"))).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_3900
     * @tc.name testSearch039
     * @tc.desc Verify search() finds JSON key name in string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("{\"name\":\"Alice\",\"age\":30}");
      let pos: int = text.search("\"name\"");
      expect(pos).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4000
     * @tc.name testSearch040
     * @tc.desc Verify search() finds log level ERROR in log line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2024-01-01 ERROR: connection failed");
      let pos: int = text.search(new RegExp("ERROR"));
      expect(pos).assertLarger(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4100
     * @tc.name testSearch041
     * @tc.desc Verify search() finds sentence ending with period
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello world. This is a test.");
      let pos: int = text.search(new RegExp("\\."));
      expect(pos).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4200
     * @tc.name testSearch042
     * @tc.desc Verify search() with non-greedy quantifier *? finds shortest match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("<div>hello</div><span>world</span>");
      let pos: int = text.search(new RegExp("<.*?>"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4300
     * @tc.name testSearch043
     * @tc.desc Verify search() extracts domain from URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("https://www.example.com/path");
      let pos: int = text.search(new RegExp("www\\.\\w+\\.\\w+"));
      expect(pos).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4400
     * @tc.name testSearch044
     * @tc.desc Verify search() checks phone number contains only digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("13812345678");
      let nonDigit: int = text.search(new RegExp("\\D"));
      expect(nonDigit).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4500
     * @tc.name testSearch045
     * @tc.desc Verify search() finds year in date pattern YYYY-MM-DD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2024-06-10");
      let pos: int = text.search(new RegExp("\\d{4}"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4600
     * @tc.name testSearch046
     * @tc.desc Verify search() finds HTML end tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("<div>content</div>");
      let pos: int = text.search(new RegExp("</\\w+>"));
      expect(pos).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4700
     * @tc.name testSearch047
     * @tc.desc Verify search() finds IP address pattern in log
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Connection from 192.168.1.100 established");
      let pos: int = text.search(new RegExp("\\d+\\.\\d+\\.\\d+\\.\\d+"));
      expect(pos).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4800
     * @tc.name testSearch048
     * @tc.desc Verify search() finds function definition keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("function calculate(a: int, b: int): int { return a + b; }");
      let pos: int = text.search(new RegExp("function\\s+\\w+"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_4900
     * @tc.name testSearch049
     * @tc.desc Verify search() finds complete word using \\b boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("The cat is in the category");
      let wholeWord: int = text.search(new RegExp("\\bcat\\b"));
      let partial: int = text.search(new RegExp("cat"));
      expect(wholeWord).assertEqual(4);
      expect(partial).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_5000
     * @tc.name testSearch050
     * @tc.desc Verify search() finds repeated characters pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let pos: int = text.search(new RegExp("(.)\\1"));
      expect(pos).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_5100
     * @tc.name testSearch051
     * @tc.desc Verify search() with non-greedy +? quantifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("aaaab");
      let pos: int = text.search(new RegExp("a+?b"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_5200
     * @tc.name testSearch052
     * @tc.desc Verify search() on palindrome string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("radar");
      let pos: int = text.search(new RegExp("^r.*r$"));
      expect(pos).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_5300
     * @tc.name testSearch053
     * @tc.desc Verify search() with RegExp anchors does not match literal anchor text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("before ^abc$ after");
      let pos: int = text.search(new RegExp("^abc$"));
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_5400
     * @tc.name testSearch054
     * @tc.desc Verify search() with ASCII uppercase class does not match Greek uppercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0391\u0392\u0393");
      let pos: int = text.search(new RegExp("[A-Z]+"));
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_5500
     * @tc.name testSearch055
     * @tc.desc Verify search() with anchored CJK RegExp does not match literal anchor characters in CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587^$\u6D4B\u8BD5");
      let pos: int = text.search(new RegExp("^\\u4E2D\\u6587$"));
      expect(pos).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_5600
     * @tc.name testSearch056
     * @tc.desc Verify search() handles isolated low surrogate U+DC04
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\uDC04");
      let result: int = source.search("\uDC04");
      expect(result).assertLargerOrEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_5700
     * @tc.name testSearch057
     * @tc.desc Verify Search handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: int = source.search(new RegExp("\\u56DE\\u8F66\\u6362\\u884C"));
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SEARCH_5800
     * @tc.name testSearch058
     * @tc.desc Verify Search handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSearch058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: int = source.search(new RegExp("الا"));
      expect(result).assertEqual(22);
    });
  });
}
