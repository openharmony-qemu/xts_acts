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

export default function StringTrimLeftTest(): void {
  describe('StringTrimLeftTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_0100
     * @tc.name testTrimLeft001
     * @tc.desc Verify trimLeft() removes leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  ArkTS  ");
      let result: string = str.trimLeft();
      expect(result).assertEqual("ArkTS  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_0200
     * @tc.name testTrimLeft002
     * @tc.desc Verify trimLeft() removes leading tab and newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t\nArkTS");
      let result: string = str.trimLeft();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_0300
     * @tc.name testTrimLeft003
     * @tc.desc Verify trimLeft() removes leading carriage-return and space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\r Hello");
      let result: string = str.trimLeft();
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_0400
     * @tc.name testTrimLeft004
     * @tc.desc Verify trimLeft() and trimStart() produce same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t ArkTS");
      let r1: string = str.trimLeft();
      let r2: string = str.trimStart();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_0500
     * @tc.name testTrimLeft005
     * @tc.desc Verify trimLeft() does NOT change string with whitespace only on right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("abc  ");
      let result: string = str.trimLeft();
      expect(result).assertEqual("abc  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_0600
     * @tc.name testTrimLeft006
     * @tc.desc Verify trimLeft() does NOT change string with no whitespace at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("plain");
      let result: string = str.trimLeft();
      expect(result).assertEqual("plain");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_0700
     * @tc.name testTrimLeft007
     * @tc.desc Verify trimLeft() on CJK text with leading whitespace removes only leading
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  中文测试");
      let result: string = str.trimLeft();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_0800
     * @tc.name testTrimLeft008
     * @tc.desc Verify trimLeft() on GBK text with leading tab removes it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t中文测试");
      let result: string = str.trimLeft();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_0900
     * @tc.name testTrimLeft009
     * @tc.desc Verify trimLeft() on emoji text with leading tab and space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("\t 😀🎉");
      let result: string = str.trimLeft();
      expect(result).assertEqual("😀🎉");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_1000
     * @tc.name testTrimLeft010
     * @tc.desc Verify trimLeft() on ISO 8859-1 Latin accented text with leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("   café");
      let result: string = str.trimLeft();
      expect(result).assertEqual("café");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_1100
     * @tc.name testTrimLeft011
     * @tc.desc Verify trimLeft() on half-width katakana with leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("  ﾊﾝｶｸ");
      let result: string = str.trimLeft();
      expect(result).assertEqual("ﾊﾝｶｸ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_1200
     * @tc.name testTrimLeft012
     * @tc.desc Verify trimLeft() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("");
      let result: string = str.trimLeft();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_1300
     * @tc.name testTrimLeft013
     * @tc.desc Verify trimLeft() on all-whitespace string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String("   \t   ");
      let result: string = str.trimLeft();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_1400
     * @tc.name testTrimLeft014
     * @tc.desc Verify trimLeft() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  data");
      let result: string = text.trimLeft();
      expect(result).assertEqual("data");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_1500
     * @tc.name testTrimLeft015
     * @tc.desc Verify trimLeft() removes a UTF-8 BOM before JSON payload text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\uFEFF{\"id\":1}");
      let result: string = text.trimLeft();
      expect(result).assertEqual("{\"id\":1}");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_1600
     * @tc.name testTrimLeft016
     * @tc.desc Verify trimLeft() cleans leading whitespace before a command option
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\t  --mode=debug");
      let result: string = text.trimLeft();
      expect(result).assertEqual("--mode=debug");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_1700
     * @tc.name testTrimLeft017
     * @tc.desc Verify trimLeft() cleans a CSV field while preserving trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("  user@example.com  ");
      let result: string = text.trimLeft();
      expect(result).assertEqual("user@example.com  ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMLEFT_1800
     * @tc.name testTrimLeft018
     * @tc.desc Verify trimLeft() removes form-feed and vertical-tab before an imported SKU
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTrimLeft018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("\f\vsku-001");
      let result: string = text.trimLeft();
      expect(result).assertEqual("sku-001");
    });
  });
}
