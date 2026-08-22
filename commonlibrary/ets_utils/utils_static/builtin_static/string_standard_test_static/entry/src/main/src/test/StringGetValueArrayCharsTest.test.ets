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


export default function StringGetValueArrayCharsTest():void {
  describe('StringGetValueArrayCharsTest', (): void => {
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0100
     * @tc.name testStringGetValueArrayChars001
     * @tc.desc Verify getValueArrayChars with required parameters begin and end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars(0, 3);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('A,r,k');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0200
     * @tc.name testStringGetValueArrayChars002
     * @tc.desc Verify getValueArrayChars extracts middle substring with correct elements and order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars(1, 4);
      expect(result.length).assertEqual(3);
      expect(result.toString()).assertEqual('r,k,T');
      expect(result[0]).assertEqual(c'r');
      expect(result[1]).assertEqual(c'k');
      expect(result[2]).assertEqual(c'T');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0300
     * @tc.name testStringGetValueArrayChars003
     * @tc.desc Verify getValueArrayChars extracts entire string from begin zero to length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars(0, text.length);
      expect(result.length).assertEqual(5);
      expect(result[2]).assertEqual(c'k');
      expect(result[4]).assertEqual(c'S');
      expect(result.toString()).assertEqual('A,r,k,T,S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0400
     * @tc.name testStringGetValueArrayChars004
     * @tc.desc Verify extracting first character with begin zero and end one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars(0, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0500
     * @tc.name testStringGetValueArrayChars005
     * @tc.desc Verify begin and end parameters accept hexadecimal octal and binary number formats
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let resultHex = text.getValueArrayChars(0x1, 0x3);
      expect(resultHex.length).assertEqual(2);
      expect(resultHex.toString()).assertEqual('r,k');

      let resultOct = text.getValueArrayChars(0o3, 0o5);
      expect(resultOct.length).assertEqual(2);
      expect(resultOct.toString()).assertEqual('T,S');

      let resultBin = text.getValueArrayChars(0b10, 0b101);
      expect(resultBin.length).assertEqual(3);
      expect(resultBin.toString()).assertEqual('k,T,S');

      let resultEndHex = text.getValueArrayChars(0, 0x3);
      expect(resultEndHex.length).assertEqual(3);
      expect(resultEndHex.toString()).assertEqual('A,r,k');

      let resultEndOct = text.getValueArrayChars(0, 0o5);
      expect(resultEndOct.length).assertEqual(5);
      expect(resultEndOct.toString()).assertEqual('A,r,k,T,S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0600
     * @tc.name testStringGetValueArrayChars006
     * @tc.desc Verify begin equals end at various positions returns empty ValueArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";

      let result1 = text.getValueArrayChars(0, 0);
      expect(result1.length).assertEqual(0);
      expect(result1.toString()).assertEqual('');

      let result2 = text.getValueArrayChars(2, 2);
      expect(result2.length).assertEqual(0);
      expect(result2.toString()).assertEqual('');

      let result3 = text.getValueArrayChars(5, 5);
      expect(result3.length).assertEqual(0);
      expect(result3.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0700
     * @tc.name testStringGetValueArrayChars007
     * @tc.desc Verify negative begin or end values throw StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";

      try {
        text.getValueArrayChars(-2147483648, 0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }

      try {
        text.getValueArrayChars(-1, 3);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }

      try {
        text.getValueArrayChars(0, -1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }

      try {
        text.getValueArrayChars(-2, -1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0800
     * @tc.name testStringGetValueArrayChars008
     * @tc.desc Verify begin or end exceeding string length throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";

      try {
        text.getValueArrayChars(2147483647, 2147483647);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }

      try {
        text.getValueArrayChars(10, 15);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }

      try {
        text.getValueArrayChars(0, 2147483647);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }

      try {
        text.getValueArrayChars(0, 100);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_0900
     * @tc.name testStringGetValueArrayChars009
     * @tc.desc Verify begin greater than end throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      try {
        text.getValueArrayChars(3, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1000
     * @tc.name testStringGetValueArrayChars010
     * @tc.desc Verify Chinese string extraction with multi-byte characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "中文测试";
      let result = text.getValueArrayChars(1, 3);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(c'文');
      expect(result[1]).assertEqual(c'测');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1100
     * @tc.name testStringGetValueArrayChars011
     * @tc.desc Verify mixed language string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "Test测试テスト테스트";
      let result = text.getValueArrayChars(0, 5);
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1200
     * @tc.name testStringGetValueArrayChars012
     * @tc.desc Verify emoji string extraction with surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "😀🔥";
      let result = text.getValueArrayChars(0, 1);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1300
     * @tc.name testStringGetValueArrayChars013
     * @tc.desc Verify escape characters string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "test\n\t\r";
      let result = text.getValueArrayChars(0, 5);
      expect(result.length).assertEqual(5);
      expect(result[4]).assertEqual(c'\n');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1400
     * @tc.name testStringGetValueArrayChars014
     * @tc.desc Verify special symbols string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "!@#$%^&*()";
      let result = text.getValueArrayChars(0, 5);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1500
     * @tc.name testStringGetValueArrayChars015
     * @tc.desc Verify script tag string extraction without execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "<script>alert(1)</script>";
      let result = text.getValueArrayChars(0, 7);
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(c'<');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1600
     * @tc.name testStringGetValueArrayChars016
     * @tc.desc Verify Unicode boundary characters string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "\u0000\uFFFF";
      let result = text.getValueArrayChars(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(c'\u0000');
      expect(result[1]).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1700
     * @tc.name testStringGetValueArrayChars017
     * @tc.desc Verify zero-width space string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "test\u200B";
      let result = text.getValueArrayChars(4, 5);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(c'\u200B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1800
     * @tc.name testStringGetValueArrayChars018
     * @tc.desc Verify long string of 10000 characters extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = "a".repeat(10000);
      let result = text.getValueArrayChars(5000, 6000);
      expect(result.length).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_1900
     * @tc.name testStringGetValueArrayChars019
     * @tc.desc Verify 65535 characters string boundary extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let text = "a".repeat(65535);
      let result = text.getValueArrayChars(0, 65535);
      expect(result.length).assertEqual(65535);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2000
     * @tc.name testStringGetValueArrayChars020
     * @tc.desc Verify new String constructor object extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result = text.getValueArrayChars(0, 3);
      expect(result.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2100
     * @tc.name testStringGetValueArrayChars021
     * @tc.desc Verify returned array elements order matches original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "abcdef";
      let result = text.getValueArrayChars(2, 5);
      expect(result[0]).assertEqual(c'c');
      expect(result[1]).assertEqual(c'd');
      expect(result[2]).assertEqual(c'e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2200
     * @tc.name testStringGetValueArrayChars022
     * @tc.desc Verify array elements are char type assignable to char variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "A";
      let result = text.getValueArrayChars(0, 1);
      let ch: char = result[0];
      expect(ch).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2300
     * @tc.name testStringGetValueArrayChars023
     * @tc.desc Verify multiple concurrent calls return independent ValueArray instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result1 = text.getValueArrayChars(0, 3);
      let result2 = text.getValueArrayChars(2, 5);
      let result3 = text.getValueArrayChars(0, 5);
      expect(result1.length).assertEqual(3);
      expect(result2.length).assertEqual(3);
      expect(result3.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2400
     * @tc.name testStringGetValueArrayChars024
     * @tc.desc Verify empty string extraction returns empty ValueArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "";
      let result = text.getValueArrayChars(0, 0);
      expect(result.length).assertEqual(0);
      expect(result.toString()).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2500
     * @tc.name testStringGetValueArrayChars025
     * @tc.desc Verify extracting last character with begin equals length minus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars(text.length - 1, text.length);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(c'S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2600
     * @tc.name testStringGetValueArrayChars026
     * @tc.desc Verify numeric digit string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "12345";
      let result = text.getValueArrayChars(1, 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(c'2');
      expect(result[2]).assertEqual(c'4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2700
     * @tc.name testStringGetValueArrayChars027
     * @tc.desc Verify whitespace-only string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "   ";
      let result = text.getValueArrayChars(0, 3);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(c' ');
      expect(result[2]).assertEqual(c' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2800
     * @tc.name testStringGetValueArrayChars028
     * @tc.desc Verify original string remains unchanged after extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars(0, 3);
      expect(text.length).assertEqual(5);
      expect(text).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_2900
     * @tc.name testStringGetValueArrayChars029
     * @tc.desc Verify repeated same character string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "aaaaa";
      let result = text.getValueArrayChars(1, 4);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(c'a');
      expect(result[2]).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3000
     * @tc.name testStringGetValueArrayChars030
     * @tc.desc Verify extracting single character from middle position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars(2, 3);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(c'k');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3100
     * @tc.name testStringGetValueArrayChars031
     * @tc.desc Verify minimal two character extraction from begin zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars(0, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(c'A');
      expect(result[1]).assertEqual(c'r');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3200
     * @tc.name testStringGetValueArrayChars032
     * @tc.desc Verify string with double quotes and backslash extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "a\"b\\c";
      let result = text.getValueArrayChars(0, 5);
      expect(result.length).assertEqual(5);
      expect(result[1]).assertEqual(c'"');
      expect(result[3]).assertEqual(c'\\');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3300
     * @tc.name testStringGetValueArrayChars033
     * @tc.desc Verify overlapping intervals return correct and independent results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result1 = text.getValueArrayChars(0, 3);
      let result2 = text.getValueArrayChars(2, 5);
      expect(result1.length).assertEqual(3);
      expect(result2.length).assertEqual(3);
      expect(result1[2]).assertEqual(c'k');
      expect(result2[0]).assertEqual(c'k');
      expect(result1[0]).assertEqual(c'A');
      expect(result2[2]).assertEqual(c'S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3400
     * @tc.name testStringGetValueArrayChars034
     * @tc.desc Verify result length equals end minus begin across multiple intervals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "abcdef";
      let r1 = text.getValueArrayChars(0, 2);
      expect(r1.length).assertEqual(2);
      let r2 = text.getValueArrayChars(1, 5);
      expect(r2.length).assertEqual(4);
      let r3 = text.getValueArrayChars(3, 3);
      expect(r3.length).assertEqual(0);
      let r4 = text.getValueArrayChars(0, 6);
      expect(r4.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3500
     * @tc.name testStringGetValueArrayChars035
     * @tc.desc Verify URL string extraction in business scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "https://example.com";
      let result = text.getValueArrayChars(8, 15);
      expect(result.length).assertEqual(7);
      expect(result[0]).assertEqual(c'e');
      expect(result[6]).assertEqual(c'e');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3600
     * @tc.name testStringGetValueArrayChars036
     * @tc.desc Verify trailing whitespace string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "hello  ";
      let result = text.getValueArrayChars(5, 7);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(c' ');
      expect(result[1]).assertEqual(c' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3700
     * @tc.name testStringGetValueArrayChars037
     * @tc.desc Verify extracting last two characters from string end boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "ArkTS";
      let result = text.getValueArrayChars(text.length - 2, text.length);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(c'T');
      expect(result[1]).assertEqual(c'S');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3800
     * @tc.name testStringGetValueArrayChars038
     * @tc.desc Verify mixed alphanumeric letters and digits string extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "abc123";
      let result = text.getValueArrayChars(3, 6);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(c'1');
      expect(result[2]).assertEqual(c'3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_3900
     * @tc.name testStringGetValueArrayChars039
     * @tc.desc Verify control characters form feed and vertical tab extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "a\fb\vc";
      let result = text.getValueArrayChars(0, 5);
      expect(result.length).assertEqual(5);
      expect(result[1]).assertEqual(c'\u000C');
      expect(result[3]).assertEqual(c'\u000B');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_4000
     * @tc.name testStringGetValueArrayChars040
     * @tc.desc Verify string containing commas with correct element extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "a,b,c";
      let result = text.getValueArrayChars(0, 5);
      expect(result.length).assertEqual(5);
      expect(result[0]).assertEqual(c'a');
      expect(result[1]).assertEqual(c',');
      expect(result[3]).assertEqual(c',');
      expect(result[4]).assertEqual(c'c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETVALUE1CHAR_4100
     * @tc.name testStringGetValueArrayChars041
     * @tc.desc Verify empty string with end exceeding length throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testStringGetValueArrayChars041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = "";
      try {
        text.getValueArrayChars(0, 1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('StringIndexOutOfBoundsError');
      }
    });

  })
}
