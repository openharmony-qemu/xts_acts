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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../../Util.test';

export default function StringGetBytesTest(): void {
  describe('StringGetBytesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0100
     * @tc.name testGetBytes001
     * @tc.desc Verify getBytes(0, length) on 5 ASCII chars returns expected bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(5);
      expect(bytes[0]).assertEqual(65);
      expect(bytes[4]).assertEqual(83);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0200
     * @tc.name testGetBytes002
     * @tc.desc Verify getBytes(0, 0) on empty string returns empty byte array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let bytes: byte[] = text.getBytes(0, 0);
      expect(bytes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0300
     * @tc.name testGetBytes003
     * @tc.desc Verify getBytes(0, length) on 2 CJK chars returns byte count equal to code unit count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0400
     * @tc.name testGetBytes004
     * @tc.desc Verify getBytes(0, 2) partial range on "ABCD" returns byte values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCD");
      let bytes: byte[] = text.getBytes(0, 2);
      expect(bytes.length).assertEqual(2);
      expect(bytes[0]).assertEqual(65);
      expect(bytes[1]).assertEqual(66);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0500
     * @tc.name testGetBytes005
     * @tc.desc Verify getBytes(0, length) on single ASCII char returns 1 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Z");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0600
     * @tc.name testGetBytes006
     * @tc.desc Verify getBytes(0, length) on emoji returns 2 bytes as surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0700
     * @tc.name testGetBytes007
     * @tc.desc Verify getBytes(0, length) on 3 pure ASCII chars returns exactly 3 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0800
     * @tc.name testGetBytes008
     * @tc.desc Verify getBytes(0, length) on ISO 8859-1 Latin precomposed é returns 1 byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_0900
     * @tc.name testGetBytes009
     * @tc.desc Verify getBytes(0, length) mixed ASCII plus CJK plus emoji returns 4 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A中😀");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1000
     * @tc.name testGetBytes010
     * @tc.desc Verify getBytes(0, length) on C0 newline and tab returns byte values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n\t");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
      expect(bytes[0]).assertEqual(10);
      expect(bytes[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1100
     * @tc.name testGetBytes011
     * @tc.desc Verify getBytes(0, length) on GBK Chinese text returns 2 bytes for 2 chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1200
     * @tc.name testGetBytes012
     * @tc.desc Verify getBytes(0, length) on combining character sequence returns 2 bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1300
     * @tc.name testGetBytes013
     * @tc.desc Verify getBytes(2, 2) on non-empty string returns empty byte array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let bytes: byte[] = text.getBytes(2, 2);
      expect(bytes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1400
     * @tc.name testGetBytes014
     * @tc.desc Verify getBytes(0, length) with dynamic variables returns correct byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Node");
      let start: int = 0;
      let end: int = text.length;
      let bytes: byte[] = text.getBytes(start, end);
      expect(bytes.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1500
     * @tc.name testGetBytes015
     * @tc.desc Verify getBytes() with negative begin throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      try {
        let bytes: byte[] = text.getBytes(-1, 2);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1600
     * @tc.name testGetBytes016
     * @tc.desc Verify getBytes() with end beyond length throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      try {
        let bytes: byte[] = text.getBytes(0, 5);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1700
     * @tc.name testGetBytes017
     * @tc.desc Verify getBytes() with begin greater than end throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      try {
        let bytes: byte[] = text.getBytes(4, 2);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1800
     * @tc.name testGetBytes018
     * @tc.desc Verify getBytes(1, length) returns expected bytes after first ASCII character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let bytes: byte[] = text.getBytes(1, text.length);
      expect(bytes.length).assertEqual(4);
      expect(bytes[0]).assertEqual(114);
      expect(bytes[3]).assertEqual(83);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_1900
     * @tc.name testGetBytes019
     * @tc.desc Verify getBytes(length, length) returns empty array at end boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let bytes: byte[] = text.getBytes(text.length, text.length);
      expect(bytes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2000
     * @tc.name testGetBytes020
     * @tc.desc Verify getBytes() preserves selected embedded C0 NUL byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B");
      let bytes: byte[] = text.getBytes(1, 2);
      expect(bytes.length).assertEqual(1);
      expect(bytes[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2100
     * @tc.name testGetBytes021
     * @tc.desc Verify getBytes() range includes C0 control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\n\t");
      let bytes: byte[] = text.getBytes(1, text.length);
      expect(bytes.length).assertEqual(2);
      expect(bytes[0]).assertEqual(10);
      expect(bytes[1]).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2200
     * @tc.name testGetBytes022
     * @tc.desc Verify getBytes() returns bytes for hexadecimal-looking ASCII string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0x123");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(5);
      expect(bytes[1]).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2300
     * @tc.name testGetBytes023
     * @tc.desc Verify getBytes() returns bytes for business date string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(10);
      expect(bytes[4]).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2400
     * @tc.name testGetBytes024
     * @tc.desc Verify getBytes() returns bytes for email at sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes[4]).assertEqual(64);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2500
     * @tc.name testGetBytes025
     * @tc.desc Verify getBytes() returns bytes for masked bank card asterisk
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let bytes: byte[] = text.getBytes(6, 10);
      expect(bytes.length).assertEqual(4);
      expect(bytes[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2600
     * @tc.name testGetBytes026
     * @tc.desc Verify getBytes() returns bytes for CRLF pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\r\nB");
      let bytes: byte[] = text.getBytes(1, 3);
      expect(bytes.length).assertEqual(2);
      expect(bytes[0]).assertEqual(13);
      expect(bytes[1]).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2700
     * @tc.name testGetBytes027
     * @tc.desc Verify getBytes() returns byte for literal backslash in escape spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\\u4e2d");
      let bytes: byte[] = text.getBytes(0, 1);
      expect(bytes.length).assertEqual(1);
      expect(bytes[0]).assertEqual(92);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2800
     * @tc.name testGetBytes028
     * @tc.desc Verify getBytes() returns bytes for binary-looking ASCII string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("0b1010");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(6);
      expect(bytes[1]).assertEqual(98);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_2900
     * @tc.name testGetBytes029
     * @tc.desc Verify getBytes() returns bytes for scientific notation token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("123.45e6");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(8);
      expect(bytes[3]).assertEqual(46);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_3000
     * @tc.name testGetBytes030
     * @tc.desc Verify getBytes() returns byte for halfwidth dash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("-");
      let bytes: byte[] = text.getBytes(0, text.length);
      expect(bytes.length).assertEqual(1);
      expect(bytes[0]).assertEqual(45);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_3100
     * @tc.name testGetBytes031
     * @tc.desc Verify getBytes() handles ISO-8859-1 question-mark garbled text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("????");
      let result: byte[] = source.getBytes(0, source.length);
      expect(result.length).assertLarger(0);
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual(63);
      expect(result[3]).assertEqual(63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_3200
     * @tc.name testGetBytes032
     * @tc.desc Verify GetBytes handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: byte[] = source.getBytes(0, source.length);
      expect(result.length).assertEqual(74);
      expect(result[0]).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETBYTES_3300
     * @tc.name testGetBytes033
     * @tc.desc Verify GetBytes handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetBytes033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: byte[] = source.getBytes(0, source.length);
      expect(result.length).assertEqual(source.length);
      expect(result[0]).assertEqual(-58);
    });
  });
}
