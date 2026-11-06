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

class TestChunkObject {
  tag: number = 1;
}

export default function StringDecoderWriteTest(): void {
  describe('StringDecoderWriteTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_0100
     * @tc.name testSdWriteBuffering001
     * @tc.desc Verify StringDecoder write chunked buffering of incomplete sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteBuffering001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0xE4, 0xBD]));
        expect(ret).assertEqual('');

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0xE4, 0xB8]));
        expect(ret.length).assertEqual(0);

      }
      {

        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        dec.write(arr);
        expect(arr[5]).assertEqual(0xBD);

      }
      {

        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array([0xE4, 0xB8]);
        dec.write(arr);
        expect(arr[1]).assertEqual(0xB8);

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4, 0xBD]));
        expect(ret).assertEqual('');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4, 0xB8, 0xAD, 0xE4]));
        expect(ret).assertEqual('中');

      }
      {

        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xE4, 0xB8, 0xAD, 0xE5]));
        let ret: string = dec.write(new Uint8Array([0xA5, 0xBD]));
        expect(ret).assertEqual('好');

      }
      {

        let dec = new util.StringDecoder('utf-16le');
        dec.write(new Uint8Array([0x60]));
        let ret: string = dec.write(new Uint8Array([0x4F]));
        expect(ret).assertEqual('你');

      }
      {

        let dec = new util.StringDecoder('utf-16be');
        dec.write(new Uint8Array([0x4F]));
        let ret: string = dec.write(new Uint8Array([0x60]));
        expect(ret).assertEqual('你');

      }
      {

        let d = new util.StringDecoder();
        let first: string = d.write(new Uint8Array([0xE4, 0xE4, 0xE4]));
        let second: string = d.write(new Uint8Array([0xBD, 0xA0, 0xBD, 0xA0, 0xBD, 0xA0]));
        expect(first.length).assertEqual(2);
        expect(second).assertEqual('你\uFFFD\uFFFD\uFFFD\uFFFD');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_0200
     * @tc.name testSdWriteBuffering002
     * @tc.desc Verify StringDecoder write chunked buffering of incomplete sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteBuffering002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let first: string = d.write(new Uint8Array([0xE4, 0xBD, 0xA0]));
        let second: string = d.write(new Uint8Array([0xE4, 0xBD]));
        expect(first).assertEqual('你');
        expect(second).assertEqual('');

      }
      {

        let d = new util.StringDecoder('utf-16le');
        let out = d.write(new Uint8Array([0x3D, 0xD8]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder('utf-16le');
        let first: string = d.write(new Uint8Array([0x3D, 0xD8, 0x00]));
        expect(first).assertEqual('');
        let second: string = d.write(new Uint8Array([0xDE]));
        expect(second).assertEqual('😀');

      }
      {

        let d = new util.StringDecoder('gbk');
        let out = d.write(new Uint8Array([0xC4]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder('gbk');
        let out = d.write(new Uint8Array([0xD6]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder('big5');
        let out = d.write(new Uint8Array([0xA7]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder('gb18030');
        let out = d.write(new Uint8Array([0x81]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder('gbk');
        let first: string = d.write(new Uint8Array([0xC4, 0xE3, 0xD6]));
        let second: string = d.write(new Uint8Array([0xD0]));
        expect(first).assertEqual('你');
        expect(second).assertEqual('中');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_0300
     * @tc.name testSdWriteEncoding001
     * @tc.desc Verify StringDecoder write with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let a: string = dec.write(new Uint8Array([0x41]));
        let b: string = dec.write(new Uint8Array([0x42]));
        expect(a).not().assertEqual(b);
        expect(a).assertEqual('A');
        expect(b).assertEqual('B');

      }
      {

        let dec = new util.StringDecoder();
        let len: number = dec.write(new Uint8Array([0x41, 0x42])).length;
        expect(len).assertEqual(2);

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write('中文测试');
        expect(ret).assertEqual('中文测试');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write('a😍b');
        expect(ret.length).assertEqual(4);

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write('中A本Bこん');
        expect(ret).assertEqual('中A本Bこん');

      }
      {

        let dec = new util.StringDecoder('utf-16le');
        let ret: string = dec.write('text');
        expect(ret).assertEqual('text');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(ret).assertEqual('你好');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(ret.charAt(1).toString()).assertEqual('好');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE6, 0x9D, 0x8E]));
        expect(ret).assertEqual('李');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xF0, 0x9F, 0x98, 0x8D]));
        expect(ret).assertEqual('😍');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_0400
     * @tc.name testSdWriteEncoding002
     * @tc.desc Verify StringDecoder write with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0x42, 0xE5, 0xA5, 0xBD, 0x43]));
        expect(ret).assertEqual('B好C');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xEF, 0xBB, 0xBF, 0x41]));
        expect(ret).assertEqual('\uFEFFA');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xC5, 0xBC]));
        expect(ret).assertEqual('ż');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0x41, 0xE4, 0xBD, 0xA0]));
        expect(ret).assertEqual('A你');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xF0, 0x9F, 0x8D, 0xA9]));
        expect(ret).assertEqual('🍩');

      }
      {

        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array(64);
        for (let i = 0; i < 64; i++) {
          arr[i] = 0x40 + i;
        }
        let ret: string = dec.write(arr);
        expect(ret.length).assertEqual(64);

      }
      {

        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array(64);
        for (let i = 0; i < 64; i++) {
          arr[i] = 0x40 + i;
        }
        let ret: string = dec.write(arr);
        expect(ret.charAt(0).toString()).assertEqual('@');

      }
      {

        let dec = new util.StringDecoder('utf-16le');
        let ret: string = dec.write(new Uint8Array([0x7D, 0x59]));
        expect(ret).assertEqual('好');

      }
      {

        let dec = new util.StringDecoder('utf-16be');
        let ret: string = dec.write(new Uint8Array([0x59, 0x7D]));
        expect(ret).assertEqual('好');

      }
      {

        let dec = new util.StringDecoder('gbk');
        let ret: string = dec.write(new Uint8Array([0xBA, 0xC3]));
        expect(ret).assertEqual('好');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_0500
     * @tc.name testSdWriteEncoding003
     * @tc.desc Verify StringDecoder write with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0x7A]));
        expect(ret).assertEqual('z');

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0xE4, 0xB8, 0xAD]));
        expect(ret).assertEqual('中');

      }
      {

        let dec = new util.StringDecoder('utf-16le');
        let ret = dec.write(new Uint8Array([0x60, 0x4F]));
        expect(ret).assertEqual('你');

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0xE4, 0xB8, 0xAD, 0xE5, 0x9B, 0xBD, 0xE4, 0xBA, 0xBA]));
        expect(ret.length).assertEqual(3);

      }
      {

        let dec = new util.StringDecoder('utf-16le');
        let ret = dec.write(new Uint8Array([0x60, 0x4F, 0x7D, 0x59]));
        expect(ret.length).assertEqual(2);

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0xEF, 0xBB, 0xBF, 0x41]));
        expect(ret.length).assertEqual(2);

      }
      {

        let decA = new util.StringDecoder();
        let decB = new util.StringDecoder('gbk');
        let arr: Uint8Array = new Uint8Array([0xD6, 0xD0]);
        let ra: string = decA.write(arr);
        let rb: string = decB.write(arr);
        expect(ra).not().assertEqual(rb);
        expect(rb).assertEqual('中');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(ret.startsWith('你')).assertTrue();
        expect(ret).assertEqual('你好');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4, 0xB8, 0xAD]));
        let lit: string = '中';
        expect(ret).assertEqual(lit);

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4]));
        expect(ret).assertEqual('');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_0600
     * @tc.name testSdWriteEncoding004
     * @tc.desc Verify StringDecoder write with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder('utf-16le');
        let ret: string = dec.write(new Uint8Array([0x60]));
        expect(ret).assertEqual('');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(ret.charCodeAt(1)).assertEqual(0x597D);

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(ret.charAt(0).toString()).assertEqual('你');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(ret.charCodeAt(0)).assertEqual(0x4F60);

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xEF]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF0]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x41, 0x41, 0x41]));
        expect(out).assertEqual('AAA');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF5, 0x41]));
        expect(out).assertEqual('�A');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xE4, 0xBD, 0xA0, 0x41, 0xE4]));
        expect(out).assertEqual('你A');

      }
      {

        let d = new util.StringDecoder('utf-16le');
        let out = d.write(new Uint8Array([0x3D, 0xD8, 0x00, 0xDE]));
        expect(out).assertEqual('😀');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_0700
     * @tc.name testSdWriteEncoding005
     * @tc.desc Verify StringDecoder write with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder('utf-16le');
        let out = d.write(new Uint8Array([0x00, 0xDE]));
        expect(out).assertEqual('�');

      }
      {

        let d = new util.StringDecoder('utf-16le');
        let out = d.write(new Uint8Array([0x00, 0xDE, 0x3D, 0xD8]));
        expect(out).assertEqual('�');

      }
      {

        let d = new util.StringDecoder('utf-16le');
        let out = d.write(new Uint8Array([0x41, 0x00]));
        expect(out).assertEqual('A');

      }
      {

        let d = new util.StringDecoder('utf-16be');
        let out = d.write(new Uint8Array([0xD8, 0x3D, 0xDE, 0x00]));
        expect(out).assertEqual('😀');

      }
      {

        let d = new util.StringDecoder('utf-16be');
        let out = d.write(new Uint8Array([0x3D, 0xD8]));
        expect(out).assertEqual('㷘');

      }
      {

        let d = new util.StringDecoder('utf-16be');
        let out = d.write(new Uint8Array([0x00, 0x41, 0x00, 0x42]));
        expect(out).assertEqual('AB');

      }
      {

        let d = new util.StringDecoder('utf-16le');
        let first: string = d.write(new Uint8Array([0x00]));
        let second: string = d.write(new Uint8Array([0x41]));
        expect(first).assertEqual('');
        expect(second).assertEqual('䄀');

      }
      {

        let d = new util.StringDecoder('utf-16be');
        let first: string = d.write(new Uint8Array([0x00]));
        let second: string = d.write(new Uint8Array([0x41]));
        expect(first).assertEqual('');
        expect(second).assertEqual('A');

      }
      {

        let d = new util.StringDecoder('gbk');
        let first: string = d.write(new Uint8Array([0xC4]));
        let second: string = d.write(new Uint8Array([0xE3]));
        expect(first).assertEqual('');
        expect(second).assertEqual('你');

      }
      {

        let d = new util.StringDecoder('gbk');
        let out = d.write(new Uint8Array([0xD6, 0xD0]));
        expect(out).assertEqual('中');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_0800
     * @tc.name testSdWriteEncoding006
     * @tc.desc Verify StringDecoder write with various text encodings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder('big5');
        let first: string = d.write(new Uint8Array([0xA7]));
        let second: string = d.write(new Uint8Array([0x41]));
        expect(first).assertEqual('');
        expect(second).assertEqual('你');

      }
      {

        let d = new util.StringDecoder('gb18030');
        let out = d.write(new Uint8Array([0x81, 0x30, 0x81]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder('gbk');
        let out = d.write(new Uint8Array([0xC4, 0xE3, 0xD6]));
        expect(out).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_0900
     * @tc.name testSdWriteUnicode001
     * @tc.desc Verify StringDecoder write with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let base: Uint8Array = new Uint8Array([0x41, 0xE4, 0xB8, 0xAD, 0x42, 0x43]);
        let view: Uint8Array = base.subarray(1, 4);
        let ret: string = dec.write(view);
        expect(ret).assertEqual('中');

      }
      {

        let dec = new util.StringDecoder();
        let a: Uint8Array = new Uint8Array([0xE5, 0xA5, 0xBD, 0x58]).subarray(0, 3);
        let b: Uint8Array = new Uint8Array([0xE5, 0xA5, 0xBD, 0x58]).slice(0, 3);
        let ra: string = dec.write(a);
        let rb: string = dec.write(b);
        expect(ra).assertEqual(rb);

      }
      {

        let base: Uint8Array = new Uint8Array(4);
        base[0] = 0xE5;
        base[1] = 0xA5;
        base[2] = 0xBD;
        let dec = new util.StringDecoder();
        let ret: string = dec.write(base.subarray(0, 3));
        expect(ret).assertEqual('好');

      }
      {

        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xE4]));
        let ret: string = dec.write(new Uint8Array([0xB8, 0xAD]));
        expect(ret).assertEqual('中');

      }
      {

        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xE4, 0xB8]));
        let ret: string = dec.write(new Uint8Array([0xAD]));
        expect(ret).assertEqual('中');

      }
      {

        let d = new util.StringDecoder();
        let src = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let out = d.write(src.slice(-3));
        expect(out).assertEqual('好');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF4, 0x90, 0x80, 0x80]));
        expect(out).assertEqual('����');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1000
     * @tc.name testSdWriteEmoji001
     * @tc.desc Verify StringDecoder write with emoji and surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteEmoji001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write('a😍b');
        expect(ret).assertEqual('a😍b');

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0xF0, 0x9F, 0x8D, 0xA9]));
        expect(ret).assertEqual('🍩');

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0xF0, 0x9F, 0x8D, 0xA9]));
        expect(ret.length).assertEqual(2);

      }
      {

        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array([0xF0, 0x9F, 0x8D, 0xA9]);
        dec.write(arr);
        expect(arr.length).assertEqual(4);

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xF0, 0x9F, 0x98]));
        expect(ret).assertEqual('');

      }
      {

        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xF0]));
        let ret: string = dec.write(new Uint8Array([0x9F, 0x98, 0x8D]));
        expect(ret).assertEqual('😍');

      }
      {

        let dec = new util.StringDecoder();
        dec.write(new Uint8Array([0xF0, 0x9F]));
        let ret: string = dec.write(new Uint8Array([0x98, 0x8D]));
        expect(ret).assertEqual('😍');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF0, 0x9F]));
        expect(out).assertEqual('');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1100
     * @tc.name testSdWriteInvisible001
     * @tc.desc Verify StringDecoder write with invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteInvisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xFE]));
        expect(ret).assertEqual('�');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0xFF, 0xFF]));
        expect(ret).assertEqual('��');

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0xFF, 0xFF]));
        expect(ret.length).assertEqual(2);

      }
      {

        let d = new util.StringDecoder();
        let src = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let out = d.write(src.slice(-1));
        expect(out).assertEqual('�');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xFE]));
        expect(out).assertEqual('�');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF8]));
        expect(out).assertEqual('�');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xC0]));
        expect(out).assertEqual('�');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF5]));
        expect(out).assertEqual('�');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x80, 0x80, 0x80]));
        expect(out).assertEqual('���');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xFF, 0xFF, 0xFF]));
        expect(out).assertEqual('���');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1200
     * @tc.name testSdWriteInvisible002
     * @tc.desc Verify StringDecoder write with invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteInvisible002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xBD, 0xBD, 0xBD]));
        expect(out).assertEqual('���');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xC3, 0xC3]));
        expect(out).assertEqual('�');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xE4, 0xE4, 0xE4]));
        expect(out).assertEqual('��');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF0, 0xF0, 0xF0, 0xF0]));
        expect(out).assertEqual('���');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xE0, 0x80, 0x80]));
        expect(out).assertEqual('���');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xED, 0xA0, 0x80]));
        expect(out).assertEqual('���');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xED, 0xBF, 0xBF]));
        expect(out).assertEqual('���');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1300
     * @tc.name testSdWriteControl001
     * @tc.desc Verify StringDecoder write with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write('a\tb\nc\r');
        expect(ret).assertEqual('a\tb\nc\r');

      }
      {

        let dec = new util.StringDecoder();
        let s: string = 'immutable';
        dec.write(s);
        expect(s).assertEqual('immutable');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0x41, 0x00, 0x42]));
        expect(ret).assertEqual('A\u0000B');

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0x41, 0x00, 0x42]));
        expect(ret.length).assertEqual(3);

      }
      {

        let chunk: string | Uint8Array | null = null;
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0x00, 0x00, 0x00, 0x00]));
        expect(out).assertEqual('\u0000\u0000\u0000\u0000');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xC2, 0x7F]));
        expect(out).assertEqual('�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1400
     * @tc.name testSdWriteSpecial001
     * @tc.desc Verify StringDecoder write with special format content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteSpecial001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let src = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let out = d.write(src.slice(0, -1));
        expect(out).assertEqual('你');

      }
      {

        let d = new util.StringDecoder();
        let src = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let out = d.write(src.slice(0, -2));
        expect(out).assertEqual('你');

      }
      {

        let d = new util.StringDecoder();
        let src = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let out = d.write(src.slice(-6));
        expect(out).assertEqual('你好');

      }
      {

        let d = new util.StringDecoder();
        let src = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let out = d.write(src.slice(-7));
        expect(out).assertEqual('你好');

      }
      {

        let d = new util.StringDecoder();
        let src = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let out = d.write(src.slice(0, 7));
        expect(out).assertEqual('你好');

      }
      {

        let d = new util.StringDecoder();
        let src = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let out = d.write(src.slice(0, 0x7FFFFFFF));
        expect(out).assertEqual('你好');

      }
      {

        let d = new util.StringDecoder();
        let src = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let out = d.write(src.slice(1, -1));
        expect(out).assertEqual('��');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1500
     * @tc.name testSdWriteBoundary001
     * @tc.desc Verify StringDecoder write with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let ret = dec.write('');
        expect(ret).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xE0]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF0, 0x90, 0x80, 0x80]));
        expect(out.charCodeAt(0)).assertEqual(0xD800);
        expect(out.charCodeAt(1)).assertEqual(0xDC00);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1600
     * @tc.name testSdWriteConsistency001
     * @tc.desc Verify StringDecoder write state consistency and source independence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let s: string = 'repeat';
        let a: string = dec.write(s);
        let b: string = dec.write(s);
        expect(a).assertEqual(b);

      }
      {

        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        dec.write(arr);
        expect(arr.byteLength).assertEqual(6);

      }
      {

        let decA = new util.StringDecoder();
        let decB = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array([0xE4, 0xB8, 0xAD]);
        decA.write(arr);
        decB.write(arr);
        let decC = new util.StringDecoder();
        let ret = decC.write(arr);
        expect(ret).assertEqual('中');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1700
     * @tc.name testSdWriteBasic001
     * @tc.desc Verify StringDecoder write with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write('plain');
        expect(ret).assertEqual('plain');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write(new Uint8Array([0x51]));
        expect(ret).assertEqual('Q');

      }
      {

        let dec = new util.StringDecoder();
        let a: string = dec.write('first');
        let b: string = dec.write('second');
        expect(a).not().assertEqual(b);
        expect(a).assertEqual('first');
        expect(b).assertEqual('second');

      }
      {

        let dec = new util.StringDecoder();
        let inner: string = dec.write('nest');
        let outer: string = dec.write(inner);
        expect(outer).assertEqual('nest');

      }
      {

        let dec = new util.StringDecoder();
        let ret: string = dec.write('中文测试');
        expect(ret.length).assertEqual(4);

      }
      {

        let dec = new util.StringDecoder();
        let s: string = 'y'.repeat(8000);
        let ret: string = dec.write(s);
        expect(ret.length).assertEqual(8000);

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0x80]));
        expect(ret).assertEqual('\ufffd');

      }
      {

        let dec = new util.StringDecoder();
        let ret = dec.write(new Uint8Array([0x42, 0xE5, 0xA5, 0xBD, 0x43]));
        expect(ret.length).assertEqual(3);

      }
      {

        let dec = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        dec.write(arr);
        expect(arr[0]).assertEqual(0xE4);

      }
      {

        let dec = new util.StringDecoder();
        let s: string = 'usable';
        dec.write(s);
        expect(s.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1800
     * @tc.name testSdWriteBasic002
     * @tc.desc Verify StringDecoder write with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let dec = new util.StringDecoder();
        let base: Uint8Array = new Uint8Array([0x58, 0x59, 0x5A, 0x61]);
        let view: Uint8Array = base.subarray(1, 3);
        let ret: string = dec.write(view);
        expect(ret).assertEqual('YZ');

      }
      {

        let dec = new util.StringDecoder();
        let base: Uint8Array = new Uint8Array([0x68, 0x65, 0x6C, 0x6C, 0x6F]);
        let view: Uint8Array = base.subarray(0, 5);
        let ret: string = dec.write(view);
        expect(ret).assertEqual('hello');

      }
      {

        let chunk: string | Uint8Array | undefined = undefined;
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | number = Double.NaN;
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | number = 123;
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | number = -1;
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | boolean = true;
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | bigint = BigInt(1);
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | Array<number> = [1, 2, 3];
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | Map<number, number> = new Map<number, number>();
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_1900
     * @tc.name testSdWriteBasic003
     * @tc.desc Verify StringDecoder write with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let chunk: string | Uint8Array | Set<number> = new Set<number>();
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | RegExp = new RegExp('a', 'g');
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | Date = new Date(0);
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | TestChunkObject = new TestChunkObject();
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let chunk: string | Uint8Array | util.StringDecoder = new util.StringDecoder();
        try {
          let d = new util.StringDecoder();
          d.write(chunk as string | Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xC2, 0x80]));
        expect(out).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xDF, 0xBF]));
        expect(out).assertEqual('߿');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xE0, 0xA0, 0x80]));
        expect(out).assertEqual('ࠀ');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xEF, 0xBF, 0xBF]));
        expect(out).assertEqual('￿');

      }
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xED, 0x9F, 0xBF]));
        expect(out).assertEqual('퟿');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRINGDECODER_WRITE_2000
     * @tc.name testSdWriteBasic004
     * @tc.desc Verify StringDecoder write with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSdWriteBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let d = new util.StringDecoder();
        let out = d.write(new Uint8Array([0xF4, 0x8F, 0xBF, 0xBF]));
        expect(out.charCodeAt(0)).assertEqual(0xDBFF);
        expect(out.charCodeAt(1)).assertEqual(0xDFFF);

      }
      {

        let d = new util.StringDecoder();
        let first: string = d.write(new Uint8Array([0xC2]));
        let second: string = d.write(new Uint8Array([0x80]));
        expect(first).assertEqual('');
        expect(second).assertEqual('');

      }
      {

        let d = new util.StringDecoder();
        let arr: Uint8Array = new Uint8Array(300);
        for (let i = 0; i < 100; i++) {
          arr[i * 3] = 0xE4;
          arr[i * 3 + 1] = 0xBD;
          arr[i * 3 + 2] = 0xA0;
        }
        let out = d.write(arr);
        expect(out.length).assertEqual(100);

      }
    });

  });
}
