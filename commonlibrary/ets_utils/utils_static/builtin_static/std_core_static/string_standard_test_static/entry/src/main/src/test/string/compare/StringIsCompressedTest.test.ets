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

export default function StringIsCompressedTest(): void {
  describe('StringIsCompressedTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0100
     * @tc.name testIsCompressed001
     * @tc.desc Verify isCompressed() on ASCII string returns true as all chars fit in Latin-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0200
     * @tc.name testIsCompressed002
     * @tc.desc Verify isCompressed() on empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String();
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0300
     * @tc.name testIsCompressed003
     * @tc.desc Verify isCompressed() on CJK Unicode BMP string returns false as chars exceed Latin-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0400
     * @tc.name testIsCompressed004
     * @tc.desc Verify isCompressed() consistency returns same result on repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Same");
      let r1: boolean = text.isCompressed();
      let r2: boolean = text.isCompressed();
      expect(r1).assertEqual(r2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0500
     * @tc.name testIsCompressed005
     * @tc.desc Verify isCompressed() on long ASCII string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A".repeat(1000));
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0600
     * @tc.name testIsCompressed006
     * @tc.desc Verify isCompressed() on emoji string returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0700
     * @tc.name testIsCompressed007
     * @tc.desc Verify isCompressed() on ISO 8859-1 Latin precomposed character returns false as only ASCII is compressed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0800
     * @tc.name testIsCompressed008
     * @tc.desc Verify isCompressed() on mixed ASCII plus CJK returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABC中文");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_0900
     * @tc.name testIsCompressed009
     * @tc.desc Verify isCompressed() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("Latin1Only");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1000
     * @tc.name testIsCompressed010
     * @tc.desc Verify isCompressed() on half-width katakana returns false as code points exceed ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ﾊﾝｶｸ");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1100
     * @tc.name testIsCompressed011
     * @tc.desc Verify isCompressed() on empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1200
     * @tc.name testIsCompressed012
     * @tc.desc Verify isCompressed() on ASCII-only symbols and digits returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("12345!@#$%");
      let result: boolean = text.isCompressed();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1300
     * @tc.name testIsCompressed013
     * @tc.desc Verify isCompressed() on CJK text returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED_1400
     * @tc.name testIsCompressed014
     * @tc.desc Verify isCompressed() on mixed ASCII and CJK text returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testIsCompressed014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ID-\u4E2D\u6587-001");
      let result: boolean = text.isCompressed();
      expect(result).assertFalse();
    });
  });
}
