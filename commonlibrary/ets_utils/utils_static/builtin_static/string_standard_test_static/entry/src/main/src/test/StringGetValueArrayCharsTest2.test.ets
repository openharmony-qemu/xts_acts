'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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
} from '../../../hypium/index';
import hilog from '@ohos.hilog';


export default function StringGetValueArrayCharsTest2():void {
  describe('StringGetValueArrayCharsTest2', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0100
     * @tc.name testStringGetValueArrayChars001
     * @tc.desc Verify getValueArrayChars is no-argument method returns complete char array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result.toString()).assertEqual('A,r,k,T,S');
      expect(result[0]).assertEqual(c'A');
      expect(result[4]).assertEqual(c'S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0200
     * @tc.name testStringGetValueArrayChars002
     * @tc.desc Verify getValueArrayChars on empty string returns empty ValueArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(0);
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0300
     * @tc.name testStringGetValueArrayChars003
     * @tc.desc Verify getValueArrayChars on single character string returns single element ValueArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "A";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0400
     * @tc.name testStringGetValueArrayChars004
     * @tc.desc Verify getValueArrayChars on Chinese string with multi-byte characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "中文测试";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(c'中');
      expect(result[3]).assertEqual(c'试');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0500
     * @tc.name testStringGetValueArrayChars005
     * @tc.desc Verify getValueArrayChars on mixed language string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "Test测试テスト테스트";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(12);
      expect(result[0]).assertEqual(c'T');
      expect(result[4]).assertEqual(c'测');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0600
     * @tc.name testStringGetValueArrayChars006
     * @tc.desc Verify getValueArrayChars on emoji string with surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "😀🔥";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0700
     * @tc.name testStringGetValueArrayChars007
     * @tc.desc Verify getValueArrayChars on string with escape characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "test\n\t\r";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(c't');
      expect(result[4]).assertEqual(c'\n');
      expect(result[5]).assertEqual(c'\t');
      expect(result[6]).assertEqual(c'\r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0800
     * @tc.name testStringGetValueArrayChars008
     * @tc.desc Verify getValueArrayChars on string with special symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "!@#$%^&*()";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(10);
      expect(result[0]).assertEqual(c'!');
      expect(result[9]).assertEqual(c')');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0900
     * @tc.name testStringGetValueArrayChars009
     * @tc.desc Verify getValueArrayChars on XSS string without script execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "<script>alert(1)</script>";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(25);
      expect(result[0]).assertEqual(c'<');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1000
     * @tc.name testStringGetValueArrayChars010
     * @tc.desc Verify getValueArrayChars on Unicode boundary characters string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "\u0000\uFFFF";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(c'\u0000');
      expect(result[1]).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1100
     * @tc.name testStringGetValueArrayChars011
     * @tc.desc Verify getValueArrayChars on zero-width space string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "test\u200B";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[4]).assertEqual(c'\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1200
     * @tc.name testStringGetValueArrayChars012
     * @tc.desc Verify getValueArrayChars on 10000 characters long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = "a".repeat(10000);
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(10000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1300
     * @tc.name testStringGetValueArrayChars013
     * @tc.desc Verify getValueArrayChars on 65535 characters string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = "a".repeat(65535);
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1400
     * @tc.name testStringGetValueArrayChars014
     * @tc.desc Verify getValueArrayChars on hexadecimal format string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "0x123";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'0');
      expect(result[2]).assertEqual(c'1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1500
     * @tc.name testStringGetValueArrayChars015
     * @tc.desc Verify getValueArrayChars on scientific notation string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "1.0e6";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'1');
      expect(result[3]).assertEqual(c'e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1600
     * @tc.name testStringGetValueArrayChars016
     * @tc.desc Verify getValueArrayChars on new String constructor object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'A');
      expect(result[4]).assertEqual(c'S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1700
     * @tc.name testStringGetValueArrayChars017
     * @tc.desc Verify getValueArrayChars on empty new String constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String();
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(0);
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1800
     * @tc.name testStringGetValueArrayChars018
     * @tc.desc Verify getValueArrayChars on whitespace-only string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "   ";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(c' ');
      expect(result[2]).assertEqual(c' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1900
     * @tc.name testStringGetValueArrayChars019
     * @tc.desc Verify returned array elements match original string characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "abc";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('a,b,c');
      expect(result[0]).assertEqual(c'a');
      expect(result[1]).assertEqual(c'b');
      expect(result[2]).assertEqual(c'c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2000
     * @tc.name testStringGetValueArrayChars020
     * @tc.desc Verify returned array elements order matches string order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars();
      expect(result[0]).assertEqual(c'A');
      expect(result[1]).assertEqual(c'r');
      expect(result[2]).assertEqual(c'k');
      expect(result[3]).assertEqual(c'T');
      expect(result[4]).assertEqual(c'S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2100
     * @tc.name testStringGetValueArrayChars021
     * @tc.desc Verify single character string returns single element ValueArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "X";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(c'X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2200
     * @tc.name testStringGetValueArrayChars022
     * @tc.desc Verify same string multiple calls return consistent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result1 = text.getValueArrayChars();
      let result2 = text.getValueArrayChars();
      expect(result1.length).assertEqual(5);
      expect(result2.length).assertEqual(5);
      expect(result1[0]).assertEqual(result2[0]);
      expect(result1[4]).assertEqual(result2[4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2300
     * @tc.name testStringGetValueArrayChars023
     * @tc.desc Verify array elements are char type assignable to char variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "A";
      let result = text.getValueArrayChars();
      let ch: char = result[0];
      expect(ch).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2400
     * @tc.name testStringGetValueArrayChars024
     * @tc.desc Verify original string remains unchanged after extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars();
      expect(text.length).assertEqual(5);
      expect(text).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2500
     * @tc.name testStringGetValueArrayChars025
     * @tc.desc Verify first and last elements match string first and last characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "Hello";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'H');
      expect(result[result.length - 1]).assertEqual(c'o');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2600
     * @tc.name testStringGetValueArrayChars026
     * @tc.desc Verify valid string call does not throw any Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      try {
        let result = text.getValueArrayChars();
        expect(result.length).assertEqual(5);
        expect(result[0]).assertEqual(c'A');
      } catch (error) {
        expect().assertFail();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2700
     * @tc.name testStringGetValueArrayChars027
     * @tc.desc Verify getValueArrayChars is synchronous returning non-Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2800
     * @tc.name testStringGetValueArrayChars028
     * @tc.desc Verify synchronous method return value cannot be awaited
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2900
     * @tc.name testStringGetValueArrayChars029
     * @tc.desc Verify multiple concurrent calls return independent ValueArray instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result1 = text.getValueArrayChars();
      let result2 = text.getValueArrayChars();
      let result3 = text.getValueArrayChars();
      expect(result1.length).assertEqual(5);
      expect(result2.length).assertEqual(5);
      expect(result3.length).assertEqual(5);
      expect(result1[0]).assertEqual(c'A');
      expect(result2[0]).assertEqual(c'A');
      expect(result3[0]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3000
     * @tc.name testStringGetValueArrayChars030
     * @tc.desc Verify loop calls do not cause memory leak or exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      for (let i = 0; i < 100; i++) {
        let result = text.getValueArrayChars();
        expect(result.length).assertEqual(5);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3100
     * @tc.name testStringGetValueArrayChars031
     * @tc.desc Verify getValueArrayChars on numeric digit string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "12345";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'1');
      expect(result[4]).assertEqual(c'5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3200
     * @tc.name testStringGetValueArrayChars032
     * @tc.desc Verify getValueArrayChars on repeated same character string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "aaaaa";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'a');
      expect(result[4]).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3300
     * @tc.name testStringGetValueArrayChars033
     * @tc.desc Verify getValueArrayChars on string with double quotes and backslash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "a\"b\\c";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[1]).assertEqual(c'"');
      expect(result[3]).assertEqual(c'\\');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3400
     * @tc.name testStringGetValueArrayChars034
     * @tc.desc Verify getValueArrayChars on string with control characters form feed and vertical tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "a\fb\vc";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[1]).assertEqual(c'\u000C');
      expect(result[3]).assertEqual(c'\u000B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3500
     * @tc.name testStringGetValueArrayChars035
     * @tc.desc Verify getValueArrayChars on string containing commas with correct element extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "a,b,c";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'a');
      expect(result[1]).assertEqual(c',');
      expect(result[3]).assertEqual(c',');
      expect(result[4]).assertEqual(c'c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3600
     * @tc.name testStringGetValueArrayChars036
     * @tc.desc Verify getValueArrayChars on URL string in business scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "https://example.com";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(19);
      expect(result[0]).assertEqual(c'h');
      expect(result[8]).assertEqual(c'e');
      expect(result[18]).assertEqual(c'm');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3700
     * @tc.name testStringGetValueArrayChars037
     * @tc.desc Verify getValueArrayChars on trailing whitespace string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "hello  ";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(c'h');
      expect(result[5]).assertEqual(c' ');
      expect(result[6]).assertEqual(c' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3800
     * @tc.name testStringGetValueArrayChars038
     * @tc.desc Verify getValueArrayChars on mixed alphanumeric letters and digits string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "abc123";
      let result = text.getValueArrayChars();
      expect(result.length).assertEqual(6);
      expect(result[0]).assertEqual(c'a');
      expect(result[3]).assertEqual(c'1');
      expect(result[5]).assertEqual(c'3');
    });

  })
}
