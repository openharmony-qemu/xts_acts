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

export default function StringContentEqualsTest(): void {
  describe('StringContentEqualsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_0100
     * @tc.name testContentEquals001
     * @tc.desc Verify contentEquals() with StringBuilder of identical content returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: boolean = text.contentEquals(new StringBuilder("ArkTS"));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_0200
     * @tc.name testContentEquals002
     * @tc.desc Verify contentEquals() with different content returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: boolean = text.contentEquals(new StringBuilder("Other"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_0300
     * @tc.name testContentEquals003
     * @tc.desc Verify contentEquals() with two empty content returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: boolean = text.contentEquals(new StringBuilder(""));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_0400
     * @tc.name testContentEquals004
     * @tc.desc Verify contentEquals() is case-sensitive returning false for different case
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: boolean = text.contentEquals(new StringBuilder("arkts"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_0500
     * @tc.name testContentEquals005
     * @tc.desc Verify contentEquals() with CJK Unicode BMP characters returns true for match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let result: boolean = text.contentEquals(new StringBuilder("中文测试"));
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_0600
     * @tc.name testContentEquals006
     * @tc.desc Verify contentEquals() with different lengths returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let result: boolean = text.contentEquals(new StringBuilder("ABC"));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_0700
     * @tc.name testContentEquals007
     * @tc.desc Verify contentEquals() with dynamic variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("GitHub");
      let sb: StringBuilder = new StringBuilder("GitHub");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_0800
     * @tc.name testContentEquals008
     * @tc.desc Verify contentEquals() returns false for different content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let sb: StringBuilder = new StringBuilder("JavaScript");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_0900
     * @tc.name testContentEquals009
     * @tc.desc Verify contentEquals() returns false for different length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("OpenHarmony");
      let sb: StringBuilder = new StringBuilder("Open");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_1000
     * @tc.name testContentEquals010
     * @tc.desc Verify contentEquals() with emoji surrogate pair content returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\uD83D\uDE00B");
      let sb: StringBuilder = new StringBuilder("A\uD83D\uDE00B");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_1100
     * @tc.name testContentEquals011
     * @tc.desc Verify contentEquals() detects zero-width character difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let sb: StringBuilder = new StringBuilder("Ark\u200BTS");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_1200
     * @tc.name testContentEquals012
     * @tc.desc Verify contentEquals() with embedded NUL character returns true for exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B");
      let sb: StringBuilder = new StringBuilder("A\0B");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_1300
     * @tc.name testContentEquals013
     * @tc.desc Verify contentEquals() with mixed character sets returns true for exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u4E2D\u0391\u0627\u05D0");
      let sb: StringBuilder = new StringBuilder("A\u4E2D\u0391\u0627\u05D0");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_1400
     * @tc.name testContentEquals014
     * @tc.desc Verify contentEquals() returns false for same prefix with different suffix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("prefix-value-A");
      let sb: StringBuilder = new StringBuilder("prefix-value-B");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_1500
     * @tc.name testContentEquals015
     * @tc.desc Verify contentEquals() with newline content returns true for exact match
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("line1\nline2");
      let sb: StringBuilder = new StringBuilder("line1\nline2");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_1600
     * @tc.name testContentEquals016
     * @tc.desc Verify contentEquals() with ISO 8859-1 Latin-1 accented content returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Caf\u00E9");
      let sb: StringBuilder = new StringBuilder("Caf\u00E9");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS_1700
     * @tc.name testContentEquals017
     * @tc.desc Verify contentEquals() detects missing Latin-1 accent difference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testContentEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Cafe");
      let sb: StringBuilder = new StringBuilder("Caf\u00E9");
      let result: boolean = text.contentEquals(sb);
      expect(result).assertFalse();
    });
  });
}
