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

export default function TextDecoderOverviewTest(): void {
  describe('TextDecoderOverviewTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_0100
     * @tc.name testTdOvFatal001
     * @tc.desc Verify TextDecoder overview with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvFatal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opts1: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let opts2: util.TextDecoderOptions = { ignoreBOM: false, fatal: true };
        let d1 = util.TextDecoder.create('utf-8', opts1);
        let d2 = util.TextDecoder.create('utf-8', opts2);
        expect(d1.fatal).assertEqual(d2.fatal);
        expect(d1.ignoreBOM).assertEqual(d2.ignoreBOM);

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0xC3]));
        expect(r).assertEqual('�');

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0xE4, 0xBD]));
        expect(r).assertEqual('�');

      }
      {
        let dec: util.TextDecoder = new util.TextDecoder();
        expect(dec.fatal).assertFalse();

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create();
        expect(dec.fatal).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        expect(dec.fatal).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        expect(dec.fatal).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        expect(dec.fatal).assertTrue();
        expect(dec.ignoreBOM).assertTrue();

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        dec.decodeToString(new Uint8Array([0x61]));
        expect(dec.fatal).assertFalse();

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_0200
     * @tc.name testTdOvBom001
     * @tc.desc Verify TextDecoder overview with ignoreBOM and BOM handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvBom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: util.TextDecoder = new util.TextDecoder();
        expect(dec.ignoreBOM).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        expect(dec.ignoreBOM).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        expect(dec.ignoreBOM).assertFalse();

      }
      {
        expect(util.TextDecoder.create().ignoreBOM).assertFalse();

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.charCodeAt(0)).assertEqual(0xFEFF);

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.charCodeAt(0)).assertEqual(0x61);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.charCodeAt(0)).assertEqual(0xFEFF);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_0300
     * @tc.name testTdOvStream001
     * @tc.desc Verify TextDecoder overview with streaming chunk decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvStream001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opts: util.DecodeToStringOptions = { stream: false };
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0x62, 0x63]), opts);
        expect(r).assertEqual('bc');

      }
      {
        let opts: util.DecodeToStringOptions = { stream: false };
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0x61]), opts);
        expect(r).assertEqual('a');

      }
      {
        let opts: util.DecodeToStringOptions = { stream: true };
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0x61]), opts);
        expect(r).assertEqual('a');

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let optsT: util.DecodeToStringOptions = { stream: true };
        let optsF: util.DecodeToStringOptions = { stream: false };
        let r1 = d.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), optsT);
        let r2 = d.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), optsF);
        expect(r1).assertEqual(r2);

      }
      {
        let opts: util.DecodeToStringOptions = { stream: true };
        let d = util.TextDecoder.create('utf-8');
        let r1 = d.decodeToString(new Uint8Array([0x61, 0x62]), opts);
        let r2 = d.decodeToString(new Uint8Array([0x63]), opts);
        expect(r1).assertEqual('ab');
        expect(r2).assertEqual('c');

      }
      {
        let input: Uint8Array = new Uint8Array([0xE4, 0xB8, 0xAD]);
        let dOpts: util.DecodeToStringOptions = { stream: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        dec.decodeToString(input, dOpts);
        expect(input.$_get(0)).assertEqual(0xE4);
        expect(input.$_get(2)).assertEqual(0xAD);

      }
      {
        let dOpts: util.DecodeToStringOptions = { stream: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0x61, 0x62, 0x63]), dOpts);
        expect(out).assertEqual('abc');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_0400
     * @tc.name testTdOvEncoding001
     * @tc.desc Verify TextDecoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0x5A]));
        expect(r).assertEqual('Z');

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0xC3, 0xB1]));
        expect(r).assertEqual('ñ');

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0xE4, 0xB8, 0xAD]));
        expect(r).assertEqual('中');

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0xF0, 0xA0, 0x80, 0x80]));
        expect(r).assertEqual('𠀀');

      }
      {
        let d = util.TextDecoder.create('utf-16le');
        let r = d.decodeToString(new Uint8Array([0x3D, 0xD8, 0x00, 0xDE]));
        expect(r).assertEqual('😀');

      }
      {
        let d = util.TextDecoder.create('gb2312');
        let r = d.decodeToString(new Uint8Array([0xC4, 0xE3]));
        expect(r).assertEqual('你');

      }
      {
        let d = util.TextDecoder.create('gb18030');
        let r = d.decodeToString(new Uint8Array([0x95, 0x32, 0x83, 0x36]));
        expect(r).assertEqual('𠀊');

      }
      {
        let d = util.TextDecoder.create('big5');
        let r = d.decodeToString(new Uint8Array([0xA4, 0xA4]));
        expect(r).assertEqual('中');

      }
      {
        let d = util.TextDecoder.create('iso-2022-jp');
        let r = d.decodeToString(new Uint8Array([0x61]));
        expect(r).assertEqual('a');

      }
      {
        let d = util.TextDecoder.create('euc-kr');
        let r = d.decodeToString(new Uint8Array([0xB0, 0xA1]));
        expect(r).assertEqual('가');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_0500
     * @tc.name testTdOvEncoding002
     * @tc.desc Verify TextDecoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d = util.TextDecoder.create('iso-8859-15');
        let r = d.decodeToString(new Uint8Array([0xA4]));
        expect(r).assertEqual('€');

      }
      {
        let d = util.TextDecoder.create('iso-8859-2');
        let r = d.decodeToString(new Uint8Array([0xE9]));
        expect(r).assertEqual('é');

      }
      {
        let d = util.TextDecoder.create('windows-1252');
        let r = d.decodeToString(new Uint8Array([0x80]));
        expect(r).assertEqual('€');

      }
      {
        let d = util.TextDecoder.create('windows-1251');
        let r = d.decodeToString(new Uint8Array([0xC0]));
        expect(r).assertEqual('А');

      }
      {
        let d = util.TextDecoder.create('koi8-r');
        let r = d.decodeToString(new Uint8Array([0xC1]));
        expect(r).assertEqual('а');

      }
      {
        let d = util.TextDecoder.create('ibm866');
        let r = d.decodeToString(new Uint8Array([0x80]));
        expect(r).assertEqual('А');

      }
      {
        let d = util.TextDecoder.create('x-mac-cyrillic');
        let r = d.decodeToString(new Uint8Array([0x80]));
        expect(r).assertEqual('А');

      }
      {
        let d = util.TextDecoder.create('iso-8859-7');
        let r = d.decodeToString(new Uint8Array([0xE1]));
        expect(r).assertEqual('α');

      }
      {
        let d = util.TextDecoder.create('iso-8859-8');
        let r = d.decodeToString(new Uint8Array([0xE0]));
        expect(r).assertEqual('א');

      }
      {
        let d = util.TextDecoder.create('iso-8859-6');
        let r = d.decodeToString(new Uint8Array([0xC1]));
        expect(r).assertEqual('ء');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_0600
     * @tc.name testTdOvEncoding003
     * @tc.desc Verify TextDecoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d = util.TextDecoder.create('windows-874');
        let r = d.decodeToString(new Uint8Array([0xA1]));
        expect(r).assertEqual('ก');

      }
      {
        let d = util.TextDecoder.create('UTF-8');
        let r = d.decodeToString(new Uint8Array([0x41]));
        expect(r).assertEqual('A');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let d1 = util.TextDecoder.create('utf-8', opts);
        let d2 = util.TextDecoder.create('gbk', opts);
        expect(d1.fatal).assertTrue();
        expect(d2.fatal).assertTrue();
        expect(d2.ignoreBOM).assertTrue();

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0xC3, 0xA9]));
        expect(r).assertEqual('é');

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0x7F]));
        expect(r).assertEqual('');

      }
      {
        let dec: util.TextDecoder = new util.TextDecoder();
        expect(dec.encoding).assertEqual('utf-8');

      }
      {
        let dec: util.TextDecoder = new util.TextDecoder();
        let out: string = dec.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(out).assertEqual('abc');

      }
      {
        let decA: util.TextDecoder = new util.TextDecoder();
        let decB: util.TextDecoder = util.TextDecoder.create('utf-8');
        let bytes: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        expect(decA.decodeToString(bytes)).assertEqual(decB.decodeToString(bytes));

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create();
        expect(dec.encoding).assertEqual('utf-8');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('gbk');
        expect(dec.encoding).assertEqual('gbk');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_0700
     * @tc.name testTdOvEncoding004
     * @tc.desc Verify TextDecoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16be');
        expect(dec.encoding).assertEqual('utf-16be');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('iso-8859-1');
        expect(dec.encoding).assertEqual('iso-8859-1');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('big5');
        let out: string = dec.decodeToString(new Uint8Array([0xA4, 0xA4]));
        expect(out.length).assertEqual(1);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        expect(dec.encoding).assertEqual('utf-8');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('gb2312');
        expect(dec.encoding).assertEqual('gb2312');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('big5');
        expect(dec.encoding).assertEqual('big5');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16le');
        expect(dec.encoding).assertEqual('utf-16le');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('shift_jis');
        expect(dec.encoding).assertEqual('shift_jis');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('euc-kr');
        expect(dec.encoding).assertEqual('euc-kr');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        expect(dec.encoding).assertEqual('utf-8');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_0800
     * @tc.name testTdOvEncoding005
     * @tc.desc Verify TextDecoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(util.TextDecoder.create('gbk').encoding).assertEqual('gbk');

      }
      {
        expect(util.TextDecoder.create('utf-8').decodeToString(new Uint8Array([0x61]))).assertEqual('a');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('gbk');
        let out: string = dec.decodeToString(new Uint8Array([0xD6, 0xD0]));
        expect(out).assertEqual('中');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16le');
        let out: string = dec.decodeToString(new Uint8Array([0x7D, 0x59]));
        expect(out).assertEqual('好');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0x61]));
        expect(out).assertEqual('a');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(out).assertEqual('abc');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(out.charCodeAt(0)).assertEqual(0x4F60);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0xE4, 0xB8, 0xAD]));
        expect(out.charCodeAt(0)).assertEqual(0x4E2D);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]));
        expect(out.charCodeAt(0)).assertEqual(55357);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD, 0xE4, 0xB8, 0x96, 0xE7, 0x95, 0x8C]));
        expect(out.charCodeAt(0)).assertEqual(0x4F60);
        expect(out.charCodeAt(3)).assertEqual(0x754C);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_0900
     * @tc.name testTdOvEncoding006
     * @tc.desc Verify TextDecoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16le');
        let out: string = dec.decodeToString(new Uint8Array([0x7D, 0x59]));
        expect(out.charCodeAt(0)).assertEqual(0x597D);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16be');
        let out: string = dec.decodeToString(new Uint8Array([0x59, 0x7D]));
        expect(out.charCodeAt(0)).assertEqual(0x597D);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16le');
        let out: string = dec.decodeToString(new Uint8Array([0x41, 0x00, 0x42, 0x00]));
        expect(out).assertEqual('AB');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('iso-8859-1');
        let out: string = dec.decodeToString(new Uint8Array([0xE9]));
        expect(out.charCodeAt(0)).assertEqual(0x00E9);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('iso-8859-2');
        let out: string = dec.decodeToString(new Uint8Array([0xA5]));
        expect(out.charCodeAt(0)).assertEqual(0x013D);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('iso-8859-5');
        let out: string = dec.decodeToString(new Uint8Array([0xB8]));
        expect(out.charCodeAt(0)).assertEqual(0x0418);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('koi8-r');
        let out: string = dec.decodeToString(new Uint8Array([0xC1]));
        expect(out.charCodeAt(0)).assertEqual(0x0430);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('windows-1251');
        let out: string = dec.decodeToString(new Uint8Array([0xC0]));
        expect(out.charCodeAt(0)).assertEqual(0x0410);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('windows-1252');
        let out: string = dec.decodeToString(new Uint8Array([0x80]));
        expect(out.charCodeAt(0)).assertEqual(0x20AC);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('macintosh');
        let out: string = dec.decodeToString(new Uint8Array([0x80]));
        expect(out.charCodeAt(0)).assertEqual(0x00C4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_1000
     * @tc.name testTdOvEncoding007
     * @tc.desc Verify TextDecoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: util.TextDecoder = util.TextDecoder.create('ibm866');
        let out: string = dec.decodeToString(new Uint8Array([0x80]));
        expect(out.charCodeAt(0)).assertEqual(0x0410);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('gbk');
        let out: string = dec.decodeToString(new Uint8Array([0xD6, 0xD0]));
        expect(out.charCodeAt(0)).assertEqual(0x4E2D);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('gb2312');
        let out: string = dec.decodeToString(new Uint8Array([0xD6, 0xD0]));
        expect(out.charCodeAt(0)).assertEqual(0x4E2D);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('gb18030');
        let out: string = dec.decodeToString(new Uint8Array([0xD6, 0xD0]));
        expect(out.charCodeAt(0)).assertEqual(0x4E2D);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('big5');
        let out: string = dec.decodeToString(new Uint8Array([0xA4, 0xA4]));
        expect(out.charCodeAt(0)).assertEqual(0x4E2D);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('euc-jp');
        let out: string = dec.decodeToString(new Uint8Array([0xA4, 0xA2]));
        expect(out.charCodeAt(0)).assertEqual(0x3042);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('shift_jis');
        let out: string = dec.decodeToString(new Uint8Array([0x82, 0xA0]));
        expect(out.charCodeAt(0)).assertEqual(0x3042);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('euc-kr');
        let out: string = dec.decodeToString(new Uint8Array([0xB0, 0xA1]));
        expect(out.charCodeAt(0)).assertEqual(0xAC00);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([]));
        expect(out).assertEqual('');

      }
      {
        let arr: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          arr.$_set(i, 0x61);
        }
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(arr);
        expect(out.length).assertEqual(100);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_1100
     * @tc.name testTdOvEncoding008
     * @tc.desc Verify TextDecoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        dec.decodeToString(new Uint8Array([0x61]));
        expect(dec.encoding).assertEqual('utf-8');

      }
      {
        expect(util.TextDecoder.create('gbk').decodeToString(new Uint8Array([0xD6, 0xD0]))).assertEqual('中');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('gbk');
        let gbkOut: string = dec.decodeToString(new Uint8Array([0xD6, 0xD0]));
        dec = util.TextDecoder.create('utf-16le');
        let u16Out: string = dec.decodeToString(new Uint8Array([0x7D, 0x59]));
        expect(gbkOut).assertEqual('中');
        expect(u16Out.charCodeAt(0)).assertEqual(0x597D);

      }
      {
        expect(util.TextDecoder.create('iso-8859-1').decodeToString(new Uint8Array([0xE9]))).assertEqual('é');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_1200
     * @tc.name testTdOvControl001
     * @tc.desc Verify TextDecoder overview with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0x61, 0x00, 0x62]));
        expect(r).assertEqual('a\u0000b');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_1300
     * @tc.name testTdOvBoundary001
     * @tc.desc Verify TextDecoder overview with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let bytes: number[] = [];
        for (let i = 0; i < 1000; i++) {
          bytes.push(0xE4);
          bytes.push(0xBD);
          bytes.push(0xA0);
        }
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array(bytes));
        expect(r.length).assertEqual(1000);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([]));
        expect(out.length).assertEqual(0);

      }
      {
        let full: Uint8Array = new Uint8Array([0x61, 0x62]);
        let view: Uint8Array = full.subarray(0, 0);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        expect(dec.decodeToString(view)).assertEqual('');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_1400
     * @tc.name testTdOvConsistency001
     * @tc.desc Verify TextDecoder overview state consistency and shared options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let input: Uint8Array = new Uint8Array([0xE4, 0xB8, 0xAD]);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let first: string = dec.decodeToString(input);
        let second: string = dec.decodeToString(input);
        expect(second).assertEqual(first);

      }
      {
        let full: Uint8Array = new Uint8Array([0x61, 0x62, 0x63, 0x64]);
        let viewA: Uint8Array = full.subarray(0, 2);
        let viewB: Uint8Array = full.subarray(2, 4);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        expect(dec.decodeToString(viewA)).assertEqual('ab');
        expect(dec.decodeToString(viewB)).assertEqual('cd');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_1500
     * @tc.name testTdOvBasic001
     * @tc.desc Verify TextDecoder overview with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array(0));
        expect(r).assertEqual('');

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0x61, 0xE4, 0xBD, 0xA0, 0x62]));
        expect(r).assertEqual('a你b');

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let bytes: number[] = [];
        for (let i = 0x41; i <= 0x5A; i++) {
          bytes.push(i);
        }
        let r = d.decodeToString(new Uint8Array(bytes));
        expect(r).assertEqual('ABCDEFGHIJKLMNOPQRSTUVWXYZ');

      }
      {
        let d = util.TextDecoder.create('utf-8');
        let bytes: number[] = [];
        for (let i = 0x30; i <= 0x39; i++) {
          bytes.push(i);
        }
        let r = d.decodeToString(new Uint8Array(bytes));
        expect(r).assertEqual('0123456789');

      }
      {
        let parent = new Uint8Array([0x61, 0x62, 0x63, 0x64]);
        let view = parent.subarray(1, 3);
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(view);
        expect(r).assertEqual('bc');

      }
      {
        let opts: util.DecodeToStringOptions | undefined = undefined;
        let d = util.TextDecoder.create('utf-8');
        let r = d.decodeToString(new Uint8Array([0x61]), opts);
        expect(r).assertEqual('a');

      }
      {
        let dec: util.TextDecoder = new util.TextDecoder();
        let out: string = dec.decodeToString(new Uint8Array([0x61]));
        expect(out).assertEqual('a');

      }
      {
        let n: number = new util.TextDecoder().decodeToString(new Uint8Array([0x61, 0x62, 0x63])).length;
        expect(n).assertEqual(3);

      }
      {
        let dec: util.TextDecoder = new util.TextDecoder();
        let first: string = dec.decodeToString(new Uint8Array([0x61]));
        let second: string = dec.decodeToString(new Uint8Array([0x62, 0x63]));
        expect(first).assertEqual('a');
        expect(second).assertEqual('bc');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0x61, 0x00, 0x62]));
        expect(out.charCodeAt(1)).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_OVERVIEW_1600
     * @tc.name testTdOvBasic002
     * @tc.desc Verify TextDecoder overview with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdOvBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0x00, 0x00, 0x00]));
        expect(out.length).assertEqual(3);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0x00]));
        expect(out.charCodeAt(0)).assertEqual(0);

      }
      {
        let input: Uint8Array = new Uint8Array([0x61, 0x62, 0x63]);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        dec.decodeToString(input);
        expect(input.$_get(0)).assertEqual(0x61);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let full: Uint8Array = new Uint8Array(buf);
        full.$_set(0, 0x78);
        full.$_set(1, 0x79);
        full.$_set(2, 0x7A);
        full.$_set(3, 0x61);
        full.$_set(4, 0x62);
        full.$_set(5, 0x63);
        let view: Uint8Array = full.subarray(3, 6);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        expect(dec.decodeToString(view)).assertEqual('abc');

      }
      {
        let full: Uint8Array = new Uint8Array([0x61, 0x62, 0x63, 0xE4, 0xB8, 0xAD]);
        let view: Uint8Array = full.subarray(3, 6);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(view);
        expect(out.charCodeAt(0)).assertEqual(0x4E2D);

      }
      {
        let full: Uint8Array = new Uint8Array([0x61, 0x62, 0x63]);
        let view: Uint8Array = full.subarray(0, 3);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        dec.decodeToString(view);
        expect(full.$_get(2)).assertEqual(0x63);

      }
      {
        let full: Uint8Array = new Uint8Array([0x61, 0x62, 0x63]);
        let view: Uint8Array = full.subarray(2, 3);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        expect(dec.decodeToString(view)).assertEqual('c');

      }
      {
        let out: string = util.TextDecoder.create('utf-8').decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(out.length).assertEqual(3);
        expect(out.charCodeAt(0)).assertEqual(97);

      }
    });

  });
}
