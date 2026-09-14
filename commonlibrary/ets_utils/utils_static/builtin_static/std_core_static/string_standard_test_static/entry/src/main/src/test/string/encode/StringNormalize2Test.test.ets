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

function getStr(): string {
  return "é";
}

function nfc<T extends string>(s: T): string {
  return s.normalize("NFC");
}

function nfd<T extends string>(s: T): string {
  return s.normalize("NFD");
}

export default function StringNormalize2Test(): void {
  describe('StringNormalize2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_0100
     * @tc.name testNormalize001
     * @tc.desc Verify string literal normalize NFC returns unchanged for precomposed e-acute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("é".normalize("NFC")).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_0200
     * @tc.name testNormalize002
     * @tc.desc Verify new String instance normalize NFD decomposes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = new String("é").normalize("NFD");
      expect(r.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_0300
     * @tc.name testNormalize003
     * @tc.desc Verify const string normalize default NFC returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const s: string = "é";
      expect(s.normalize()).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_0400
     * @tc.name testNormalize004
     * @tc.desc Verify function return value normalize NFC composes decomposed form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStr().normalize("NFC")).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_0500
     * @tc.name testNormalize005
     * @tc.desc Verify NFC of decomposed e-acute composes to precomposed form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("é".normalize("NFC")).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_0600
     * @tc.name testNormalize006
     * @tc.desc Verify NFD of precomposed e-acute decomposes to e plus combining acute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: string = "é".normalize("NFD");
      expect(r.length).assertEqual(2);
      expect(r.charCodeAt(0)).assertEqual(0x65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_0700
     * @tc.name testNormalize007
     * @tc.desc Verify NFC roundtrip NFD and back produces same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "é";
      let nfd: string = s.normalize("NFD");
      let back: string = nfd.normalize("NFC");
      expect(s).assertEqual(back);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_0800
     * @tc.name testNormalize008
     * @tc.desc Verify four normalization forms on fullwidth A: NFC NFD unchanged NFKC NFKD halfwidth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("Ａ".normalize("NFC")).assertEqual("Ａ");
      expect("Ａ".normalize("NFD")).assertEqual("Ａ");
      expect("Ａ".normalize("NFKC")).assertEqual("A");
      expect("Ａ".normalize("NFKD")).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_0900
     * @tc.name testNormalize009
     * @tc.desc Verify NFKC on superscript 2 converts to digit 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("²".normalize("NFC")).assertEqual("²");
      expect("²".normalize("NFKC")).assertEqual("2");
      expect("²".normalize("NFKD")).assertEqual("2");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1000
     * @tc.name testNormalize010
     * @tc.desc Verify NFKC on ligature fi decomposes to f plus i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("ﬁ".normalize("NFC")).assertEqual("ﬁ");
      expect("ﬁ".normalize("NFKC")).assertEqual("fi");
      expect("ﬁ".normalize("NFKD")).assertEqual("fi");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1100
     * @tc.name testNormalize011
     * @tc.desc Verify NFKC on circled digit 1 converts to digit 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("①".normalize("NFKC")).assertEqual("1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1200
     * @tc.name testNormalize012
     * @tc.desc Verify NFC length of precomposed e-acute is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("é".normalize("NFC").length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1300
     * @tc.name testNormalize013
     * @tc.desc Verify NFD length of precomposed e-acute is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect("é".normalize("NFD").length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1400
     * @tc.name testNormalize014
     * @tc.desc Verify NFC codePointAt of composed e-acute returns 0xE9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp: Int | undefined = "é".normalize("NFC").codePointAt(0);
      expect(cp).assertEqual(0xE9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1500
     * @tc.name testNormalize015
     * @tc.desc Verify NFD codePointAt of decomposed e-acute returns 0x65 for base e
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cp: Int | undefined = "é".normalize("NFD").codePointAt(0);
      expect(cp).assertEqual(0x65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1600
     * @tc.name testNormalize016
     * @tc.desc Verify original string is not modified after normalize call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "é";
      original.normalize("NFC");
      expect(original).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1700
     * @tc.name testNormalize017
     * @tc.desc Verify NFC normalize is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let once: string = "é".normalize("NFC");
      let twice: string = once.normalize("NFC");
      expect(once).assertEqual(twice);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1800
     * @tc.name testNormalize018
     * @tc.desc Verify NFD normalize is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let once: string = "é".normalize("NFD");
      let twice: string = once.normalize("NFD");
      expect(once).assertEqual(twice);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_1900
     * @tc.name testNormalize019
     * @tc.desc Verify NFC normalization makes precomposed and decomposed forms equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: string = "é";
      let b: string = "é";
      expect(a.normalize("NFC")).assertEqual(b.normalize("NFC"));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2000
     * @tc.name testNormalize020
     * @tc.desc Verify normalize with invalid form string throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        "a".normalize("INVALID");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2100
     * @tc.name testNormalize021
     * @tc.desc Verify normalize with empty string form throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        "a".normalize("");
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual("RangeError");
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2200
     * @tc.name testNormalize022
     * @tc.desc Verify NFC normalizes both precomposed U+00E9 and decomposed e+U+0301 to precomposed form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(nfc("\u00E9")).assertEqual("\u00E9");
      expect(nfc("e\u0301")).assertEqual("\u00E9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2300
     * @tc.name testNormalize023
     * @tc.desc Verify generic function with T extends string calls normalize NFD correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(nfd("é").length).assertEqual(2);
      expect(nfd("é")).assertEqual("é");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2400
     * @tc.name testNormalize024
     * @tc.desc Verify NFC normalization before split produces correct code-unit-index-aligned array for composed vs decomposed input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let composed: string = "é";
      let decomposed: string = "é";
      let nfcFromComp: string[] = composed.normalize("NFC").split("");
      let nfcFromDecomp: string[] = decomposed.normalize("NFC").split("");
      expect(nfcFromComp.length).assertEqual(1);
      expect(nfcFromDecomp.length).assertEqual(1);
      expect(nfcFromComp[0]).assertEqual(nfcFromDecomp[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2500
     * @tc.name testNormalize025
     * @tc.desc Verify NFD decomposition of é then charCodeAt(0) yields base letter e code point 0x65
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "é";
      let firstByte: number = s.normalize("NFD").charCodeAt(0);
      expect(firstByte).assertEqual(0x65);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2600
     * @tc.name testNormalize026
     * @tc.desc Verify 4-chain normalize(NFC)→slice(1)→concat("-suffix")→toLowerCase preserves Unicode through each step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "Café";
      let result: string = s.normalize("NFC").slice(1).concat("-suffix").toLowerCase();
      expect(result).assertEqual("afé-suffix");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2700
     * @tc.name testNormalize027
     * @tc.desc Verify typeof normalize result is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "\u00E9";
      expect(str.normalize()).assertEqual("\u00E9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2800
     * @tc.name testNormalize028
     * @tc.desc Verify normalize on empty string all forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "";
      expect(str.normalize("NFC")).assertEqual("");
      expect(str.normalize("NFD")).assertEqual("");
      expect(str.normalize("NFKC")).assertEqual("");
      expect(str.normalize("NFKD")).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_2900
     * @tc.name testNormalize029
     * @tc.desc Verify normalize on pure numbers remains unchanged in all forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "12345";
      expect(str.normalize("NFC")).assertEqual("12345");
      expect(str.normalize("NFKD")).assertEqual("12345");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_3000
     * @tc.name testNormalize030
     * @tc.desc Verify normalize on pure symbols unchanged in all forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "!@#$%";
      expect(str.normalize("NFC")).assertEqual("!@#$%");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_3100
     * @tc.name testNormalize031
     * @tc.desc Verify NFKC fullwidth to halfwidth conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "\uFF21";
      expect(str.normalize("NFKC")).assertEqual("A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_3200
     * @tc.name testNormalize032
     * @tc.desc Verify four normalization forms compared for same input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "\u00E9";
      let nfc: string = str.normalize("NFC");
      let nfd: string = str.normalize("NFD");
      let nfkc: string = str.normalize("NFKC");
      let nfkd: string = str.normalize("NFKD");
      expect(nfc.length).assertEqual(1);
      expect(nfd.length).assertEqual(2);
      expect(nfkc).assertEqual(nfc);
      expect(nfkd).assertEqual(nfd);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_3300
     * @tc.name testNormalize033
     * @tc.desc Verify normalize preserves zero-width space U+200B in all forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "\u200B";
      expect(str.normalize("NFC")).assertEqual("\u200B");
      expect(str.normalize("NFD")).assertEqual("\u200B");
      expect(str.normalize("NFKC")).assertEqual("\u200B");
      expect(str.normalize("NFKD")).assertEqual("\u200B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_3400
     * @tc.name testNormalize034
     * @tc.desc Verify normalize preserves replacement char U+FFFD in all forms
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "\uFFFD";
      expect(str.normalize("NFC")).assertEqual("\uFFFD");
      expect(str.normalize("NFD")).assertEqual("\uFFFD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_3500
     * @tc.name testNormalize035
     * @tc.desc Verify normalize NFD on ASCII unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "ABC";
      expect(str.normalize("NFD")).assertEqual("ABC");
    });
  
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_NORMALIZE2_3600
     * @tc.name testNormalize036
     * @tc.desc Verify normalize on expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testNormalize036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = "ABC".normalize("NFC");
      expect(result).assertEqual("ABC");
    });
  });
}