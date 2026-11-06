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

export default function TextEncoderPropertiesTest(): void {
  describe('TextEncoderPropertiesTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_PROPERTIES_0100
     * @tc.name testTePropsEncoding001
     * @tc.desc Verify TextEncoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTePropsEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let tAr5a = new util.TextEncoder();
        let tAr5b = util.TextEncoder.create();
        expect(tAr5a.encoding).assertEqual(tAr5b.encoding);

      }
      {

        let tAr6a = new util.TextEncoder('gbk');
        let tAr6b = util.TextEncoder.create('gbk');
        expect(tAr6a.encoding).assertEqual(tAr6b.encoding);
        expect(tAr6a.encoding).assertEqual('gbk');

      }
      {

        let tAr7a = new util.TextEncoder();
        let tAr7b = new util.TextEncoder();
        expect(tAr7a.encoding).assertEqual('utf-8');
        expect(tAr7b.encoding).assertEqual('utf-8');

      }
      {

        try {
          util.TextEncoder.create('GBK ');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        try {
          util.TextEncoder.create('  big5');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let tE = util.TextEncoder.create('');
        expect(tE.encoding).assertEqual('utf-8');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('gb2312');
        expect(te.encoding).assertEqual('gb2312');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-16le');
        expect(te.encoding).assertEqual('utf-16le');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-16be');
        expect(te.encoding).assertEqual('utf-16be');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('gb18030');
        expect(te.encoding).assertEqual('gb18030');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_PROPERTIES_0200
     * @tc.name testTePropsEncoding002
     * @tc.desc Verify TextEncoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTePropsEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = util.TextEncoder.create('big5');
        expect(te.encoding).assertEqual('big5');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-1');
        expect(te.encoding).assertEqual('iso-8859-1');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('ibm866');
        expect(te.encoding).assertEqual('ibm866');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('iso-8859-2');
        expect(te.encoding).assertEqual('iso-8859-2');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('iso-8859-3');
        expect(te.encoding).assertEqual('iso-8859-3');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('iso-8859-4');
        expect(te.encoding).assertEqual('iso-8859-4');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('iso-8859-5');
        expect(te.encoding).assertEqual('iso-8859-5');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('iso-8859-6');
        expect(te.encoding).assertEqual('iso-8859-6');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('koi8-r');
        expect(te.encoding).assertEqual('koi8-r');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('koi8-u');
        expect(te.encoding).assertEqual('koi8-u');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_PROPERTIES_0300
     * @tc.name testTePropsEncoding003
     * @tc.desc Verify TextEncoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTePropsEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = new util.TextEncoder('macintosh');
        expect(te.encoding).assertEqual('macintosh');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('windows-874');
        expect(te.encoding).assertEqual('windows-874');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('windows-1250');
        expect(te.encoding).assertEqual('windows-1250');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('windows-1251');
        expect(te.encoding).assertEqual('windows-1251');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('windows-1253');
        expect(te.encoding).assertEqual('windows-1253');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('iso-2022-jp');
        expect(te.encoding).assertEqual('iso-2022-jp');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('x-mac-cyrillic');
        expect(te.encoding).assertEqual('x-mac-cyrillic');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('gb2312');
        expect(te.encoding).assertEqual('gb2312');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-16le');
        expect(te.encoding).assertEqual('utf-16le');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-16be');
        expect(te.encoding).assertEqual('utf-16be');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_PROPERTIES_0400
     * @tc.name testTePropsEncoding004
     * @tc.desc Verify TextEncoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTePropsEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-7');
        expect(te.encoding).assertEqual('iso-8859-7');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-8');
        expect(te.encoding).assertEqual('iso-8859-8');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-8-i');
        expect(te.encoding).assertEqual('iso-8859-8-i');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-10');
        expect(te.encoding).assertEqual('iso-8859-10');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-13');
        expect(te.encoding).assertEqual('iso-8859-13');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-14');
        expect(te.encoding).assertEqual('iso-8859-14');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-15');
        expect(te.encoding).assertEqual('iso-8859-15');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('windows-1254');
        expect(te.encoding).assertEqual('windows-1254');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('windows-1255');
        expect(te.encoding).assertEqual('windows-1255');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('windows-1256');
        expect(te.encoding).assertEqual('windows-1256');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_PROPERTIES_0500
     * @tc.name testTePropsEncoding005
     * @tc.desc Verify TextEncoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTePropsEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = util.TextEncoder.create('windows-1257');
        expect(te.encoding).assertEqual('windows-1257');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('windows-1258');
        expect(te.encoding).assertEqual('windows-1258');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('euc-jp');
        expect(te.encoding).assertEqual('euc-jp');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('shift_jis');
        expect(te.encoding).assertEqual('shift_jis');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('euc-kr');
        expect(te.encoding).assertEqual('euc-kr');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('gbk');
        expect(te.encoding).assertEqual('gbk');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder();
        expect(te.encoding.length).assertEqual(5);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('gbk');
        expect(te.encoding.length).assertEqual(3);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('gb18030');
        expect(te.encoding.length).assertEqual(7);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-16le');
        expect(te.encoding.length).assertEqual(8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_PROPERTIES_0600
     * @tc.name testTePropsEncoding006
     * @tc.desc Verify TextEncoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTePropsEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-16be');
        expect(te.encoding.length).assertEqual(8);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-1');
        expect(te.encoding.length).assertEqual(10);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-2022-jp');
        expect(te.encoding.length).assertEqual(11);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('windows-1252');
        expect(te.encoding.length).assertEqual(12);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('x-mac-cyrillic');
        expect(te.encoding.length).assertEqual(14);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('euc-jp');
        expect(te.encoding.length).assertEqual(6);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('shift_jis');
        expect(te.encoding.length).assertEqual(9);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('koi8-r');
        expect(te.encoding.length).assertEqual(6);

      }
      {
        let te: util.TextEncoder = new util.TextEncoder();
        te.encodeInto('abc');
        expect(te.encoding).assertEqual('utf-8');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('gbk');
        te.encodeInto('你');
        expect(te.encoding).assertEqual('gbk');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_PROPERTIES_0700
     * @tc.name testTePropsEncoding007
     * @tc.desc Verify TextEncoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTePropsEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a = util.TextEncoder.create('gb18030').encoding;
        let b = util.TextEncoder.create('gb18030').encoding;
        expect(a).assertEqual('gb18030');
        expect(b).assertEqual('gb18030');

      }
      {
        let teU: util.TextEncoder = new util.TextEncoder('utf-8');
        let teG: util.TextEncoder = new util.TextEncoder('gb2312');
        teU.encodeInto('你');
        expect(teG.encoding).assertEqual('gb2312');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('utf-16le');
        te.encodeInto('你');
        expect(te.encoding).assertEqual('utf-16le');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('big5');
        te.encodeInto('中');
        expect(te.encoding).assertEqual('big5');

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('euc-jp');
        te.encodeInto('あ');
        te.encodeInto('い');
        te.encodeInto('う');
        expect(te.encoding).assertEqual('euc-jp');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('x-mac-cyrillic');
        let dest: Uint8Array = new Uint8Array(8);
        te.encodeIntoUint8Array('abc', dest);
        expect(te.encoding).assertEqual('x-mac-cyrillic');

      }
      {
        let te: util.TextEncoder = new util.TextEncoder('shift_jis');
        let dest: Uint8Array = new Uint8Array(8);
        te.encodeInto('あ');
        te.encodeIntoUint8Array('あ', dest);
        expect(te.encoding).assertEqual('shift_jis');

      }
      {
        let a: util.TextEncoder = util.TextEncoder.create('gbk');
        let b: util.TextEncoder = new util.TextEncoder('gbk');
        expect(a.encoding).assertEqual(b.encoding);

      }
      {
        let a: util.TextEncoder = util.TextEncoder.create();
        let b: util.TextEncoder = new util.TextEncoder();
        expect(a.encoding).assertEqual('utf-8');
        expect(b.encoding).assertEqual('utf-8');

      }
      {
        let a: util.TextEncoder = util.TextEncoder.create('utf-16le');
        let b: util.TextEncoder = new util.TextEncoder('utf-16le');
        expect(a.encoding).assertEqual(b.encoding);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_PROPERTIES_0800
     * @tc.name testTePropsEncoding008
     * @tc.desc Verify TextEncoder properties with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTePropsEncoding008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let a: util.TextEncoder = util.TextEncoder.create('big5');
        let b: util.TextEncoder = new util.TextEncoder('big5');
        expect(a.encoding).assertEqual(b.encoding);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-8');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(3);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('gb2312');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(2);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('utf-16le');
        let out: Uint8Array = te.encodeInto('你');
        expect(out.byteLength).assertEqual(2);

      }
      {
        let teU: util.TextEncoder = util.TextEncoder.create('utf-8');
        let teG: util.TextEncoder = util.TextEncoder.create('gb2312');
        let u: Uint8Array = teU.encodeInto('你');
        let g: Uint8Array = teG.encodeInto('你');
        expect(u.$_get(0)).assertEqual(0xE4);
        expect(g.$_get(0)).assertEqual(0xC4);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('iso-8859-1');
        let out: Uint8Array = te.encodeInto('é');
        expect(out.byteLength).assertEqual(1);

      }
      {
        let te: util.TextEncoder = util.TextEncoder.create('shift_jis');
        let out: Uint8Array = te.encodeInto('あ');
        expect(out.byteLength).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_PROPERTIES_0900
     * @tc.name testTePropsBasic001
     * @tc.desc Verify TextEncoder properties with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTePropsBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let input: string = '你好';
        let te: util.TextEncoder = new util.TextEncoder('utf-8');
        let out: Uint8Array = te.encodeInto(input);
        expect(out.length).assertEqual(6);

      }
    });

  });
}
