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

export default function TextEncoderOverviewTest(): void {
  describe('TextEncoderOverviewTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_0100
     * @tc.name testTeOvThrows001
     * @tc.desc Verify TextEncoder overview throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.TextEncoder('invalid-enc');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_0200
     * @tc.name testTeOvEncoding001
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder('utf-8');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(3);
        expect(r[0]).assertEqual(0xE4);
        expect(r[1]).assertEqual(0xBD);
        expect(r[2]).assertEqual(0xA0);

      }
      {
        let te = new util.TextEncoder('utf-8');
        let r = te.encodeInto('😀');
        expect(r.length).assertEqual(4);
        expect(r[0]).assertEqual(0xF0);
        expect(r[1]).assertEqual(0x9F);
        expect(r[2]).assertEqual(0x98);
        expect(r[3]).assertEqual(0x80);

      }
      {
        let te = new util.TextEncoder('gb2312');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0xC4);
        expect(r[1]).assertEqual(0xE3);

      }
      {
        let te = new util.TextEncoder('gbk');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0xC4);
        expect(r[1]).assertEqual(0xE3);

      }
      {
        let te = new util.TextEncoder('gb18030');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(4);
        expect(r[0]).assertEqual(196);
        expect(r[1]).assertEqual(227);

      }
      {
        let te = new util.TextEncoder('big5');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0xA7);
        expect(r[1]).assertEqual(0x41);

      }
      {
        let te = new util.TextEncoder('utf-16le');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0x60);
        expect(r[1]).assertEqual(0x4F);

      }
      {
        let te = new util.TextEncoder('utf-16be');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0x4F);
        expect(r[1]).assertEqual(0x60);

      }
      {
        let te = new util.TextEncoder('euc-jp');
        let r = te.encodeInto('あ');
        expect(r.length).assertEqual(3);
        expect(r[0]).assertEqual(164);
        expect(r[1]).assertEqual(162);

      }
      {
        let te = new util.TextEncoder('shift_jis');
        let r = te.encodeInto('あ');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0x82);
        expect(r[1]).assertEqual(0xA0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_0300
     * @tc.name testTeOvEncoding002
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder('euc-kr');
        let r = te.encodeInto('가');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0xB0);
        expect(r[1]).assertEqual(0xA1);

      }
      {
        let te = new util.TextEncoder('iso-2022-jp');
        let r = te.encodeInto('a');
        expect(r.length).assertEqual(6);
        expect(r[0]).assertEqual(97);

      }
      {
        let te = new util.TextEncoder('iso-8859-1');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(0xE9);

      }
      {
        let te = new util.TextEncoder('iso-8859-2');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-3');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-4');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-5');
        let r = te.encodeInto('А');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-6');
        let r = te.encodeInto('ا');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-7');
        let r = te.encodeInto('α');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-8');
        let r = te.encodeInto('א');
        expect(r.length).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_0400
     * @tc.name testTeOvEncoding003
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder('iso-8859-8-i');
        let r = te.encodeInto('א');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-10');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-13');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-14');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('iso-8859-15');
        let r = te.encodeInto('€');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(0xA4);

      }
      {
        let te = new util.TextEncoder('koi8-r');
        let r = te.encodeInto('А');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(225);

      }
      {
        let te = new util.TextEncoder('koi8-u');
        let r = te.encodeInto('А');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('macintosh');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('windows-874');
        let r = te.encodeInto('ก');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('windows-1250');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_0500
     * @tc.name testTeOvEncoding004
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder('windows-1251');
        let r = te.encodeInto('А');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(0xC0);

      }
      {
        let te = new util.TextEncoder('windows-1252');
        let r = te.encodeInto('€');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(0x80);

      }
      {
        let te = new util.TextEncoder('windows-1253');
        let r = te.encodeInto('α');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('windows-1254');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('windows-1255');
        let r = te.encodeInto('א');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('windows-1256');
        let r = te.encodeInto('ا');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('windows-1257');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('windows-1258');
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('x-mac-cyrillic');
        let r = te.encodeInto('А');
        expect(r.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder('ibm866');
        let r = te.encodeInto('А');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(0x80);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_0600
     * @tc.name testTeOvEncoding005
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder('');
        expect(te.encoding).assertEqual('utf-8');

      }
      {
        let te = util.TextEncoder.create('utf-8');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(3);
        expect(r[0]).assertEqual(0xE4);
        expect(r[1]).assertEqual(0xBD);
        expect(r[2]).assertEqual(0xA0);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0xC4);
        expect(r[1]).assertEqual(0xE3);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0x60);
        expect(r[1]).assertEqual(0x4F);

      }
      {
        let te = util.TextEncoder.create('big5');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0xA7);
        expect(r[1]).assertEqual(0x41);

      }
      {
        let te = util.TextEncoder.create('gb18030');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(4);
        expect(r[0]).assertEqual(196);
        expect(r[1]).assertEqual(227);

      }
      {
        let te = util.TextEncoder.create('UTF-16BE');
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(0x4F);
        expect(r[1]).assertEqual(0x60);

      }
      {
        let te = new util.TextEncoder('big5');
        let v1 = te.encoding;
        let v2 = te.encoding;
        expect(v1).assertEqual('big5');
        expect(v2).assertEqual('big5');

      }
      {
        let t1 = new util.TextEncoder('utf-8');
        let t2 = new util.TextEncoder('gbk');
        expect(t1.encoding).assertEqual('utf-8');
        expect(t2.encoding).assertEqual('gbk');

      }
      {
        let a = new util.TextEncoder('utf-16le');
        let b = util.TextEncoder.create('utf-16le');
        expect(a.encoding).assertEqual('utf-16le');
        expect(b.encoding).assertEqual('utf-16le');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_0700
     * @tc.name testTeOvEncoding006
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('ab');
        expect(r.length).assertEqual(2);
        expect(r[0]).assertEqual(97);
        expect(r[1]).assertEqual(98);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('abc');
        expect(r.length).assertEqual(3);
        expect(r[0]).assertEqual(97);
        expect(r[1]).assertEqual(98);
        expect(r[2]).assertEqual(99);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('a你');
        expect(r.length).assertEqual(4);
        expect(r[0]).assertEqual(97);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('你a');
        expect(r.length).assertEqual(4);
        expect(r[3]).assertEqual(97);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('你');
        let dest = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('你', dest);
        expect(info.written).assertEqual(3);
        expect(info.read).assertEqual(1);
        expect(dest[0]).assertEqual(r[0]);
        expect(dest[1]).assertEqual(r[1]);
        expect(dest[2]).assertEqual(r[2]);

      }
      {
        let te = new util.TextEncoder('gbk');
        let r = te.encodeInto('你');
        let dest = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('你', dest);
        expect(info.written).assertEqual(r.length);
        expect(dest[0]).assertEqual(r[0]);
        expect(dest[1]).assertEqual(r[1]);

      }
      {
        let te = new util.TextEncoder('utf-16le');
        let r = te.encodeInto('你');
        let dest = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('你', dest);
        expect(info.written).assertEqual(r.length);
        expect(dest[0]).assertEqual(r[0]);
        expect(dest[1]).assertEqual(r[1]);

      }
      {
        let te = new util.TextEncoder('big5');
        let r = te.encodeInto('你');
        let dest = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('你', dest);
        expect(info.written).assertEqual(r.length);
        expect(dest[0]).assertEqual(r[0]);
        expect(dest[1]).assertEqual(r[1]);

      }
      {
        let te = new util.TextEncoder('euc-jp');
        let dest = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('あ', dest);
        expect(info.written).assertEqual(2);
        expect(dest[0]).assertEqual(164);
        expect(dest[1]).assertEqual(162);

      }
      {
        let te = new util.TextEncoder('shift_jis');
        let r = te.encodeInto('あ');
        let dest = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('あ', dest);
        expect(info.written).assertEqual(r.length);
        expect(dest[0]).assertEqual(r[0]);
        expect(dest[1]).assertEqual(r[1]);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_0800
     * @tc.name testTeOvEncoding007
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder('utf-16be');
        let r = te.encodeInto('你');
        let dest = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('你', dest);
        expect(info.written).assertEqual(r.length);
        expect(dest[0]).assertEqual(r[0]);
        expect(dest[1]).assertEqual(r[1]);

      }
      {
        let te = new util.TextEncoder('gbk');
        let r = te.encodeInto('你好');
        let dest = new Uint8Array(8);
        let info = te.encodeIntoUint8Array('你好', dest);
        expect(info.read).assertEqual(2);
        expect(info.written).assertEqual(r.length);
        expect(info.written).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('😀');
        let dest = new Uint8Array(8);
        let info = te.encodeIntoUint8Array('😀', dest);
        expect(info.written).assertEqual(4);
        expect(info.read).assertEqual(2);
        expect(dest[0]).assertEqual(r[0]);
        expect(dest[1]).assertEqual(r[1]);
        expect(dest[2]).assertEqual(r[2]);
        expect(dest[3]).assertEqual(r[3]);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('abcd');
        let dest = new Uint8Array(8);
        let info = te.encodeIntoUint8Array('abcd', dest);
        expect(info.written).assertEqual(4);
        expect(dest[0]).assertEqual(r[0]);
        expect(dest[1]).assertEqual(r[1]);
        expect(dest[2]).assertEqual(r[2]);
        expect(dest[3]).assertEqual(r[3]);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder();
        expect(te.encoding).assertEqual('utf-8');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        expect(te.encoding).assertEqual('utf-8');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('gb18030');
        expect(te.encoding).assertEqual('gb18030');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('big5');
        expect(te.encoding).assertEqual('big5');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('euc-jp');
        expect(te.encoding).assertEqual('euc-jp');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('shift_jis');
        expect(te.encoding).assertEqual('shift_jis');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_0900
     * @tc.name testTeOvEncoding008
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = new util.TextEncoder('euc-kr');
        expect(te.encoding).assertEqual('euc-kr');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('iso-8859-1');
        expect(te.encoding).assertEqual('iso-8859-1');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('gbk');
        expect(te.encoding).assertEqual('gbk');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('gb2312');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(2);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('gb18030');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(4);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('gbk');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(2);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('big5');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(2);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('euc-jp');
        let out: Uint8Array = te.encodeInto('あ');
        expect(out.byteLength).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('shift_jis');
        let out: Uint8Array = te.encodeInto('あ');
        expect(out.byteLength).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1000
     * @tc.name testTeOvEncoding009
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = new util.TextEncoder('euc-kr');
        let out: Uint8Array = te.encodeInto('한');
        expect(out.byteLength).assertEqual(2);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-16le');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(2);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-16be');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(2);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('😀');
        expect(out.byteLength).assertEqual(4);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-16le');
        let out: Uint8Array = te.encodeInto('😀');
        expect(out.byteLength).assertEqual(4);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('iso-8859-1');
        let out: Uint8Array = te.encodeInto('é');
        expect(out.byteLength).assertEqual(1);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('abc');
        expect(out.$_get(0)).assertEqual(97);
        expect(out.$_get(1)).assertEqual(98);
        expect(out.$_get(2)).assertEqual(99);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.$_get(0)).assertEqual(0xE4);
        expect(out.$_get(1)).assertEqual(0xBD);
        expect(out.$_get(2)).assertEqual(0xA0);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-16le');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.$_get(0)).assertEqual(0x60);
        expect(out.$_get(1)).assertEqual(0x4F);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-16be');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.$_get(0)).assertEqual(0x4F);
        expect(out.$_get(1)).assertEqual(0x60);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1100
     * @tc.name testTeOvEncoding010
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = new util.TextEncoder('gb2312');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.$_get(0)).assertEqual(0xC4);
        expect(out.$_get(1)).assertEqual(0xE3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('shift_jis');
        let out: Uint8Array = te.encodeInto('あ');
        expect(out.$_get(0)).assertEqual(0x82);
        expect(out.$_get(1)).assertEqual(0xA0);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('😀');
        expect(out.$_get(0)).assertEqual(0xF0);
        expect(out.$_get(1)).assertEqual(0x9F);
        expect(out.$_get(2)).assertEqual(0x98);
        expect(out.$_get(3)).assertEqual(0x80);

      }
      {
        let teU: util.TextEncoder = new util.TextEncoder('utf-8');
        let teG: util.TextEncoder = new util.TextEncoder('gb2312');
        let u: Uint8Array = teU.encodeInto('你');
        let g: Uint8Array = teG.encodeInto('你');
        expect(u.byteLength).assertEqual(3);
        expect(g.byteLength).assertEqual(2);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create();
        expect(te.encoding).assertEqual('utf-8');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-8');
        expect(te.encoding).assertEqual('utf-8');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-8');
        let out: Uint8Array = te.encodeInto('abc');
        expect(out.$_get(0)).assertEqual(97);
        expect(out.$_get(1)).assertEqual(98);
        expect(out.$_get(2)).assertEqual(99);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-8');
        let out: Uint8Array = te.encodeInto('你好');
        expect(out.byteLength).assertEqual(6);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('gb2312');
        let out: Uint8Array = te.encodeInto('你好');
        expect(out.byteLength).assertEqual(4);

      }
      {
        let tc: util.TextEncoder = util.TextEncoder.create();
        let tn: util.TextEncoder = new util.TextEncoder();
        let oc: Uint8Array = tc.encodeInto('你');
        let on: Uint8Array = tn.encodeInto('你');
        expect(oc.byteLength).assertEqual(3);
        expect(on.byteLength).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1200
     * @tc.name testTeOvEncoding011
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-8');
        let a: Uint8Array = te.encodeInto('你');
        let b: Uint8Array = te.encodeInto('hello');
        expect(a.byteLength).assertEqual(3);
        expect(b.byteLength).assertEqual(5);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.length).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('你好');
        expect(out.byteLength).assertEqual(6);

      }
      {
        let longStr: string = '';
        for (let i: number = 0; i < 10000; i++) {
          longStr += 'a';
        }
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto(longStr);
        expect(out.byteLength).assertEqual(10000);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('\udc04');
        expect(out.byteLength).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('hello你好');
        expect(out.byteLength).assertEqual(11);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('\uD800¥¥');
        expect(out.byteLength).assertEqual(7);
        expect(out.$_get(0)).assertEqual(237);
        expect(out.$_get(1)).assertEqual(160);
        expect(out.$_get(2)).assertEqual(128);
        expect(out.$_get(3)).assertEqual(194);
        expect(out.$_get(4)).assertEqual(165);
        expect(out.$_get(5)).assertEqual(194);
        expect(out.$_get(6)).assertEqual(165);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('你好');
        expect(out.$_get(0)).assertEqual(0xE4);
        expect(out.$_get(1)).assertEqual(0xBD);
        expect(out.$_get(2)).assertEqual(0xA0);
        expect(out.$_get(3)).assertEqual(0xE5);
        expect(out.$_get(4)).assertEqual(0xA5);
        expect(out.$_get(5)).assertEqual(0xBD);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('abc', dest);
        expect(info.read).assertEqual(3);
        expect(info.written).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(6);
        te.encodeIntoUint8Array('abc', dest);
        expect(dest.buffer.byteLength).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1300
     * @tc.name testTeOvEncoding012
     * @tc.desc Verify TextEncoder overview with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEncoding012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let a: Uint8Array = te.encodeInto('你好');
        let dest: Uint8Array = new Uint8Array(8);
        te.encodeIntoUint8Array('你好', dest);
        expect(dest.$_get(0)).assertEqual(a.$_get(0));
        expect(dest.$_get(1)).assertEqual(a.$_get(1));
        expect(dest.$_get(2)).assertEqual(a.$_get(2));
        expect(dest.$_get(3)).assertEqual(a.$_get(3));
        expect(dest.$_get(4)).assertEqual(a.$_get(4));
        expect(dest.$_get(5)).assertEqual(a.$_get(5));

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('gb2312');
        let a: Uint8Array = te.encodeInto('你好');
        let dest: Uint8Array = new Uint8Array(4);
        te.encodeIntoUint8Array('你好', dest);
        expect(dest.$_get(0)).assertEqual(a.$_get(0));
        expect(dest.$_get(1)).assertEqual(a.$_get(1));
        expect(dest.$_get(2)).assertEqual(a.$_get(2));
        expect(dest.$_get(3)).assertEqual(a.$_get(3));

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-16le');
        let a: Uint8Array = te.encodeInto('你');
        let dest: Uint8Array = new Uint8Array(2);
        te.encodeIntoUint8Array('你', dest);
        expect(dest.$_get(0)).assertEqual(a.$_get(0));
        expect(dest.$_get(1)).assertEqual(a.$_get(1));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1400
     * @tc.name testTeOvUnicode001
     * @tc.desc Verify TextEncoder overview with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('你');
        expect(r.length).assertEqual(3);
        expect(r[0]).assertEqual(0xE4);
        expect(r[1]).assertEqual(0xBD);
        expect(r[2]).assertEqual(0xA0);

      }
      {
        let s = '';
        for (let i = 0; i < 500; i++) {
          s = s + '你';
        }
        let te = new util.TextEncoder();
        let r = te.encodeInto(s);
        expect(r.length).assertEqual(1500);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder();
        let out: Uint8Array = te.encodeInto('你');
        expect(out.length).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let r1: Uint8Array = te.encodeInto('a');
        let r2: Uint8Array = te.encodeInto('你');
        let r3: Uint8Array = te.encodeInto('abc');
        expect(r1.byteLength).assertEqual(1);
        expect(r2.byteLength).assertEqual(3);
        expect(r3.byteLength).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('你', dest);
        expect(info.read).assertEqual(1);
        expect(info.written).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1500
     * @tc.name testTeOvEmoji001
     * @tc.desc Verify TextEncoder overview with emoji and surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvEmoji001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('😀');
        expect(r.length).assertEqual(4);
        expect(r[0]).assertEqual(0xF0);
        expect(r[1]).assertEqual(0x9F);
        expect(r[2]).assertEqual(0x98);
        expect(r[3]).assertEqual(0x80);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('😀你');
        expect(r.length).assertEqual(7);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1600
     * @tc.name testTeOvBoundary001
     * @tc.desc Verify TextEncoder overview with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let r: Uint8Array | undefined = undefined;
        r = te.encodeInto();
        expect(r!.length).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let r: Uint8Array | undefined = undefined;
        r = te.encodeInto('');
        expect(r!.length).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1700
     * @tc.name testTeOvConsistency001
     * @tc.desc Verify TextEncoder overview state consistency and default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let r1: Uint8Array = te.encodeInto('你好');
        r1.$_set(0, 0);
        r1.$_set(1, 0);
        r1.$_set(2, 0);
        let r2: Uint8Array = te.encodeInto('你好');
        expect(r2.$_get(0)).assertEqual(0xE4);
        expect(r2.$_get(1)).assertEqual(0xBD);
        expect(r2.$_get(2)).assertEqual(0xA0);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let r1: Uint8Array = te.encodeInto('abc');
        let r2: Uint8Array = te.encodeInto('abc');
        expect(r1.$_get(0)).assertEqual(r2.$_get(0));
        expect(r1.$_get(1)).assertEqual(r2.$_get(1));
        expect(r1.$_get(2)).assertEqual(r2.$_get(2));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1800
     * @tc.name testTeOvBasic001
     * @tc.desc Verify TextEncoder overview with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('a');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(97);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('你好');
        expect(r.length).assertEqual(6);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('\uD800');
        expect(r.length).assertEqual(3);
        expect(r[0]).assertEqual(0xED);
        expect(r[1]).assertEqual(0xA0);
        expect(r[2]).assertEqual(0x80);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('\uDC00');
        expect(r.length).assertEqual(3);
        expect(r[0]).assertEqual(0xED);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('\0');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('a\0b');
        expect(r.length).assertEqual(3);
        expect(r[0]).assertEqual(97);
        expect(r[1]).assertEqual(0);
        expect(r[2]).assertEqual(98);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('\n');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(10);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('\uD800¥¥');
        expect(r.length).assertEqual(7);
        expect(r[0]).assertEqual(0xED);
        expect(r[1]).assertEqual(0xA0);
        expect(r[2]).assertEqual(0x80);
        expect(r[3]).assertEqual(0xC2);
        expect(r[4]).assertEqual(0xA5);
        expect(r[5]).assertEqual(0xC2);
        expect(r[6]).assertEqual(0xA5);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('é');
        expect(r.length).assertEqual(3);
        expect(r[0]).assertEqual(0x65);
        expect(r[1]).assertEqual(0xCC);
        expect(r[2]).assertEqual(0x81);

      }
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto(' ');
        expect(r.length).assertEqual(1);
        expect(r[0]).assertEqual(32);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_1900
     * @tc.name testTeOvBasic002
     * @tc.desc Verify TextEncoder overview with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let r = te.encodeInto('a你b');
        expect(r.length).assertEqual(5);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let r1: Uint8Array = te.encodeInto('abc');
        r1.$_set(0, 0);
        let r2: Uint8Array = te.encodeInto('abc');
        expect(r2.$_get(0)).assertEqual(97);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('abc');
        expect(out.length).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto('abc');
        expect(out.byteLength).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(4);
        let info = te.encodeIntoUint8Array('abc', dest);
        expect(info.written).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(4);
        te.encodeIntoUint8Array('abc', dest);
        expect(dest[0]).assertEqual(97);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(8);
        let info = te.encodeIntoUint8Array('a你b', dest);
        expect(info.read).assertEqual(3);
        expect(info.written).assertEqual(5);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(2);
        let info = te.encodeIntoUint8Array('abc', dest);
        expect(info.read).assertEqual(2);
        expect(info.written).assertEqual(2);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(3);
        let info = te.encodeIntoUint8Array('abc', dest);
        expect(info.read).assertEqual(3);
        expect(info.written).assertEqual(3);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(4);
        te.encodeIntoUint8Array('abcd', dest);
        let raw: Uint8Array = new Uint8Array(dest.buffer);
        expect(raw.$_get(0)).assertEqual(97);
        expect(raw.$_get(3)).assertEqual(100);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_OVERVIEW_2000
     * @tc.name testTeOvBasic003
     * @tc.desc Verify TextEncoder overview with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeOvBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let buf: ArrayBuffer = new ArrayBuffer(8);
        let view: Uint8Array = new Uint8Array(buf, 2, 4);
        te.encodeIntoUint8Array('ab', view);
        let raw: Uint8Array = new Uint8Array(buf);
        expect(raw.$_get(0)).assertEqual(0);
        expect(raw.$_get(2)).assertEqual(97);
        expect(raw.$_get(3)).assertEqual(98);
        expect(raw.$_get(4)).assertEqual(0);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array(6);
        te.encodeIntoUint8Array('abc', dest);
        expect(dest.byteLength).assertEqual(6);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let dest: Uint8Array = new Uint8Array([0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF]);
        te.encodeIntoUint8Array('abc', dest);
        expect(dest.$_get(0)).assertEqual(97);
        expect(dest.$_get(1)).assertEqual(98);
        expect(dest.$_get(2)).assertEqual(99);
        expect(dest.$_get(3)).assertEqual(0xFF);
        expect(dest.$_get(4)).assertEqual(0xFF);
        expect(dest.$_get(5)).assertEqual(0xFF);

      }
    });

  });
}
