'use static'


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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';

import Utils from '../../Util.test';

import util from '@ohos.util';

export default function TextDecoderConstructorTest(): void {
  describe('TextDecoderConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_0100
     * @tc.name testTdCtorFatal001
     * @tc.desc Verify TextDecoder constructor with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorFatal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dFa1 = new util.TextDecoder();
        expect(dFa1.decodeToString(new Uint8Array([0xFF]))).assertEqual('�');

      }
      {
        let dFa2 = new util.TextDecoder();
        expect(dFa2.decodeToString(new Uint8Array([0x80])).charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dFa3 = new util.TextDecoder();
        expect(dFa3.decodeToString(new Uint8Array([0xC3]))).assertEqual('�');

      }
      {
        let dFa4 = new util.TextDecoder();
        expect(dFa4.decodeToString(new Uint8Array([0xC3, 0x28]))).assertEqual('�(');

      }
      {
        let dFa5 = new util.TextDecoder();
        expect(dFa5.decodeToString(new Uint8Array([0xE4, 0xBD])).charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dFa6 = new util.TextDecoder();
        let rFa6: string = dFa6.decodeToString(new Uint8Array([0xE4, 0x28, 0xA1]));
        expect(rFa6.length).assertEqual(3);
        expect(rFa6.charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dFa7 = new util.TextDecoder();
        expect(dFa7.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98]))).assertEqual('�');

      }
      {
        let dFa8 = new util.TextDecoder();
        expect(dFa8.decodeToString(new Uint8Array([0xC0, 0xAF])).charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dFa9 = new util.TextDecoder();
        expect(dFa9.decodeToString(new Uint8Array([0xC1, 0xBF]))).assertEqual('��');

      }
      {
        let dFa10 = new util.TextDecoder();
        expect(dFa10.decodeToString(new Uint8Array([0xED, 0xA0, 0x80])).charCodeAt(0)).assertEqual(0xFFFD);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_0200
     * @tc.name testTdCtorFatal002
     * @tc.desc Verify TextDecoder constructor with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorFatal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dFa11 = new util.TextDecoder();
        expect(dFa11.decodeToString(new Uint8Array([0xF4, 0x90, 0x80, 0x80]))).assertEqual('����');

      }
      {
        let dFa12 = new util.TextDecoder();
        expect(dFa12.decodeToString(new Uint8Array([0xF8, 0x88, 0x80, 0x80, 0x80])).charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dFa13 = new util.TextDecoder();
        expect(dFa13.decodeToString(new Uint8Array([0xFC, 0x84, 0x80, 0x80, 0x80, 0x80]))).assertEqual('������');

      }
      {
        let dFa14 = new util.TextDecoder();
        expect(dFa14.decodeToString(new Uint8Array([0xE0, 0x80, 0x80])).charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dFa15 = new util.TextDecoder();
        expect(dFa15.decodeToString(new Uint8Array([0xF0, 0x80, 0x80, 0x80]))).assertEqual('����');

      }
      {
        let dFa16 = new util.TextDecoder();
        expect(dFa16.decodeToString(new Uint8Array([0x61, 0xFF, 0x62]))).assertEqual('a�b');

      }
      {
        let dFa17 = new util.TextDecoder();
        expect(dFa17.decodeToString(new Uint8Array([0xFF, 0x61])).charAt(0).toString()).assertEqual('�');

      }
      {
        let dFa18 = new util.TextDecoder();
        expect(dFa18.decodeToString(new Uint8Array([0x61, 0xFF])).charCodeAt(1)).assertEqual(0xFFFD);

      }
      {
        let dFa19 = new util.TextDecoder();
        let rFa19: string = dFa19.decodeToString(new Uint8Array([0xFF, 0xFF]));
        expect(rFa19.length).assertEqual(2);
        expect(rFa19.charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dFa20 = new util.TextDecoder();
        expect(dFa20.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0x80]))).assertEqual('你�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_0300
     * @tc.name testTdCtorFatal003
     * @tc.desc Verify TextDecoder constructor with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorFatal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dFa21 = new util.TextDecoder();
        let rFa21: string = dFa21.decodeToString(new Uint8Array([0xEF, 0xBB, 0x28]));
        expect(rFa21.charAt(0).toString()).assertEqual('�');
        expect(rFa21.charAt(1).toString()).assertEqual('(');

      }
      {
        let dBo11 = new util.TextDecoder();
        expect(dBo11.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xFF]))).assertEqual('\uFEFF�');

      }
      {
        let dCm4 = new util.TextDecoder();
        expect(dCm4.decodeToString(new Uint8Array([0xE4, 0xB8, 0xAD, 0xFF, 0xE5, 0x9B, 0xBD]))).assertEqual('中�国');

      }
      {
        let dCm7 = new util.TextDecoder();
        for (let i = 128; i < 256; i++) {
          let out: string = dCm7.decodeToString(new Uint8Array([i]));
          expect(out.charCodeAt(0)).assertEqual(0xFFFD);
        }

      }
      {
        let dCm8 = new util.TextDecoder();
        dCm8.decodeToString(new Uint8Array([0xFF]));
        expect(dCm8.decodeToString(new Uint8Array([0x61]))).assertEqual('a');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.fatal).assertFalse();

      }
      {
        let decoder = new util.TextDecoder();
        let fatalFlag: boolean = decoder.fatal;
        expect(fatalFlag).assertFalse();

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.fatal).assertEqual(decoder.ignoreBOM);

      }
      {
        let d1 = new util.TextDecoder();
        let d2 = new util.TextDecoder();
        expect(d1.fatal).assertEqual(d2.fatal);

      }
      {
        let d4 = new util.TextDecoder();
        let d5 = new util.TextDecoder();
        let d6 = new util.TextDecoder();
        expect(d4.fatal).assertEqual(d5.fatal);
        expect(d5.fatal).assertEqual(d6.fatal);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_0400
     * @tc.name testTdCtorFatal004
     * @tc.desc Verify TextDecoder constructor with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorFatal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(new util.TextDecoder().fatal).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_0500
     * @tc.name testTdCtorBom001
     * @tc.desc Verify TextDecoder constructor with ignoreBOM and BOM handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorBom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dBo1 = new util.TextDecoder();
        expect(dBo1.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF]))).assertEqual('\uFEFF');

      }
      {
        let dBo2 = new util.TextDecoder();
        expect(dBo2.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF])).charCodeAt(0)).assertEqual(0xFEFF);

      }
      {
        let dBo3 = new util.TextDecoder();
        let rBo3: string = dBo3.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(rBo3.length).assertEqual(2);

      }
      {
        let dBo4 = new util.TextDecoder();
        let rBo4: string = dBo4.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xE4, 0xBD, 0xA0]));
        expect(rBo4.length).assertEqual(2);

      }
      {
        let dBo5 = new util.TextDecoder();
        expect(dBo5.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xE4, 0xBD, 0xA0])).charCodeAt(1)).assertEqual(0x4F60);

      }
      {
        let dBo6 = new util.TextDecoder();
        expect(dBo6.decodeToString(new Uint8Array([0x61, 0xEF, 0xBB, 0xBF, 0x62]))).assertEqual('a\uFEFFb');

      }
      {
        let dBo7 = new util.TextDecoder();
        expect(dBo7.decodeToString(new Uint8Array([0x61, 0xEF, 0xBB, 0xBF, 0x62])).charCodeAt(1)).assertEqual(0xFEFF);

      }
      {
        let dBo8 = new util.TextDecoder();
        let rBo8: string = dBo8.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xEF, 0xBB, 0xBF]));
        expect(rBo8.length).assertEqual(2);

      }
      {
        let dBo9 = new util.TextDecoder();
        let rBo9: string = dBo9.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xF0, 0x9F, 0x98, 0x80]));
        expect(rBo9.length).assertEqual(3);

      }
      {
        let dBo10 = new util.TextDecoder();
        let rBo10: string = dBo10.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(rBo10.indexOf('\uFEFF')).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_0600
     * @tc.name testTdCtorBom002
     * @tc.desc Verify TextDecoder constructor with ignoreBOM and BOM handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorBom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dBo12 = new util.TextDecoder();
        expect(dBo12.decodeToString(new Uint8Array([0xEF, 0xBB])).charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dCm3 = new util.TextDecoder();
        let rCm3: string = dCm3.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xE4, 0xB8, 0xAD]));
        expect(rCm3.charAt(0).toString()).assertEqual('\uFEFF');

      }
      {
        let dCm5 = new util.TextDecoder();
        let rCm5: string = dCm5.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xE4, 0xB8, 0xAD, 0xFF]));
        expect(rCm5.length).assertEqual(3);
        expect(rCm5.charCodeAt(1)).assertEqual(0x4E2D);

      }
      {
        let dCm9 = new util.TextDecoder();
        dCm9.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(dCm9.decodeToString(new Uint8Array([0x61])).charCodeAt(0)).assertEqual(0x61);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.ignoreBOM).assertFalse();

      }
      {
        let decoder = new util.TextDecoder();
        let ignoreFlag: boolean = decoder.ignoreBOM;
        expect(ignoreFlag).assertFalse();

      }
      {
        let d1 = new util.TextDecoder();
        let d2 = new util.TextDecoder();
        expect(d1.ignoreBOM).assertEqual(d2.ignoreBOM);

      }
      {
        let m1 = new util.TextDecoder();
        let m2 = new util.TextDecoder();
        let m3 = new util.TextDecoder();
        expect(m1.ignoreBOM).assertEqual(m2.ignoreBOM);
        expect(m2.ignoreBOM).assertEqual(m3.ignoreBOM);

      }
      {
        expect(new util.TextDecoder().ignoreBOM).assertFalse();

      }
      {
        let decoder = new util.TextDecoder();
        let bomResult: string = decoder.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(bomResult.charCodeAt(0)).assertEqual(0xFEFF);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_0700
     * @tc.name testTdCtorEncoding001
     * @tc.desc Verify TextDecoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dEn1 = new util.TextDecoder();
        expect(dEn1.decodeToString(new Uint8Array([0xC3, 0xA9]))).assertEqual('é');

      }
      {
        let dEn2 = new util.TextDecoder();
        expect(dEn2.decodeToString(new Uint8Array([0xC4, 0x8D]))).assertEqual('č');

      }
      {
        let dEn3 = new util.TextDecoder();
        expect(dEn3.decodeToString(new Uint8Array([0xE4, 0xB8, 0xAD]))).assertEqual('中');

      }
      {
        let dEn4 = new util.TextDecoder();
        expect(dEn4.decodeToString(new Uint8Array([0xE5, 0x9B, 0xBD]))).assertEqual('国');

      }
      {
        let dEn5 = new util.TextDecoder();
        expect(dEn5.decodeToString(new Uint8Array([0xE7, 0x94, 0xB2]))).assertEqual('甲');

      }
      {
        let dEn6 = new util.TextDecoder();
        expect(dEn6.decodeToString(new Uint8Array([0xF0, 0x9F, 0x8E, 0x89]))).assertEqual('🎉');

      }
      {
        let dEn7 = new util.TextDecoder();
        expect(dEn7.decodeToString(new Uint8Array([0xF0, 0x9F, 0x91, 0x8B]))).assertEqual('👋');

      }
      {
        let dEn8 = new util.TextDecoder();
        expect(dEn8.decodeToString(new Uint8Array([0x7F])).charCodeAt(0)).assertEqual(127);

      }
      {
        let dEn9 = new util.TextDecoder();
        expect(dEn9.decodeToString(new Uint8Array([0x00])).charCodeAt(0)).assertEqual(0);

      }
      {
        let dEn10 = new util.TextDecoder();
        expect(dEn10.decodeToString(new Uint8Array([0x20]))).assertEqual(' ');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_0800
     * @tc.name testTdCtorEncoding002
     * @tc.desc Verify TextDecoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dEn11 = new util.TextDecoder();
        expect(dEn11.decodeToString(new Uint8Array([0x41]))).assertEqual('A');

      }
      {
        let dEn12 = new util.TextDecoder();
        expect(dEn12.decodeToString(new Uint8Array([0x5A]))).assertEqual('Z');

      }
      {
        let dEn13 = new util.TextDecoder();
        expect(dEn13.decodeToString(new Uint8Array([0x30]))).assertEqual('0');

      }
      {
        let dEn14 = new util.TextDecoder();
        expect(dEn14.decodeToString(new Uint8Array([0x0A]))).assertEqual('\n');

      }
      {
        let dEn15 = new util.TextDecoder();
        expect(dEn15.decodeToString(new Uint8Array([0x09]))).assertEqual('\t');

      }
      {
        let dEn16 = new util.TextDecoder();
        expect(dEn16.decodeToString(new Uint8Array([0x5C]))).assertEqual('\\');

      }
      {
        let dEn17 = new util.TextDecoder();
        expect(dEn17.decodeToString(new Uint8Array([0x22]))).assertEqual('"');

      }
      {
        let dEn18 = new util.TextDecoder();
        expect(dEn18.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0x61]))).assertEqual('你a');

      }
      {
        let dEn19 = new util.TextDecoder();
        expect(dEn19.decodeToString(new Uint8Array([0x61, 0xE4, 0xBD, 0xA0]))).assertEqual('a你');

      }
      {
        let dEn20 = new util.TextDecoder();
        let rEn20: string = dEn20.decodeToString(new Uint8Array([0xE4, 0xB8, 0xAD]));
        expect(rEn20.length).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_0900
     * @tc.name testTdCtorEncoding003
     * @tc.desc Verify TextDecoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dEn21 = new util.TextDecoder();
        let rEn21: string = dEn21.decodeToString(new Uint8Array([0xE4, 0xB8, 0xAD, 0x61]));
        expect(rEn21.length).assertEqual(2);

      }
      {
        let dEn22 = new util.TextDecoder();
        let rEn22: string = dEn22.decodeToString(new Uint8Array([0x44, 0x00]));
        expect(rEn22.length).assertEqual(2);

      }
      {
        let dEn23 = new util.TextDecoder();
        expect(dEn23.decodeToString(new Uint8Array([0x44, 0x00])).charCodeAt(1)).assertEqual(0);

      }
      {
        let dEn24 = new util.TextDecoder();
        expect(dEn24.decodeToString(new Uint8Array([0x00, 0x44])).charCodeAt(0)).assertEqual(0);

      }
      {
        let dEn25 = new util.TextDecoder();
        expect(dEn25.decodeToString(new Uint8Array([0xD6, 0xD0])).charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dEn26 = new util.TextDecoder();
        let rEn26: string = dEn26.decodeToString(new Uint8Array([0xA4, 0xA4]));
        expect(rEn26.length).assertEqual(2);

      }
      {
        let dEn27 = new util.TextDecoder();
        expect(dEn27.decodeToString(new Uint8Array([0xE9])).charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dEn28 = new util.TextDecoder();
        expect(dEn28.decodeToString(new Uint8Array([0x2D, 0x4E]))).assertEqual('-N');

      }
      {
        let dCm6 = new util.TextDecoder();
        for (let i = 0; i < 128; i++) {
          let out: string = dCm6.decodeToString(new Uint8Array([i]));
          expect(out.charCodeAt(0)).assertEqual(i);
        }

      }
      {
        let dEm4 = new util.TextDecoder();
        let rEm4: string = dEm4.decodeToString(new Uint8Array([0x00, 0x41, 0x00]));
        expect(rEm4.charAt(1).toString()).assertEqual('A');
        expect(rEm4.length).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1000
     * @tc.name testTdCtorEncoding004
     * @tc.desc Verify TextDecoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encIt1 = new util.TextEncoder();
        let bytesIt1: Uint8Array = encIt1.encodeInto('a');
        let decIt1 = new util.TextDecoder();
        expect(decIt1.decodeToString(bytesIt1)).assertEqual('a');

      }
      {
        let decIt6a = new util.TextDecoder();
        let decIt6b = util.TextDecoder.create('utf-8');
        expect(decIt6a.decodeToString(new Uint8Array([0xE4, 0xB8, 0xAD]))).assertEqual(
          decIt6b.decodeToString(new Uint8Array([0xE4, 0xB8, 0xAD])));

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding).assertEqual('utf-8');

      }
      {
        let typedDecoder: util.TextDecoder = new util.TextDecoder();
        expect(typedDecoder.encoding).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.length).assertEqual(5);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.charAt(0).toString()).assertEqual('u');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.charAt(2).toString()).assertEqual('f');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.charAt(4).toString()).assertEqual('8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.charAt(decoder.encoding.length - 1).toString()).assertEqual('8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.indexOf('-')).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1100
     * @tc.name testTdCtorEncoding005
     * @tc.desc Verify TextDecoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.indexOf('utf-8')).assertEqual(0);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.lastIndexOf('8')).assertEqual(4);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.startsWith('utf')).assertTrue();
        expect(decoder.encoding).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.endsWith('8')).assertTrue();
        expect(decoder.encoding).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.toUpperCase()).assertEqual('UTF-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.charCodeAt(0)).assertEqual(117);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.codePointAt(0)).assertEqual(117);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.substring(1, 3)).assertEqual('tf');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.slice(0, 3)).assertEqual('utf');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.split('-').length).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1200
     * @tc.name testTdCtorEncoding006
     * @tc.desc Verify TextDecoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.TextDecoder();
        let parts: string[] = decoder.encoding.split('-');
        expect(parts[0]).assertEqual('utf');
        expect(parts[1]).assertEqual('8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.includes('utf-8')).assertTrue();
        expect(decoder.encoding).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.trim()).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding).assertEqual(decoder.encoding.toLowerCase());

      }
      {
        let decoder = new util.TextDecoder();
        let computed: string = 'utf-' + '8';
        expect(decoder.encoding).assertEqual(computed);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.concat('')).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.repeat(1)).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.padStart(5, 'x')).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.replace('utf', 'UTF')).assertEqual('UTF-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.search('8')).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1300
     * @tc.name testTdCtorEncoding007
     * @tc.desc Verify TextDecoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.localeCompare('utf-8')).assertEqual(0);

      }
      {
        let d1 = new util.TextDecoder();
        let d2 = new util.TextDecoder();
        expect(d1.encoding).assertEqual(d2.encoding);

      }
      {
        let d1 = new util.TextDecoder();
        let d2 = new util.TextDecoder();
        let d3 = new util.TextDecoder();
        expect(d1.encoding).assertEqual(d2.encoding);
        expect(d2.encoding).assertEqual(d3.encoding);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding.length).assertEqual('utf-8'.length);

      }
      {
        let r1 = new util.TextDecoder().encoding;
        let r2 = new util.TextDecoder().encoding;
        expect(r1).assertEqual('utf-8');
        expect(r2).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.encoding + decoder.encoding).assertEqual('utf-8utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        let encoder = new util.TextEncoder();
        expect(decoder.encoding).assertEqual('utf-8');
        expect(encoder.encoding).assertEqual('utf-8');

      }
      {
        let decoder = new util.TextDecoder();
        decoder.decodeToString(new Uint8Array([0x61]));
        expect(decoder.encoding).assertEqual('utf-8');

      }
      {
        expect(new util.TextDecoder().encoding).assertEqual('utf-8');

      }
      {
        expect(new util.TextDecoder().encoding.length).assertEqual(5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1400
     * @tc.name testTdCtorEncoding008
     * @tc.desc Verify TextDecoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(new util.TextDecoder().encoding.charAt(0).toString()).assertEqual('u');

      }
      {
        expect(new util.TextDecoder().encoding.toUpperCase()).assertEqual('UTF-8');

      }
      {
        expect(new util.TextDecoder().encoding.indexOf('-')).assertEqual(3);

      }
      {
        let ce1 = new util.TextDecoder().encoding;
        let ce2 = new util.TextDecoder().encoding;
        expect(ce1).assertEqual(ce2);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]))).assertEqual('你');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63]))).assertEqual('abc');

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]))).assertEqual('😀');

      }
      {
        let decoder = new util.TextDecoder();
        let enc: string = decoder.encoding;
        expect(enc.charAt(0).toString()).assertEqual('u');

      }
      {
        let decoder = new util.TextDecoder();
        let enc: string = decoder.encoding;
        expect(enc.charCodeAt(0)).assertEqual(0x75);
        expect(enc.length).assertEqual(5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1500
     * @tc.name testTdCtorUnicode001
     * @tc.desc Verify TextDecoder constructor with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encIt2 = new util.TextEncoder();
        let bytesIt2: Uint8Array = encIt2.encodeInto('中');
        let decIt2 = new util.TextDecoder();
        expect(decIt2.decodeToString(bytesIt2)).assertEqual('中');

      }
      {
        let encIt4 = new util.TextEncoder();
        encIt4.encodeInto('x');
        let decIt4 = new util.TextDecoder();
        expect(decIt4.decodeToString(new Uint8Array([0xE4, 0xB8, 0xAD]))).assertEqual('中');

      }
      {
        let encIt5 = new util.TextEncoder();
        let decIt5a = new util.TextDecoder();
        let decIt5b = new util.TextDecoder();
        let rIt5a: string = decIt5a.decodeToString(encIt5.encodeInto('a'));
        let rIt5b: string = decIt5b.decodeToString(encIt5.encodeInto('中'));
        expect(rIt5a).assertEqual('a');
        expect(rIt5b).assertEqual('中');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1600
     * @tc.name testTdCtorEmoji001
     * @tc.desc Verify TextDecoder constructor with emoji and surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorEmoji001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encIt3 = new util.TextEncoder();
        let bytesIt3: Uint8Array = encIt3.encodeInto('😀');
        let decIt3 = new util.TextDecoder();
        expect(decIt3.decodeToString(bytesIt3)).assertEqual('😀');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1700
     * @tc.name testTdCtorInvisible001
     * @tc.desc Verify TextDecoder constructor with invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorInvisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dFa17b = new util.TextDecoder();
        let rFa17b: string = dFa17b.decodeToString(new Uint8Array([0xFF, 0x61]));
        expect(rFa17b.charAt(0).toString()).assertEqual('�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1800
     * @tc.name testTdCtorControl001
     * @tc.desc Verify TextDecoder constructor with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dEm3 = new util.TextDecoder();
        let rEm3a: string = dEm3.decodeToString(new Uint8Array([0x00]));
        let rEm3b: string = dEm3.decodeToString(new Uint8Array([0x00]));
        expect(rEm3a.charCodeAt(0)).assertEqual(0);
        expect(rEm3b.charCodeAt(0)).assertEqual(0);

      }
      {
        let dEm5 = new util.TextDecoder();
        let rEm5: string = dEm5.decodeToString(new Uint8Array([0x41, 0x00, 0x42, 0x00]));
        expect(rEm5.length).assertEqual(4);
        expect(rEm5.charCodeAt(2)).assertEqual(0x42);

      }
      {
        let dEm6 = new util.TextDecoder();
        let rEm6: string = dEm6.decodeToString(new Uint8Array([0x00, 0x7F]));
        expect(rEm6.charCodeAt(1)).assertEqual(0x7F);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.decodeToString(new Uint8Array([0x61, 0x00, 0x62])).length).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_1900
     * @tc.name testTdCtorBoundary001
     * @tc.desc Verify TextDecoder constructor with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dAr7 = new util.TextDecoder();
        dAr7.decodeToString(new Uint8Array(0));
        expect(dAr7.decodeToString(new Uint8Array([0x38]))).assertEqual('8');

      }
      {
        let dEm1 = new util.TextDecoder();
        let rEm1: string = dEm1.decodeToString(new Uint8Array(0));
        expect(rEm1.length).assertEqual(0);

      }
      {
        let decoder = new util.TextDecoder();
        expect(decoder.decodeToString(new Uint8Array(0))).assertEqual('');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_2000
     * @tc.name testTdCtorConsistency001
     * @tc.desc Verify TextDecoder constructor state consistency and shared options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dEm8 = new util.TextDecoder();
        let src: Uint8Array = new Uint8Array([0xE4, 0xB8, 0xAD]);
        let rEm8a: string = dEm8.decodeToString(src);
        let rEm8b: string = dEm8.decodeToString(src);
        expect(rEm8a).assertEqual(rEm8b);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_2100
     * @tc.name testTdCtorBasic001
     * @tc.desc Verify TextDecoder constructor with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dAr1 = new util.TextDecoder();
        expect(dAr1.decodeToString(new Uint8Array([0x31]))).assertEqual('1');

      }
      {
        for (let i = 0; i < 12; i++) {
          let dAr2 = new util.TextDecoder();
          expect(dAr2.decodeToString(new Uint8Array([0x32]))).assertEqual('2');
        }

      }
      {
        let dAr3 = new util.TextDecoder();
        expect(dAr3.decodeToString(new Uint8Array([0x33]))).assertEqual('3');

      }
      {
        let dAr4a = new util.TextDecoder();
        let dAr4b = new util.TextDecoder();
        expect(dAr4a.decodeToString(new Uint8Array([0x34, 0x35]))).assertEqual(
          dAr4b.decodeToString(new Uint8Array([0x34, 0x35])));

      }
      {
        let dAr5: util.TextDecoder = new util.TextDecoder();
        expect(dAr5.decodeToString(new Uint8Array([0x36]))).assertEqual('6');

      }
      {
        expect(new util.TextDecoder().decodeToString(new Uint8Array([0x37]))).assertEqual('7');

      }
      {
        let dAr8a = new util.TextDecoder();
        let r8a: string = dAr8a.decodeToString(new Uint8Array([0x39]));
        let dAr8b = new util.TextDecoder();
        let r8b: string = dAr8b.decodeToString(new Uint8Array([0x40]));
        expect(r8a).assertEqual('9');
        expect(r8b).assertEqual('@');

      }
      {
        let dCm1 = new util.TextDecoder();
        expect(dCm1.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]))).assertEqual('你好');

      }
      {
        let dCm2 = new util.TextDecoder();
        expect(dCm2.decodeToString(new Uint8Array([0xF0, 0x9F, 0x91, 0x8D]))).assertEqual('👍');

      }
      {
        let dCm10 = new util.TextDecoder();
        let mixed: Uint8Array = new Uint8Array([0x61, 0xE4, 0xB8, 0xAD, 0x62, 0xF0, 0x9F, 0x98, 0x80, 0x63]);
        expect(dCm10.decodeToString(mixed)).assertEqual('a中b😀c');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_CONSTRUCTOR_2200
     * @tc.name testTdCtorBasic002
     * @tc.desc Verify TextDecoder constructor with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdCtorBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dEm2 = new util.TextDecoder();
        let longBytes: number[] = [];
        for (let i = 0; i < 100; i++) {
          longBytes.push(0x61);
        }
        let rEm2: string = dEm2.decodeToString(new Uint8Array(longBytes));
        expect(rEm2.length).assertEqual(100);

      }
      {
        let dEm7 = new util.TextDecoder();
        expect(dEm7.decodeToString(new Uint8Array(1)).charCodeAt(0)).assertEqual(0);

      }
      {
        let dFa17c = new util.TextDecoder();
        let rFa17c: string = dFa17c.decodeToString(new Uint8Array([0xFF, 0x61]));
        expect(rFa17c.charCodeAt(0)).assertEqual(0xFFFD);

      }
      {
        let dCm3c = new util.TextDecoder();
        let rCm3c: string = dCm3c.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xE4, 0xB8, 0xAD]));
        expect(rCm3c.charCodeAt(0)).assertEqual(0xFEFF);

      }
      {
        let da = new util.TextDecoder();
        let db = new util.TextDecoder();
        expect(da).not().assertEqual(db);

      }
      {
        let decoder = new util.TextDecoder();
        let enc: string = decoder.encoding;
        let fatalVal: boolean = decoder.fatal;
        let bomVal: boolean = decoder.ignoreBOM;
        expect(enc).assertEqual('utf-8');
        expect(fatalVal).assertFalse();
        expect(bomVal).assertFalse();

      }
      {
        expect(new util.TextDecoder().decodeToString(new Uint8Array([0x61]))).assertEqual('a');

      }
    });

  });
}
