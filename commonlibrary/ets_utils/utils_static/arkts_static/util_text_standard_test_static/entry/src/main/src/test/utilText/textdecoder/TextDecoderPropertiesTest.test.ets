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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-static/src/main/indexStatic';

import Utils from '../../Util.test';

import util from '@ohos.util';

export default function TextDecoderPropertiesTest(): void {
  describe('TextDecoderPropertiesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_0100
     * @tc.name testTdPropsThrows001
     * @tc.desc Verify TextDecoder properties throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsR9: util.TextDecoderOptions = { fatal: true };
        let dR9 = util.TextDecoder.create('utf-8', optsR9);
        expect(dR9.fatal).assertTrue();
        try { dR9.decodeToString(new Uint8Array([0xFF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_0200
     * @tc.name testTdPropsFatal001
     * @tc.desc Verify TextDecoder properties with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsFatal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dAr1 = new util.TextDecoder();
        expect(dAr1.encoding).assertEqual('utf-8');
        expect(dAr1.fatal).assertFalse();
        expect(dAr1.ignoreBOM).assertFalse();

      }
      {
        let dAr2 = util.TextDecoder.create();
        expect(dAr2.encoding).assertEqual('utf-8');
        expect(dAr2.fatal).assertFalse();
        expect(dAr2.ignoreBOM).assertFalse();

      }
      {
        let optsEn1: util.TextDecoderOptions = { fatal: true };
        let dEn1 = util.TextDecoder.create('utf-8', optsEn1);
        expect(dEn1.encoding).assertEqual('utf-8');
        expect(dEn1.fatal).assertTrue();

      }
      {
        let optsO2: util.TextDecoderOptions = { fatal: true };
        let dO2 = util.TextDecoder.create('utf-8', optsO2);
        expect(dO2.fatal).assertTrue();
        expect(dO2.ignoreBOM).assertFalse();

      }
      {
        let optsO3: util.TextDecoderOptions = { ignoreBOM: true };
        let dO3 = util.TextDecoder.create('utf-8', optsO3);
        expect(dO3.ignoreBOM).assertTrue();
        expect(dO3.fatal).assertFalse();

      }
      {
        let optsO5: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dO5 = util.TextDecoder.create('utf-8', optsO5);
        expect(dO5.fatal).assertFalse();
        expect(dO5.ignoreBOM).assertFalse();

      }
      {
        let optsO6: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let dO6 = util.TextDecoder.create('utf-8', optsO6);
        expect(dO6.fatal).assertTrue();
        expect(dO6.ignoreBOM).assertFalse();

      }
      {
        let optsO7: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dO7 = util.TextDecoder.create('utf-8', optsO7);
        expect(dO7.fatal).assertFalse();
        expect(dO7.ignoreBOM).assertTrue();

      }
      {
        let optsO8a: util.TextDecoderOptions = { ignoreBOM: true, fatal: true };
        let optsO8b: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dO8a = util.TextDecoder.create('utf-8', optsO8a);
        let dO8b = util.TextDecoder.create('utf-8', optsO8b);
        expect(dO8a.fatal).assertEqual(dO8b.fatal);
        expect(dO8a.ignoreBOM).assertEqual(dO8b.ignoreBOM);

      }
      {
        let optsO9: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dO9a = util.TextDecoder.create('utf-8', optsO9);
        let dO9b = util.TextDecoder.create('utf-8', optsO9);
        expect(dO9a.ignoreBOM).assertEqual(dO9b.ignoreBOM);
        expect(dO9a.fatal).assertEqual(dO9b.fatal);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_0300
     * @tc.name testTdPropsFatal002
     * @tc.desc Verify TextDecoder properties with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsFatal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsO10: util.TextDecoderOptions = { fatal: true };
        let dO10 = util.TextDecoder.create('gbk', optsO10);
        expect(dO10.encoding).assertEqual('gbk');
        expect(dO10.fatal).assertTrue();
        expect(dO10.ignoreBOM).assertFalse();

      }
      {
        let dR2 = util.TextDecoder.create('utf-8');
        expect(dR2.fatal).assertFalse();

      }
      {
        let optsR5: util.TextDecoderOptions = { fatal: true };
        let dR5 = util.TextDecoder.create('utf-8', optsR5);
        let f1: boolean = dR5.fatal;
        expect(f1).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let td = util.TextDecoder.create('big5', opts);
        expect(td.fatal).assertFalse();

      }
      {
        let td = util.TextDecoder.create('euc-jp');
        expect(td.fatal).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let td = util.TextDecoder.create('iso-8859-1', opts);
        expect(td.fatal).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let td = util.TextDecoder.create('big5', opts);
        expect(td.fatal).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let td = util.TextDecoder.create('big5', opts);
        expect(td.ignoreBOM).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let td = util.TextDecoder.create('euc-jp', opts);
        expect(td.fatal).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let td = util.TextDecoder.create('euc-jp', opts);
        expect(td.ignoreBOM).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_0400
     * @tc.name testTdPropsFatal003
     * @tc.desc Verify TextDecoder properties with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsFatal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let td = util.TextDecoder.create('shift_jis');
        expect(td.fatal).assertFalse();

      }
      {
        let td = new util.TextDecoder();
        let uint8: Uint8Array = new Uint8Array([0x61]);
        td.decodeToString(uint8);
        expect(td.fatal).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let a = util.TextDecoder.create('utf-16le', opts).fatal;
        let b = util.TextDecoder.create('utf-16le', opts).fatal;
        expect(a).assertTrue();
        expect(b).assertTrue();

      }
      {
        let d1 = util.TextDecoder.create('utf-16le');
        let d2 = util.TextDecoder.create('gbk');
        expect(d1.fatal).assertFalse();
        expect(d2.fatal).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let td = util.TextDecoder.create('utf-8', opts);
        opts.fatal = false;
        expect(td.fatal).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let td = util.TextDecoder.create('utf-8', opts);
        expect(td.fatal).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let td = util.TextDecoder.create('utf-8', opts);
        expect(td.ignoreBOM).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let td = util.TextDecoder.create('utf-8', opts);
        let uint8: Uint8Array = new Uint8Array([0xFF]);
        try {
          td.decodeToString(uint8);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let td = util.TextDecoder.create('utf-8', opts);
        let uint8: Uint8Array = new Uint8Array([0xFF]);
        let r = td.decodeToString(uint8);
        expect(r).assertEqual('\ufffd');

      }
      {
        let optsD5: util.TextDecoderOptions = { fatal: true };
        let dd5 = util.TextDecoder.create('utf-8', optsD5);
        let rd5 = dd5.decodeToString(new Uint8Array([0x61, 0x62]));
        expect(rd5).assertEqual('ab');
        expect(dd5.fatal).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_0500
     * @tc.name testTdPropsFatal004
     * @tc.desc Verify TextDecoder properties with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsFatal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let fd2 = new util.TextDecoder();
        let f2a = fd2.fatal;
        let f2b = fd2.fatal;
        expect(f2a).assertFalse();
        expect(f2b).assertFalse();

      }
      {
        let optsF5: util.TextDecoderOptions = { fatal: true };
        let fd5 = util.TextDecoder.create('utf-8', optsF5);
        let rf5 = fd5.decodeToString(new Uint8Array([0x61]));
        expect(rf5).assertEqual('a');
        expect(fd5.fatal).assertTrue();

      }
      {
        let gd4 = new util.TextDecoder();
        let fullBytes: Uint8Array = new Uint8Array(256);
        let idx4: int;
        for (idx4 = 0; idx4 < 256; idx4++) {
          fullBytes.$_set(idx4, idx4);
        }
        gd4.decodeToString(fullBytes);
        expect(gd4.encoding).assertEqual('utf-8');
        expect(gd4.fatal).assertFalse();
        expect(gd4.ignoreBOM).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_0600
     * @tc.name testTdPropsBom001
     * @tc.desc Verify TextDecoder properties with ignoreBOM and BOM handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsBom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsO11: util.TextDecoderOptions = { ignoreBOM: false };
        let dO11 = util.TextDecoder.create('utf-8', optsO11);
        expect(dO11.ignoreBOM).assertFalse();
        expect(dO11.fatal).assertFalse();

      }
      {
        let dR3 = util.TextDecoder.create('utf-8');
        expect(dR3.ignoreBOM).assertFalse();

      }
      {
        let optsR6: util.TextDecoderOptions = { ignoreBOM: true };
        let dR6 = util.TextDecoder.create('utf-8', optsR6);
        let b1: boolean = dR6.ignoreBOM;
        expect(b1).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let td = util.TextDecoder.create('windows-1251', opts);
        expect(td.ignoreBOM).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: false };
        let td = util.TextDecoder.create('windows-1251', opts);
        expect(td.ignoreBOM).assertFalse();

      }
      {
        let td = util.TextDecoder.create('shift_jis');
        expect(td.ignoreBOM).assertFalse();

      }
      {
        let td = new util.TextDecoder();
        let uint8: Uint8Array = new Uint8Array([0x62]);
        td.decodeToString(uint8);
        expect(td.ignoreBOM).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let a = util.TextDecoder.create('utf-16be', opts).ignoreBOM;
        let b = util.TextDecoder.create('utf-16be', opts).ignoreBOM;
        expect(a).assertTrue();
        expect(b).assertTrue();

      }
      {
        let td = new util.TextDecoder();
        let uint8: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]);
        td.decodeToString(uint8);
        expect(uint8[3]).assertEqual(0x61);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let td = util.TextDecoder.create('utf-8', opts);
        opts.ignoreBOM = false;
        expect(td.ignoreBOM).assertTrue();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_0700
     * @tc.name testTdPropsBom002
     * @tc.desc Verify TextDecoder properties with ignoreBOM and BOM handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsBom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let td = util.TextDecoder.create('utf-8', opts);
        let uint8: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]);
        let r = td.decodeToString(uint8);
        expect(r).assertEqual('a');

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: false };
        let td = util.TextDecoder.create('utf-8', opts);
        let uint8: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]);
        let r = td.decodeToString(uint8);
        expect(r).assertEqual('\uFEFFa');

      }
      {
        let optsE4: util.TextDecoderOptions = { ignoreBOM: false };
        let de4 = util.TextDecoder.create('utf-8', optsE4);
        let re4 = de4.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]));
        expect(re4).assertEqual('\uFEFFabc');

      }
      {
        let fd3 = new util.TextDecoder();
        let f3a = fd3.ignoreBOM;
        let f3b = fd3.ignoreBOM;
        expect(f3a).assertFalse();
        expect(f3b).assertFalse();

      }
      {
        let optsF6: util.TextDecoderOptions = { ignoreBOM: true };
        let fd6 = util.TextDecoder.create('utf-8', optsF6);
        fd6.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(fd6.ignoreBOM).assertTrue();

      }
      {
        let optsG5: util.TextDecoderOptions = { ignoreBOM: true };
        let gd5 = util.TextDecoder.create('utf-16le', optsG5);
        let rg5 = gd5.decodeToString(new Uint8Array([0xFF, 0xFE, 0x61, 0x00]));
        expect(rg5).assertEqual('a');
        expect(gd5.ignoreBOM).assertTrue();

      }
      {
        let optsG6: util.TextDecoderOptions = { ignoreBOM: false };
        let gd6 = util.TextDecoder.create('utf-16le', optsG6);
        let rg6 = gd6.decodeToString(new Uint8Array([0xFF, 0xFE, 0x61, 0x00]));
        expect(rg6).assertEqual('\uFEFFa');
        expect(gd6.ignoreBOM).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_0800
     * @tc.name testTdPropsEncoding001
     * @tc.desc Verify TextDecoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsAr4: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dAr4 = util.TextDecoder.create('utf-8', optsAr4);
        expect(dAr4.encoding).assertEqual('utf-8');
        expect(dAr4.fatal).assertTrue();
        expect(dAr4.ignoreBOM).assertTrue();

      }
      {
        let dAr6a = new util.TextDecoder();
        let dAr6b = util.TextDecoder.create();
        expect(dAr6a.encoding).assertEqual(dAr6b.encoding);

      }
      {
        let dAl3 = util.TextDecoder.create('us-ascii');
        expect(dAl3.encoding).assertEqual('us-ascii');

      }
      {
        let dR4 = util.TextDecoder.create('utf-16le');
        let e1: string = dR4.encoding;
        expect(e1).assertEqual('utf-16le');

      }
      {
        let dR7a = util.TextDecoder.create('gbk');
        let dR7b = util.TextDecoder.create('big5');
        expect(dR7a.encoding).assertEqual('gbk');
        expect(dR7b.encoding).assertEqual('big5');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('gbk', opts);
        expect(td.encoding).assertEqual('gbk');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('gb2312', opts);
        expect(td.encoding).assertEqual('gb2312');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('koi8-r', opts);
        expect(td.encoding).assertEqual('koi8-r');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('macintosh', opts);
        expect(td.encoding).assertEqual('macintosh');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('ibm866', opts);
        expect(td.encoding).assertEqual('ibm866');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_0900
     * @tc.name testTdPropsEncoding002
     * @tc.desc Verify TextDecoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('euc-kr', opts);
        expect(td.encoding).assertEqual('euc-kr');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('windows-1252', opts);
        expect(td.encoding).assertEqual('windows-1252');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('iso-8859-2', opts);
        expect(td.encoding).assertEqual('iso-8859-2');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('windows-1250', opts);
        expect(td.encoding).assertEqual('windows-1250');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('gb18030', opts);
        expect(td.encoding).assertEqual('gb18030');

      }
      {
        let opts: util.TextDecoderOptions = {};
        let td = util.TextDecoder.create('utf-16be', opts);
        expect(td.encoding).assertEqual('utf-16be');

      }
      {
        let td = util.TextDecoder.create('windows-1251');
        expect(td.encoding.length).assertEqual(12);

      }
      {
        let td = util.TextDecoder.create('iso-2022-jp');
        expect(td.encoding.length).assertEqual(11);

      }
      {
        let td = util.TextDecoder.create('koi8-u');
        expect(td.encoding.length).assertEqual(6);

      }
      {
        let td = util.TextDecoder.create('euc-kr');
        expect(td.encoding.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_1000
     * @tc.name testTdPropsEncoding003
     * @tc.desc Verify TextDecoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let td = new util.TextDecoder();
        let uint8: Uint8Array = new Uint8Array([0x61, 0x62, 0x63]);
        td.decodeToString(uint8);
        expect(td.encoding).assertEqual('utf-8');

      }
      {
        let td = new util.TextDecoder();
        let uint8: Uint8Array = new Uint8Array([97, 98, 99]);
        td.decodeToString(uint8);
        expect(uint8[0]).assertEqual(97);

      }
      {
        let d1 = new util.TextDecoder();
        let opts: util.TextDecoderOptions = { fatal: true };
        let d2 = util.TextDecoder.create('gbk', opts);
        let uint8: Uint8Array = new Uint8Array([0x61]);
        d2.decodeToString(uint8);
        expect(d1.encoding).assertEqual('utf-8');

      }
      {
        let da3 = util.TextDecoder.create('utf-8');
        expect(da3.encoding).assertEqual('utf-8');
        expect(da3.fatal).assertFalse();
        expect(da3.ignoreBOM).assertFalse();

      }
      {
        let da5 = util.TextDecoder.create('utf-8', undefined);
        expect(da5.encoding).assertEqual('utf-8');

      }
      {
        let da6 = util.TextDecoder.create(undefined, undefined);
        expect(da6.encoding).assertEqual('utf-8');

      }
      {
        let fd1 = new util.TextDecoder();
        let f1a = fd1.encoding;
        let f1b = fd1.encoding;
        expect(f1a).assertEqual('utf-8');
        expect(f1b).assertEqual('utf-8');

      }
      {
        let fd4 = util.TextDecoder.create('utf-16le');
        fd4.decodeToString(new Uint8Array([0x61, 0x00]));
        expect(fd4.encoding).assertEqual('utf-16le');

      }
      {
        let optsF7a: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let fd7a = util.TextDecoder.create('utf-16le', optsF7a);
        let fd7b = new util.TextDecoder();
        expect(fd7a.encoding).assertEqual('utf-16le');
        expect(fd7a.fatal).assertTrue();
        expect(fd7a.ignoreBOM).assertTrue();
        expect(fd7b.encoding).assertEqual('utf-8');
        expect(fd7b.fatal).assertFalse();
        expect(fd7b.ignoreBOM).assertFalse();

      }
      {
        let gd2 = new util.TextDecoder();
        let rg2 = gd2.decodeToString(new Uint8Array([0x61]));
        expect(rg2).assertEqual('a');
        expect(gd2.encoding).assertEqual('utf-8');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_1100
     * @tc.name testTdPropsEncoding004
     * @tc.desc Verify TextDecoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let gd3 = new util.TextDecoder();
        let rg3 = gd3.decodeToString(new Uint8Array([0x41, 0x41, 0x41]));
        expect(rg3).assertEqual('AAA');
        expect(gd3.encoding).assertEqual('utf-8');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_1200
     * @tc.name testTdPropsBoundary001
     * @tc.desc Verify TextDecoder properties with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let gd1 = new util.TextDecoder();
        let rg1 = gd1.decodeToString(new Uint8Array([]));
        expect(rg1).assertEqual('');
        expect(gd1.encoding).assertEqual('utf-8');
        expect(gd1.fatal).assertFalse();
        expect(gd1.ignoreBOM).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_1300
     * @tc.name testTdPropsConsistency001
     * @tc.desc Verify TextDecoder properties state consistency and shared options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let td = new util.TextDecoder();
        let uint8: Uint8Array = new Uint8Array([97]);
        let r1 = td.decodeToString(uint8);
        uint8[0] = 98;
        let r2 = td.decodeToString(uint8);
        expect(r1).assertEqual('a');
        expect(r2).assertEqual('b');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_PROPERTIES_1400
     * @tc.name testTdPropsBasic001
     * @tc.desc Verify TextDecoder properties with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdPropsBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let td = new util.TextDecoder();
        let uint8: Uint8Array = new Uint8Array([97, 98, 99]);
        let r = td.decodeToString(uint8);
        uint8[0] = 88;
        expect(r).assertEqual('abc');

      }
      {
        let d1 = util.TextDecoder.create('utf-8');
        let d2 = util.TextDecoder.create('utf-8');
        let u: Uint8Array = new Uint8Array([97, 98, 99]);
        d1.decodeToString(u);
        expect(d2.encoding).assertEqual('utf-8');

      }
    });

  });
}
