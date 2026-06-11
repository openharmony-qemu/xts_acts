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

export default function StringTrimRightTest(): void {
  describe('StringTrimRightTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_0100
     * @tc.name testTrimRight001
     * @tc.desc Verify trimRight() removes trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  ArkTS  ");
      let result: string = str.trimRight();
      expect(result).assertEqual("  ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_0200
     * @tc.name testTrimRight002
     * @tc.desc Verify trimRight() removes trailing carriage-return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("value\r");
      let result: string = str.trimRight();
      expect(result).assertEqual("value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_0300
     * @tc.name testTrimRight003
     * @tc.desc Verify trimRight() removes trailing newline and tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("data\n\t");
      let result: string = str.trimRight();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_0400
     * @tc.name testTrimRight004
     * @tc.desc Verify trimRight() and trimEnd() produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t ArkTS  ");
      let r1: string = str.trimRight();
      let r2: string = str.trimEnd();
      expect(r1).assertEqual(r2);
      expect(r1).assertEqual("\t ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_0500
     * @tc.name testTrimRight005
     * @tc.desc Verify trimRight() does NOT change string with whitespace only on left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  abc");
      let result: string = str.trimRight();
      expect(result).assertEqual("  abc");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_0600
     * @tc.name testTrimRight006
     * @tc.desc Verify trimRight() does NOT change string with no whitespace at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("plain");
      let result: string = str.trimRight();
      expect(result).assertEqual("plain");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_0700
     * @tc.name testTrimRight007
     * @tc.desc Verify trimRight() on GBK text with trailing whitespace removes only trailing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试  ");
      let result: string = str.trimRight();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_0800
     * @tc.name testTrimRight008
     * @tc.desc Verify trimRight() on CJK text with trailing tab removes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("中文测试\t");
      let result: string = str.trimRight();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_0900
     * @tc.name testTrimRight009
     * @tc.desc Verify trimRight() on emoji text with trailing spaces removes only trailing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("😀🎉  ");
      let result: string = str.trimRight();
      expect(result).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_1000
     * @tc.name testTrimRight010
     * @tc.desc Verify trimRight() on ISO 8859-1 Latin accented text with trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("café   ");
      let result: string = str.trimRight();
      expect(result).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_1100
     * @tc.name testTrimRight011
     * @tc.desc Verify trimRight() on half-width katakana with trailing tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("ﾊﾝｶｸ\t");
      let result: string = str.trimRight();
      expect(result).assertEqual("ﾊﾝｶｸ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_1200
     * @tc.name testTrimRight012
     * @tc.desc Verify trimRight() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: string = str.trimRight();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_1300
     * @tc.name testTrimRight013
     * @tc.desc Verify trimRight() on all-whitespace string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("   \t   ");
      let result: string = str.trimRight();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_1400
     * @tc.name testTrimRight014
     * @tc.desc Verify trimRight() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("data  ");
      let result: string = text.trimRight();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_1500
     * @tc.name testTrimRight015
     * @tc.desc Verify trimRight() removes CRLF from a protocol header line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("Content-Length: 12\r\n");
      let result: string = text.trimRight();
      expect(result).assertEqual("Content-Length: 12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_1600
     * @tc.name testTrimRight016
     * @tc.desc Verify trimRight() removes trailing blanks while preserving YAML indentation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  child: value   ");
      let result: string = text.trimRight();
      expect(result).assertEqual("  child: value");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_1700
     * @tc.name testTrimRight017
     * @tc.desc Verify trimRight() cleans a CSV field while preserving leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  user@example.com  ");
      let result: string = text.trimRight();
      expect(result).assertEqual("  user@example.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMRIGHT_1800
     * @tc.name testTrimRight018
     * @tc.desc Verify trimRight() removes a trailing BOM marker from imported text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimRight018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("token\uFEFF");
      let result: string = text.trimRight();
      expect(result).assertEqual("token");
    });
  });
}
