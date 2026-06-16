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

export default function StringMatchTest(): void {
  describe('StringMatchTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0100
     * @tc.name testMatch001
     * @tc.desc Verify match() with ASCII string pattern returns matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let m: RegExpMatchArray | null = text.match("Ark");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("Ark");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0200
     * @tc.name testMatch002
     * @tc.desc Verify match() with RegExp digit pattern returns matched digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello123world");
      let m: RegExpMatchArray | null = text.match(new RegExp("[0-9]+"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0300
     * @tc.name testMatch003
     * @tc.desc Verify match() with not-found pattern returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abcdef");
      let m: RegExpMatchArray | null = text.match("[0-9]");
      let isNull: boolean = m === null;
      expect(isNull).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0400
     * @tc.name testMatch004
     * @tc.desc Verify match() with global flag returns all digit matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3");
      let m: RegExpMatchArray | null = text.match(new RegExp("[0-9]", "g"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("1");
      expect(m![1]).assertEqual("2");
      expect(m![2]).assertEqual("3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0500
     * @tc.name testMatch005
     * @tc.desc Verify match() with CJK Unicode BMP pattern returns matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界");
      let m: RegExpMatchArray | null = text.match("世界");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0600
     * @tc.name testMatch006
     * @tc.desc Verify match() with capturing group returns captured group content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc123def");
      let m: RegExpMatchArray | null = text.match(new RegExp("([0-9]+)"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("123");
      expect(m![1]).assertEqual("123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0700
     * @tc.name testMatch007
     * @tc.desc Verify match() with empty string pattern matches empty at position 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let m: RegExpMatchArray | null = text.match("");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0800
     * @tc.name testMatch008
     * @tc.desc Verify match() with pattern at end of string returns matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("startXYZ");
      let m: RegExpMatchArray | null = text.match("XYZ");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("XYZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_0900
     * @tc.name testMatch009
     * @tc.desc Verify match() with GBK Chinese pattern returns matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let m: RegExpMatchArray | null = text.match("测试");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1000
     * @tc.name testMatch010
     * @tc.desc Verify match() with C0 control tab pattern finds match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("col1\tcol2");
      let m: RegExpMatchArray | null = text.match("\t");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1100
     * @tc.name testMatch011
     * @tc.desc Verify match() with dynamic pattern variable returns correct match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let pattern: string = "world";
      let m: RegExpMatchArray | null = text.match(pattern);
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1200
     * @tc.name testMatch012
     * @tc.desc Verify match() returns null deterministically when no match found
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let m: RegExpMatchArray | null = text.match("xyz");
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1300
     * @tc.name testMatch013
     * @tc.desc Verify match() with global flag returns all occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a1b2c3d4");
      let m: RegExpMatchArray | null = text.match(new RegExp("[0-9]", "g"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1400
     * @tc.name testMatch014
     * @tc.desc Verify match() with case-insensitive flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let m: RegExpMatchArray | null = text.match(new RegExp("hello", "i"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1500
     * @tc.name testMatch015
     * @tc.desc Verify match() on empty string returns null for non-empty pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let m: RegExpMatchArray | null = text.match("a");
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1600
     * @tc.name testMatch016
     * @tc.desc Verify match() with multiple capturing groups returns all groups
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2024-06-10");
      let m: RegExpMatchArray | null = text.match(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![1]).assertEqual("2024");
      expect(m![2]).assertEqual("06");
      expect(m![3]).assertEqual("10");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1700
     * @tc.name testMatch017
     * @tc.desc Verify match() result index property points to match position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let m: RegExpMatchArray | null = text.match("world");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.index).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1800
     * @tc.name testMatch018
     * @tc.desc Verify match() with global flag and empty pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let m: RegExpMatchArray | null = text.match(new RegExp("", "g"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_1900
     * @tc.name testMatch019
     * @tc.desc Verify match() with gi flags for global case-insensitive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Cafe CAFE cafe");
      let m: RegExpMatchArray | null = text.match(new RegExp("cafe", "gi"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2000
     * @tc.name testMatch020
     * @tc.desc Verify match() result input property references the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let m: RegExpMatchArray | null = text.match("world");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m!.input).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2100
     * @tc.name testMatch021
     * @tc.desc Verify match() on single character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let found: RegExpMatchArray | null = text.match("A");
      let notFound: RegExpMatchArray | null = text.match("B");
      expect(found === null).assertFalse();
      expect(notFound === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2200
     * @tc.name testMatch022
     * @tc.desc Verify match() with word boundary \\b for whole word only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("cat category catch");
      let m: RegExpMatchArray | null = text.match(new RegExp("\\bcat\\b"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("cat");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2300
     * @tc.name testMatch023
     * @tc.desc Verify match() with string pattern uses regex metacharacter semantics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a.b");
      let m: RegExpMatchArray | null = text.match(".");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("a");
      expect(m!.index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2400
     * @tc.name testMatch024
     * @tc.desc Verify match() with escaped RegExp pattern matches a literal dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a.b");
      let m: RegExpMatchArray | null = text.match(new RegExp("\\."));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual(".");
      expect(m!.index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2500
     * @tc.name testMatch025
     * @tc.desc Verify match() with RegExp quantifier braces does not match literal brace text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("value a{2}");
      let m: RegExpMatchArray | null = text.match(new RegExp("a{2}"));
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2600
     * @tc.name testMatch026
     * @tc.desc Verify match() with parentheses and plus RegExp metacharacters does not match literal expression text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("calc(1+2)");
      let m: RegExpMatchArray | null = text.match(new RegExp("calc(1+2)"));
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2700
     * @tc.name testMatch027
     * @tc.desc Verify match() with hex escape RegExp does not match literal escape text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("value=\\x41");
      let m: RegExpMatchArray | null = text.match(new RegExp("\\x41"));
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2800
     * @tc.name testMatch028
     * @tc.desc Verify match() with string pattern escaped dot matches a literal dot
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a.b");
      let m: RegExpMatchArray | null = text.match("\\.");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual(".");
      expect(m!.index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_2900
     * @tc.name testMatch029
     * @tc.desc Verify match() with string digit-class pattern returns matched digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("order42done");
      let m: RegExpMatchArray | null = text.match("\\d+");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("42");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3000
     * @tc.name testMatch030
     * @tc.desc Verify match() with string anchor pattern matches the whole string only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let m: RegExpMatchArray | null = text.match("^abc$");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("abc");
      expect(m!.index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3100
     * @tc.name testMatch031
     * @tc.desc Verify match() with string anchor pattern does not match embedded text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("before abc after");
      let m: RegExpMatchArray | null = text.match("^abc$");
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3200
     * @tc.name testMatch032
     * @tc.desc Verify match() with string pattern escaped dollar matches literal currency text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("price$100");
      let m: RegExpMatchArray | null = text.match("price\\$\\d+");
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("price$100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3300
     * @tc.name testMatch033
     * @tc.desc Verify match() with RegExp anchor pattern matches the whole string only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let m: RegExpMatchArray | null = text.match(new RegExp("^abc$"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("abc");
      expect(m!.index).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3400
     * @tc.name testMatch034
     * @tc.desc Verify match() with RegExp anchor pattern does not match embedded text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("before abc after");
      let m: RegExpMatchArray | null = text.match(new RegExp("^abc$"));
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3500
     * @tc.name testMatch035
     * @tc.desc Verify match() with escaped RegExp dollar pattern matches literal currency text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("price$100");
      let m: RegExpMatchArray | null = text.match(new RegExp("price\\$\\d+"));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual("price$100");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3600
     * @tc.name testMatch036
     * @tc.desc Verify match() with ASCII uppercase class does not match Cyrillic uppercase letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0410\u0411\u0412");
      let m: RegExpMatchArray | null = text.match(new RegExp("[A-Z]+"));
      expect(m === null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3700
     * @tc.name testMatch037
     * @tc.desc Verify match() with RegExp supplementary-plane emoji pattern returns emoji match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = String.fromCodePoint(128512);
      const text = new String("A" + emoji + "B");
      let m: RegExpMatchArray | null = text.match(new RegExp(emoji));
      let notNull: boolean = m !== null;
      expect(notNull).assertTrue();
      expect(m![0]).assertEqual(emoji);
      expect(m!.index).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3800
     * @tc.name testMatch038
     * @tc.desc Verify match() with malformed RegExp char class throws before matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let thrown: boolean = false;
      try {
        let m: RegExpMatchArray | null = text.match(new RegExp("[abc"));
      } catch (_error) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_3900
     * @tc.name testMatch039
     * @tc.desc Verify match() with malformed RegExp capture group throws before matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let thrown: boolean = false;
      try {
        let m: RegExpMatchArray | null = text.match(new RegExp("(abc"));
      } catch (_error) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_4000
     * @tc.name testMatch040
     * @tc.desc Verify match() with malformed RegExp quantifier throws before matching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let thrown: boolean = false;
      try {
        let m: RegExpMatchArray | null = text.match(new RegExp("a**"));
      } catch (_error) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_4100
     * @tc.name testMatch041
     * @tc.desc Verify match() handles ISO-8859-1 question-mark garbled text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("????");
      let result: RegExpMatchArray | null = source.match(new RegExp("\\?\\?"));
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual("??");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_4200
     * @tc.name testMatch042
     * @tc.desc Verify Match handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: RegExpMatchArray | null = source.match(new RegExp("<script>"));
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual("<script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_MATCH_4300
     * @tc.name testMatch043
     * @tc.desc Verify Match handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testMatch043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: RegExpMatchArray | null = source.match(new RegExp("АБВ"));
      expect(result !== null).assertTrue();
      expect(result![0]).assertEqual("АБВ");
    });
  });
}
