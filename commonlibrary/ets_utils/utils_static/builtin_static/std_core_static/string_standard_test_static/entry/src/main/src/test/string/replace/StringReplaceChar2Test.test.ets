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

function getStr(): string {
  return "abcabc";
}

export default function StringReplaceChar2Test(): void {
  describe('StringReplaceChar2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_0100
     * @tc.name testReplaceChar001
     * @tc.desc Verify replaceChar() on string literal replaces all occurrences globally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s1: string = "banana";
      let r1: String = s1.replaceChar(c'a', c'o');
      expect(r1).assertEqual("bonono");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_0200
     * @tc.name testReplaceChar002
     * @tc.desc Verify replaceChar() on new String() instance replaces all occurrences globally
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s2: String = new String("banana");
      let r2: String = s2.replaceChar(c'a', c'o');
      expect(r2).assertEqual("bonono");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_0300
     * @tc.name testReplaceChar003
     * @tc.desc Verify replaceChar() behavior consistency between string literal and new String()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literal: string = "hello";
      let boxed: String = new String("hello");
      let rLiteral: String = literal.replaceChar(c'l', c'L');
      let rBoxed: String = boxed.replaceChar(c'l', c'L');
      expect(rLiteral).assertEqual(rBoxed);
      expect(rLiteral).assertEqual("heLLo");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_0400
     * @tc.name testReplaceChar004
     * @tc.desc Verify replaceChar() on const-declared string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sConst: string = "test string";
      let rConst: String = sConst.replaceChar(c't', c'T');
      expect(rConst).assertEqual("TesT sTring");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_0500
     * @tc.name testReplaceChar005
     * @tc.desc Verify replaceChar() on function-returned string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: String = getStr().replaceChar(c'a', c'X');
      expect(r).assertEqual("XbcXbc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_0600
     * @tc.name testReplaceChar006
     * @tc.desc Verify replaceChar() with char variables reused across calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let target: char = c' ';
      let replacement: char = c'_';
      let r1: String = "hello world".replaceChar(target, replacement);
      let r2: String = "a b c".replaceChar(target, replacement);
      expect(r1).assertEqual("hello_world");
      expect(r2).assertEqual("a_b_c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_0700
     * @tc.name testReplaceChar007
     * @tc.desc Verify replaceChar() with char variable reassigned and reused
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ch: char = c'1';
      let r1: String = "a1b1".replaceChar(ch, c'2');
      ch = c'a';
      let r2: String = "abc".replaceChar(ch, c'X');
      expect(r1).assertEqual("a2b2");
      expect(r2).assertEqual("Xbc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_0800
     * @tc.name testReplaceChar008
     * @tc.desc Verify chained replaceChar() calls replace two different characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a1b1c1";
      let r: string = s.replaceChar(c'a', c'A').replaceChar(c'1', c'0').toString();
      expect(r).assertEqual("A0b0c0");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_0900
     * @tc.name testReplaceChar009
     * @tc.desc Verify triple chained replaceChar() replaces three different characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello world";
      let r: string = s.replaceChar(c'h', c'H').replaceChar(c'w', c'W').replaceChar(c'l', c'L').toString();
      expect(r).assertEqual("HeLLo WorLd");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1000
     * @tc.name testReplaceChar010
     * @tc.desc Verify chained replaceChar() then replace() combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "abc abc";
      let r: string = s.replaceChar(c'a', c'X').replace("X", "A");
      expect(r).assertEqual("Abc Xbc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1100
     * @tc.name testReplaceChar011
     * @tc.desc Verify chained replace() then replaceChar() combination
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "abcabc";
      let r: string = s.replace("abc", "XYZ").replaceChar(c'Z', c'z').toString();
      expect(r).assertEqual("XYzabc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1200
     * @tc.name testReplaceChar012
     * @tc.desc Verify replaceChar() replaces all newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a\nb\nc";
      let r: String = s.replaceChar(c'\n', c'|');
      expect(r).assertEqual("a|b|c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1300
     * @tc.name testReplaceChar013
     * @tc.desc Verify replaceChar() replaces all tab characters with space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a\tb\tc";
      let r: String = s.replaceChar(c'\t', c' ');
      expect(r).assertEqual("a b c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1400
     * @tc.name testReplaceChar014
     * @tc.desc Verify replaceChar() replaces carriage return characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a\r\nb";
      let r: String = s.replaceChar(c'\r', c' ');
      expect(r).assertEqual("a \nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1500
     * @tc.name testReplaceChar015
     * @tc.desc Verify replaceChar() replaces all null characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "ab\0cd\0ef";
      let r: String = s.replaceChar(c'\0', c'X');
      expect(r).assertEqual("abXcdXef");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1600
     * @tc.name testReplaceChar016
     * @tc.desc Verify replaceChar() replaces max Unicode char U+FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a￿b￿c";
      let r: String = s.replaceChar(c'￿', c'-');
      expect(r).assertEqual("a-b-c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1700
     * @tc.name testReplaceChar017
     * @tc.desc Verify replaceChar() replaces ASCII boundary char tilde
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello~world";
      let r: String = s.replaceChar(c'~', c'!');
      expect(r).assertEqual("hello!world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1800
     * @tc.name testReplaceChar018
     * @tc.desc Verify replaceChar() triple-layer validation: instanceof, toString, length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: String = "hello world".replaceChar(c'o', c'O');
      expect(r.toString()).assertEqual("hellO wOrld");
      expect(r.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_1900
     * @tc.name testReplaceChar019
     * @tc.desc Verify replaceChar() result length unchanged after single-char replacement
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello";
      let r: String = s.replaceChar(c'l', c'L');
      expect(r.length).assertEqual(s.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_2000
     * @tc.name testReplaceChar020
     * @tc.desc Verify replaceChar() on empty string result length is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: String = "".replaceChar(c'a', c'b');
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_2100
     * @tc.name testReplaceChar021
     * @tc.desc Verify replaceChar() returns the same string when replacing character with itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello world";
      let r: String = s.replaceChar(c'l', c'l');
      expect(r.toString()).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_2200
     * @tc.name testReplaceChar022
     * @tc.desc Verify replaceChar() replaces character at both beginning and end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a b c a";
      let r: String = s.replaceChar(c'a', c'X');
      expect(r.toString()).assertEqual("X b c X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_2300
     * @tc.name testReplaceChar023
     * @tc.desc Verify replaceChar() result properties unchanged when no match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello";
      let r: String = s.replaceChar(c'x', c'y');
      expect(r.length).assertEqual(s.length);
      expect(r.toString()).assertEqual(s);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_2400
     * @tc.name testReplaceChar024
     * @tc.desc Verify replaceChar() replaces all Japanese character occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "あいあい";
      let r: String = s.replaceChar(c'あ', c'え');
      expect(r).assertEqual("えいえい");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_2500
     * @tc.name testReplaceChar025
     * @tc.desc Verify replaceChar() replaces all Cyrillic character occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "абаб";
      let r: String = s.replaceChar(c'а', c'о');
      expect(r).assertEqual("обоб");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_2600
     * @tc.name testReplaceChar026
     * @tc.desc Verify replaceChar() with char obtained from String wrapper via charAt()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let wrapper: String = new String("hello");
      let target: char = wrapper.charAt(0);
      let s: string = "hello world";
      let r: String = s.replaceChar(target, c'H');
      expect(r).assertEqual("Hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_2700
     * @tc.name testReplaceChar027
     * @tc.desc Verify replaceChar() does not mutate the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello";
      let before: string = s;
      s.replaceChar(c'l', c'L');
      expect(s).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPLACECHAR2_2800
     * @tc.name testReplaceChar028
     * @tc.desc Verify replaceChar() on large string replaces all character occurrences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testReplaceChar028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a".repeat(500);
      let r: String = s.replaceChar(c'a', c'b');
      expect(r.length).assertEqual(500);
      expect(r.toString()).assertEqual("b".repeat(500));
    });
    });
}