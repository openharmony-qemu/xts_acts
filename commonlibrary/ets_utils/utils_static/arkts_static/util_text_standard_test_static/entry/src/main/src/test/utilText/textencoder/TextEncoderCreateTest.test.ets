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

export default function TextEncoderCreateTest(): void {
  describe('TextEncoderCreateTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_0100
     * @tc.name testTeCreateEncoding001
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te0 = util.TextEncoder.create();
        expect(te0.encoding).assertEqual('utf-8');

      }
      {
        let te1 = util.TextEncoder.create('utf-8');
        expect(te1.encoding).assertEqual('utf-8');

      }
      {
        let encU2: string | undefined = undefined;
        let te2 = util.TextEncoder.create(encU2);
        expect(te2.encoding).assertEqual('utf-8');

      }
      {
        let te3 = util.TextEncoder.create('utf-16le');
        expect(te3.encoding).assertEqual('utf-16le');

      }
      {
        let te4a = util.TextEncoder.create();
        let te4b = new util.TextEncoder();
        expect(te4a.encoding).assertEqual(te4b.encoding);

      }
      {
        let te5a = util.TextEncoder.create('utf-8');
        let te5b = new util.TextEncoder('utf-8');
        expect(te5a.encoding).assertEqual(te5b.encoding);

      }
      {
        let teE1 = util.TextEncoder.create('big5');
        expect(teE1.encoding).assertEqual('big5');

      }
      {
        let teE2 = util.TextEncoder.create('gb18030');
        expect(teE2.encoding).assertEqual('gb18030');

      }
      {
        let teE3 = util.TextEncoder.create('utf-16be');
        expect(teE3.encoding).assertEqual('utf-16be');

      }
      {
        let teE5 = util.TextEncoder.create('gb2312');
        expect(teE5.encoding).assertEqual('gb2312');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_0200
     * @tc.name testTeCreateEncoding002
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let teE6 = util.TextEncoder.create('iso-8859-1');
        expect(teE6.encoding).assertEqual('iso-8859-1');

      }
      {
        let teE7 = util.TextEncoder.create('iso-8859-2');
        expect(teE7.encoding).assertEqual('iso-8859-2');

      }
      {
        let teE8 = util.TextEncoder.create('iso-8859-3');
        expect(teE8.encoding).assertEqual('iso-8859-3');

      }
      {
        let teE9 = util.TextEncoder.create('iso-8859-4');
        expect(teE9.encoding).assertEqual('iso-8859-4');

      }
      {
        let teE10 = util.TextEncoder.create('iso-8859-5');
        expect(teE10.encoding).assertEqual('iso-8859-5');

      }
      {
        let teE11 = util.TextEncoder.create('iso-8859-6');
        expect(teE11.encoding).assertEqual('iso-8859-6');

      }
      {
        let teE12 = util.TextEncoder.create('iso-8859-7');
        expect(teE12.encoding).assertEqual('iso-8859-7');

      }
      {
        let teE13 = util.TextEncoder.create('iso-8859-8');
        expect(teE13.encoding).assertEqual('iso-8859-8');

      }
      {
        let teE14 = util.TextEncoder.create('iso-8859-8-i');
        expect(teE14.encoding).assertEqual('iso-8859-8-i');

      }
      {
        let teE15 = util.TextEncoder.create('iso-8859-10');
        expect(teE15.encoding).assertEqual('iso-8859-10');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_0300
     * @tc.name testTeCreateEncoding003
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let teE16 = util.TextEncoder.create('iso-8859-13');
        expect(teE16.encoding).assertEqual('iso-8859-13');

      }
      {
        let teE17 = util.TextEncoder.create('iso-8859-14');
        expect(teE17.encoding).assertEqual('iso-8859-14');

      }
      {
        let teE18 = util.TextEncoder.create('iso-8859-15');
        expect(teE18.encoding).assertEqual('iso-8859-15');

      }
      {
        let teE19 = util.TextEncoder.create('koi8-r');
        expect(teE19.encoding).assertEqual('koi8-r');

      }
      {
        let teE20 = util.TextEncoder.create('koi8-u');
        expect(teE20.encoding).assertEqual('koi8-u');

      }
      {
        let teE21 = util.TextEncoder.create('macintosh');
        expect(teE21.encoding).assertEqual('macintosh');

      }
      {
        let teE22 = util.TextEncoder.create('windows-874');
        expect(teE22.encoding).assertEqual('windows-874');

      }
      {
        let teE23 = util.TextEncoder.create('windows-1250');
        expect(teE23.encoding).assertEqual('windows-1250');

      }
      {
        let teE24 = util.TextEncoder.create('windows-1251');
        expect(teE24.encoding).assertEqual('windows-1251');

      }
      {
        let teE25 = util.TextEncoder.create('windows-1252');
        expect(teE25.encoding).assertEqual('windows-1252');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_0400
     * @tc.name testTeCreateEncoding004
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let teE26 = util.TextEncoder.create('windows-1253');
        expect(teE26.encoding).assertEqual('windows-1253');

      }
      {
        let teE27 = util.TextEncoder.create('windows-1254');
        expect(teE27.encoding).assertEqual('windows-1254');

      }
      {
        let teE28 = util.TextEncoder.create('windows-1255');
        expect(teE28.encoding).assertEqual('windows-1255');

      }
      {
        let teE29 = util.TextEncoder.create('windows-1256');
        expect(teE29.encoding).assertEqual('windows-1256');

      }
      {
        let teE30 = util.TextEncoder.create('windows-1257');
        expect(teE30.encoding).assertEqual('windows-1257');

      }
      {
        let teE31 = util.TextEncoder.create('windows-1258');
        expect(teE31.encoding).assertEqual('windows-1258');

      }
      {
        let teE32 = util.TextEncoder.create('x-mac-cyrillic');
        expect(teE32.encoding).assertEqual('x-mac-cyrillic');

      }
      {
        let teE33 = util.TextEncoder.create('gbk');
        expect(teE33.encoding).assertEqual('gbk');

      }
      {
        let teE34 = util.TextEncoder.create('euc-jp');
        expect(teE34.encoding).assertEqual('euc-jp');

      }
      {
        let teE35 = util.TextEncoder.create('iso-2022-jp');
        expect(teE35.encoding).assertEqual('iso-2022-jp');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_0500
     * @tc.name testTeCreateEncoding005
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let teE36 = util.TextEncoder.create('shift_jis');
        expect(teE36.encoding).assertEqual('shift_jis');

      }
      {
        let teE37 = util.TextEncoder.create('euc-kr');
        expect(teE37.encoding).assertEqual('euc-kr');

      }
      {
        let teE38 = util.TextEncoder.create('ibm866');
        expect(teE38.encoding).assertEqual('ibm866');

      }
      {
        try {
          util.TextEncoder.create('utf8');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          util.TextEncoder.create('latin1');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          util.TextEncoder.create('ascii');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          util.TextEncoder.create(' ');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let teL8 = util.TextEncoder.create('big5');
        let a8 = teL8.encoding;
        teL8.encodeInto('A');
        expect(teL8.encoding).assertEqual(a8);

      }
      {
        let teR2 = util.TextEncoder.create('utf-16be');
        expect(teR2.encoding.length).assertEqual(8);

      }
      {
        let teR3 = util.TextEncoder.create('iso-8859-8-i');
        expect(teR3.encoding.length).assertEqual(12);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_0600
     * @tc.name testTeCreateEncoding006
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let teR4 = util.TextEncoder.create('windows-1258');
        expect(teR4.encoding.length).assertEqual(12);

      }
      {
        let teR5 = util.TextEncoder.create('x-mac-cyrillic');
        expect(teR5.encoding.length).assertEqual(14);

      }
      {
        let gA6 = util.TextEncoder.create('gbk').encoding;
        let gB6 = util.TextEncoder.create('gbk').encoding;
        expect(gA6).assertEqual('gbk');
        expect(gB6).assertEqual('gbk');

      }
      {
        let teR7a = util.TextEncoder.create('utf-16le');
        let teR7b = util.TextEncoder.create('utf-16le');
        expect(teR7a.encoding).assertEqual(teR7b.encoding);

      }
      {
        let teR8a = util.TextEncoder.create();
        let teR8b = util.TextEncoder.create();
        expect(teR8a.encoding).assertEqual(teR8b.encoding);

      }
      {
        let teD1 = util.TextEncoder.create('utf-8');
        let bD1: Uint8Array = teD1.encodeInto('A');
        expect(bD1[0]).assertEqual(65);

      }
      {
        let teD2 = util.TextEncoder.create('utf-8');
        let bD2: Uint8Array = teD2.encodeInto('中');
        expect(bD2.length).assertEqual(3);

      }
      {
        let teD3 = util.TextEncoder.create('utf-16le');
        let bD3: Uint8Array = teD3.encodeInto('A');
        expect(bD3.length).assertEqual(2);

      }
      {
        let teD4 = util.TextEncoder.create('utf-16be');
        let bD4: Uint8Array = teD4.encodeInto('A');
        expect(bD4.length).assertEqual(2);

      }
      {
        let teD5 = util.TextEncoder.create('gbk');
        let bD5: Uint8Array = teD5.encodeInto('中');
        expect(bD5.length).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_0700
     * @tc.name testTeCreateEncoding007
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let teD6 = util.TextEncoder.create('big5');
        let bD6: Uint8Array = teD6.encodeInto('中');
        expect(bD6.length).assertEqual(2);

      }
      {
        let teD7 = util.TextEncoder.create('iso-8859-1');
        let bD7: Uint8Array = teD7.encodeInto('A');
        expect(bD7.length).assertEqual(1);

      }
      {
        let encA4 = util.TextEncoder.create();
        expect(encA4.encoding).assertEqual('utf-8');

      }
      {
        let encA5 = util.TextEncoder.create('utf-8');
        expect(encA5.encoding).assertEqual('utf-8');

      }
      {
        let encA6 = util.TextEncoder.create('gbk');
        expect(encA6.encoding).assertEqual('gbk');

      }
      {
        let encA7 = util.TextEncoder.create('big5');
        expect(encA7.encoding).assertEqual('big5');

      }
      {
        let encA8 = util.TextEncoder.create('utf-16le');
        expect(encA8.encoding).assertEqual('utf-16le');

      }
      {
        let encA9 = util.TextEncoder.create('utf-16be');
        expect(encA9.encoding).assertEqual('utf-16be');

      }
      {
        let encA10 = util.TextEncoder.create('euc-jp');
        expect(encA10.encoding).assertEqual('euc-jp');

      }
      {
        let encA11 = util.TextEncoder.create('shift_jis');
        expect(encA11.encoding).assertEqual('shift_jis');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_0800
     * @tc.name testTeCreateEncoding008
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encA12 = util.TextEncoder.create('gb18030');
        expect(encA12.encoding).assertEqual('gb18030');

      }
      {
        let encA13 = util.TextEncoder.create('iso-8859-1');
        expect(encA13.encoding).assertEqual('iso-8859-1');

      }
      {
        let encA14 = util.TextEncoder.create('windows-1252');
        expect(encA14.encoding).assertEqual('windows-1252');

      }
      {
        let encA15 = util.TextEncoder.create('euc-kr');
        expect(encA15.encoding).assertEqual('euc-kr');

      }
      {
        let encA16 = util.TextEncoder.create('koi8-r');
        expect(encA16.encoding).assertEqual('koi8-r');

      }
      {
        let encA33 = util.TextEncoder.create('big5');
        let rA33 = encA33.encodeInto('你');
        expect(rA33.length).assertEqual(2);

      }
      {
        let encA34: util.TextEncoder = util.TextEncoder.create('euc-jp');
        let rA34 = encA34.encodeInto('あ');
        expect(rA34.length).assertEqual(3);

      }
      {
        let encC1 = util.TextEncoder.create('utf-8');
        expect(encC1.encoding.length).assertEqual(5);

      }
      {
        let encC2 = util.TextEncoder.create('gbk');
        expect(encC2.encoding.length).assertEqual(3);

      }
      {
        let encC3 = util.TextEncoder.create('big5');
        expect(encC3.encoding.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_0900
     * @tc.name testTeCreateEncoding009
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encC4 = util.TextEncoder.create('euc-jp');
        expect(encC4.encoding.length).assertEqual(6);

      }
      {
        let encC5 = util.TextEncoder.create('gb18030');
        expect(encC5.encoding.length).assertEqual(7);

      }
      {
        let encC6 = util.TextEncoder.create('utf-16le');
        expect(encC6.encoding.length).assertEqual(8);

      }
      {
        let encC7 = util.TextEncoder.create('shift_jis');
        expect(encC7.encoding.length).assertEqual(9);

      }
      {
        let encC8 = util.TextEncoder.create('macintosh');
        expect(encC8.encoding.length).assertEqual(9);

      }
      {
        let encC9 = util.TextEncoder.create('iso-8859-1');
        expect(encC9.encoding.length).assertEqual(10);

      }
      {
        let encC10 = util.TextEncoder.create('iso-8859-15');
        expect(encC10.encoding.length).assertEqual(11);

      }
      {
        let encC11 = util.TextEncoder.create('windows-1252');
        expect(encC11.encoding.length).assertEqual(12);

      }
      {
        let encC14 = util.TextEncoder.create('iso-2022-jp');
        expect(encC14.encoding.length).assertEqual(11);

      }
      {
        let encC15 = util.TextEncoder.create('koi8-r');
        expect(encC15.encoding.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_1000
     * @tc.name testTeCreateEncoding010
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let encD1 = util.TextEncoder.create('utf-16le');
        encD1.encodeInto('你');
        expect(encD1.encoding).assertEqual('utf-16le');

      }
      {
        let encD2 = util.TextEncoder.create('big5');
        encD2.encodeInto('你');
        encD2.encodeInto('你好');
        expect(encD2.encoding).assertEqual('big5');

      }
      {
        let d3a = util.TextEncoder.create('gbk').encoding;
        let d3b = util.TextEncoder.create('gbk').encoding;
        expect(d3a).assertEqual(d3b);
        expect(d3a).assertEqual('gbk');

      }
      {
        let encD4 = util.TextEncoder.create('utf-8');
        let destD4 = new Uint8Array(4);
        encD4.encodeIntoUint8Array('你', destD4);
        expect(encD4.encoding).assertEqual('utf-8');

      }
      {
        let encVarD5: string = 'utf-16be';
        let encD5 = util.TextEncoder.create(encVarD5);
        encVarD5 = 'gbk';
        expect(encD5.encoding).assertEqual('utf-16be');

      }
      {
        let encD6 = util.TextEncoder.create('utf-8');
        let rD6: Uint8Array | undefined = undefined;
        rD6 = encD6.encodeInto('');
        expect(rD6!.length).assertEqual(0);

      }
      {
        let encD7 = util.TextEncoder.create('euc-jp');
        let rD7a = encD7.encodeInto('あ');
        let rD7b = encD7.encodeInto('あ');
        expect(rD7a.length).assertEqual(3);
        expect(rD7b.length).assertEqual(3);
        expect(rD7a.$_get(0)).assertEqual(rD7b.$_get(0));

      }
      {
        let encSj = util.TextEncoder.create('shift_jis');
        expect(encSj.encoding).assertEqual('shift_jis');

      }
      {
        expect(util.TextEncoder.create('koi8-u').encoding).assertEqual('koi8-u');

      }
      {
        expect(util.TextEncoder.create('windows-1256').encoding).assertEqual('windows-1256');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_1100
     * @tc.name testTeCreateEncoding011
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        expect(util.TextEncoder.create('iso-8859-3').encoding).assertEqual('iso-8859-3');

      }
      {
        expect(util.TextEncoder.create('utf-8').encodeInto('abc').length).assertEqual(3);

      }
      {
        let chE5 = util.TextEncoder.create('utf-8').encodeInto('z');
        expect(chE5.$_get(0)).assertEqual(122);

      }
      {
        expect(util.TextEncoder.create('utf-16le').encodeInto('abc').length).assertEqual(6);

      }
      {
        let e7Enc = util.TextEncoder.create('big5').encoding;
        let encE7 = util.TextEncoder.create(e7Enc);
        expect(encE7.encoding).assertEqual('big5');

      }
      {
        expect(util.TextEncoder.create('utf-8').encodeInto('😀').length).assertEqual(4);

      }
      {
        let f2a = util.TextEncoder.create('utf-8');
        let f2b = util.TextEncoder.create('utf-8');
        expect(f2a.encoding).assertEqual(f2b.encoding);

      }
      {
        let f3a = util.TextEncoder.create('utf-8');
        let f3b = util.TextEncoder.create('gbk');
        expect(f3a.encoding).not().assertEqual(f3b.encoding);
        expect(f3a.encoding).assertEqual('utf-8');
        expect(f3b.encoding).assertEqual('gbk');

      }
      {
        let f4a = util.TextEncoder.create('big5');
        let f4b = util.TextEncoder.create('utf-16le');
        expect(f4a.encoding).assertEqual('big5');
        expect(f4b.encoding).assertEqual('utf-16le');

      }
      {
        let f5a = util.TextEncoder.create('utf-8');
        util.TextEncoder.create('gbk');
        util.TextEncoder.create('big5');
        util.TextEncoder.create('utf-16le');
        expect(f5a.encoding).assertEqual('utf-8');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_1200
     * @tc.name testTeCreateEncoding012
     * @tc.desc Verify TextEncoder.create with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateEncoding012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let f6a = util.TextEncoder.create('utf-8');
        let f6b = util.TextEncoder.create('utf-8');
        let r6a = f6a.encodeInto('你');
        let r6b = f6b.encodeInto('你');
        expect(r6a.length).assertEqual(r6b.length);
        expect(r6a.$_get(0)).assertEqual(r6b.$_get(0));
        expect(r6a.$_get(1)).assertEqual(r6b.$_get(1));
        expect(r6a.$_get(2)).assertEqual(r6b.$_get(2));

      }
      {
        let f7a = util.TextEncoder.create('utf-8');
        let f7b = util.TextEncoder.create('utf-16le');
        let r7a = f7a.encodeInto('你');
        let r7b = f7b.encodeInto('你');
        expect(r7a.length).assertEqual(3);
        expect(r7b.length).assertEqual(2);

      }
      {
        let f8a = util.TextEncoder.create('euc-jp');
        let f8b = util.TextEncoder.create('shift_jis');
        let r8a = f8a.encodeInto('あ');
        let r8b = f8b.encodeInto('あ');
        expect(r8a.$_get(0)).assertEqual(0xA4);
        expect(r8b.$_get(0)).assertEqual(0x82);

      }
      {
        let encG2 = util.TextEncoder.create('utf-8');
        let g2 = encG2.encodeInto('你');
        expect(g2.byteOffset).assertEqual(0);

      }
      {
        let encG3 = util.TextEncoder.create('utf-8');
        let g3 = encG3.encodeInto('你');
        expect(g3.buffer.byteLength).assertEqual(3);

      }
      {
        let encG4 = util.TextEncoder.create('utf-8');
        let g4 = encG4.encodeInto('你');
        expect(g4.byteLength).assertEqual(3);

      }
      {
        let g5a = util.TextEncoder.create('utf-16le');
        let g5b = new util.TextEncoder('utf-16le');
        let r5a = g5a.encodeInto('你');
        let r5b = g5b.encodeInto('你');
        expect(r5a.$_get(0)).assertEqual(r5b.$_get(0));
        expect(r5a.$_get(1)).assertEqual(r5b.$_get(1));

      }
      {
        let encG7 = util.TextEncoder.create('utf-8');
        let g7a = encG7.encodeInto('你');
        let g7b = encG7.encodeInto('你');
        expect(g7a.length).assertEqual(g7b.length);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_CREATE_1300
     * @tc.name testTeCreateBasic001
     * @tc.desc Verify TextEncoder.create with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeCreateBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        try {
          util.TextEncoder.create(' utf-8');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        try {
          util.TextEncoder.create('utf-8 ');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

  });
}
