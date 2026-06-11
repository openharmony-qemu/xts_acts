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

export default function StringTrimStartTest(): void {
  describe('StringTrimStartTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0100
     * @tc.name testTrimStart001
     * @tc.desc Verify trimStart() removes leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  ArkTS  ");
      let result: string = str.trimStart();
      expect(result).assertEqual("ArkTS  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0200
     * @tc.name testTrimStart002
     * @tc.desc Verify trimStart() removes leading tab and newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t\nArkTS");
      let result: string = str.trimStart();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0300
     * @tc.name testTrimStart003
     * @tc.desc Verify trimStart() removes leading carriage-return and form-feed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\r\fdata");
      let result: string = str.trimStart();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0400
     * @tc.name testTrimStart004
     * @tc.desc Verify trimStart() and trimLeft() produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t ArkTS");
      let r1: string = str.trimStart();
      let r2: string = str.trimLeft();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0500
     * @tc.name testTrimStart005
     * @tc.desc Verify trimStart() does NOT change string when whitespace is only at the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("Hello World");
      let result: string = str.trimStart();
      expect(result).assertEqual("Hello World");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0600
     * @tc.name testTrimStart006
     * @tc.desc Verify trimStart() does NOT change string with no whitespace at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("clean");
      let result: string = str.trimStart();
      expect(result).assertEqual("clean");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0700
     * @tc.name testTrimStart007
     * @tc.desc Verify trimStart() on CJK text with leading whitespace removes only leading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  中文测试");
      let result: string = str.trimStart();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0800
     * @tc.name testTrimStart008
     * @tc.desc Verify trimStart() on GBK text with leading tab removes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t中文测试");
      let result: string = str.trimStart();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_0900
     * @tc.name testTrimStart009
     * @tc.desc Verify trimStart() on emoji text with leading spaces removes only leading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  😀🎉");
      let result: string = str.trimStart();
      expect(result).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1000
     * @tc.name testTrimStart010
     * @tc.desc Verify trimStart() on ISO 8859-1 Latin accented text with leading tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\tcafé");
      let result: string = str.trimStart();
      expect(result).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1100
     * @tc.name testTrimStart011
     * @tc.desc Verify trimStart() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: string = str.trimStart();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1200
     * @tc.name testTrimStart012
     * @tc.desc Verify trimStart() on all-whitespace string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("   \t   ");
      let result: string = str.trimStart();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1300
     * @tc.name testTrimStart013
     * @tc.desc Verify trimStart() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  data");
      let result: string = text.trimStart();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1400
     * @tc.name testTrimStart014
     * @tc.desc Verify trimStart() removes full-width space U+3000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fws: string = String.fromCharCode(0x3000);
      const text = new String(fws + fws + "abc");
      let result: string = text.trimStart();
      expect(result).assertEqual("abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1500
     * @tc.name testTrimStart015
     * @tc.desc Verify trimStart() does not modify the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello");
      let result: string = text.trimStart();
      expect(text.toString()).assertEqual("  hello");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1600
     * @tc.name testTrimStart016
     * @tc.desc Verify trimStart() called twice returns same as once (idempotent)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello");
      let once: string = text.trimStart();
      let once2: string = text.trimStart();
      const text1 = new String(once2);
      let twice: string = text1.trimStart();
      expect(twice).assertEqual(once);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1700
     * @tc.name testTrimStart017
     * @tc.desc Verify trimStart() + trimEnd() equals trim()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let fullTrim: string = text.trim();
      let stepTrim: string = text.trimStart().trimEnd();
      expect(stepTrim).assertEqual(fullTrim);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1800
     * @tc.name testTrimStart018
     * @tc.desc Verify trimStart() chained with toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello");
      let result: string = text.trimStart().toUpperCase().toString();
      expect(result).assertEqual("HELLO");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_1900
     * @tc.name testTrimStart019
     * @tc.desc Verify trimStart() on all-whitespace string returns empty deterministically
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\t \n \r");
      let result: string = text.trimStart();
      expect(result).assertEqual("");
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2000
     * @tc.name testTrimStart020
     * @tc.desc Verify trimStart() with large number of leading whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String(" ".repeat(100) + "data");
      let result: string = text.trimStart();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART_2100
     * @tc.name testTrimStart021
     * @tc.desc Verify trimStart() preserves trailing whitespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimStart021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("  hello  ");
      let result: string = text.trimStart();
      expect(result).assertEqual("hello  ");
    });
  });
}
