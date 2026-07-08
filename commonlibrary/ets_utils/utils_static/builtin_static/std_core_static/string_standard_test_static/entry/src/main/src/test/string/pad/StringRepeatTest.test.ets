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

export default function StringRepeatTest(): void {
  describe('StringRepeatTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_0100
     * @tc.name testRepeat001
     * @tc.desc Verify repeat(3) on single ASCII char returns 3 copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.repeat(3);
      expect(result).assertEqual("AAA");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_0200
     * @tc.name testRepeat002
     * @tc.desc Verify repeat(0) returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      let result: string = text.repeat(0);
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_0300
     * @tc.name testRepeat003
     * @tc.desc Verify repeat(1) returns the original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.repeat(1);
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_0400
     * @tc.name testRepeat004
     * @tc.desc Verify repeat(3) on multi-char ASCII string repeats correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let result: string = text.repeat(3);
      expect(result).assertEqual("ababab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_0500
     * @tc.name testRepeat005
     * @tc.desc Verify repeat(3) on emoji string produces correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: string = text.repeat(3);
      expect(result).assertEqual("😀😀😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_0600
     * @tc.name testRepeat006
     * @tc.desc Verify repeat(100) produces correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("x");
      let result: string = text.repeat(100);
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_0700
     * @tc.name testRepeat007
     * @tc.desc Verify repeat(5) on empty string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: string = text.repeat(5);
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_0800
     * @tc.name testRepeat008
     * @tc.desc Verify repeat(3) on CJK Unicode BMP characters preserves content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let result: string = text.repeat(3);
      expect(result).assertEqual("中文中文中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_0900
     * @tc.name testRepeat009
     * @tc.desc Verify repeat(2) on ISO 8859-1 Latin character preserves accent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: string = text.repeat(2);
      expect(result).assertEqual("éé");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1000
     * @tc.name testRepeat010
     * @tc.desc Verify repeat(2) on GBK Chinese text repeats correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("测试");
      let result: string = text.repeat(2);
      expect(result).assertEqual("测试测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1100
     * @tc.name testRepeat011
     * @tc.desc Verify repeat() with C0 control newline character repeats correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n");
      let result: string = text.repeat(3);
      expect(result).assertEqual("\n\n\n");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1200
     * @tc.name testRepeat012
     * @tc.desc Verify repeat() with negative count throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A");
      try {
        let result: string = text.repeat(-1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1300
     * @tc.name testRepeat013
     * @tc.desc Verify repeat() with dynamic count variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Go");
      let count: int = 2;
      let result: string = text.repeat(count);
      expect(result).assertEqual("GoGo");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1400
     * @tc.name testRepeat014
     * @tc.desc Verify repeat() combined with toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let result: string = text.repeat(3).toUpperCase().toString();
      expect(result).assertEqual("ABABAB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1500
     * @tc.name testRepeat015
     * @tc.desc Verify repeat() then slice() to get portion of repeated pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let repeated: string = text.repeat(5);
      let sliced: string = repeated.slice(2, 6);
      expect(sliced).assertEqual("abab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1600
     * @tc.name testRepeat016
     * @tc.desc Verify repeat() for separator line pattern
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("-");
      let line: string = text.repeat(10);
      expect(line).assertEqual("----------");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1700
     * @tc.name testRepeat017
     * @tc.desc Verify repeat() with multi-character input has length count times original length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Result length must exactly equal count * original length
      const text = new String("ABC");
      let count: int = 5;
      let result: string = text.repeat(count);
      expect(result.length).assertEqual(text.length * count);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1800
     * @tc.name testRepeat018
     * @tc.desc Verify repeat() does not modify original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.repeat(3);
      expect(text.toString()).assertEqual("AB");
      expect(result).assertEqual("ABABAB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_1900
     * @tc.name testRepeat019
     * @tc.desc Verify includes() finds substring in repeated result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let repeated: string = text.repeat(3);
      let inc: boolean = repeated.includes("bcab");
      expect(inc).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2000
     * @tc.name testRepeat020
     * @tc.desc Verify endsWith() on repeated result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let repeated: string = text.repeat(4);
      let ends: boolean = repeated.endsWith("ab");
      expect(ends).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2100
     * @tc.name testRepeat021
     * @tc.desc Verify startsWith() on repeated result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let repeated: string = text.repeat(4);
      expect(repeated.startsWith("ab")).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2200
     * @tc.name testRepeat022
     * @tc.desc Verify repeat() chained with toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: string = text.repeat(3).toLowerCase();
      expect(result).assertEqual("ababab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2300
     * @tc.name testRepeat023
     * @tc.desc Verify repeat() chained with replace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let repeated: string = text.repeat(3);
      let result: string = repeated.replace("b", "B");
      expect(result).assertEqual("aBabab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2400
     * @tc.name testRepeat024
     * @tc.desc Verify repeat() twice gives same as repeat with combined count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let r2: String = text.repeat(2);
      let r3: String = r2.repeat(3);
      let r6: String = text.repeat(6);
      expect(r3.toString()).assertEqual(r6.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2500
     * @tc.name testRepeat025
     * @tc.desc Verify repeat() combined with padStart for alignment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ab");
      let repeated: String = text.repeat(2);
      let padded: string = repeated.padStart(6, "x");
      expect(padded).assertEqual("xxabab");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2600
     * @tc.name testRepeat026
     * @tc.desc Verify repeat() on empty string returns empty regardless of count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      expect(text.repeat(0)).assertEqual("");
      expect(text.repeat(5)).assertEqual("");
      expect(text.repeat(100)).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2700
     * @tc.name testRepeat027
     * @tc.desc Verify repeat() with count 1 returns same content as original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("hello");
      let result: string = text.repeat(1);
      expect(result).assertEqual("hello");
      expect(result.length).assertEqual(text.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2800
     * @tc.name testRepeat028
     * @tc.desc Verify repeat() result charAt access across repeated boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let repeated: string = text.repeat(2);
      expect(repeated.charAt(0)).assertEqual(c'a');
      expect(repeated.charAt(3)).assertEqual(c'a');
      expect(repeated.charAt(5)).assertEqual(c'c');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_2900
     * @tc.name testRepeat029
     * @tc.desc Verify repeat() indexOf across repeated boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      let repeated: string = text.repeat(3);
      expect(repeated.indexOf("abc")).assertEqual(0);
      expect(repeated.indexOf("abc", 1)).assertEqual(3);
      expect(repeated.indexOf("abc", 4)).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_3000
     * @tc.name testRepeat030
     * @tc.desc Verify repeat() returns "" for count 0 and "xxx" for count 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("x");
      let r0: string = text.repeat(0);
      let r3: string = text.repeat(3);
      expect(r0).assertEqual("");
      expect(r3).assertEqual("xxx");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_3100
     * @tc.name testRepeat031
     * @tc.desc Verify repeat() handles illegal UTF-8 sequence spelling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("\\xe4\\x3f\\xad");
      let result: string = source.repeat(1);
      expect(result).assertEqual("\\xe4\\x3f\\xad");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_3200
     * @tc.name testRepeat032
     * @tc.desc Verify Repeat handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string =
        "!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26";
      const source = new String(expected);
      let result: string = source.repeat(1);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_REPEAT_3300
     * @tc.name testRepeat033
     * @tc.desc Verify Repeat handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRepeat033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const expected: string = "テスト 테스트 Test 測試 АБВГД الاختبار";
      const source = new String(expected);
      let result: string = source.repeat(1);
      expect(result).assertEqual(expected);
    });
  });
}
