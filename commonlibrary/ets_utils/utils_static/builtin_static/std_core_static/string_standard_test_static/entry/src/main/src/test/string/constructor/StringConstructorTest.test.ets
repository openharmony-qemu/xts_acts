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

export default function StringConstructorTest(): void {
  describe('StringConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_0100
     * @tc.name testConstructor001
     * @tc.desc Verify new String() no-arg constructor creates empty string with length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String();
      expect(s.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_0200
     * @tc.name testConstructor002
     * @tc.desc Verify new String(String) copy constructor creates string with same content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new String("ArkTS");
      const copied = new String(original);
      expect(copied.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_0300
     * @tc.name testConstructor003
     * @tc.desc Verify new String(String) with ASCII English string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("Hello"));
      expect(s.toString()).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_0400
     * @tc.name testConstructor004
     * @tc.desc Verify new String(String) with CJK Unicode BMP Chinese string content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("测试中文"));
      expect(s.toString()).assertEqual("测试中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_0500
     * @tc.name testConstructor005
     * @tc.desc Verify new String(String) with numeric string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("12345"));
      expect(s.toString()).assertEqual("12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_0600
     * @tc.name testConstructor006
     * @tc.desc Verify new String(String) with mixed content (letters+digits+symbols)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("Test-123!@#"));
      expect(s.toString()).assertEqual("Test-123!@#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_0700
     * @tc.name testConstructor007
     * @tc.desc Verify new String(String) with empty source String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String(""));
      expect(s.length).assertEqual(0);
      expect(s.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_0800
     * @tc.name testConstructor008
     * @tc.desc Verify new String(String) with single character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("A"));
      expect(s.length).assertEqual(1);
      expect(s.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_0900
     * @tc.name testConstructor009
     * @tc.desc Verify new String(String) with C0 control characters newline tab carriage-return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("line1\nline2\ttab\r"));
      expect(s.toString()).assertEqual("line1\nline2\ttab\r");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1000
     * @tc.name testConstructor010
     * @tc.desc Verify new String(String) with CJK Unicode BMP characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("中文"));
      expect(s.toString()).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1100
     * @tc.name testConstructor011
     * @tc.desc Verify new String(FixedArray<char>) creates correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'A', c'r', c'k', c'T', c'S'];
      const s = new String(chars);
      expect(s.toString()).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1200
     * @tc.name testConstructor012
     * @tc.desc Verify new String(FixedArray<char>) with English letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'H', c'e', c'l', c'l', c'o'];
      const s = new String(chars);
      expect(s.toString()).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1300
     * @tc.name testConstructor013
     * @tc.desc Verify new String(FixedArray<char>) with digit characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'1', c'2', c'3', c'4', c'5'];
      const s = new String(chars);
      expect(s.toString()).assertEqual("12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1400
     * @tc.name testConstructor014
     * @tc.desc Verify new String(FixedArray<char>) with mixed ASCII digit symbol CJK characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'A', c'1', c'!', c'中'];
      const s = new String(chars);
      expect(s.toString()).assertEqual("A1!中");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1500
     * @tc.name testConstructor015
     * @tc.desc Verify new String(FixedArray<char>) with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'你', c'好'];
      const s = new String(chars);
      expect(s.toString()).assertEqual("你好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1600
     * @tc.name testConstructor016
     * @tc.desc Verify new String(FixedArray<char>) with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [];
      const s = new String(chars);
      expect(s.length).assertEqual(0);
      expect(s.toString()).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1700
     * @tc.name testConstructor017
     * @tc.desc Verify new String(FixedArray<char>) with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'A'];
      const s = new String(chars);
      expect(s.length).assertEqual(1);
      expect(s.toString()).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1800
     * @tc.name testConstructor018
     * @tc.desc Verify new String(ValueArray<char>) creates correct string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: ValueArray<char> = [c'A', c'r', c'k'];
      const s = new String(chars);
      expect(s.toString()).assertEqual("Ark");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_1900
     * @tc.name testConstructor019
     * @tc.desc Verify new String(ValueArray<char>) with English letters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: ValueArray<char> = [c'W', c'o', c'r', c'l', c'd'];
      const s = new String(chars);
      expect(s.toString()).assertEqual("World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2000
     * @tc.name testConstructor020
     * @tc.desc Verify new String(ValueArray<char>) with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueChars: ValueArray<char> = [];
      const s = new String(valueChars);
      expect(s.isEmpty()).assertTrue();
      expect(s.getLength()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2100
     * @tc.name testConstructor021
     * @tc.desc Verify new String(ValueArray<char>) with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const valueChars: ValueArray<char> = [c'Z'];
      const s = new String(valueChars);
      expect(s.charAt(0)).assertEqual(c'Z');
      expect(s.getLength()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2200
     * @tc.name testConstructor022
     * @tc.desc Verify new String(char[]) stringifies array elements with comma separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: char[] = [c'H', c'i', c'!'];
      const s = new String(chars);
      expect(s.toString()).assertEqual("H,i,!");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2300
     * @tc.name testConstructor023
     * @tc.desc Verify new String(char[]) with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const listChars: char[] = [];
      const s = new String(listChars);
      expect(s.getLength()).assertEqual(0);
      expect(s.isEmpty()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2400
     * @tc.name testConstructor024
     * @tc.desc Verify new String(char[]) with single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const listChars: char[] = [c'Q'];
      const s = new String(listChars);
      expect(s.charCodeAt(0)).assertEqual(81);
      expect(s.getLength()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2500
     * @tc.name testConstructor025
     * @tc.desc Verify new String(String) preserves whitespace-only content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String(" \t "));
      expect(s.getLength()).assertEqual(3);
      expect(s.toString()).assertEqual(" \t ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2600
     * @tc.name testConstructor026
     * @tc.desc Verify new String(String) preserves embedded C0 NUL character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("A\0B"));
      expect(s.getLength()).assertEqual(3);
      expect(s.toString()).assertEqual("A\0B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2700
     * @tc.name testConstructor027
     * @tc.desc Verify copy constructed String is not same object as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const original = new String("test");
      const copied = new String(original);
      expect(copied.toString()).assertEqual("test");
      expect(copied.toString()).assertEqual(original.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2800
     * @tc.name testConstructor028
     * @tc.desc Verify new String() instanceof String returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String("test");
      expect(s instanceof String).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_2900
     * @tc.name testConstructor029
     * @tc.desc Verify new String() instanceof Object returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String("test");
      expect(s instanceof Object).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3000
     * @tc.name testConstructor030
     * @tc.desc Verify String implements Comparable by compareTo equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s1 = new String("abc");
      const s2 = new String("abc");
      expect(s1.compareTo(s2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3100
     * @tc.name testConstructor031
     * @tc.desc Verify charAt works on FixedArray-constructed String
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: FixedArray<char> = [c'X', c'Y', c'Z'];
      const s = new String(chars);
      expect(s.charAt(0)).assertEqual(c'X');
      expect(s.charAt(1)).assertEqual(c'Y');
      expect(s.charAt(2)).assertEqual(c'Z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3200
     * @tc.name testConstructor032
     * @tc.desc Verify FixedArray and ValueArray produce same content while char[] keeps array string form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fa: FixedArray<char> = [c'T', c'E', c'S', c'T'];
      const va: ValueArray<char> = [c'T', c'E', c'S', c'T'];
      const ca: char[] = [c'T', c'E', c'S', c'T'];
      const s1 = new String(fa);
      const s2 = new String(va);
      const s3 = new String(ca);
      expect(s1.toString()).assertEqual(s2.toString());
      expect(s3.toString()).assertEqual("T,E,S,T");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3300
     * @tc.name testConstructor033
     * @tc.desc Verify new String() from string literal returns correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String("test");
      expect(s.toString()).assertEqual("test");
      expect(s.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3400
     * @tc.name testConstructor034
     * @tc.desc Verify String from char[] with C0 control NUL character includes separator output
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const chars: char[] = [c'A', c'\0', c'B'];
      const s = new String(chars);
      expect(s.length).assertEqual(5);
      expect(s.charCodeAt(1)).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3500
     * @tc.name testConstructor035
     * @tc.desc Verify new String(String) with Unicode supplementary plane emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("😀🎉"));
      expect(s.toString()).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3600
     * @tc.name testConstructor036
     * @tc.desc Verify new String(String) with C0 control carriage-return character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("a\rb"));
      expect(s.length).assertEqual(3);
      expect(s.charCodeAt(1)).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3700
     * @tc.name testConstructor037
     * @tc.desc Verify new String(String) with full-width form FF00 block characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s = new String(new String("ＦＵＬＬ"));
      expect(s.toString()).assertEqual("ＦＵＬＬ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3800
     * @tc.name testConstructor038
     * @tc.desc Verify new String() from char[] with BOM character preserves element between separators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bomChars: char[] = [c'A', c'\uFEFF', c'B'];
      const s = new String(bomChars);
      expect(s.charCodeAt(2)).assertEqual(65279);
      expect(s.charAt(2)).assertEqual(c'\uFEFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_3900
     * @tc.name testConstructor039
     * @tc.desc Verify String() conversion with undefined returns string 'undefined'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String(undefined);
      expect(result).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_4000
     * @tc.name testConstructor040
     * @tc.desc Verify String() conversion with null returns string 'null'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String(null);
      expect(result).assertEqual('null');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_4100
     * @tc.name testConstructor041
     * @tc.desc Verify String() conversion with boolean true/false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let t: string = String(true);
      let f: string = String(false);
      expect(t).assertEqual('true');
      expect(f).assertEqual('false');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_4200
     * @tc.name testConstructor042
     * @tc.desc Verify String() conversion with number / NaN / Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num: string = String(123);
      let nan: string = String(NaN);
      let inf: string = String(Infinity);
      expect(num).assertEqual('123');
      expect(nan).assertEqual('NaN');
      expect(inf).assertEqual('Infinity');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_4300
     * @tc.name testConstructor043
     * @tc.desc Verify String() conversion with array returns comma-joined elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let result: string = String(arr);
      expect(result).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_4400
     * @tc.name testConstructor044
     * @tc.desc Verify String() conversion with empty array returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      let result: string = String(arr);
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_4500
     * @tc.name testConstructor045
     * @tc.desc Verify String() conversion with object returns '[object Object]'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let result: string = String(obj);
      expect(result).assertEqual('[object Object]');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_4600
     * @tc.name testConstructor046
     * @tc.desc Verify constructor() handles illegal UTF-8 sequence spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xe4\\x3f\\xad");
      expect(source.toString()).assertEqual("\\xe4\\x3f\\xad");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_4700
     * @tc.name testConstructor047
     * @tc.desc Verify Constructor handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      const result = new String(expected);
      expect(result.toString()).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONSTRUCTOR_4800
     * @tc.name testConstructor048
     * @tc.desc Verify Constructor handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testConstructor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string = "テスト 테스트 Test 測試 АБВГД الاختبار";
      const result = new String(expected);
      expect(result.toString()).assertEqual(expected);
    });
  });
}
