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

export default function StringGetCharsTest(): void {
  describe('StringGetCharsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_0100
     * @tc.name testGetChars001
     * @tc.desc Verify getChars() on ASCII string returns char array of same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_0200
     * @tc.name testGetChars002
     * @tc.desc Verify getChars() on empty string returns empty char array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_0300
     * @tc.name testGetChars003
     * @tc.desc Verify getChars() on CJK Unicode BMP string returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_0400
     * @tc.name testGetChars004
     * @tc.desc Verify getChars() first element matches first character of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("XYZ");
      let chars: char[] = text.getChars();
      expect(chars[0].toString()).assertEqual("X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_0500
     * @tc.name testGetChars005
     * @tc.desc Verify getChars() last element matches last character of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("XYZ");
      let chars: char[] = text.getChars();
      expect(chars[2].toString()).assertEqual("Z");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_0600
     * @tc.name testGetChars006
     * @tc.desc Verify getChars() on emoji returns 2 chars for surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_0700
     * @tc.name testGetChars007
     * @tc.desc Verify getChars() on single character returns length 1 with correct content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("K");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(1);
      expect(chars[0].toString()).assertEqual("K");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_0800
     * @tc.name testGetChars008
     * @tc.desc Verify getChars() on ISO 8859-1 Latin precomposed é returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(1);
      expect(chars[0].toString()).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_0900
     * @tc.name testGetChars009
     * @tc.desc Verify getChars() on combining character sequence returns 2 chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_1000
     * @tc.name testGetChars010
     * @tc.desc Verify getChars() on C0 control characters returns correct chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\n\t\0");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(3);
      expect(chars[0].toString()).assertEqual("\n");
      expect(chars[1].toString()).assertEqual("\t");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_1100
     * @tc.name testGetChars011
     * @tc.desc Verify getChars() on GBK Chinese text returns correct chars at each position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(2);
      expect(chars[0].toString()).assertEqual("中");
      expect(chars[1].toString()).assertEqual("文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_1200
     * @tc.name testGetChars012
     * @tc.desc Verify getChars() on half-width katakana returns length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ﾊ");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_1300
     * @tc.name testGetChars013
     * @tc.desc Verify getChars() on emoji returns high surrogate at index 0 and low surrogate at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let chars: char[] = text.getChars();
      let combined: string = chars[0].toString() + chars[1].toString();
      expect(combined).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_1400
     * @tc.name testGetChars014
     * @tc.desc Verify getChars() on mixed ASCII plus CJK plus emoji returns total length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A中😀");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_1500
     * @tc.name testGetChars015
     * @tc.desc Verify getChars() with dynamic variable returns correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testGetChars015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("Dev");
      let chars: char[] = text.getChars();
      expect(chars.length).assertEqual(3);
      expect(chars[1].toString()).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_GETCHARS_1600
     * @tc.name testGetChars016
     * @tc.desc Verify getChars() traverses all chars matching original string
     */
    it('testGetChars016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let chars: char[] = text.getChars();
      let result: string = "";
      for (let i: int = 0; i < chars.length; i++) {
        result += chars[i].toString();
      }
      expect(result).assertEqual("TypeScript");
    });
  });
}
