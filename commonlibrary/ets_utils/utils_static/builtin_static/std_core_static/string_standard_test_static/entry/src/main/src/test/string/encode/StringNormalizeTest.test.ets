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

export default function StringNormalizeTest(): void {
  describe('StringNormalizeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_0100
     * @tc.name testNormalize001
     * @tc.desc Verify normalize() default NFC on ASCII string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("ArkTS");
      let result: string = text.normalize();
      expect(result).assertEqual("ArkTS");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_0200
     * @tc.name testNormalize002
     * @tc.desc Verify normalize(NFC) on ISO 8859-1 precomposed character returns same length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("café");
      let result: string = text.normalize("NFC");
      expect(result.length).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_0300
     * @tc.name testNormalize003
     * @tc.desc Verify normalize(NFC) on decomposed combining sequence composes to single char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: string = text.normalize("NFC");
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_0400
     * @tc.name testNormalize004
     * @tc.desc Verify normalize(NFD) on precomposed character decomposes to longer length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let result: string = text.normalize("NFD");
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_0500
     * @tc.name testNormalize005
     * @tc.desc Verify normalize() on empty string returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("");
      let result: string = text.normalize();
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_0600
     * @tc.name testNormalize006
     * @tc.desc Verify normalize(NFC) length differs from normalize(NFD) for precomposed char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("é");
      let nfc: string = text.normalize("NFC");
      let nfd: string = text.normalize("NFD");
      expect(nfc.length).assertEqual(1);
      expect(nfd.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_0700
     * @tc.name testNormalize007
     * @tc.desc Verify normalize(NFKC) on ASCII string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("Hello");
      let result: string = text.normalize("NFKC");
      expect(result).assertEqual("Hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_0800
     * @tc.name testNormalize008
     * @tc.desc Verify normalize() on CJK Unicode BMP characters returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("你好");
      let result: string = text.normalize();
      expect(result).assertEqual("你好");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_0900
     * @tc.name testNormalize009
     * @tc.desc Verify normalize() on emoji string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("😀");
      let result: string = text.normalize();
      expect(result).assertEqual("😀");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1000
     * @tc.name testNormalize010
     * @tc.desc Verify normalize() on GBK Chinese text returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("中文测试");
      let result: string = text.normalize();
      expect(result).assertEqual("中文测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1100
     * @tc.name testNormalize011
     * @tc.desc Verify normalize(NFKD) on dynamic variable returns correct decomposition
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String("é");
      let form: string = "NFKD";
      let result: string = text.normalize(form);
      expect(result.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1200
     * @tc.name testNormalize012
     * @tc.desc Verify normalize() with invalid form string throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      try {
        let result: string = text.normalize("INVALID");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1300
     * @tc.name testNormalize013
     * @tc.desc Verify normalize() with empty form string throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      try {
        let result: string = text.normalize("");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1400
     * @tc.name testNormalize014
     * @tc.desc Verify normalize() with form string 'null' throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      try {
        let result: string = text.normalize("null");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1500
     * @tc.name testNormalize015
     * @tc.desc Verify normalize() with form '[object Object]' throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      try {
        let result: string = text.normalize("[object Object]");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1600
     * @tc.name testNormalize016
     * @tc.desc Verify normalize() with form 'NFE' (close to valid but invalid) throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("abc");
      try {
        let result: string = text.normalize("NFE");
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1700
     * @tc.name testNormalize017
     * @tc.desc Verify normalize(NFKC) expands Latin ligature compatibility character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFB01le");
      let result: string = text.normalize("NFKC");
      expect(result).assertEqual("file");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1800
     * @tc.name testNormalize018
     * @tc.desc Verify normalize(NFKD) expands Latin ligature compatibility character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFB01le");
      let result: string = text.normalize("NFKD");
      expect(result).assertEqual("file");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_1900
     * @tc.name testNormalize019
     * @tc.desc Verify normalize(NFC) makes composed and decomposed user names comparable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const stored = new String("caf\u00E9");
      const typed = new String("cafe\u0301");
      let storedName: string = stored.normalize("NFC");
      let typedName: string = typed.normalize("NFC");
      expect(storedName).assertEqual(typedName);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2000
     * @tc.name testNormalize020
     * @tc.desc Verify normalize(NFKC) converts fullwidth order code characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFF21\uFF22-\uFF11\uFF12");
      let result: string = text.normalize("NFKC");
      expect(result).assertEqual("AB-12");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2100
     * @tc.name testNormalize021
     * @tc.desc Verify normalize(NFKC) converts circled list numbers to plain digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u2460 item");
      let result: string = text.normalize("NFKC");
      expect(result).assertEqual("1 item");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2200
     * @tc.name testNormalize022
     * @tc.desc Verify normalize(NFD) decomposes an accent in an SKU while preserving delimiters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("SKU-\u00E9-01");
      let result: string = text.normalize("NFD");
      expect(result.startsWith("SKU-")).assertTrue();
      expect(result.endsWith("-01")).assertTrue();
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2300
     * @tc.name testNormalize023
     * @tc.desc Verify normalize() preserves Unicode escape CJK text under NFC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u4E2D\u6587");
      let result: string = text.normalize("NFC");
      expect(result).assertEqual("\u4E2D\u6587");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2400
     * @tc.name testNormalize024
     * @tc.desc Verify normalize() preserves zero-width space under NFC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\u200BB");
      let result: string = text.normalize("NFC");
      expect(result).assertEqual("A\u200BB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2500
     * @tc.name testNormalize025
     * @tc.desc Verify normalize() preserves replacement character under NFC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFFFD");
      let result: string = text.normalize("NFC");
      expect(result).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2600
     * @tc.name testNormalize026
     * @tc.desc Verify normalize() preserves Arabic text under NFC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\u0627\u0628");
      let result: string = text.normalize("NFC");
      expect(result).assertEqual("\u0627\u0628");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2700
     * @tc.name testNormalize027
     * @tc.desc Verify normalize() preserves date-format ASCII under NFKC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("2026-03-05");
      let result: string = text.normalize("NFKC");
      expect(result).assertEqual("2026-03-05");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2800
     * @tc.name testNormalize028
     * @tc.desc Verify normalize() converts fullwidth letters under NFKC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uFF21\uFF22\uFF23");
      let result: string = text.normalize("NFKC");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_2900
     * @tc.name testNormalize029
     * @tc.desc Verify normalize() preserves CRLF sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("A\r\nB");
      let result: string = text.normalize("NFC");
      expect(result).assertEqual("A\r\nB");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_3000
     * @tc.name testNormalize030
     * @tc.desc Verify normalize() preserves emoji surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text = new String("\uD83D\uDE00");
      let result: string = text.normalize("NFC");
      expect(result).assertEqual("\uD83D\uDE00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_3100
     * @tc.name testNormalize031
     * @tc.desc Verify Normalize handles combined special characters without losing content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source =
        new String("!@#$%^&*() <script>alert(1)</script> \u6D4B\u8BD5 \u5206\u5272\u7B26  \u6D4B\u8BD5 \n \u6362\u884C  \u6D4B\u8BD5 \r\n \u56DE\u8F66\u6362\u884C  \u6D4B\u8BD5 \\ \u8F6C\u4E49\u7B26");
      let result: string = source.normalize("NFC");
      expect(result).assertEqual(source.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE_3200
     * @tc.name testNormalize032
     * @tc.desc Verify Normalize handles multilingual mixed encoded content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testNormalize032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source = new String("テスト 테스트 Test 測試 АБВГД الاختبار");
      let result: string = source.normalize("NFC");
      expect(result).assertEqual(source.toString());
    });
  });
}
