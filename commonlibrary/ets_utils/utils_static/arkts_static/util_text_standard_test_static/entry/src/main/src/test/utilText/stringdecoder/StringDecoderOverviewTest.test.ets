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

export default function StringDecoderOverviewTest(): void {
  describe('StringDecoderOverviewTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_0100
     * @tc.name testSdOvThrows001
     * @tc.desc Verify StringDecoder overview throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        try {
          let d = new util.StringDecoder('not-a-codec');
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_0200
     * @tc.name testSdOvBuffering001
     * @tc.desc Verify StringDecoder overview chunked buffering of incomplete sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvBuffering001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder('utf-8');
        let out = d.end();
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xC3]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF0, 0x9F, 0x98]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE4]));
        expect(out).assertEqual('你');

      }
      {

        let d = new util.StringDecoder();
        let out = d.end(new Uint8Array([0x41, 0xE4]));
        expect(out).assertEqual('A�');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD]);
        let ret: string = decoder.write(input);
        expect(ret.length).assertEqual(0);

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD]);
        let writeRet: string = decoder.write(input);
        expect(writeRet).assertEqual('');
        let endRet: string = decoder.end(new Uint8Array([0xA0]));
        expect(endRet).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let writeRet: string = decoder.write(new Uint8Array([0xE4]));
        let endRet: string = decoder.end(new Uint8Array([0xBD, 0xA0]));
        expect(writeRet).assertEqual('');
        expect(endRet).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let writeRet: string = decoder.write(new Uint8Array([0xE4, 0xBD]));
        let endRet: string = decoder.end(new Uint8Array([0xA0]));
        expect(writeRet).assertEqual('');
        expect(endRet).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_0300
     * @tc.name testSdOvBuffering002
     * @tc.desc Verify StringDecoder overview chunked buffering of incomplete sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvBuffering002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = new util.StringDecoder('utf-8');
        let writeRet: string = decoder.write(new Uint8Array([0xE4, 0xBD, 0xA0]));
        let endRet: string = decoder.end();
        expect(writeRet).assertEqual('你');
        expect(endRet).assertEqual('');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_0400
     * @tc.name testSdOvEncoding001
     * @tc.desc Verify StringDecoder overview with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder('utf-8');
        let out = d.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(out).assertEqual('你好');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xE4, 0xB8, 0x80]));
        expect(out).assertEqual('一');

      }
      {

        let d = new util.StringDecoder('utf-8');
        let out = d.write(new Uint8Array([0xE5, 0xA5, 0xBD]));
        expect(out).assertEqual('好');

      }
      {

        let d = new util.StringDecoder('gbk');
        let out = d.write(new Uint8Array([0xC4, 0xE3]));
        expect(out).assertEqual('你');

      }
      {

        let d = new util.StringDecoder('gb18030');
        let out = d.write(new Uint8Array([0xC4, 0xE3, 0xBA, 0xC3]));
        expect(out).assertEqual('你好');

      }
      {

        let d = new util.StringDecoder('big5');
        let out = d.write(new Uint8Array([0xA4, 0xA4]));
        expect(out).assertEqual('中');

      }
      {

        let d = new util.StringDecoder('utf-16be');
        let out = d.write(new Uint8Array([0x4F, 0x60]));
        expect(out).assertEqual('你');

      }
      {

        let d = new util.StringDecoder('iso-8859-2');
        let out = d.write(new Uint8Array([0xE9]));
        expect(out).assertEqual('é');

      }
      {

        let d = new util.StringDecoder('koi8-r');
        let out = d.write(new Uint8Array([0xC1]));
        expect(out).assertEqual('а');

      }
      {

        let d = new util.StringDecoder('macintosh');
        let out = d.write(new Uint8Array([0x80]));
        expect(out).assertEqual('Ä');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_0500
     * @tc.name testSdOvEncoding002
     * @tc.desc Verify StringDecoder overview with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder('windows-1250');
        let out = d.write(new Uint8Array([0xE9]));
        expect(out).assertEqual('é');

      }
      {

        let d = new util.StringDecoder('windows-1251');
        let out = d.write(new Uint8Array([0xC0]));
        expect(out).assertEqual('А');

      }
      {

        let d = new util.StringDecoder('utf-8');
        let out = d.write(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(out).assertEqual('你');

      }
      {

        let d = new util.StringDecoder('');
        let out = d.write(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(out).assertEqual('你');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write('你好');
        expect(out).assertEqual('你好');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write('😀');
        expect(out).assertEqual('😀');

      }
      {

        let d = new util.StringDecoder('gbk');
        let out = d.write('abc');
        expect(out).assertEqual('abc');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x41]));
        expect(out).assertEqual('A');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x68, 0x69]));
        expect(out).assertEqual('hi');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xC3, 0xA9]));
        expect(out).assertEqual('é');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_0600
     * @tc.name testSdOvEncoding003
     * @tc.desc Verify StringDecoder overview with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(out).assertEqual('你');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]));
        expect(out).assertEqual('😀');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xEF, 0xBB, 0xBF]));
        expect(out).assertEqual('\uFEFF');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x80, 0xC0, 0xF8]));
        expect(out).assertEqual('���');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x61, 0xE4, 0xBD, 0xA0, 0x62]));
        expect(out).assertEqual('a你b');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0x41]));
        expect(out).assertEqual('你A');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x61, 0xF0, 0x9F, 0x98, 0x80, 0x62]));
        expect(out).assertEqual('a😀b');

      }
      {

        let d = new util.StringDecoder();
        let out = d.end();
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let out = d.end(new Uint8Array([0xE5, 0xA5, 0xBD]));
        expect(out).assertEqual('好');

      }
      {

        let d = new util.StringDecoder('gbk');
        let out = d.end(new Uint8Array([0xC4, 0xE3]));
        expect(out).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_0700
     * @tc.name testSdOvEncoding004
     * @tc.desc Verify StringDecoder overview with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder('utf-16le');
        let out = d.end(new Uint8Array([0x60, 0x4F]));
        expect(out).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder();
        let input: Uint8Array = new Uint8Array([0x41, 0x42, 0x43]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('ABC');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let ret: string = decoder.write(input);
        expect(ret.length).assertEqual(1);

      }
      {

        let decoder = new util.StringDecoder('utf-16le');
        let input: Uint8Array = new Uint8Array([0x60, 0x4F]);
        let ret: string = decoder.end(input);
        expect(ret).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('utf-16be');
        let input: Uint8Array = new Uint8Array([0x4F, 0x60]);
        let ret: string = decoder.end(input);
        expect(ret).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('gbk');
        let input: Uint8Array = new Uint8Array([0xC4, 0xE3]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('gb18030');
        let input: Uint8Array = new Uint8Array([0xC4, 0xE3]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('big5');
        let input: Uint8Array = new Uint8Array([0xA7, 0x41]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let ret: string = decoder.write('abc');
        expect(ret).assertEqual('abc');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let single: Uint8Array = new Uint8Array([0x41]);
        let ret: string = decoder.write(single);
        expect(ret).assertEqual('A');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_0800
     * @tc.name testSdOvEncoding005
     * @tc.desc Verify StringDecoder overview with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = new util.StringDecoder('utf-8');
        let ret: string = decoder.write('你好');
        expect(ret).assertEqual('你好');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('你好');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let ret: string = decoder.write(input);
        expect(ret.length).assertEqual(2);

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xC3, 0xA9]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('é');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let first: string = decoder.write(input.slice(0, 3));
        let second: string = decoder.write(input.slice(3));
        expect(first).assertEqual('你');
        expect(second).assertEqual('好');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let first: string = decoder.write(input.slice(0, 4));
        let second: string = decoder.write(input.slice(4));
        expect(first).assertEqual('你');
        expect(second).assertEqual('好');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let first: string = decoder.write(new Uint8Array([0x68]));
        let second: string = decoder.write(new Uint8Array([0x69]));
        expect(first).assertEqual('h');
        expect(second).assertEqual('i');

      }
      {

        let decoder = new util.StringDecoder('iso-8859-2');
        let input: Uint8Array = new Uint8Array([0xA1]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('Ą');

      }
      {

        let decoder = new util.StringDecoder('koi8-r');
        let input: Uint8Array = new Uint8Array([0xE1]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('А');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_0900
     * @tc.name testSdOvEncoding006
     * @tc.desc Verify StringDecoder overview with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = new util.StringDecoder('macintosh');
        let input: Uint8Array = new Uint8Array([0xE4]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('‰');

      }
      {

        let decoder = new util.StringDecoder('windows-1250');
        let input: Uint8Array = new Uint8Array([0xE4]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('ä');

      }
      {

        let decoder = new util.StringDecoder('windows-1251');
        let input: Uint8Array = new Uint8Array([0xE4]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('д');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0x41, 0x42]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('你AB');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF]);
        let ret: string = decoder.write(input);
        expect(ret.length).assertEqual(1);

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let ret: string = decoder.write(input.slice(0));
        expect(ret).assertEqual('你好');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0x61, 0x00, 0x62]);
        let ret: string = decoder.write(input);
        expect(ret.length).assertEqual(3);

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let endRet: string = decoder.end(input);
        expect(endRet).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let endRet: string = decoder.end(input);
        expect(endRet.length).assertEqual(2);

      }
      {

        let decoder = new util.StringDecoder('gb18030');
        let input: Uint8Array = new Uint8Array([0xC4, 0xE3]);
        let endRet: string = decoder.end(input);
        expect(endRet).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_1000
     * @tc.name testSdOvEncoding007
     * @tc.desc Verify StringDecoder overview with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = new util.StringDecoder('big5');
        let input: Uint8Array = new Uint8Array([0xA7, 0x41]);
        let ret: string = decoder.end(input);
        expect(ret).assertEqual('你');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let first: string = decoder.write(new Uint8Array([0x41]));
        let second: string = decoder.end(new Uint8Array([0x42]));
        expect(first).assertEqual('A');
        expect(second).assertEqual('B');

      }
      {

        let decoder = new util.StringDecoder('utf-16le');
        let input: Uint8Array = new Uint8Array([0x3D, 0xD8, 0x00, 0xDE]);
        let ret: string = decoder.end(input);
        expect(ret.charCodeAt(0)).assertEqual(0xD83D);

      }
      {

        let decoder = new util.StringDecoder('utf-16be');
        let input: Uint8Array = new Uint8Array([0xD8, 0x3D, 0xDE, 0x00]);
        let ret: string = decoder.end(input);
        expect(ret.charCodeAt(0)).assertEqual(0xD83D);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_1100
     * @tc.name testSdOvEmoji001
     * @tc.desc Verify StringDecoder overview with emoji and surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvEmoji001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let out = d.write('x\udc04y');
        expect(out).assertEqual('x\udc04y');

      }
      {

        let d = new util.StringDecoder();
        let out = d.end(new Uint8Array([0xF0, 0x9F, 0x8D, 0xA9]));
        expect(out).assertEqual('🍩');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_1200
     * @tc.name testSdOvInvisible001
     * @tc.desc Verify StringDecoder overview with invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvInvisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xFF]));
        expect(out).assertEqual('�');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xC1, 0x80]));
        expect(out).assertEqual('��');

      }
      {

        let d = new util.StringDecoder();
        let out = d.end(new Uint8Array([0xE4]));
        expect(out).assertEqual('�');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xEF, 0xBB, 0xBF]);
        let ret: string = decoder.write(input);
        expect(ret.charCodeAt(0)).assertEqual(0xFEFF);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_1300
     * @tc.name testSdOvControl001
     * @tc.desc Verify StringDecoder overview with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let out = d.write('a\u0000b');
        expect(out).assertEqual('a\u0000b');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([97, 98, 0, 99]));
        expect(out).assertEqual('ab\u0000c');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_1400
     * @tc.name testSdOvBoundary001
     * @tc.desc Verify StringDecoder overview with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let s = 'x'.repeat(10000);
        let out = d.write(s);
        expect(out).assertEqual(s);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_1500
     * @tc.name testSdOvConsistency001
     * @tc.desc Verify StringDecoder overview state consistency and source independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let before: number = input.$_get(0);
        decoder.end(input);
        expect(input.$_get(0)).assertEqual(before);

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let before: number = input.byteOffset;
        decoder.write(input);
        expect(input.byteOffset).assertEqual(before);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_1600
     * @tc.name testSdOvBasic001
     * @tc.desc Verify StringDecoder overview with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let out = d.write('single');
        expect(out).assertEqual('single');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x58]));
        expect(out).assertEqual('X');

      }
      {

        let d = new util.StringDecoder();
        let out = d.end('tail');
        expect(out).assertEqual('tail');

      }
      {

        let d = new util.StringDecoder();
        let out = d.end(new Uint8Array([0x42]));
        expect(out).assertEqual('B');

      }
      {

        let d = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array(128);
        for (let i = 0; i < 128; i++) {
          arr[i] = i;
        }
        let out = d.write(arr);
        expect(out.length).assertEqual(128);

      }
      {

        let d = new util.StringDecoder();
        let out = d.end('中文');
        expect(out).assertEqual('中文');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0x61, 0x00, 0x62]);
        let ret: string = decoder.write(input);
        expect(ret).assertEqual('a\u0000b');
        expect(ret.length).assertEqual(3);

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let writeString: string = decoder.write(input.slice(0, 5));
        let endString: string = decoder.end(input.slice(5));
        expect(writeString).assertEqual('你');
        expect(endString).assertEqual('好');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let ret: string = decoder.end('abc');
        expect(ret).assertEqual('abc');

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let before: number = input.$_get(0);
        decoder.write(input);
        expect(input.$_get(0)).assertEqual(before);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_OVERVIEW_1700
     * @tc.name testSdOvBasic002
     * @tc.desc Verify StringDecoder overview with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdOvBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let before: number = input.$_get(1);
        decoder.write(input);
        expect(input.$_get(1)).assertEqual(before);

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let before: number = input.$_get(2);
        decoder.write(input);
        expect(input.$_get(2)).assertEqual(before);

      }
      {

        let decoder = new util.StringDecoder('utf-8');
        let input: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let before: number = input.byteLength;
        decoder.write(input);
        expect(input.byteLength).assertEqual(before);

      }
    });

  });
}
