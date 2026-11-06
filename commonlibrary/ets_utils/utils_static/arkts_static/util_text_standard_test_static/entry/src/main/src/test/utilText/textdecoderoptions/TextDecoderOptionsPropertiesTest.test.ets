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

export default function TextDecoderOptionsPropertiesTest(): void {
  describe('TextDecoderOptionsPropertiesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_0100
     * @tc.name testTdoPropsThrows001
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties throw on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsF3: util.TextDecoderOptions = { fatal: true };
        let df3 = util.TextDecoder.create('utf-8', optsF3);
        try { df3.decodeToString(new Uint8Array([0xFF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsF4: util.TextDecoderOptions = { fatal: true };
        let df4 = util.TextDecoder.create('utf-8', optsF4);
        try { df4.decodeToString(new Uint8Array([0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsE2: util.TextDecoderOptions = { fatal: true };
        let de2 = util.TextDecoder.create('utf-8', optsE2);
        try { de2.decodeToString(new Uint8Array([0xFF])); } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let re2 = de2.decodeToString(new Uint8Array([0x61]));
        expect(re2).assertEqual('a');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        try {
          dec.decodeToString(new Uint8Array([0xFF]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        try {
          dec.decodeToString(new Uint8Array([0x80]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec1: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        try {
          dec1.decodeToString(new Uint8Array([0xFF]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }
        let dec2: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec2.decodeToString(new Uint8Array([0x61]));
        expect(out).assertEqual('a');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_0200
     * @tc.name testTdoPropsFatal001
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsF: util.TextDecoderOptions = { fatal: true };
        let d5 = util.TextDecoder.create('utf-8', optsF);
        let r5 = d5.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(d5.ignoreBOM).assertFalse();
        expect(r5).assertEqual('\uFEFFa');

      }
      {
        let optsB: util.TextDecoderOptions = { ignoreBOM: true };
        let d6 = util.TextDecoder.create('utf-8', optsB);
        let r6 = d6.decodeToString(new Uint8Array([0xFF, 0x61]));
        expect(d6.fatal).assertFalse();
        expect(r6).assertEqual('�' + 'a');

      }
      {
        let optsOrder1: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let optsOrder2: util.TextDecoderOptions = { ignoreBOM: true, fatal: false };
        let decA = util.TextDecoder.create('utf-8', optsOrder1);
        let decB = util.TextDecoder.create('utf-8', optsOrder2);
        let r8a = decA.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        let r8b = decB.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(r8a).assertEqual('a');
        expect(r8b).assertEqual('a');

      }
      {
        let optsShare: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let d9a = util.TextDecoder.create('utf-8', optsShare);
        let d9b = util.TextDecoder.create('utf-8', optsShare);
        expect(d9a.ignoreBOM).assertTrue();
        expect(d9b.ignoreBOM).assertTrue();

      }
      {
        let df1 = util.TextDecoder.create('utf-8');
        let rf1 = df1.decodeToString(new Uint8Array([0xFF]));
        expect(rf1).assertEqual('�');

      }
      {
        let optsF5: util.TextDecoderOptions = { fatal: true };
        let df5 = util.TextDecoder.create('utf-8', optsF5);
        try { df5.decodeToString(new Uint8Array([0xC0, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsF6: util.TextDecoderOptions = { fatal: true };
        let df6 = util.TextDecoder.create('utf-8', optsF6);
        try { df6.decodeToString(new Uint8Array([0xE4, 0x28])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsF7: util.TextDecoderOptions = { fatal: true };
        let df7 = util.TextDecoder.create('utf-8', optsF7);
        try { df7.decodeToString(new Uint8Array([0xF5, 0x80, 0x80, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsF8: util.TextDecoderOptions = { fatal: true };
        let df8 = util.TextDecoder.create('utf-8', optsF8);
        try { df8.decodeToString(new Uint8Array([0xE4, 0xBD])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsF9: util.TextDecoderOptions = { fatal: false };
        let df9 = util.TextDecoder.create('utf-8', optsF9);
        let rf9 = df9.decodeToString(new Uint8Array([0xE4, 0xBD]));
        expect(rf9).assertEqual('�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_0300
     * @tc.name testTdoPropsFatal002
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsF10: util.TextDecoderOptions = { fatal: true };
        let df10 = util.TextDecoder.create('utf-8', optsF10);
        let rf10 = df10.decodeToString(new Uint8Array([97, 98, 0, 99]));
        expect(rf10).assertEqual('ab\u0000c');

      }
      {
        let df11 = util.TextDecoder.create('utf-8');
        let rf11 = df11.decodeToString(new Uint8Array([97, 0, 98]));
        expect(rf11).assertEqual('a\u0000b');

      }
      {
        let optsF12: util.TextDecoderOptions = { fatal: true };
        let df12 = util.TextDecoder.create('utf-8', optsF12);
        let rf12 = df12.decodeToString(new Uint8Array([72, 105]));
        expect(rf12).assertEqual('Hi');

      }
      {
        let optsF13: util.TextDecoderOptions = { fatal: true };
        let df13 = util.TextDecoder.create('utf-8', optsF13);
        let rf13 = df13.decodeToString(new Uint8Array([]));
        expect(rf13).assertEqual('');

      }
      {
        let optsF16: util.TextDecoderOptions = { fatal: true };
        let df16 = util.TextDecoder.create('utf-8', optsF16);
        let rf16 = df16.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]));
        expect(rf16).assertEqual('😀');

      }
      {
        let optsF14: util.TextDecoderOptions = { fatal: true };
        let df14 = util.TextDecoder.create('utf-8', optsF14);
        expect(df14.fatal).assertTrue();

      }
      {
        let optsF15: util.TextDecoderOptions = { fatal: false };
        let df15 = util.TextDecoder.create('utf-8', optsF15);
        expect(df15.fatal).assertFalse();

      }
      {
        let optsC1: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dc1 = util.TextDecoder.create('utf-8', optsC1);
        let rc1 = dc1.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xFF]));
        expect(rc1).assertEqual('\uFEFF�');

      }
      {
        let optsC2: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dc2 = util.TextDecoder.create('utf-8', optsC2);
        let rc2 = dc2.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xFF]));
        expect(rc2).assertEqual('�');

      }
      {
        let optsC3: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let dc3 = util.TextDecoder.create('utf-8', optsC3);
        try { dc3.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xFF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_0400
     * @tc.name testTdoPropsFatal003
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsC4: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dc4 = util.TextDecoder.create('utf-8', optsC4);
        try { dc4.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xFF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsC5: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dc5 = util.TextDecoder.create('utf-8', optsC5);
        let rc5 = dc5.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]));
        expect(rc5).assertEqual('\uFEFFabc');

      }
      {
        let optsC7: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let dc7 = util.TextDecoder.create('utf-8', optsC7);
        let rc7 = dc7.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]));
        expect(rc7).assertEqual('\uFEFFabc');

      }
      {
        let optsC8: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dc8 = util.TextDecoder.create('utf-8', optsC8);
        let rc8 = dc8.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]));
        expect(rc8).assertEqual('abc');

      }
      {
        let optsC9: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dc9 = util.TextDecoder.create('utf-8', optsC9);
        let rc9 = dc9.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF]));
        expect(rc9).assertEqual('');

      }
      {
        let optsC10: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dc10 = util.TextDecoder.create('utf-8', optsC10);
        let rc10 = dc10.decodeToString(new Uint8Array([0xF0, 0x80, 0x80, 0x28]));
        expect(rc10).assertEqual('���' + '(');

      }
      {
        let optsC11: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let dc11 = util.TextDecoder.create('utf-16le', optsC11);
        try { dc11.decodeToString(new Uint8Array([0xFF, 0xFE, 0xFF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsC12: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dc12 = util.TextDecoder.create('utf-8', optsC12);
        let rc12 = dc12.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(rc12).assertEqual('你');

      }
      {
        let optsR2: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dr2 = util.TextDecoder.create('utf-8', optsR2);
        let rr2 = dr2.decodeToString(new Uint8Array([0x61]));
        expect(dr2.fatal).assertTrue();
        expect(rr2).assertEqual('a');

      }
      {
        let dr5 = util.TextDecoder.create('utf-8');
        let optsR5: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dr5b = util.TextDecoder.create('utf-8', optsR5);
        let r5a = dr5.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        let r5b = dr5b.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(r5a).assertEqual('\uFEFFa');
        expect(r5b).assertEqual('\uFEFFa');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_0500
     * @tc.name testTdoPropsFatal004
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsE1: util.TextDecoderOptions = { fatal: true };
        let de1 = util.TextDecoder.create('utf-8', optsE1);
        try { de1.decodeToString(new Uint8Array([0xFF, 0xC0, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsE3: util.TextDecoderOptions = { fatal: false };
        let de3 = util.TextDecoder.create('utf-8', optsE3);
        let re3 = de3.decodeToString(new Uint8Array([0xFF, 0xFF, 0xFF]));
        expect(re3).assertEqual('���');

      }
      {
        let optsE4: util.TextDecoderOptions = { fatal: true };
        let de4 = util.TextDecoder.create('utf-8', optsE4);
        try { de4.decodeToString(new Uint8Array([0x61, 0xFF, 0x62])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let optsE5: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let de5 = util.TextDecoder.create('utf-8', optsE5);
        let re5 = de5.decodeToString(new Uint8Array([]));
        expect(re5).assertEqual('');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0x61]));
        expect(out).assertEqual('a');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xFF]));
        expect(out.charCodeAt(0)).assertEqual(65533);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0xFF]));
        expect(out.charCodeAt(0)).assertEqual(65533);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xE4]));
        expect(out.charCodeAt(0)).assertEqual(65533);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0x80]));
        expect(out.charCodeAt(0)).assertEqual(65533);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xC0, 0xAF]));
        expect(out.length).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_0600
     * @tc.name testTdoPropsFatal005
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xFF, 0x61]));
        expect(out).assertEqual('�' + 'a');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(out).assertEqual('abc');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        try {
          dec.decodeToString(new Uint8Array([0xE4]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(out).assertEqual('你');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xC3, 0xA9]));
        expect(out).assertEqual('é');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]));
        expect(out).assertEqual('😀');

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.charCodeAt(0)).assertEqual(65279);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        try {
          dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xFF]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.charCodeAt(0)).assertEqual(65279);
        expect(out.charCodeAt(1)).assertEqual(97);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out).assertEqual('a');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_0700
     * @tc.name testTdoPropsFatal006
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.charCodeAt(0)).assertEqual(65279);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xFF]));
        expect(out.charCodeAt(0)).assertEqual(65533);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        try {
          dec.decodeToString(new Uint8Array([0xFF]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let withBom: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        let plain: string = dec.decodeToString(new Uint8Array([0x61]));
        expect(withBom).assertEqual(plain);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0x80]));
        expect(out.length).assertEqual(1);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB]));
        expect(out.length).assertEqual(1);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let input: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]);
        dec.decodeToString(input);
        expect(input.$_get(0)).assertEqual(0xEF);
        expect(input.$_get(3)).assertEqual(0x61);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let td = util.TextDecoder.create('utf-8', opts);
        expect(td.fatal).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let input: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]);
        let first: string = dec.decodeToString(input);
        let second: string = dec.decodeToString(input);
        expect(first).assertEqual(second);

      }
      {
        let optsA: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let optsB: util.TextDecoderOptions = { ignoreBOM: true, fatal: true };
        let decA: util.TextDecoder = util.TextDecoder.create('utf-8', optsA);
        let decB: util.TextDecoder = util.TextDecoder.create('utf-8', optsB);
        let outA: string = decA.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        let outB: string = decB.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(outA).assertEqual(outB);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_0800
     * @tc.name testTdoPropsFatal007
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out1: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        let out2: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x62]));
        expect(out1).assertEqual('a');
        expect(out2).assertEqual('b');

      }
      {

        let o1: util.TextDecoderOptions = { fatal: true };
        let d1 = util.TextDecoder.create('utf-8', o1);
        try { d1.decodeToString(new Uint8Array([0xED, 0xA0, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o2: util.TextDecoderOptions = { fatal: true };
        let d2 = util.TextDecoder.create('utf-8', o2);
        try { d2.decodeToString(new Uint8Array([0xF0, 0x80, 0x80, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o3: util.TextDecoderOptions = { fatal: true };
        let d3 = util.TextDecoder.create('utf-8', o3);
        try { d3.decodeToString(new Uint8Array([0xF8, 0x88, 0x80, 0x80, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o4: util.TextDecoderOptions = { fatal: true };
        let d4 = util.TextDecoder.create('utf-8', o4);
        try { d4.decodeToString(new Uint8Array([0xFE])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o5: util.TextDecoderOptions = { fatal: true };
        let d5 = util.TextDecoder.create('utf-8', o5);
        try { d5.decodeToString(new Uint8Array([0xC3])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o6: util.TextDecoderOptions = { fatal: true };
        let d6 = util.TextDecoder.create('utf-8', o6);
        try { d6.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o7: util.TextDecoderOptions = { fatal: true };
        let d7 = util.TextDecoder.create('utf-8', o7);
        try { d7.decodeToString(new Uint8Array([0xF4, 0x90, 0x80, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o8: util.TextDecoderOptions = { fatal: true };
        let decoder = util.TextDecoder.create('utf-8', o8);
        try { decoder.decodeToString(new Uint8Array([0xEF, 0xBB])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o9: util.TextDecoderOptions = { fatal: true };
        let d9 = util.TextDecoder.create('utf-8', o9);
        try { d9.decodeToString(new Uint8Array([0xBF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_0900
     * @tc.name testTdoPropsFatal008
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let o10: util.TextDecoderOptions = { fatal: true };
        let d10 = util.TextDecoder.create('utf-8', o10);
        try { d10.decodeToString(new Uint8Array([0xE0, 0x80, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o11: util.TextDecoderOptions = { fatal: true };
        let d11 = util.TextDecoder.create('utf-8', o11);
        try { d11.decodeToString(new Uint8Array([0xC0])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o12: util.TextDecoderOptions = { fatal: true };
        let d12 = util.TextDecoder.create('utf-8', o12);
        try { d12.decodeToString(new Uint8Array([0xC1, 0xBF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o13: util.TextDecoderOptions = { fatal: true };
        let d13 = util.TextDecoder.create('utf-8', o13);
        try { d13.decodeToString(new Uint8Array([0xF7, 0xBF, 0xBF, 0xBF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o14: util.TextDecoderOptions = { fatal: true };
        let d14 = util.TextDecoder.create('utf-8', o14);
        try { d14.decodeToString(new Uint8Array([0xEF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o15: util.TextDecoderOptions = { fatal: true };
        let d15 = util.TextDecoder.create('utf-8', o15);
        try { d15.decodeToString(new Uint8Array([0xE2, 0x82])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let o16: util.TextDecoderOptions = { fatal: true };
        let d16 = util.TextDecoder.create('utf-8', o16);
        try { d16.decodeToString(new Uint8Array([0xE1])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let p1: util.TextDecoderOptions = { fatal: false };
        let e1 = util.TextDecoder.create('utf-8', p1);
        let r1 = e1.decodeToString(new Uint8Array([0xED, 0xA0, 0x80]));
        expect(r1).assertEqual('���');

      }
      {

        let p2: util.TextDecoderOptions = { fatal: false };
        let e2 = util.TextDecoder.create('utf-8', p2);
        let r2 = e2.decodeToString(new Uint8Array([0xF0, 0x80, 0x80, 0x80]));
        expect(r2).assertEqual('����');

      }
      {

        let p3: util.TextDecoderOptions = { fatal: false };
        let e3 = util.TextDecoder.create('utf-8', p3);
        let r3 = e3.decodeToString(new Uint8Array([0x80]));
        expect(r3).assertEqual('�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1000
     * @tc.name testTdoPropsFatal009
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let p4: util.TextDecoderOptions = { fatal: false };
        let e4 = util.TextDecoder.create('utf-8', p4);
        let r4 = e4.decodeToString(new Uint8Array([0xC3]));
        expect(r4).assertEqual('�');

      }
      {

        let p5: util.TextDecoderOptions = { fatal: false };
        let e5 = util.TextDecoder.create('utf-8', p5);
        let r5 = e5.decodeToString(new Uint8Array([0xC0, 0x80]));
        expect(r5).assertEqual('��');

      }
      {

        let p6: util.TextDecoderOptions = { fatal: false };
        let e6 = util.TextDecoder.create('utf-8', p6);
        let r6 = e6.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98]));
        expect(r6).assertEqual('�');

      }
      {

        let p7: util.TextDecoderOptions = { fatal: false };
        let e7 = util.TextDecoder.create('utf-8', p7);
        let r7 = e7.decodeToString(new Uint8Array([0xF4, 0x90, 0x80, 0x80]));
        expect(r7).assertEqual('����');

      }
      {

        let p8: util.TextDecoderOptions = { fatal: false };
        let e8 = util.TextDecoder.create('utf-8', p8);
        let r8 = e8.decodeToString(new Uint8Array([0x80, 0x80]));
        expect(r8).assertEqual('��');

      }
      {

        let p9: util.TextDecoderOptions = { fatal: false };
        let e9 = util.TextDecoder.create('utf-8', p9);
        let r9 = e9.decodeToString(new Uint8Array([0xFE, 0xFF]));
        expect(r9).assertEqual('��');

      }
      {

        let m1: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let t1 = util.TextDecoder.create('utf-8', m1);
        try { t1.decodeToString(new Uint8Array([0xEF, 0xBB])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let m2: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let t2 = util.TextDecoder.create('utf-8', m2);
        try { t2.decodeToString(new Uint8Array([0xED, 0xA0, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let m3: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let t3 = util.TextDecoder.create('utf-8', m3);
        let u3 = t3.decodeToString(new Uint8Array([0xF0, 0x80, 0x80, 0x80]));
        expect(u3).assertEqual('����');

      }
      {

        let m4: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let t4 = util.TextDecoder.create('utf-8', m4);
        let u4 = t4.decodeToString(new Uint8Array([0xF8, 0x88, 0x80, 0x80, 0x80]));
        expect(u4).assertEqual('�����');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1100
     * @tc.name testTdoPropsFatal010
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let m5: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let t5 = util.TextDecoder.create('utf-8', m5);
        try { t5.decodeToString(new Uint8Array([0xF4, 0x90, 0x80, 0x80])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let m6: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let t6 = util.TextDecoder.create('utf-8', m6);
        let u6 = t6.decodeToString(new Uint8Array([0xED, 0xA0, 0x80]));
        expect(u6).assertEqual('���');

      }
      {

        let m7: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let t7 = util.TextDecoder.create('utf-8', m7);
        try { t7.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let m8: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let t8 = util.TextDecoder.create('utf-8', m8);
        let u8 = t8.decodeToString(new Uint8Array([0xBF]));
        expect(u8).assertEqual('�');

      }
      {

        let m9: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let t9 = util.TextDecoder.create('utf-8', m9);
        let u9 = t9.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF]));
        expect(u9).assertEqual('\uFEFF');

      }
      {

        let m10: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let t10 = util.TextDecoder.create('utf-8', m10);
        let u10 = t10.decodeToString(new Uint8Array([0xF4, 0x8F, 0xBF, 0xBF]));
        expect(u10.length).assertEqual(2);

      }
      {

        let m11: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let t11 = util.TextDecoder.create('utf-8', m11);
        try { t11.decodeToString(new Uint8Array([0xFE, 0xFF])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let b1: util.TextDecoderOptions = { fatal: true };
        let w1 = util.TextDecoder.create('utf-8', b1);
        let v1 = w1.decodeToString(new Uint8Array([0x00]));
        expect(v1).assertEqual('\u0000');

      }
      {

        let b2: util.TextDecoderOptions = { fatal: true };
        let w2 = util.TextDecoder.create('utf-8', b2);
        let v2 = w2.decodeToString(new Uint8Array([0x7F]));
        expect(v2).assertEqual('');

      }
      {

        let b3: util.TextDecoderOptions = { fatal: false };
        let w3 = util.TextDecoder.create('utf-8', b3);
        let v3 = w3.decodeToString(new Uint8Array([0xDF, 0xBF]));
        expect(v3).assertEqual('߿');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1200
     * @tc.name testTdoPropsFatal011
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let b4: util.TextDecoderOptions = { fatal: true };
        let w4 = util.TextDecoder.create('utf-8', b4);
        let v4 = w4.decodeToString(new Uint8Array([0xC2, 0x80]));
        expect(v4).assertEqual('');

      }
      {

        let b5: util.TextDecoderOptions = { fatal: true };
        let w5 = util.TextDecoder.create('utf-8', b5);
        let v5 = w5.decodeToString(new Uint8Array([0xE0, 0xA0, 0x80]));
        expect(v5).assertEqual('ࠀ');

      }
      {

        let b6: util.TextDecoderOptions = { fatal: true };
        let w6 = util.TextDecoder.create('utf-8', b6);
        let v6 = w6.decodeToString(new Uint8Array([0xE1, 0x80, 0x80]));
        expect(v6).assertEqual('က');

      }
      {

        let b7: util.TextDecoderOptions = { fatal: true };
        let w7 = util.TextDecoder.create('utf-8', b7);
        let v7 = w7.decodeToString(new Uint8Array([0xEF, 0xBF, 0xBD]));
        expect(v7).assertEqual('�');

      }
      {

        let b8: util.TextDecoderOptions = { fatal: true };
        let w8 = util.TextDecoder.create('utf-8', b8);
        let result = w8.decodeToString(new Uint8Array([0xF4, 0x8F, 0xBF, 0xBF]));
        expect(result).assertEqual('􏿿');

      }
      {

        let b9: util.TextDecoderOptions = { fatal: true };
        let w9 = util.TextDecoder.create('utf-8', b9);
        let v9 = w9.decodeToString(new Uint8Array([0xF1, 0x80, 0x80, 0x80]));
        expect(v9.length).assertEqual(2);

      }
      {

        let b10: util.TextDecoderOptions = { fatal: true };
        let w10 = util.TextDecoder.create('utf-8', b10);
        try { w10.decodeToString(new Uint8Array([0xC2])); expect().assertFail(); }
        catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let z1: util.TextDecoderOptions = { fatal: false };
        let y1 = util.TextDecoder.create('utf-8', z1);
        let x1 = y1.decodeToString(new Uint8Array([0x61]));
        expect(x1).assertEqual('a');

      }
      {

        let z3: util.TextDecoderOptions = { fatal: false };
        let y3 = util.TextDecoder.create('utf-8', z3);
        let x3 = y3.decodeToString(new Uint8Array([0x00, 0x00, 0x00]));
        expect(x3).assertEqual('\u0000\u0000\u0000');

      }
      {

        let z4: util.TextDecoderOptions = { fatal: true };
        let y4 = util.TextDecoder.create('utf-8', z4);
        let x4 = y4.decodeToString(new Uint8Array([0x00, 0x61]));
        expect(x4).assertEqual('\u0000a');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1300
     * @tc.name testTdoPropsFatal012
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties fatal option behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsFatal012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let z5: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let y5 = util.TextDecoder.create('utf-8', z5);
        let x5 = y5.decodeToString(new Uint8Array([0x80]));
        expect(x5).assertEqual('�');

      }
      {

        let z6: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let y6 = util.TextDecoder.create('utf-8', z6);
        let x6 = y6.decodeToString(new Uint8Array([0xFF]));
        expect(x6).assertEqual('�');

      }
      {

        let bigOpts: util.TextDecoderOptions = { fatal: true };
        let bigD = util.TextDecoder.create('utf-8', bigOpts);
        let bigArr: Uint8Array = new Uint8Array(10000);
        bigArr.fill(0x61);
        let bigS = bigD.decodeToString(bigArr);
        expect(bigS.length).assertEqual(10000);

      }
      {

        let jOpts: util.TextDecoderOptions = { fatal: false };
        let jD = util.TextDecoder.create('utf-8', jOpts);
        let jR = jD.decodeToString(new Uint8Array([0x00, 0x41]));
        expect(JSON.stringify(jR)).assertEqual('"\\u0000A"');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1400
     * @tc.name testTdoPropsBom001
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties ignoreBOM and BOM behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsBom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dg1 = util.TextDecoder.create('utf-8');
        let rg1 = dg1.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(rg1).assertEqual('\uFEFFa');

      }
      {
        let optsG3: util.TextDecoderOptions = { ignoreBOM: true };
        let dg3 = util.TextDecoder.create('utf-8', optsG3);
        let rg3 = dg3.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]));
        expect(rg3).assertEqual('abc');

      }
      {
        let optsG4: util.TextDecoderOptions = { ignoreBOM: true };
        let dg4 = util.TextDecoder.create('utf-8', optsG4);
        let rg4 = dg4.decodeToString(new Uint8Array([0x61, 0x62]));
        expect(rg4).assertEqual('ab');

      }
      {
        let optsG5: util.TextDecoderOptions = { ignoreBOM: true };
        let dg5 = util.TextDecoder.create('utf-8', optsG5);
        let rg5 = dg5.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF]));
        expect(rg5).assertEqual('');

      }
      {
        let optsG6: util.TextDecoderOptions = { ignoreBOM: false };
        let dg6 = util.TextDecoder.create('utf-8', optsG6);
        let rg6 = dg6.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF]));
        expect(rg6).assertEqual('\uFEFF');

      }
      {
        let optsG7: util.TextDecoderOptions = { ignoreBOM: true };
        let dg7 = util.TextDecoder.create('utf-8', optsG7);
        let rg7 = dg7.decodeToString(new Uint8Array([0x61, 0xEF, 0xBB, 0xBF, 0x62]));
        expect(rg7).assertEqual('a\uFEFFb');

      }
      {
        let optsG8: util.TextDecoderOptions = { ignoreBOM: true };
        let dg8 = util.TextDecoder.create('utf-8', optsG8);
        let rg8 = dg8.decodeToString(new Uint8Array([0xEF, 0xBB]));
        expect(rg8).assertEqual('�');

      }
      {
        let optsG14: util.TextDecoderOptions = { ignoreBOM: true };
        let dg14 = util.TextDecoder.create('utf-8', optsG14);
        let rg14 = dg14.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0xEF, 0xBB, 0xBF]));
        expect(rg14).assertEqual('\uFEFF');

      }
      {
        let optsG9: util.TextDecoderOptions = { ignoreBOM: true };
        let dg9 = util.TextDecoder.create('utf-16le', optsG9);
        let rg9 = dg9.decodeToString(new Uint8Array([0xFF, 0xFE, 0x61, 0x00]));
        expect(rg9).assertEqual('a');

      }
      {
        let optsG10: util.TextDecoderOptions = { ignoreBOM: false };
        let dg10 = util.TextDecoder.create('utf-16le', optsG10);
        let rg10 = dg10.decodeToString(new Uint8Array([0xFF, 0xFE, 0x61, 0x00]));
        expect(rg10).assertEqual('\uFEFFa');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1500
     * @tc.name testTdoPropsBom002
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties ignoreBOM and BOM behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsBom002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let optsG11: util.TextDecoderOptions = { ignoreBOM: true };
        let dg11 = util.TextDecoder.create('utf-16be', optsG11);
        let rg11 = dg11.decodeToString(new Uint8Array([0xFE, 0xFF, 0x00, 0x61]));
        expect(rg11).assertEqual('a');

      }
      {
        let optsG12: util.TextDecoderOptions = { ignoreBOM: true };
        let dg12 = util.TextDecoder.create('utf-8', optsG12);
        expect(dg12.ignoreBOM).assertTrue();

      }
      {
        let optsG13: util.TextDecoderOptions = { ignoreBOM: false };
        let dg13 = util.TextDecoder.create('utf-8', optsG13);
        expect(dg13.ignoreBOM).assertFalse();

      }
      {
        let optsR3: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dr3 = util.TextDecoder.create('utf-8', optsR3);
        let r3 = dr3.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62]));
        expect(r3.length).assertEqual(2);

      }
      {
        let optsR4: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dr4 = util.TextDecoder.create('utf-8', optsR4);
        let r4 = dr4.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62]));
        expect(r4.length).assertEqual(3);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.length).assertEqual(1);

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.charCodeAt(0)).assertEqual(65279);

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out).assertEqual('a');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x62]));
        expect(out.charCodeAt(0)).assertEqual(65279);

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(out).assertEqual('abc');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1600
     * @tc.name testTdoPropsBom003
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties ignoreBOM and BOM behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsBom003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16le', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xFF, 0xFE, 0x41, 0x00]));
        expect(out.charCodeAt(0)).assertEqual(65279);

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16le', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xFF, 0xFE, 0x41, 0x00]));
        expect(out).assertEqual('A');

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF]));
        expect(out).assertEqual('\uFEFF');

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF]));
        expect(out).assertEqual('');

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0x61, 0xEF, 0xBB, 0xBF, 0x62]));
        expect(out).assertEqual('a\uFEFFb');

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0x61, 0xEF, 0xBB, 0xBF]));
        expect(out).assertEqual('a\uFEFF');

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16le', opts);
        let out: string = dec.decodeToString(new Uint8Array([0x41, 0x00, 0xFF, 0xFE]));
        expect(out).assertEqual('A\uFEFF');

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.length).assertEqual(1);

      }
      {
        let opts: util.TextDecoderOptions = { ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        expect(out.length).assertEqual(2);

      }
      {
        let input: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        dec.decodeToString(input);
        expect(input.byteLength).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1700
     * @tc.name testTdoPropsBom004
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties ignoreBOM and BOM behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsBom004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let input: Uint8Array = new Uint8Array([0x61, 0x62, 0x63]);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        dec.decodeToString(input);
        expect(input.byteLength).assertEqual(3);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let td = util.TextDecoder.create('utf-8', opts);
        expect(td.ignoreBOM).assertTrue();

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let input: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]);
        let out: string = dec.decodeToString(input);
        expect(out).assertEqual('a');

      }
      {
        let optsA: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let optsB: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let decA: util.TextDecoder = util.TextDecoder.create('utf-8', optsA);
        let decB: util.TextDecoder = util.TextDecoder.create('utf-8', optsB);
        let input: Uint8Array = new Uint8Array([0x61, 0x62, 0x63]);
        expect(decA.decodeToString(input)).assertEqual(decB.decodeToString(input));

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        dec.decodeToString(new Uint8Array([0x61]));
        let out: string = dec.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x62]));
        expect(out).assertEqual('b');

      }
      {
        let optsTrue: util.TextDecoderOptions = { ignoreBOM: true };
        let optsFalse: util.TextDecoderOptions = { ignoreBOM: false };
        let decTrue: util.TextDecoder = util.TextDecoder.create('utf-8', optsTrue);
        let decFalse: util.TextDecoder = util.TextDecoder.create('utf-8', optsFalse);
        let input: Uint8Array = new Uint8Array([0x61, 0x62]);
        let outTrue: string = decTrue.decodeToString(input);
        let outFalse: string = decFalse.decodeToString(input);
        expect(outTrue).assertEqual(outFalse);

      }
      {

        let q1: util.TextDecoderOptions = { ignoreBOM: false };
        let f1 = util.TextDecoder.create('utf-16be', q1);
        let s1 = f1.decodeToString(new Uint8Array([0xFE, 0xFF]));
        expect(s1).assertEqual('\uFEFF');

      }
      {

        let q2: util.TextDecoderOptions = { ignoreBOM: true };
        let f2 = util.TextDecoder.create('utf-16be', q2);
        let s2 = f2.decodeToString(new Uint8Array([0xFE, 0xFF]));
        expect(s2).assertEqual('');

      }
      {

        let q3: util.TextDecoderOptions = { ignoreBOM: true };
        let f3 = util.TextDecoder.create('utf-16le', q3);
        let s3 = f3.decodeToString(new Uint8Array([0xFF, 0xFE]));
        expect(s3).assertEqual('');

      }
      {

        let q4: util.TextDecoderOptions = { ignoreBOM: false };
        let f4 = util.TextDecoder.create('utf-16le', q4);
        let s4 = f4.decodeToString(new Uint8Array([0xFF, 0xFE]));
        expect(s4).assertEqual('\uFEFF');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1800
     * @tc.name testTdoPropsBom005
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties ignoreBOM and BOM behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsBom005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let q5: util.TextDecoderOptions = { ignoreBOM: false };
        let f5 = util.TextDecoder.create('utf-8', q5);
        let s5 = f5.decodeToString(new Uint8Array([0x61, 0x62]));
        expect(s5).assertEqual('ab');

      }
      {

        let q6: util.TextDecoderOptions = { ignoreBOM: false };
        let f6 = util.TextDecoder.create('utf-8', q6);
        let s6 = f6.decodeToString(new Uint8Array([0x61, 0xEF, 0xBB, 0xBF, 0x62]));
        expect(s6).assertEqual('a\uFEFFb');

      }
      {

        let q7: util.TextDecoderOptions = { ignoreBOM: true };
        let f7 = util.TextDecoder.create('utf-8', q7);
        let s7 = f7.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0xEF, 0xBB, 0xBF]));
        expect(s7).assertEqual('a\uFEFF');

      }
      {

        let q8: util.TextDecoderOptions = { ignoreBOM: false };
        let f8 = util.TextDecoder.create('utf-8', q8);
        let s8 = f8.decodeToString(new Uint8Array([0xEF, 0xBB]));
        expect(s8).assertEqual('�');

      }
      {

        let q9: util.TextDecoderOptions = { ignoreBOM: true };
        let f9 = util.TextDecoder.create('utf-8', q9);
        let s9 = f9.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(s9).assertEqual('你');

      }
      {

        let z2: util.TextDecoderOptions = { ignoreBOM: true };
        let y2 = util.TextDecoder.create('utf-8', z2);
        let x2 = y2.decodeToString(new Uint8Array([0x41, 0x41, 0x41]));
        expect(x2).assertEqual('AAA');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_1900
     * @tc.name testTdoPropsEmoji001
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties with emoji and surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsEmoji001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]));
        expect(out.length).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_2000
     * @tc.name testTdoPropsEncoding001
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let opts: util.TextDecoderOptions = { fatal: true, ignoreBOM: true };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        expect(dec.encoding).assertEqual('utf-8');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(out.length).assertEqual(3);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-16le');
        let out: string = dec.decodeToString(new Uint8Array([0x41, 0x00, 0x42, 0x00]));
        expect(out.length).assertEqual(2);

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array(0));
        expect(out).assertEqual('');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODEROPTIONS_PROPERTIES_2100
     * @tc.name testTdoPropsBasic001
     * @tc.desc Verify TextDecoderOptions fatal and ignoreBOM properties with basic decoding input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdoPropsBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d2 = new util.TextDecoder();
        expect(d2.fatal).assertFalse();
        expect(d2.ignoreBOM).assertFalse();

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0x61]));
        expect(out).assertEqual('a');

      }
      {
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        let out: string = dec.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(out.length).assertEqual(2);

      }
      {
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        let buf: ArrayBuffer = new ArrayBuffer(5);
        let full: Uint8Array = new Uint8Array(buf);
        full.$_set(2, 0x61);
        full.$_set(3, 0x62);
        let view: Uint8Array = new Uint8Array(buf, 2, 2);
        let out: string = dec.decodeToString(view);
        expect(out).assertEqual('ab');

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(6);
        let full: Uint8Array = new Uint8Array(buf);
        full.$_set(1, 0x61);
        full.$_set(2, 0x62);
        let view: Uint8Array = new Uint8Array(buf, 1, 2);
        let opts: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8', opts);
        dec.decodeToString(view);
        expect(view.byteOffset).assertEqual(1);

      }
      {
        let input: Uint8Array = new Uint8Array([0x61, 0x62, 0x63]);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        dec.decodeToString(input);
        expect(input.buffer.byteLength).assertEqual(3);

      }
      {
        let buf: ArrayBuffer = new ArrayBuffer(4);
        let full: Uint8Array = new Uint8Array(buf);
        full.$_set(0, 0x78);
        full.$_set(1, 0x61);
        let view: Uint8Array = new Uint8Array(buf, 1, 1);
        let dec: util.TextDecoder = util.TextDecoder.create('utf-8');
        dec.decodeToString(view);
        expect(full.$_get(0)).assertEqual(0x78);

      }
    });

  });
}
