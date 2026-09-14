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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function checkCompress<T extends string>(s: T): boolean {
  return s.isCompressed();
}

export default function StringIsCompressed2Test(): void {
  describe('StringIsCompressed2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED2_0100
     * @tc.name testIsCompressed001
     * @tc.desc Verify isCompressed() on plain ASCII string returns true (Latin-1 compressible)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsCompressed001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "hello world";
      expect(s.isCompressed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED2_0200
     * @tc.name testIsCompressed002
     * @tc.desc Verify isCompressed() on empty string returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsCompressed002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "";
      expect(s.isCompressed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED2_0300
     * @tc.name testIsCompressed003
     * @tc.desc Verify isCompressed() on CJK Chinese characters returns false (non-Latin1)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsCompressed003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "你好世界";
      expect(s.isCompressed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED2_0400
     * @tc.name testIsCompressed004
     * @tc.desc Verify isCompressed() on emoji surrogate pair returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsCompressed004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "🀄🎉";
      expect(s.isCompressed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED2_0500
     * @tc.name testIsCompressed005
     * @tc.desc Verify isCompressed() on Greek/Cyrillic returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsCompressed005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "ΑλφαПривет";
      expect(s.isCompressed()).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED2_0600
     * @tc.name testIsCompressed006
     * @tc.desc Verify isCompressed() inside generic function with T extends string constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsCompressed006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(checkCompress("ASCII_only")).assertTrue();
      expect(checkCompress("Αλφα")).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED2_0700
     * @tc.name testIsCompressed007
     * @tc.desc Verify isCompressed() returns true for ASCII printable range characters (U+0020 to U+007E)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsCompressed007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "!\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~";
      expect(s.isCompressed()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ISCOMPRESSED2_0800
     * @tc.name testIsCompressed008
     * @tc.desc Verify isCompressed() returns false for characters above Latin-1 (U+0100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testIsCompressed008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "ĀāĂăĄąĆćĈĉĊċČčĎď";
      expect(s.isCompressed()).assertFalse();
    });
  });
}