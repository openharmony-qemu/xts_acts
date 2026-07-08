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

export default function StringSliceTest(): void {
  describe('StringSliceTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_0100
     * @tc.name testSlice001
     * @tc.desc Verify slice() extracts from start to end index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("HelloWorld");
      let result: string = text.slice(0, 5);
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_0200
     * @tc.name testSlice002
     * @tc.desc Verify slice() with negative start extracts from end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS-Static");
      let result: string = text.slice(-6);
      expect(result).assertEqual("Static");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_0300
     * @tc.name testSlice003
     * @tc.desc Verify slice() with negative end excludes from end of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let result: string = text.slice(0, -2);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_0400
     * @tc.name testSlice004
     * @tc.desc Verify slice() without arguments returns full string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.slice();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_0500
     * @tc.name testSlice005
     * @tc.desc Verify slice() with start >= end returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      let result: string = text.slice(3, 1);
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_0600
     * @tc.name testSlice006
     * @tc.desc Verify slice() with only start index extracts to end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.slice(3);
      expect(result).assertEqual("TS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_0700
     * @tc.name testSlice007
     * @tc.desc Verify slice() with both negative indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEF");
      let result: string = text.slice(-4, -1);
      expect(result).assertEqual("CDE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_0800
     * @tc.name testSlice008
     * @tc.desc Verify slice() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好世界AB");
      let result: string = text.slice(0, 4);
      expect(result).assertEqual("你好世界");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_0900
     * @tc.name testSlice009
     * @tc.desc Verify slice() with emoji content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A😀B");
      let result: string = text.slice(1, 3);
      expect(result).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1000
     * @tc.name testSlice010
     * @tc.desc Verify slice() with start beyond length returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.slice(10);
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1100
     * @tc.name testSlice011
     * @tc.desc Verify slice() with large negative start treats as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC");
      let result: string = text.slice(-100);
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1200
     * @tc.name testSlice012
     * @tc.desc Verify slice() on GBK Chinese text extracts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试文本");
      let result: string = text.slice(2, 4);
      expect(result).assertEqual("测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1300
     * @tc.name testSlice013
     * @tc.desc Verify slice() with C0 control characters extracts correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\nb\tc");
      let result: string = text.slice(1, 4);
      expect(result).assertEqual("\nb\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1400
     * @tc.name testSlice014
     * @tc.desc Verify slice() with dynamic start and end variables
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let start: int = 4;
      let end: int = 10;
      let result: string = text.slice(start, end);
      expect(result).assertEqual("Script");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1500
     * @tc.name testSlice015
     * @tc.desc Verify slice() with indexOf to extract username and domain from email
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const email = new String("user@example.com");
      let atIdx: int = email.indexOf("@");
      let username: string = email.slice(0, atIdx);
      let domain: string = email.slice(atIdx + 1);
      expect(username).assertEqual("user");
      expect(domain).assertEqual("example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1600
     * @tc.name testSlice016
     * @tc.desc Verify slice() with negative start extracts from end, unlike substring which treats as 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let sliced: string = text.slice(-5);
      let subStr: string = text.substring(-5);
      expect(sliced).assertEqual("World");
      expect(subStr).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1700
     * @tc.name testSlice017
     * @tc.desc Verify slice() returns empty when start > end, while substring swaps them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let sliced: string = text.slice(4, 2);
      let subStr: string = text.substring(4, 2);
      expect(sliced).assertEqual("");
      expect(subStr).assertEqual("ll");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1800
     * @tc.name testSlice018
     * @tc.desc Verify slice() chained with repeat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let part: string = text.slice(0, 2);
      const text1 = new String(part);
      let repeated: string = text1.repeat(3);
      expect(repeated).assertEqual("ababab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_1900
     * @tc.name testSlice019
     * @tc.desc Verify slice() chained with toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello world");
      let word: string = text.slice(0, 5);
      const text2 = new String(word);
      let upper: String = text2.toUpperCase();
      expect(upper.toString()).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2000
     * @tc.name testSlice020
     * @tc.desc Verify slice() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello World");
      let result: string = text.slice(0, 5);
      expect(text.toString()).assertEqual("Hello World");
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2100
     * @tc.name testSlice021
     * @tc.desc Verify slice() returns empty string when start equals string length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let r1: string = text.slice(5);
      let r2: string = text.slice(5, 10);
      expect(r1).assertEqual("");
      expect(r2).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2200
     * @tc.name testSlice022
     * @tc.desc Verify slice() extracts zero-width space from mixed string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: string = text.slice(1, 2);
      expect(result).assertEqual("\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2300
     * @tc.name testSlice023
     * @tc.desc Verify slice() extracts date month segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: string = text.slice(5, 7);
      expect(result).assertEqual("03");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2400
     * @tc.name testSlice024
     * @tc.desc Verify slice() extracts Unicode escape CJK suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ID-\u4E2D\u6587");
      let result: string = text.slice(3);
      expect(result).assertEqual("\u4E2D\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2500
     * @tc.name testSlice025
     * @tc.desc Verify slice() extracts replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\uFFFDB");
      let result: string = text.slice(1, 2);
      expect(result).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2600
     * @tc.name testSlice026
     * @tc.desc Verify slice() extracts fullwidth dash between fields
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u2014B");
      let result: string = text.slice(1, 2);
      expect(result).assertEqual("\u2014");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2700
     * @tc.name testSlice027
     * @tc.desc Verify slice() extracts email domain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("test@example.com");
      let atIndex: int = text.indexOf("@");
      let result: string = text.slice(atIndex + 1);
      expect(result).assertEqual("example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2800
     * @tc.name testSlice028
     * @tc.desc Verify slice() extracts masked bank card tail
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("622202********1234");
      let result: string = text.slice(-4);
      expect(result).assertEqual("1234");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_2900
     * @tc.name testSlice029
     * @tc.desc Verify slice() extracts CRLF pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\r\nB");
      let result: string = text.slice(1, 3);
      expect(result).assertEqual("\r\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_3000
     * @tc.name testSlice030
     * @tc.desc Verify slice() extracts Arabic text segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X\u0627\u0628Y");
      let result: string = text.slice(1, 3);
      expect(result).assertEqual("\u0627\u0628");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_3100
     * @tc.name testSlice031
     * @tc.desc Verify Slice handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.slice(0, 10);
      expect(result).assertEqual("!@#$%^&*()");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SLICE_3200
     * @tc.name testSlice032
     * @tc.desc Verify Slice handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSlice032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.slice(0, 3);
      expect(result).assertEqual("テスト");
    });
  });
}
