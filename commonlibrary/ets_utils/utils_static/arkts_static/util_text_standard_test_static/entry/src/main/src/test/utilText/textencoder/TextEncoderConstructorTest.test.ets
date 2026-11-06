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

export default function TextEncoderConstructorTest(): void {
  describe('TextEncoderConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_0100
     * @tc.name testTeCtorThrows001
     * @tc.desc Verify TextEncoder constructor throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.TextEncoder('x');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('utf');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('utf_8');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('utf-8!');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('utf-8-extra');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('UTF16');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('shift-jis');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('euc-jp-');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('x-unknown');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('fake-encoding');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_0200
     * @tc.name testTeCtorThrows002
     * @tc.desc Verify TextEncoder constructor throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.TextEncoder('12345678');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('中文');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('abcdefgh');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('\t\n');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_0300
     * @tc.name testTeCtorEncoding001
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let enc = new util.TextEncoder();
        expect(enc.encoding).assertEqual('utf-8');

      }
      {
        let enc = new util.TextEncoder('utf-8');
        expect(enc.encoding).assertEqual('utf-8');

      }
      {
        let enc = new util.TextEncoder('utf-16le');
        expect(enc.encoding).assertEqual('utf-16le');

      }
      {
        let enc = new util.TextEncoder('utf-16be');
        expect(enc.encoding).assertEqual('utf-16be');

      }
      {
        let enc = new util.TextEncoder('gbk');
        expect(enc.encoding).assertEqual('gbk');

      }
      {
        let enc = new util.TextEncoder('gb2312');
        expect(enc.encoding).assertEqual('gb2312');

      }
      {
        let enc = new util.TextEncoder('gb18030');
        expect(enc.encoding).assertEqual('gb18030');

      }
      {
        let enc = new util.TextEncoder('big5');
        expect(enc.encoding).assertEqual('big5');

      }
      {
        let enc = new util.TextEncoder('euc-jp');
        expect(enc.encoding).assertEqual('euc-jp');

      }
      {
        let enc = new util.TextEncoder('shift_jis');
        expect(enc.encoding).assertEqual('shift_jis');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_0400
     * @tc.name testTeCtorEncoding002
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let enc = new util.TextEncoder('iso-2022-jp');
        expect(enc.encoding).assertEqual('iso-2022-jp');

      }
      {
        let enc = new util.TextEncoder('euc-kr');
        expect(enc.encoding).assertEqual('euc-kr');

      }
      {
        let enc = new util.TextEncoder('koi8-r');
        expect(enc.encoding).assertEqual('koi8-r');

      }
      {
        let enc = new util.TextEncoder('koi8-u');
        expect(enc.encoding).assertEqual('koi8-u');

      }
      {
        let enc = new util.TextEncoder('macintosh');
        expect(enc.encoding).assertEqual('macintosh');

      }
      {
        let enc = new util.TextEncoder('windows-1252');
        expect(enc.encoding).assertEqual('windows-1252');

      }
      {
        let enc = new util.TextEncoder('windows-1251');
        expect(enc.encoding).assertEqual('windows-1251');

      }
      {
        let enc = new util.TextEncoder('windows-874');
        expect(enc.encoding).assertEqual('windows-874');

      }
      {
        let enc = new util.TextEncoder('iso-8859-1');
        expect(enc.encoding).assertEqual('iso-8859-1');

      }
      {
        let enc = new util.TextEncoder('iso-8859-2');
        expect(enc.encoding).assertEqual('iso-8859-2');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_0500
     * @tc.name testTeCtorEncoding003
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let enc = new util.TextEncoder('iso-8859-15');
        expect(enc.encoding).assertEqual('iso-8859-15');

      }
      {
        let enc = new util.TextEncoder('iso-8859-8-i');
        expect(enc.encoding).assertEqual('iso-8859-8-i');

      }
      {
        let enc = new util.TextEncoder('x-mac-cyrillic');
        expect(enc.encoding).assertEqual('x-mac-cyrillic');

      }
      {
        let enc = new util.TextEncoder('ibm866');
        expect(enc.encoding).assertEqual('ibm866');

      }
      {
        let enc = new util.TextEncoder('windows-1250');
        expect(enc.encoding).assertEqual('windows-1250');

      }
      {
        let enc = new util.TextEncoder('UTF-8');
        expect(enc.encoding).assertEqual('UTF-8');

      }
      {
        try {
          new util.TextEncoder('utf8');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('utf-8 ');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder(' utf-8');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('utf-8\t');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_0600
     * @tc.name testTeCtorEncoding004
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let enc = new util.TextEncoder('UTF-16LE');
        expect(enc.encoding).assertEqual('UTF-16LE');

      }
      {
        try {
          new util.TextEncoder('unicode-1-1-utf-8');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('latin1');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('ascii');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('cp1252');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('iso8859-1');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('shiftjis');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('eucjp');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('x-user-defined');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('utf-16');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_0700
     * @tc.name testTeCtorEncoding005
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.TextEncoder('csutf8');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('unicode');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('gb2312-80');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('gbk!');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('utf-8\u0000x');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('-utf-8');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let e1 = new util.TextEncoder();
        let e2 = new util.TextEncoder();
        expect(e1.encoding).assertEqual(e2.encoding);

      }
      {
        let enc = new util.TextEncoder();
        let bytes = enc.encodeInto('A');
        expect(bytes[0]).assertEqual(65);

      }
      {
        let enc = new util.TextEncoder();
        let bytes = enc.encodeInto('中');
        expect(bytes.length).assertEqual(3);

      }
      {
        let enc = new util.TextEncoder('utf-16le');
        let bytes = enc.encodeInto('A');
        expect(bytes.length).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_0800
     * @tc.name testTeCtorEncoding006
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let enc = new util.TextEncoder('utf-16be');
        let bytes = enc.encodeInto('A');
        expect(bytes.length).assertEqual(2);

      }
      {
        let enc = new util.TextEncoder('gbk');
        let bytes = enc.encodeInto('中');
        expect(bytes.length).assertEqual(2);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding).assertEqual('utf-8');

      }
      {
        let typedEncoder: util.TextEncoder = new util.TextEncoder();
        expect(typedEncoder.encoding).assertEqual('utf-8');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.length).assertEqual(5);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.charCodeAt(0)).assertEqual(117);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.charCodeAt(2)).assertEqual(102);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.charCodeAt(4)).assertEqual(56);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.charCodeAt(encoder.encoding.length - 1)).assertEqual(56);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.indexOf('-')).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_0900
     * @tc.name testTeCtorEncoding007
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.indexOf('utf-8')).assertEqual(0);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.lastIndexOf('8')).assertEqual(4);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.startsWith('utf')).assertTrue();
        expect(encoder.encoding).assertEqual('utf-8');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.endsWith('8')).assertTrue();
        expect(encoder.encoding).assertEqual('utf-8');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.toUpperCase()).assertEqual('UTF-8');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.codePointAt(0)).assertEqual(117);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.substring(1, 3)).assertEqual('tf');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.slice(0, 3)).assertEqual('utf');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.split('-')[0]).assertEqual('utf');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.includes('utf-8')).assertTrue();
        expect(encoder.encoding).assertEqual('utf-8');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1000
     * @tc.name testTeCtorEncoding008
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.trim()).assertEqual('utf-8');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding).assertEqual(encoder.encoding.toLowerCase());

      }
      {
        let encoder = new util.TextEncoder();
        let computed: string = 'utf-' + '8';
        expect(encoder.encoding).assertEqual(computed);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.concat('')).assertEqual('utf-8');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.repeat(1)).assertEqual('utf-8');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.padStart(5, 'x')).assertEqual('utf-8');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.replace('utf', 'UTF')).assertEqual('UTF-8');

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.search('8')).assertEqual(4);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encoding.localeCompare('utf-8')).assertEqual(0);

      }
      {
        let encoder = new util.TextEncoder('utf-16le');
        expect(encoder.encoding.length).assertEqual(8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1100
     * @tc.name testTeCtorEncoding009
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encoder = new util.TextEncoder('gbk');
        expect(encoder.encoding.length).assertEqual(3);

      }
      {
        let r1 = new util.TextEncoder().encoding;
        let r2 = new util.TextEncoder().encoding;
        expect(r1).assertEqual('utf-8');
        expect(r2).assertEqual('utf-8');

      }
      {
        let encoder = new util.TextEncoder();
        let decoder = new util.TextDecoder();
        expect(encoder.encoding).assertEqual('utf-8');
        expect(decoder.encoding).assertEqual('utf-8');

      }
      {
        let encoder = new util.TextEncoder();
        encoder.encodeInto('abc');
        expect(encoder.encoding).assertEqual('utf-8');

      }
      {
        let enc1: string = new util.TextEncoder().encoding;
        let enc2: string = new util.TextEncoder().encoding;
        expect(enc1).assertEqual('utf-8');
        expect(enc2).assertEqual('utf-8');

      }
      {
        let n1 = new util.TextEncoder();
        let n2 = new util.TextEncoder();
        let n3 = new util.TextEncoder();
        expect(n1.encoding).assertEqual(n2.encoding);
        expect(n2.encoding).assertEqual(n3.encoding);

      }
      {
        expect(new util.TextEncoder().encoding).assertEqual('utf-8');

      }
      {
        expect(new util.TextEncoder().encoding.length).assertEqual(5);

      }
      {
        expect(new util.TextEncoder().encoding.charCodeAt(0)).assertEqual(117);

      }
      {
        expect(new util.TextEncoder().encoding.toUpperCase()).assertEqual('UTF-8');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1200
     * @tc.name testTeCtorEncoding010
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(new util.TextEncoder().encoding.indexOf('-')).assertEqual(3);

      }
      {
        expect(new util.TextEncoder('utf-16le').encoding).assertEqual('utf-16le');

      }
      {
        expect(new util.TextEncoder('gbk').encoding.toUpperCase()).assertEqual('GBK');

      }
      {
        let c1 = new util.TextEncoder().encoding;
        let c2 = new util.TextEncoder().encoding;
        expect(c1).assertEqual(c2);

      }
      {
        let encoder = new util.TextEncoder('utf-16le');
        expect(encoder.encodeInto('你').length).assertEqual(2);

      }
      {
        let encoder = new util.TextEncoder('utf-16be');
        expect(encoder.encodeInto('你').length).assertEqual(2);

      }
      {
        let encoder = new util.TextEncoder('gbk');
        expect(encoder.encodeInto('你').length).assertEqual(2);

      }
      {
        let encoder = new util.TextEncoder('big5');
        let bytes = encoder.encodeInto('你');
        expect(bytes.length).assertEqual(2);

      }
      {
        let encoder = new util.TextEncoder('utf-16le');
        let bytes = encoder.encodeInto('\uFEFF');
        expect(bytes.length).assertEqual(2);

      }
      {
        let encoder = new util.TextEncoder('utf-16le');
        expect(encoder.encodeInto('abc').length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1300
     * @tc.name testTeCtorEncoding011
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let enc: string | undefined = undefined;
        let encoder = new util.TextEncoder(enc);
        expect(encoder.encoding).assertEqual('utf-8');

      }
      {
        let enc: string | undefined = undefined;
        let encoder = new util.TextEncoder(enc);
        let u8 = encoder.encodeInto('A');
        expect(u8[0]).assertEqual(65);

      }
      {
        let le = new util.TextEncoder('utf-16le');
        let be = new util.TextEncoder('utf-16be');
        let u8le = le.encodeInto('A');
        let u8be = be.encodeInto('A');
        expect(u8le[0]).assertEqual(65);
        expect(u8le[1]).assertEqual(0);
        expect(u8be[0]).assertEqual(0);
        expect(u8be[1]).assertEqual(65);

      }
      {
        let utf8Enc = new util.TextEncoder('utf-8');
        let gbEnc = new util.TextEncoder('gb18030');
        let u8a = utf8Enc.encodeInto('中');
        let u8b = gbEnc.encodeInto('中');
        expect(u8a[0]).assertEqual(228);
        expect(u8a[1]).assertEqual(184);
        expect(u8a[2]).assertEqual(173);
        expect(u8b[0]).assertEqual(214);
        expect(u8b[1]).assertEqual(208);

      }
      {
        let euc = new util.TextEncoder('euc-jp');
        let sjis = new util.TextEncoder('shift_jis');
        let u8a = euc.encodeInto('あ');
        let u8b = sjis.encodeInto('あ');
        expect(u8a[0]).assertEqual(164);
        expect(u8a[1]).assertEqual(162);
        expect(u8b[0]).assertEqual(130);
        expect(u8b[1]).assertEqual(160);

      }
      {
        let big5 = new util.TextEncoder('big5');
        let gbk = new util.TextEncoder('gbk');
        let u8a = big5.encodeInto('你');
        let u8b = gbk.encodeInto('你');
        expect(u8a[0]).assertEqual(167);
        expect(u8a[1]).assertEqual(65);
        expect(u8b[0]).assertEqual(196);
        expect(u8b[1]).assertEqual(227);

      }
      {
        let cp1252 = new util.TextEncoder('windows-1252');
        let latin1 = new util.TextEncoder('iso-8859-1');
        let u8a = cp1252.encodeInto('€');
        let u8b = latin1.encodeInto('€');
        expect(u8a[0]).assertEqual(128);
        expect(u8b[0]).assertEqual(26);

      }
      {
        let le = new util.TextEncoder('utf-16le');
        let u8 = le.encodeInto('你');
        expect(u8[0]).assertEqual(96);
        expect(u8[1]).assertEqual(79);

      }
      {
        let be = new util.TextEncoder('utf-16be');
        let u8 = be.encodeInto('你');
        expect(u8[0]).assertEqual(79);
        expect(u8[1]).assertEqual(96);

      }
      {
        let encoder = new util.TextEncoder('utf-8');
        expect(encoder.encoding).assertEqual('utf-8');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1400
     * @tc.name testTeCtorEncoding012
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encoder = new util.TextEncoder('iso-8859-5');
        expect(encoder.encoding).assertEqual('iso-8859-5');

      }
      {
        let encoder = new util.TextEncoder('utf-8');
        let u8 = encoder.encodeInto('中');
        expect(u8[0]).assertEqual(228);
        expect(u8[1]).assertEqual(184);
        expect(u8[2]).assertEqual(173);

      }
      {
        let encoder = new util.TextEncoder('utf-8');
        let u8 = encoder.encodeInto('😀');
        expect(u8[0]).assertEqual(240);
        expect(u8[1]).assertEqual(159);
        expect(u8[2]).assertEqual(152);
        expect(u8[3]).assertEqual(128);

      }
      {
        let encoder = new util.TextEncoder('utf-8');
        let u8 = encoder.encodeInto('A');
        expect(u8[0]).assertEqual(65);

      }
      {
        let encoder = new util.TextEncoder('utf-8');
        let u8 = encoder.encodeInto('中英混排abc你');
        expect(u8[0]).assertEqual(228);
        expect(u8[1]).assertEqual(184);
        expect(u8[2]).assertEqual(173);
        expect(u8[3]).assertEqual(232);
        expect(u8[4]).assertEqual(139);
        expect(u8[5]).assertEqual(177);
        expect(u8[6]).assertEqual(230);
        expect(u8[7]).assertEqual(183);
        expect(u8[8]).assertEqual(183);
        expect(u8[9]).assertEqual(230);
        expect(u8[10]).assertEqual(142);
        expect(u8[11]).assertEqual(146);

      }
      {
        let encoder = new util.TextEncoder('gb18030');
        let u8 = encoder.encodeInto('中');
        expect(u8[0]).assertEqual(214);
        expect(u8[1]).assertEqual(208);

      }
      {
        let encoder = new util.TextEncoder('gbk');
        let u8 = encoder.encodeInto('中');
        expect(u8[0]).assertEqual(214);
        expect(u8[1]).assertEqual(208);

      }
      {
        let encoder = new util.TextEncoder('gb2312');
        let u8 = encoder.encodeInto('中');
        expect(u8[0]).assertEqual(214);
        expect(u8[1]).assertEqual(208);

      }
      {
        let encoder = new util.TextEncoder('big5');
        let u8 = encoder.encodeInto('你');
        expect(u8[0]).assertEqual(167);
        expect(u8[1]).assertEqual(65);

      }
      {
        let encoder = new util.TextEncoder('utf-16le');
        let u8 = encoder.encodeInto('A');
        expect(u8[0]).assertEqual(65);
        expect(u8[1]).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1500
     * @tc.name testTeCtorEncoding013
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encoder = new util.TextEncoder('utf-16be');
        let u8 = encoder.encodeInto('A');
        expect(u8[0]).assertEqual(0);
        expect(u8[1]).assertEqual(65);

      }
      {
        let encoder = new util.TextEncoder('utf-16le');
        let u8 = encoder.encodeInto('中');
        expect(u8[0]).assertEqual(45);
        expect(u8[1]).assertEqual(78);

      }
      {
        let encoder = new util.TextEncoder('utf-16be');
        let u8 = encoder.encodeInto('中');
        expect(u8[0]).assertEqual(78);
        expect(u8[1]).assertEqual(45);

      }
      {
        let encoder = new util.TextEncoder('euc-jp');
        let u8 = encoder.encodeInto('あ');
        expect(u8[0]).assertEqual(164);
        expect(u8[1]).assertEqual(162);

      }
      {
        let encoder = new util.TextEncoder('shift_jis');
        let u8 = encoder.encodeInto('あ');
        expect(u8[0]).assertEqual(130);
        expect(u8[1]).assertEqual(160);

      }
      {
        let encoder = new util.TextEncoder('iso-8859-1');
        let u8 = encoder.encodeInto('é');
        expect(u8[0]).assertEqual(233);

      }
      {
        let encoder = new util.TextEncoder('windows-1252');
        let u8 = encoder.encodeInto('é');
        expect(u8[0]).assertEqual(233);

      }
      {
        let encoder = new util.TextEncoder('windows-1252');
        let u8 = encoder.encodeInto('€');
        expect(u8[0]).assertEqual(128);

      }
      {
        let encoder = new util.TextEncoder('iso-8859-1');
        let u8 = encoder.encodeInto('€');
        expect(u8[0]).assertEqual(26);

      }
      {
        let encoder = new util.TextEncoder('gb18030');
        let u8 = encoder.encodeInto('中英');
        expect(u8[0]).assertEqual(214);
        expect(u8[1]).assertEqual(208);
        expect(u8[2]).assertEqual(211);
        expect(u8[3]).assertEqual(162);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1600
     * @tc.name testTeCtorEncoding014
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encoder = new util.TextEncoder('windows-1250');
        let u8 = encoder.encodeInto('A');
        expect(u8[0]).assertEqual(65);

      }
      {
        let encoder = new util.TextEncoder('windows-1256');
        let u8 = encoder.encodeInto('A');
        expect(u8[0]).assertEqual(65);

      }
      {
        let encoder = new util.TextEncoder('koi8-u');
        let u8 = encoder.encodeInto('A');
        expect(u8[0]).assertEqual(65);

      }
      {
        let encoder = new util.TextEncoder('iso-8859-2');
        let u8 = encoder.encodeInto('A');
        expect(u8[0]).assertEqual(65);

      }
      {
        let encoder = new util.TextEncoder('windows-874');
        let u8 = encoder.encodeInto('A');
        expect(u8[0]).assertEqual(65);

      }
      {
        let encoder = new util.TextEncoder('utf-8');
        let u8 = encoder.encodeInto('中');
        expect(u8.length).assertEqual(3);

      }
      {
        let encoder = new util.TextEncoder('utf-16le');
        let u8 = encoder.encodeInto('中');
        expect(u8.length).assertEqual(2);

      }
      {
        let encoder = new util.TextEncoder('utf-8');
        let u8 = encoder.encodeInto('😀');
        expect(u8.length).assertEqual(4);

      }
      {
        let encoder = new util.TextEncoder('gb18030');
        let u8 = encoder.encodeInto('中英');
        expect(u8.length).assertEqual(8);

      }
      {
        let encoder = new util.TextEncoder('utf-8');
        let u8 = encoder.encodeInto('A');
        expect(u8.length).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1700
     * @tc.name testTeCtorEncoding015
     * @tc.desc Verify TextEncoder constructor with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEncoding015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.TextEncoder('utf-8😀');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1800
     * @tc.name testTeCtorUnicode001
     * @tc.desc Verify TextEncoder constructor with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encoder = new util.TextEncoder();
        let bytes = encoder.encodeInto('你');
        expect(bytes.length).assertEqual(3);
        expect(bytes.$_get(0)).assertEqual(0xE4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_1900
     * @tc.name testTeCtorEmoji001
     * @tc.desc Verify TextEncoder constructor with emoji and surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorEmoji001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encodeInto('😀').length).assertEqual(4);

      }
      {
        try {
          new util.TextEncoder('😀');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_2000
     * @tc.name testTeCtorControl001
     * @tc.desc Verify TextEncoder constructor with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.TextEncoder('\u0000');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('null');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_2100
     * @tc.name testTeCtorSpecial001
     * @tc.desc Verify TextEncoder constructor with special format content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorSpecial001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.TextEncoder('<script>alert(1)</script>');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_2200
     * @tc.name testTeCtorBoundary001
     * @tc.desc Verify TextEncoder constructor with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let longName: string = '';
        let idx: int = 0;
        while (idx < 10000) {
          longName = longName + 'x';
          idx = idx + 1;
        }
        try {
          new util.TextEncoder(longName);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_2300
     * @tc.name testTeCtorConsistency001
     * @tc.desc Verify TextEncoder constructor state consistency and default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encodeInto('abc').length).assertEqual(3);

      }
      {
        let encoder = new util.TextEncoder();
        expect(encoder.encodeInto('a\u0000你').length).assertEqual(5);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_2400
     * @tc.name testTeCtorBasic001
     * @tc.desc Verify TextEncoder constructor with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.TextEncoder('unknown');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let enc = new util.TextEncoder('');
        expect(enc.encoding).assertEqual('utf-8');

      }
      {
        try {
          new util.TextEncoder(' ');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('\n');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('0');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('12345');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('utf-99');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('abc');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('编码');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('\udc04');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CONSTRUCTOR_2500
     * @tc.name testTeCtorBasic002
     * @tc.desc Verify TextEncoder constructor with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCtorBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          new util.TextEncoder('undefined');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          new util.TextEncoder('%s');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let longName: string = 'x'.repeat(1000);
        try {
          new util.TextEncoder(longName);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        expect(new util.TextEncoder().encodeInto('abc').length).assertEqual(3);

      }
      {
        let chainedBytes = new util.TextEncoder().encodeInto('a');
        expect(chainedBytes.$_get(0)).assertEqual(97);

      }
      {
        try {
          new util.TextEncoder('utf 8');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

  });
}
