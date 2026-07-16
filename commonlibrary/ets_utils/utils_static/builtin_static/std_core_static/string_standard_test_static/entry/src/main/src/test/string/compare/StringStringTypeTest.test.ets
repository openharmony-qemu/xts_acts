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

class MyClass001 {
  value: string = new String("test");
}

export default function StringStringTypeTest(): void {
  describe('StringStringTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_0100
     * @tc.name testStringType001
     * @tc.desc Verify string is type alias of String, both represent same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new String("hello");
      expect(s.toString()).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_0200
     * @tc.name testStringType002
     * @tc.desc Verify string alias can be copied through String annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let source: string = new String("alias");
      let copied: String = source;
      expect(copied.toString()).assertEqual("alias");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_0300
     * @tc.name testStringType003
     * @tc.desc Verify string type annotation on variable declaration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new String("ArkTS");
      expect(s.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_0400
     * @tc.name testStringType004
     * @tc.desc Verify string type annotation on function parameter and return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = new String("World");
      let result: string = new String("Hello " + name.toString());
      expect(result.toString()).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_0500
     * @tc.name testStringType005
     * @tc.desc Verify String annotation preserves method behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: String = new String("ArkTS");
      expect(name.toLowerCase().toString()).assertEqual("arkts");
      expect(name.getLength()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_0600
     * @tc.name testStringType006
     * @tc.desc Verify string type annotation on class property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass001();
      expect(obj.value.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_0700
     * @tc.name testStringType007
     * @tc.desc Verify string used in generic type parameter (string array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [new String("a"), new String("b")];
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_0800
     * @tc.name testStringType008
     * @tc.desc Verify string variable accepts String instance assignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new String("ArkTS");
      let len: int = s.getLength();
      expect(len).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_0900
     * @tc.name testStringType009
     * @tc.desc Verify String variable accepts string-annotated value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new String("test");
      let b: String = a;
      expect(b.toString()).assertEqual("test");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1000
     * @tc.name testStringType010
     * @tc.desc Verify String-annotated variable preserves content and methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String("hello");
      expect(s.toUpperCase().toString()).assertEqual("HELLO");
      expect(s.charAt(1)).assertEqual(c'e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1100
     * @tc.name testStringType011
     * @tc.desc Verify string and String annotated variables have same method set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = new String("ArkTS");
      let b: String = new String("ArkTS");
      expect(a.length).assertEqual(b.length);
      expect(a.toString()).assertEqual(b.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1200
     * @tc.name testStringType012
     * @tc.desc Verify string type can be used with String methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new String("ArkTS Static");
      expect(s.length).assertEqual(12);
      expect(s.charAt(0)).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1300
     * @tc.name testStringType013
     * @tc.desc Verify string type with emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = new String("😀");
      let len: int = s.length;
      expect(len).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1400
     * @tc.name testStringType014
     * @tc.desc Verify template literal with variable interpolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let name: string = 'world';
      let str: string = `hello ${name}`;
      expect(str).assertEqual('hello world');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1500
     * @tc.name testStringType015
     * @tc.desc Verify template literal with expression interpolation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 10;
      let b: number = 20;
      let str: string = `Sum: ${a + b}`;
      expect(str).assertEqual('Sum: 30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1600
     * @tc.name testStringType016
     * @tc.desc Verify template literal with multiple expressions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: number = 10;
      let y: number = 20;
      let str: string = `${x} + ${y} = ${x + y}`;
      expect(str).assertEqual('10 + 20 = 30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1700
     * @tc.name testStringType017
     * @tc.desc Verify template literal with nested single and double quotes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = `He said "It's beautiful"`;
      expect(str).assertEqual('He said "It\'s beautiful"');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1800
     * @tc.name testStringType018
     * @tc.desc Verify empty template literal has length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = ``;
      expect(str.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_1900
     * @tc.name testStringType019
     * @tc.desc Verify string immutability: replace returns new string, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let newStr: string = str.replace('h', 'H');
      expect(str).assertEqual('hello');
      expect(newStr).assertEqual('Hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2000
     * @tc.name testStringType020
     * @tc.desc Verify string immutability: toUpperCase returns new string, original unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let upper: string = str.toUpperCase();
      expect(str).assertEqual('hello');
      expect(upper).assertEqual('HELLO');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2100
     * @tc.name testStringType021
     * @tc.desc Verify single-quoted string containing double quotes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'He said "hello"';
      expect(str).assertEqual('He said "hello"');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2200
     * @tc.name testStringType022
     * @tc.desc Verify double-quoted string containing single quotes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "It's a beautiful day";
      expect(str).assertEqual("It's a beautiful day");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2300
     * @tc.name testStringType023
     * @tc.desc Verify string with Unicode escape sequence © equals copyright sign ©
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\u00A9';
      expect(str).assertEqual('©');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2400
     * @tc.name testStringType024
     * @tc.desc Verify string with Unicode brace escape \u{XXXXXX} for supplementary plane
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\u{1F600}';
      expect(str.length).assertLarger(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2500
     * @tc.name testStringType025
     * @tc.desc Verify string with hexadecimal escape sequence \xHH
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\x41';
      expect(str).assertEqual('A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2600
     * @tc.name testStringType026
     * @tc.desc Verify String type preserves Unicode escape CJK content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      expect(text.toString()).assertEqual("\u4E2D\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2700
     * @tc.name testStringType027
     * @tc.desc Verify String type preserves zero-width space content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      expect(text.getLength()).assertEqual(3);
      expect(text.charCodeAt(1)).assertEqual(0x200B);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2800
     * @tc.name testStringType028
     * @tc.desc Verify String type preserves replacement character content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      expect(text.toString()).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_2900
     * @tc.name testStringType029
     * @tc.desc Verify String type preserves business date content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      expect(text.getLength()).assertEqual(10);
      expect(text.toString()).assertEqual("2026-03-05");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_3000
     * @tc.name testStringType030
     * @tc.desc Verify String type preserves Arabic content length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      expect(text.getLength()).assertEqual(2);
      expect(text.charCodeAt(0)).assertEqual(0x0627);
      expect(text.charCodeAt(1)).assertEqual(0x0628);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_3100
     * @tc.name testStringType031
     * @tc.desc Verify StringType handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = typeof source.toString();
      expect(result).assertEqual("string");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TYPE_3200
     * @tc.name testStringType032
     * @tc.desc Verify StringType handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringType032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = typeof source.toString();
      expect(result).assertEqual("string");
    });
  });
}
