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

export default function StringCharAtTest(): void {
  describe('StringCharAtTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0100
     * @tc.name testCharAt001
     * @tc.desc Verify charAt() returns correct char at each position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      expect(text.charAt(0)).assertEqual("A");
      expect(text.charAt(1)).assertEqual("r");
      expect(text.charAt(4)).assertEqual("S");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0200
     * @tc.name testCharAt002
     * @tc.desc Verify charAt() at first and last position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDE");
      expect(text.charAt(0)).assertEqual("A");
      expect(text.charAt(4)).assertEqual("E");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0300
     * @tc.name testCharAt003
     * @tc.desc Verify charAt() with Chinese characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      expect(text.charAt(0)).assertEqual("你");
      expect(text.charAt(1)).assertEqual("好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0400
     * @tc.name testCharAt004
     * @tc.desc Verify charAt() with full-width character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ＦＵＬＬ");
      expect(text.charAt(0)).assertEqual("Ｆ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0500
     * @tc.name testCharAt005
     * @tc.desc Verify charAt() with RTL mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rtl: string = String.fromCharCode(0x200F);
      const text = new String("A" + rtl + "B");
      expect(text.charAt(1).toString()).assertEqual(rtl);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0600
     * @tc.name testCharAt006
     * @tc.desc Verify charAt(0) on emoji returns high surrogate code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result = text.charAt(0);
      expect(result.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0700
     * @tc.name testCharAt007
     * @tc.desc Verify charAt() on combining character sequence returns base char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let acute: string = String.fromCharCode(769);
      const text = new String("e" + acute);
      expect(text.charAt(0)).assertEqual("e");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0800
     * @tc.name testCharAt008
     * @tc.desc Verify charAt(1) on emoji returns low surrogate code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result = text.charAt(1);
      expect(result.toString().length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_0900
     * @tc.name testCharAt009
     * @tc.desc Verify charAt() on string with null byte returns null char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\0B");
      let result = text.charAt(1);
      let code: number = result.toString().charCodeAt(0);
      expect(code).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1000
     * @tc.name testCharAt010
     * @tc.desc Verify charAt() with half-width katakana returns single code unit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ﾊﾝｶｸ");
      expect(text.charAt(0)).assertEqual("ﾊ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_1100
     * @tc.name testCharAt011
     * @tc.desc Verify charAt(0) on empty string throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      try {
        let result = text.charAt(0);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_1100
     * @tc.name testCharAt012
     * @tc.desc Verify charAt(0) on all-spaces string returns space character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("   ");
      expect(text.charAt(0)).assertEqual(" ");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_1100
     * @tc.name testCharAt013
     * @tc.desc Verify charAt(length) throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      try {
        let result = text.charAt(2);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_RENUM_1100
     * @tc.name testCharAt014
     * @tc.desc Verify charAt(0) on single-character string returns that character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("X");
      expect(text.charAt(0)).assertEqual("X");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_RENUM_RENUM_1100
     * @tc.name testCharAt015
     * @tc.desc Verify charAt() accepts short type index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: short = 0;
      const text = new String("AB");
      expect(text.charAt(idx)).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_RENUM_RENUM_RENUM_1100
     * @tc.name testCharAt016
     * @tc.desc Verify charAt() accepts byte type index parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let idx: byte = 0;
      const text = new String("AB");
      expect(text.charAt(idx)).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_1100
     * @tc.name testCharAt017
     * @tc.desc Verify charAt() with negative index throws StringIndexOutOfBoundsError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("AB");
      try {
        let result = text.charAt(-1);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("StringIndexOutOfBoundsError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_1100
     * @tc.name testCharAt018
     * @tc.desc Verify charAt(1) on GBK Chinese text returns second character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      expect(text.charAt(2)).assertEqual("测");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_1100
     * @tc.name testCharAt019
     * @tc.desc Verify charAt(3) on ISO 8859-1 Latin text returns accented é
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      expect(text.charAt(3)).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_1100
     * @tc.name testCharAt020
     * @tc.desc Verify charAt(1) on string with newline returns newline character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("a\nb");
      let result: string = text.charAt(1).toString();
      let code: number = text.charCodeAt(1);
      expect(code).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_1100
     * @tc.name testCharAt021
     * @tc.desc Verify charAt(1) on string with tab returns tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("x\ty");
      let code: number = text.charCodeAt(1);
      expect(code).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_RENUM_1100
     * @tc.name testCharAt022
     * @tc.desc Verify charAt(3) on 7-char string returns middle character D
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ABCDEFG");
      expect(text.charAt(3)).assertEqual("D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CHARAT_2500
     * @tc.name testCharAt023
     * @tc.desc Verify charAt() with dynamic index variable returns correct character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharAt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("TypeScript");
      let idx: int = 4;
      expect(text.charAt(idx)).assertEqual("S");
    });
  });
}