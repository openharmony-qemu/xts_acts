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

function getString(): string {
  return "functional string";
}

function replaceFirst<T extends string>(input: T, search: string, replacement: string): string {
  return input.replace(search, replacement);
}

function safeReplace<T extends string>(source: T, pattern: string, value: string): string {
  let result: string = source.replace(pattern, value);
  return result;
}

function replaceWithFn<T extends string>(input: T, pattern: string | RegExp, fn: (m: string) => string): string {
  return input.replace(pattern, fn);
}

function getStr(): string {
  return "hello world";
}

export default function StringReplace2Test(): void {
  describe('StringReplace2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_0100
     * @tc.name testReplace001
     * @tc.desc Verify replace() called on string literal with string searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = "hello world";
      let r1: string = s1.replace("hello", "hi");
      expect(r1).assertEqual("hi world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_0200
     * @tc.name testReplace002
     * @tc.desc Verify replace() behavior consistency between string literal and new String()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literal: string = "abcabc";
      let boxed: String = new String("abcabc");
      let rLiteral: string = literal.replace("abc", "X");
      let rBoxed: string = boxed.replace("abc", "X");
      expect(rLiteral).assertEqual(rBoxed);
      expect(rLiteral).assertEqual("Xabc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_0300
     * @tc.name testReplace003
     * @tc.desc Verify replace() on const-declared string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sConst: string = "test string";
      let rConst: string = sConst.replace("test", "demo");
      expect(rConst).assertEqual("demo string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_0400
     * @tc.name testReplace004
     * @tc.desc Verify replace() on let-declared string after reassignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sLet: string = "first value";
      sLet = "second value";
      let rLet: string = sLet.replace("second", "updated");
      expect(rLet).assertEqual("updated value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_0500
     * @tc.name testReplace005
     * @tc.desc Verify replace() on string returned from an arrow function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let getStr: () => string = (): string => "arrow function";
      let rArrow: string = getStr().replace("arrow", "lambda");
      expect(rArrow).assertEqual("lambda function");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_0600
     * @tc.name testReplace006
     * @tc.desc Verify replace() replaces single emoji character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("\u{1F600}\u{1F600}\u{1F600}".replace("\u{1F600}", "\u{1F60A}")).assertEqual("\u{1F60A}\u{1F600}\u{1F600}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_0700
     * @tc.name testReplace007
     * @tc.desc Verify replace() preserves ZWJ emoji sequence while replacing adjacent plain text substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let familyStr: string = "\u{1F468}‍\u{1F469}‍\u{1F467} family";
      let rFamily: string = familyStr.replace("family", "home");
      expect(rFamily).assertEqual("\u{1F468}‍\u{1F469}‍\u{1F467} home");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_0800
     * @tc.name testReplace008
     * @tc.desc Verify replace() with regex matching emoji using g flag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("⭐star⭐".replace(new RegExp("⭐", "g"), "★")).assertEqual("★star★");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_0900
     * @tc.name testReplace009
     * @tc.desc Verify replace() with 4-byte Unicode character as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "\u{20BB7}野家";
      let r: string = s.replace("\u{20BB7}", "吉");
      expect(r).assertEqual("吉野家");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1000
     * @tc.name testReplace010
     * @tc.desc Verify replace() only replaces first occurrence of 4-byte Unicode character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "\u{20BB7}a\u{20BB7}b";
      let r: string = s.replace("\u{20BB7}", "吉");
      expect(r).assertEqual("吉a\u{20BB7}b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1100
     * @tc.name testReplace011
     * @tc.desc Verify replace() replaces first newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("line1\nline2\nline3".replace("\n", "|")).assertEqual("line1|line2\nline3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1200
     * @tc.name testReplace012
     * @tc.desc Verify replace() replaces first tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("col1\tcol2\tcol3".replace("\t", ",")).assertEqual("col1,col2\tcol3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1300
     * @tc.name testReplace013
     * @tc.desc Verify replace() replaces carriage return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("text\r\nnewline".replace("\r", "")).assertEqual("text\nnewline");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1400
     * @tc.name testReplace014
     * @tc.desc Verify replace() replaces null character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "abc\x00def";
      let r: string = s.replace("\x00", "[NUL]");
      expect(r).assertEqual("abc[NUL]def");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1500
     * @tc.name testReplace015
     * @tc.desc Verify replace() with traditional Chinese searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("數據庫數據".replace("數據", "資料")).assertEqual("資料庫數據");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1600
     * @tc.name testReplace016
     * @tc.desc Verify replace() with mixed traditional and simplified Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("繁體简体混合".replace("简体", "簡體")).assertEqual("繁體簡體混合");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1700
     * @tc.name testReplace017
     * @tc.desc Verify replace() with CJK mixed script string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixed: string = "Hello世界worldテスト한국";
      let r: string = mixed.replace("世界", "\u{1F30D}");
      expect(r).assertEqual("Hello\u{1F30D}worldテスト한국");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1800
     * @tc.name testReplace018
     * @tc.desc Verify replace() with mixed Arabic and Latin scripts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Hello مرحبا World".replace("مرحبا", "Arabic")).assertEqual("Hello Arabic World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_1900
     * @tc.name testReplace019
     * @tc.desc Verify replace() with number coerced to string as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("123abc".replace("123", "NUM")).assertEqual("NUMabc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2000
     * @tc.name testReplace020
     * @tc.desc Verify replace() with zero coerced to string as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc0def".replace("0", "ZERO")).assertEqual("abcZEROdef");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2100
     * @tc.name testReplace021
     * @tc.desc Verify replace() with string "true" as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("true_value".replace("true", "BOOL")).assertEqual("BOOL_value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2200
     * @tc.name testReplace022
     * @tc.desc Verify replace() with string "false" as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("this is false".replace("false", "BOOL")).assertEqual("this is BOOL");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2300
     * @tc.name testReplace023
     * @tc.desc Verify replace() with string "[object Object]" as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("[object Object] found".replace("[object Object]", "OBJ")).assertEqual("OBJ found");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2400
     * @tc.name testReplace024
     * @tc.desc Verify replace() with comma-separated number string as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("1,2,3 items".replace("1,2,3", "ARR")).assertEqual("ARR items");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2500
     * @tc.name testReplace025
     * @tc.desc Verify replace() with string "999" as replaceValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc".replace("abc", "999")).assertEqual("999");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2600
     * @tc.name testReplace026
     * @tc.desc Verify replace() with string "true" as replaceValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc".replace("abc", "true")).assertEqual("true");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2700
     * @tc.name testReplace027
     * @tc.desc Verify replace() with string "false" as replaceValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc".replace("a", "false")).assertEqual("falsebc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2800
     * @tc.name testReplace028
     * @tc.desc Verify chained replace() then replaceAll() call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a-b-c-a-b-c";
      let r: string = s.replace("a", "X").replaceAll("-", "_");
      expect(r).assertEqual("X_b_c_a_b_c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_2900
     * @tc.name testReplace029
     * @tc.desc Verify chained replace() calls on same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello world arkts";
      let r: string = s.replace("hello", "hi").replace("world", "earth");
      expect(r).assertEqual("hi earth arkts");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3000
     * @tc.name testReplace030
     * @tc.desc Verify replace() in generic function with T extends string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = replaceFirst("hello world", "hello", "hi");
      expect(r).assertEqual("hi world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3100
     * @tc.name testReplace031
     * @tc.desc Verify replace() in generic function works for both non-empty and empty strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = safeReplace("abc", "a", "A");
      let r2: string = safeReplace("" as string, "x", "y");
      expect(r1).assertEqual("Abc");
      expect(r2).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3200
     * @tc.name testReplace032
     * @tc.desc Verify replace() on first character returns expected string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "hello".replace("h", "H");
      expect(r).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3300
     * @tc.name testReplace033
     * @tc.desc Verify replace() result length is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "abcd".replace("ab", "XY");
      expect(r.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3400
     * @tc.name testReplace034
     * @tc.desc Verify replace() result content and length are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "hello world".replace("world", "arkts");
      expect(r).assertEqual("hello arkts");
      expect(r.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3500
     * @tc.name testReplace035
     * @tc.desc Verify replace() result length increases when replaceValue is longer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a";
      let r: string = s.replace("a", "AAA");
      expect(r.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3600
     * @tc.name testReplace036
     * @tc.desc Verify replace() result length decreases when replacing with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "abc".replace("b", "");
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3700
     * @tc.name testReplace037
     * @tc.desc Verify replace() throws SyntaxError for invalid regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        "test".replace(new RegExp("[unclosed"), "X");
        expect().assertFail();
      } catch (e) {
        expect(e).not().assertNull();
        expect((e as SyntaxError).name).assertEqual("SyntaxError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3800
     * @tc.name testReplace038
     * @tc.desc Verify replace() with valid regex does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "hello".replace(new RegExp("hello"), "hi");
      expect(r).assertEqual("hi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_3900
     * @tc.name testReplace039
     * @tc.desc Verify replace() with non-matching regex returns original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "abcdef";
      let r: string = s.replace(new RegExp("\\d+"), "NUM");
      expect(r).assertEqual("abcdef");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4000
     * @tc.name testReplace040
     * @tc.desc Verify replace() with non-matching regex preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello";
      let r: string = s.replace(new RegExp("x"), "X");
      expect(r.length).assertEqual(s.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4100
     * @tc.name testReplace041
     * @tc.desc Verify replace() with regex without g flag only replaces first match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a1a2a3".replace(new RegExp("\\d"), "N")).assertEqual("aNa2a3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4200
     * @tc.name testReplace042
     * @tc.desc Verify replace() with g-flagged regex replaces all matches
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("a1a2a3".replace(new RegExp("\\d", "g"), "N")).assertEqual("aNaNaN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4300
     * @tc.name testReplace043
     * @tc.desc Verify replace() with two capture groups referencing $2-$1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("abc-123".replace(new RegExp("(\\w+)-(\\d+)"), "$2-$1")).assertEqual("123-abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4400
     * @tc.name testReplace044
     * @tc.desc Verify replace() with multiple capture groups and format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("2024-07-17".replace(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"), "$1年$2月$3日")).assertEqual("2024年07月17日");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4500
     * @tc.name testReplace045
     * @tc.desc Verify replace() and replaceAll() produce same result with single match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello world";
      let rReplace: string = s.replace("hello", "hi");
      let rReplaceAll: string = s.replaceAll("hello", "hi");
      expect(rReplace).assertEqual(rReplaceAll);
      expect(rReplace).assertEqual("hi world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4600
     * @tc.name testReplace046
     * @tc.desc Verify replace() and replaceAll() produce same result with no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello";
      expect(s.replace("xyz", "abc")).assertEqual(s.replaceAll("xyz", "abc"));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4700
     * @tc.name testReplace047
     * @tc.desc Verify replaceAll() with g regex equals replace() with g regex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a1b2c3";
      let rAll: string = s.replaceAll(new RegExp("\\d", "g"), "N");
      let rReplace: string = s.replace(new RegExp("\\d", "g"), "N");
      expect(rAll).assertEqual(rReplace);
      expect(rAll).assertEqual("aNbNcN");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4800
     * @tc.name testReplace048
     * @tc.desc Verify replace() result length after replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello";
      let r: string = s.replace("hello", "hi");
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_4900
     * @tc.name testReplace049
     * @tc.desc Verify replace() result length equals original when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello";
      let r: string = s.replace("xyz", "abc");
      expect(r.length).assertEqual(s.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5000
     * @tc.name testReplace050
     * @tc.desc Verify replace() result property access: charAt, length, toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "hello world".replace("world", "arkts");
      expect(r.charAt(0).toString()).assertEqual("h");
      expect(r.length).assertEqual(11);
      expect(r.toUpperCase()).assertEqual("HELLO ARKTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5100
     * @tc.name testReplace051
     * @tc.desc Verify replace() with function replacer on string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = "hello";
      let r1: string = s1.replace("hello", (m: string): string => m.toUpperCase());
      expect(r1).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5200
     * @tc.name testReplace052
     * @tc.desc Verify replace() with function replacer on new String() instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: String = new String("hello");
      let r2: string = s2.replace("hello", (m: string): string => m.toUpperCase());
      expect(r2).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5300
     * @tc.name testReplace053
     * @tc.desc Verify replace() with function replacer on const-declared string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sConst: string = "test string";
      let rConst: string = sConst.replace("test", (m: string): string => m.toUpperCase());
      expect(rConst).assertEqual("TEST string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5400
     * @tc.name testReplace054
     * @tc.desc Verify replace() with function replacer on function-returned string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = getStr().replace("world", (m: string): string => m.toUpperCase());
      expect(r).assertEqual("hello WORLD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5500
     * @tc.name testReplace055
     * @tc.desc Verify replace() with function replacer and emoji searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "\u{1F600}\u{1F600}\u{1F600}".replace("\u{1F600}", (m: string): string => "\u{1F60A}");
      expect(r).assertEqual("\u{1F60A}\u{1F600}\u{1F600}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5600
     * @tc.name testReplace056
     * @tc.desc Verify replace() with function replacer wraps ZWJ emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let family: string = "\u{1F468}‍\u{1F469}‍\u{1F467} family";
      let r: string = family.replace("\u{1F468}‍\u{1F469}‍\u{1F467}", (m: string): string => "[" + m + "]");
      expect(r).assertEqual("[\u{1F468}‍\u{1F469}‍\u{1F467}] family");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5700
     * @tc.name testReplace057
     * @tc.desc Verify replace() with function replacer and 4-byte Unicode character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "\u{20BB7}野家";
      let r: string = s.replace("\u{20BB7}", (m: string): string => "吉");
      expect(r).assertEqual("吉野家");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5800
     * @tc.name testReplace058
     * @tc.desc Verify replace() with function replacer and newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "line1\nline2".replace("\n", (m: string): string => "|");
      expect(r).assertEqual("line1|line2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_5900
     * @tc.name testReplace059
     * @tc.desc Verify replace() with function replacer wraps tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "a\tb".replace("\t", (m: string): string => "[TAB]");
      expect(r).assertEqual("a[TAB]b");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6000
     * @tc.name testReplace060
     * @tc.desc Verify replace() with function replacer and traditional Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "數據庫".replace("數據", (m: string): string => "資料");
      expect(r).assertEqual("資料庫");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6100
     * @tc.name testReplace061
     * @tc.desc Verify replace() with function replacer uppercases mixed script
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "hello世界".replace("hello", (m: string): string => m.toUpperCase());
      expect(r).assertEqual("HELLO世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6200
     * @tc.name testReplace062
     * @tc.desc Verify replace() with string "123" as searchValue and function replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "abc123def".replace("123", (m: string): string => "[ NUM ]");
      expect(r).assertEqual("abc[ NUM ]def");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6300
     * @tc.name testReplace063
     * @tc.desc Verify replace() with string "true" as searchValue and function replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "true_statement".replace("true", (m: string): string => "boolean");
      expect(r).assertEqual("boolean_statement");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6400
     * @tc.name testReplace064
     * @tc.desc Verify replace() with string "[object Object]" as searchValue and function replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "test [object Object] here".replace("[object Object]", (m: string): string => "[OBJ]");
      expect(r).assertEqual("test [OBJ] here");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6500
     * @tc.name testReplace065
     * @tc.desc Verify chained replace(function) then replaceAll(string) call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a-b-c-a-b-c";
      let r: string = s.replace("a", (m: string): string => "X").replaceAll("-", "_");
      expect(r).assertEqual("X_b_c_a_b_c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6600
     * @tc.name testReplace066
     * @tc.desc Verify replace() with generic function and function replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = replaceWithFn("hello world", "world", (m: string): string => m.toUpperCase());
      expect(r).assertEqual("hello WORLD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6700
     * @tc.name testReplace067
     * @tc.desc Verify replace() with function replacer result content and length are correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "hello world".replace("world", (m: string): string => m.toUpperCase());
      expect(r).assertEqual("hello WORLD");
      expect(r.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6800
     * @tc.name testReplace068
     * @tc.desc Verify replace() catches TypeError from replacer function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        "abc".replace("b", (): string => { throw new TypeError("type mismatch"); });
        expect().assertFail();
      } catch (e) {
        expect((e as TypeError).name).assertEqual("TypeError");
        expect((e as TypeError).message).assertEqual("type mismatch");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_6900
     * @tc.name testReplace069
     * @tc.desc Verify replace() with non-matching regex does not invoke replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      let r: string = "hello".replace(new RegExp("\\d+"), (): string => { called = true; return "N"; });
      expect(called).assertFalse();
      expect(r).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7000
     * @tc.name testReplace070
     * @tc.desc Verify replace() with regex without g flag and function replacer only replaces first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "a1a2a3".replace(new RegExp("\\d"), (m: string): string => "[" + m + "]");
      expect(r).assertEqual("a[1]a2a3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7100
     * @tc.name testReplace071
     * @tc.desc Verify replace() with g-flagged regex and function replacer replaces all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0;
      let r: string = "a1a2a3".replace(new RegExp("\\d", "g"), (m: string): string => { count++; return "(" + m + ")"; });
      expect(r).assertEqual("a(1)a(2)a(3)");
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7200
     * @tc.name testReplace072
     * @tc.desc Verify replace() with capture groups passed to function replacer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "2024-07-17".replace(new RegExp("(\\d{4})-(\\d{2})-(\\d{2})"),
        (match: string, args: (Object | undefined)[]): string => {
          return (args[0] as string) + "年" + (args[1] as string) + "月" + (args[2] as string) + "日";
        });
      expect(r).assertEqual("2024年07月17日");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7300
     * @tc.name testReplace073
     * @tc.desc Verify replace() with function replacer result length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "hello".replace("h", (m: string): string => "HHH");
      expect(r.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7400
     * @tc.name testReplace074
     * @tc.desc Verify replace() with non-matching search string preserves length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello";
      let r: string = s.replace("xxx", (): string => "X");
      expect(r.length).assertEqual(s.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7500
     * @tc.name testReplace075
     * @tc.desc Verify replace(), replaceAll(), and replaceChar() processing differences for "aaa"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "aaa";
      let r1: string = s.replace("a", "b");
      let r2: string = s.replaceAll("a", "b");
      let r3: String = s.replaceChar(c'a', c'b');
      expect(r1).assertEqual("baa");
      expect(r2).assertEqual("bbb");
      expect(r3.toString()).assertEqual("bbb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7600
     * @tc.name testReplace076
     * @tc.desc Verify replaceChar() result can be used directly with replace()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: String = "hello".replaceChar(c'h', c'H');
      let finalVal: string = r.toString().replace("H", "h");
      expect(finalVal).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7700
     * @tc.name testReplace077
     * @tc.desc Verify replace with RegExp g-flag and $2$1 back-reference swaps adjacent character pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "ab cd ef";
      let re: RegExp = new RegExp("(.)(.)", "g");
      let result: string = s.replace(re, "$2$1");
      expect(result).assertEqual("bac  dfe");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7800
     * @tc.name testReplace078
     * @tc.desc Verify replace function replacer returning empty string reduces result length by matched length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "abc";
      let r: string = s.replace("b", (): string => "");
      expect(r).assertEqual("ac");
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_7900
     * @tc.name testReplace079
     * @tc.desc Verify replace $` inserts substring before match: "abc".replace("b","$`") → "aac"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "abc".replace("b", "$`");
      expect(result).assertEqual("aac");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8000
     * @tc.name testReplace080
     * @tc.desc Verify replace $' inserts substring after match: "abc".replace("b","$'") → "acc"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "abc".replace("b", "$'");
      expect(result).assertEqual("acc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8100
     * @tc.name testReplace081
     * @tc.desc Verify replace $$ inserts literal dollar sign: "a".replace("a","$$") → "$"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "a".replace("a", "$$");
      expect(result).assertEqual("$");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8200
     * @tc.name testReplace082
     * @tc.desc Verify replace with sticky RegExp flag "y" only matches at lastIndex position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp("a", "y");
      let result: string = "baa".replace(re, "X");
      expect(result).assertEqual("baa");
      let re2: RegExp = new RegExp("a", "y");
      let result2: string = "aba".replace(re2, "X");
      expect(result2).assertEqual("Xba");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8300
     * @tc.name testReplace083
     * @tc.desc Verify replace with unicode RegExp flag "u" handles surrogate pairs correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let re: RegExp = new RegExp("🌟", "gu");
      let result: string = "a🌟b".replace(re, "★");
      expect(result).assertEqual("a★b");

    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8400
     * @tc.name testReplace084
     * @tc.desc Verify replace with empty search
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "hello".replace("", "_");
      expect(r).assertEqual("_hello");
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8500
     * @tc.name testReplace085
     * @tc.desc Verify replace() with Japanese characters replaces first occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "こんにちは こんにちは";
      let r: string = s.replace("こんにちは", "こんばんは");
      expect(r).assertEqual("こんばんは こんにちは");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8600
     * @tc.name testReplace086
     * @tc.desc Verify replace() with Cyrillic characters replaces first occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "привет привет";
      let r: string = s.replace("привет", "здравствуйте");
      expect(r).assertEqual("здравствуйте привет");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8700
     * @tc.name testReplace087
     * @tc.desc Verify replace() with String(undefined) as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "undefinedValue".replace(String(undefined), "defined");
      expect(r).assertEqual("definedValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8800
     * @tc.name testReplace088
     * @tc.desc Verify replace() with String(NaN) as searchValue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "NaNValue".replace(String(Number.NaN), "num");
      expect(r).assertEqual("numValue");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_8900
     * @tc.name testReplace089
     * @tc.desc Verify replace() with String wrapper as searchValue via toString()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let search: String = new String("hello");
      let s: string = "hello world";
      let r: string = s.replace(search.toString(), "hi");
      expect(r).assertEqual("hi world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_9000
     * @tc.name testReplace090
     * @tc.desc Verify replace() on large string replaces first occurrence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello ".repeat(100) + "world";
      let r: string = s.replace("hello", "hi");
      expect(r.indexOf("hi")).assertEqual(0);
      expect(r.length).assertEqual(s.length - 3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_9100
     * @tc.name testReplace091
     * @tc.desc Verify replace() on empty source string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "".replace("a", "b");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_9200
     * @tc.name testReplace092
     * @tc.desc Verify replace() with regex i flag performs case-insensitive match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = "Hello World".replace(new RegExp("hello", "i"), "Hi");
      let r2: string = "Hello World".replace(new RegExp("HELLO", "i"), "Hi");
      expect(r1).assertEqual("Hi World");
      expect(r2).assertEqual(r1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_9300
     * @tc.name testReplace093
     * @tc.desc Verify replace() with regex m flag matches at line starts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "foo\nFOO\nbar";
      let r: string = s.replace(new RegExp("^foo", "im"), "baz");
      expect(r.startsWith("baz\n")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_9400
     * @tc.name testReplace094
     * @tc.desc Verify replace() $&amp; replacement pattern inserts matched substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "abc".replace("b", "[$&]");
      expect(result).assertEqual("a[b]c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_9500
     * @tc.name testReplace095
     * @tc.desc Verify replace() $' replacement pattern inserts suffix after match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "abcXYZ";
      let result: string = s.replace("abc", "[$']");
      expect(result).assertEqual("[XYZ]XYZ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_9600
     * @tc.name testReplace096
     * @tc.desc Verify replace() $$ replacement pattern inserts literal $
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "abc".replace("b", "[$$");
      expect(result).assertEqual("a[$c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_9700
     * @tc.name testReplace097
     * @tc.desc Verify replace() out-of-range $1 backreference keeps literal as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "hello".replace(new RegExp("hello"), "$2world");
      expect(result).assertEqual("$2world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACE2_9800
     * @tc.name testReplace098
     * @tc.desc Verify replace() preserves surrogate pair in replacement value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplace098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "x".replace("x", "A🎉B");
      expect(result).assertEqual("A🎉B");
      expect(result.length).assertEqual(4);
    });

    });
}