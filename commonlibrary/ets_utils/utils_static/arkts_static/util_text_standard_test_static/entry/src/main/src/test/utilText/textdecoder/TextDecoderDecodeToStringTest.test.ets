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

export default function TextDecoderDecodeToStringTest(): void {
  describe('TextDecoderDecodeToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_0100
     * @tc.name testTdDecodeThrows001
     * @tc.desc Verify TextDecoder decodeToString throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let opt: util.TextDecoderOptions = { fatal: true };
        let decoder = util.TextDecoder.create('utf-8', opt);
        try {
          decoder.decodeToString(new Uint8Array([0xFF]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let opt: util.TextDecoderOptions = { fatal: true };
        let decoder = util.TextDecoder.create('utf-8', opt);
        try {
          decoder.decodeToString(new Uint8Array([0xE4, 0xBD]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let opt: util.TextDecoderOptions = { fatal: true };
        let decoder = util.TextDecoder.create('utf-8', opt);
        try {
          decoder.decodeToString(new Uint8Array([0xED, 0xA0, 0x80]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let topts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let decoder = util.TextDecoder.create('utf-8', topts);
        try {
          decoder.decodeToString(new Uint8Array([0xC3]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {
        let topts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let decoder = util.TextDecoder.create('utf-8', topts);
        try {
          decoder.decodeToString(new Uint8Array([0xFF]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let topts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let decoder = util.TextDecoder.create('utf-8', topts);
        let opt: util.DecodeToStringOptions = { stream: true };
        decoder.decodeToString(new Uint8Array([0xE4]), opt);
        try {
          decoder.decodeToString(new Uint8Array([0xFF]), opt);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_0200
     * @tc.name testTdDecodeFatal001
     * @tc.desc Verify TextDecoder decodeToString with fatal option handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeFatal001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = new util.TextDecoder();
        let ret = decoder.decodeToString(new Uint8Array([0xFF]));
        expect(ret).assertEqual('�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x80]));
        expect(ret).assertEqual('�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xFF, 0xFF]));
        expect(ret).assertEqual('��');

      }
      {

        let opt: util.TextDecoderOptions = { fatal: true };
        let decoder = util.TextDecoder.create('utf-8', opt);
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(ret).assertEqual('abc');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xED, 0xA0, 0x80]));
        expect(ret).assertEqual('���');

      }
      {
        let topts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let decoder = util.TextDecoder.create('utf-8', topts);
        let opts: util.DecodeToStringOptions = { stream: false };
        let out = decoder.decodeToString(new Uint8Array([111, 107]), opts);
        expect(out).assertEqual('ok');

      }
      {
        let topts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let decoder = util.TextDecoder.create('utf-8', topts);
        let opts: util.DecodeToStringOptions = { stream: true };
        let out = decoder.decodeToString(new Uint8Array([0xC3, 0xA9]), opts);
        expect(out).assertEqual('é');

      }
      {
        let topts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let decoder = util.TextDecoder.create('utf-8', topts);
        try {
          decoder.decodeToString(new Uint8Array([0xC0, 0xAF]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let topts: util.TextDecoderOptions = { fatal: true, ignoreBOM: false };
        let decoder = util.TextDecoder.create('utf-8', topts);
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE5, 0xA5]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xBD]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('好');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0xFE]));
        expect(ret).assertEqual('a�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_0300
     * @tc.name testTdDecodeBom001
     * @tc.desc Verify TextDecoder decodeToString with ignoreBOM and BOM handling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeBom001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let opt: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let decoder = util.TextDecoder.create('utf-8', opt);
        let ret = decoder.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]));
        expect(ret).assertEqual('abc');

      }
      {

        let decoder = new util.TextDecoder();
        let ret = decoder.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61, 0x62, 0x63]));
        expect(ret).assertEqual('\uFEFFabc');

      }
      {

        let opt: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let decoder = util.TextDecoder.create('utf-8', opt);
        let ret = decoder.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF]));
        expect(ret).assertEqual('');

      }
      {

        let opt: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let decoder = util.TextDecoder.create('utf-8', opt);
        let ret = decoder.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF]));
        expect(ret).assertEqual('\uFEFF');

      }
      {

        let opt: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let decoder = util.TextDecoder.create('utf-8', opt);
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0xEF, 0xBB, 0xBF, 0x63]));
        expect(ret).assertEqual('ab\uFEFFc');

      }
      {
        let topts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let decoder = util.TextDecoder.create('utf-8', topts);
        let opts: util.DecodeToStringOptions = { stream: false };
        let out = decoder.decodeToString(new Uint8Array([121, 101, 115]), opts);
        expect(out).assertEqual('yes');

      }
      {

        let topts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let decoder = util.TextDecoder.create('utf-8', topts);
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xEF, 0xBB]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xBF, 0x61, 0x62]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('ab');

      }
      {

        let topts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let decoder = util.TextDecoder.create('utf-8', topts);
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xEF]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xBB]), opt);
        let r3 = decoder.decodeToString(new Uint8Array([0xBF]), opt);
        let r4 = decoder.decodeToString(new Uint8Array([0x78, 0x79]), opt);
        expect(r1).assertEqual('');
        expect(r2).assertEqual('');
        expect(r3).assertEqual('');
        expect(r4).assertEqual('xy');

      }
      {

        let topts: util.TextDecoderOptions = { fatal: false, ignoreBOM: false };
        let decoder = util.TextDecoder.create('utf-8', topts);
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xEF, 0xBB]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xBF, 0x61]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('\uFEFFa');

      }
      {

        let topts: util.TextDecoderOptions = { fatal: false, ignoreBOM: true };
        let decoder = util.TextDecoder.create('utf-8', topts);
        let ret1 = decoder.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x61]));
        let ret2 = decoder.decodeToString(new Uint8Array([0xEF, 0xBB, 0xBF, 0x62]));
        expect(ret1).assertEqual('a');
        expect(ret2).assertEqual('b');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_0400
     * @tc.name testTdDecodeStream001
     * @tc.desc Verify TextDecoder decodeToString with streaming chunk decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeStream001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: false };
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63]), opt);
        expect(ret).assertEqual('abc');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63]), opt);
        expect(ret).assertEqual('abc');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0xE4]));
        expect(ret).assertEqual('a�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: false };
        let ret = decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80, 0x61]), opt);
        expect(ret).assertEqual('😀a');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0xE4]), opt);
        expect(ret).assertEqual('a');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA0, 0x61]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('你a');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xBD]), opt);
        let ret3 = decoder.decodeToString(new Uint8Array([0xA0]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('');
        expect(ret3).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0x61, 0xE4, 0xBD]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA0]), opt);
        expect(ret1).assertEqual('a');
        expect(ret2).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: false };
        let ret1 = decoder.decodeToString(new Uint8Array([0x61, 0xE4]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA0]), opt);
        expect(ret1).assertEqual('a�');
        expect(ret2).assertEqual('�');

      }
      {

        try {
          let decoder = util.TextDecoder.create('utf-8');
          let opt: util.DecodeToStringOptions = { stream: true };
          decoder.decodeToString(new Uint8Array([0xF0]), opt);
          decoder.decodeToString(new Uint8Array([0x9F, 0x98]), opt);
          decoder.decodeToString(new Uint8Array([0x80]), opt);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_0500
     * @tc.name testTdDecodeStream002
     * @tc.desc Verify TextDecoder decodeToString with streaming chunk decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeStream002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xE4]), opt);
        let ret3 = decoder.decodeToString(new Uint8Array([0xBD, 0xA0]), opt);
        expect(ret1).assertEqual('你');
        expect(ret2).assertEqual('');
        expect(ret3).assertEqual('你');

      }
      {
        let opts: util.DecodeToStringOptions = { stream: false };
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([119, 111, 114, 108, 100]), opts);
        expect(out).assertEqual('world');

      }
      {
        let opts: util.DecodeToStringOptions = { stream: true };
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), opts);
        expect(out).assertEqual('你');

      }
      {
        let opts: util.DecodeToStringOptions = { stream: false };
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([115, 116, 114, 105, 110, 103]), opts);
        expect(out).assertEqual('string');

      }
      {
        let opts: util.DecodeToStringOptions = { stream: false };
        let decoder = new util.TextDecoder();
        decoder.decodeToString(new Uint8Array([65]));
        let out = decoder.decodeToString(new Uint8Array([66, 67]), opts);
        expect(out).assertEqual('BC');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xC3]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA9]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('é');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xC3]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA9, 0x61]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('éa');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xE5]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xA5]), opt);
        let r3 = decoder.decodeToString(new Uint8Array([0xBD]), opt);
        let r4 = decoder.decodeToString(new Uint8Array([0xE6, 0x96, 0x87]), opt);
        expect(r1).assertEqual('');
        expect(r2).assertEqual('');
        expect(r3).assertEqual('好');
        expect(r4).assertEqual('文');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0x61, 0x62]), opt);
        expect(ret1).assertEqual('你');
        expect(ret2).assertEqual('ab');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: false };
        let ret1 = decoder.decodeToString(new Uint8Array([0xC3]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA9]), opt);
        expect(ret1).assertEqual('�');
        expect(ret2).assertEqual('�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_0600
     * @tc.name testTdDecodeStream003
     * @tc.desc Verify TextDecoder decodeToString with streaming chunk decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeStream003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xE4]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xBD, 0xA0]), opt);
        let r3 = decoder.decodeToString(new Uint8Array([0xF0]), opt);
        let r4 = decoder.decodeToString(new Uint8Array([0x9F, 0x98, 0x80]), opt);
        expect(r1).assertEqual('');
        expect(r2).assertEqual('你');
        expect(r3).assertEqual('');
        expect(r4).assertEqual('😀');

      }
      {

        try {
          let decoder = util.TextDecoder.create('utf-8');
          let opt: util.DecodeToStringOptions = { stream: true };
          decoder.decodeToString(new Uint8Array([0x61]), opt);
          decoder.decodeToString(new Uint8Array([0xE6, 0x96]), opt);
          decoder.decodeToString(new Uint8Array([0x62]), opt);
          decoder.decodeToString(new Uint8Array([0x87]), opt);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0x78]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0x79]), opt);
        expect(ret1).assertEqual('x');
        expect(ret2).assertEqual('y');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0x41, 0x42]), opt);
        let ret3 = decoder.decodeToString(new Uint8Array([0x43, 0x44]), opt);
        expect(ret1).assertEqual('你');
        expect(ret2).assertEqual('AB');
        expect(ret3).assertEqual('CD');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xE5, 0xA5, 0xBD]), opt);
        expect(ret1).assertEqual('你');
        expect(ret2).assertEqual('好');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xE6, 0xAD]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([]), opt);
        let r3 = decoder.decodeToString(new Uint8Array([0xA6]), opt);
        expect(r1).assertEqual('');
        expect(r2).assertEqual('');
        expect(r3).assertEqual('武');

      }
      {

        try {
          let decoder = util.TextDecoder.create('utf-8');
          let opt: util.DecodeToStringOptions = { stream: true };
          decoder.decodeToString(new Uint8Array([0xE4]), opt);
          decoder.decodeToString(new Uint8Array([0xE5]), opt);
          decoder.decodeToString(new Uint8Array([0xBD, 0xA0]), opt);
          decoder.decodeToString(new Uint8Array([0xA5, 0xBD]), opt);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        decoder.decodeToString(new Uint8Array([0xE8, 0xAF]), opt);
        let out = decoder.decodeToString(new Uint8Array([0x95, 0xE4, 0xB8, 0x96]), opt);
        expect(out).assertEqual('试世');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt1: util.DecodeToStringOptions = { stream: false };
        let opt2: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4]), opt1);
        let ret2 = decoder.decodeToString(new Uint8Array([0xBD]), opt2);
        let ret3 = decoder.decodeToString(new Uint8Array([0xA0]), opt2);
        expect(ret1).assertEqual('�');
        expect(ret2).assertEqual('�');
        expect(ret3).assertEqual('�');

      }
      {

        let decoder = util.TextDecoder.create('gbk');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xC4]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xE3]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_0700
     * @tc.name testTdDecodeStream004
     * @tc.desc Verify TextDecoder decodeToString with streaming chunk decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeStream004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('big5');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xA7]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0x41]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('gb18030');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xC4]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xE3]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('utf-16be');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0x4F]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0x60]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('euc-jp');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xA4]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA2]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('あ');

      }
      {

        let decoder = util.TextDecoder.create('shift_jis');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0x82]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA0]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('あ');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let part1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD]), opt);
        let part2 = decoder.decodeToString(new Uint8Array([0xA0, 0xE5]), opt);
        let part3 = decoder.decodeToString(new Uint8Array([0xA5, 0xBD]), opt);
        let whole = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(part1 + part2 + part3).assertEqual(whole);

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0x61, 0xE4, 0xBD]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA0, 0xE5, 0xA5, 0xBD]), opt);
        let ret3 = decoder.decodeToString(new Uint8Array([0xE4, 0xB8, 0x96]), opt);
        let ret4 = decoder.decodeToString(new Uint8Array([0xE7, 0x95, 0x8C]), opt);
        expect(ret1 + ret2 + ret3 + ret4).assertEqual('a你好世界');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ab = new ArrayBuffer(5);
        let u8 = new Uint8Array(ab);
        u8[0] = 0x58;
        u8[1] = 0xE4;
        u8[2] = 0xBD;
        u8[3] = 0xA0;
        u8[4] = 0x59;
        let view = new Uint8Array(ab, 1, 3);
        let ret1 = decoder.decodeToString(view, opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), opt);
        expect(ret1).assertEqual('你');
        expect(ret2).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let full = new Uint8Array([0x61, 0x62, 0x63]);
        let emptyView = full.subarray(1, 1);
        let ret1 = decoder.decodeToString(emptyView, opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xBD, 0xA0]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_0800
     * @tc.name testTdDecodeStream005
     * @tc.desc Verify TextDecoder decodeToString with streaming chunk decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeStream005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xC2]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA9]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('©');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE2, 0x98]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0x80]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('☀');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xF0, 0x9F]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0x98, 0x80]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('😀');

      }
      {

        try {
          let decoder = util.TextDecoder.create('utf-8');
          let opt: util.DecodeToStringOptions = { stream: true };
          decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98]), opt);
          decoder.decodeToString(new Uint8Array([0x80]), opt);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        try {
          let decoder = util.TextDecoder.create('utf-8');
          let opt: util.DecodeToStringOptions = { stream: true };
          decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98]), opt);
          decoder.decodeToString(new Uint8Array([0x6A]), opt);
          decoder.decodeToString(new Uint8Array([0x80]), opt);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let decoder = util.TextDecoder.create('utf-16le');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0x41, 0x00, 0x42]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0x00, 0x43, 0x00]), opt);
        expect(ret1).assertEqual('A');
        expect(ret2).assertEqual('BC');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xC2, 0xC3]));
        expect(ret).assertEqual('��');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63, 0xF0]));
        expect(ret).assertEqual('abc�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63, 0xF0, 0x9F]));
        expect(ret).assertEqual('abc�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4]), opt);
        let opt2: util.DecodeToStringOptions = { stream: false };
        let ret2 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), opt2);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('�你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_0900
     * @tc.name testTdDecodeStream006
     * @tc.desc Verify TextDecoder decodeToString with streaming chunk decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeStream006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xBD, 0xE4, 0xB8]), opt);
        let r3 = decoder.decodeToString(new Uint8Array([0x96, 0xE7, 0x95]), opt);
        let r4 = decoder.decodeToString(new Uint8Array([0x8C]), opt);
        expect(r1 + r2 + r3 + r4).assertEqual('你好世界');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0x61]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD]), opt);
        let r3 = decoder.decodeToString(new Uint8Array([0xA0, 0x62]), opt);
        let r4 = decoder.decodeToString(new Uint8Array([0xE6, 0x96]), opt);
        let r5 = decoder.decodeToString(new Uint8Array([0x87]), opt);
        expect(r1).assertEqual('a');
        expect(r2).assertEqual('');
        expect(r3).assertEqual('你b');
        expect(r4).assertEqual('');
        expect(r5).assertEqual('文');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        decoder.decodeToString(new Uint8Array([0xE5]), opt);
        let out = decoder.decodeToString(new Uint8Array([0xA5, 0xBD]), opt);
        expect(out).assertEqual('好');

      }
      {

        let d1 = util.TextDecoder.create('utf-8');
        let d2 = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        d1.decodeToString(new Uint8Array([0xE4]), opt);
        let r1 = d2.decodeToString(new Uint8Array([0x61]), opt);
        let r2 = d1.decodeToString(new Uint8Array([0xBD, 0xA0]), opt);
        expect(r1).assertEqual('a');
        expect(r2).assertEqual('你');

      }
      {

        let dUtf8 = util.TextDecoder.create('utf-8');
        let dGbk = util.TextDecoder.create('gbk');
        let opt: util.DecodeToStringOptions = { stream: true };
        dUtf8.decodeToString(new Uint8Array([0xE4]), opt);
        let r1 = dGbk.decodeToString(new Uint8Array([0xC4]), opt);
        let r2 = dUtf8.decodeToString(new Uint8Array([0xBD, 0xA0]), opt);
        let r3 = dGbk.decodeToString(new Uint8Array([0xE3]), opt);
        expect(r1).assertEqual('');
        expect(r2).assertEqual('你');
        expect(r3).assertEqual('你');

      }
      {

        try {
          let decoder = util.TextDecoder.create('utf-8');
          let optT: util.DecodeToStringOptions = { stream: true };
          let optF: util.DecodeToStringOptions = { stream: false };
          decoder.decodeToString(new Uint8Array([0xE4]), optT);
          decoder.decodeToString(new Uint8Array([0x61, 0x62]), optF);
          decoder.decodeToString(new Uint8Array([0xBD]), optT);
          decoder.decodeToString(new Uint8Array([0xA0]), optT);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xE6, 0x88]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0x91, 0xE7]), opt);
        let r3 = decoder.decodeToString(new Uint8Array([0x88, 0xB1]), opt);
        let whole = decoder.decodeToString(new Uint8Array([0xE6, 0x88, 0x91, 0xE7, 0x88, 0xB1]));
        expect(r1 + r2 + r3).assertEqual(whole);

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0xA0]), opt);
        let ret3 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('你');
        expect(ret3).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]), opt);
        expect(r1).assertEqual('😀');
        expect(r2).assertEqual('😀');

      }
      {

        try {
          let decoder = util.TextDecoder.create('utf-8');
          let opt: util.DecodeToStringOptions = { stream: true };
          let ab = new ArrayBuffer(3);
          let u8 = new Uint8Array(ab);
          u8[0] = 0xE4;
          u8[1] = 0xBD;
          u8[2] = 0xA0;
          decoder.decodeToString(new Uint8Array(ab, 0, 1), opt);
          u8[1] = 0x58;
          u8[2] = 0x59;
          decoder.decodeToString(new Uint8Array(ab, 1, 2), opt);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1000
     * @tc.name testTdDecodeStream007
     * @tc.desc Verify TextDecoder decodeToString with streaming chunk decoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeStream007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0x61, 0xC3]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xA9, 0x62]), opt);
        expect(r1).assertEqual('a');
        expect(r2).assertEqual('éb');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xA0, 0x00, 0x61]), opt);
        expect(r1).assertEqual('');
        expect(r2).assertEqual('你\u0000a');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xA0]), opt);
        let r3 = decoder.decodeToString(new Uint8Array([0xE6, 0x96]), opt);
        let r4 = decoder.decodeToString(new Uint8Array([0x87]), opt);
        expect(r1).assertEqual('');
        expect(r2).assertEqual('你');
        expect(r3).assertEqual('');
        expect(r4).assertEqual('文');

      }
      {

        try {
          let decoder = util.TextDecoder.create('utf-8');
          let opt: util.DecodeToStringOptions = { stream: true };
          decoder.decodeToString(new Uint8Array([0xF0]), opt);
          decoder.decodeToString(new Uint8Array([0x9F]), opt);
          decoder.decodeToString(new Uint8Array([0x98]), opt);
          decoder.decodeToString(new Uint8Array([0x80]), opt);
          decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]));
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
          expect(e.code).assertEqual(401);
        }

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let opt: util.DecodeToStringOptions = { stream: true };
        let r1 = decoder.decodeToString(new Uint8Array([0xE4, 0xFF]), opt);
        let r2 = decoder.decodeToString(new Uint8Array([0xBD, 0xA0]), opt);
        expect(r1).assertEqual('��');
        expect(r2).assertEqual('��');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1100
     * @tc.name testTdDecodeEncoding001
     * @tc.desc Verify TextDecoder decodeToString with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(ret).assertEqual('abc');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([]));
        expect(ret).assertEqual('');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61]));
        expect(ret).assertEqual('a');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x62]));
        expect(ret).assertEqual('ab');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x41, 0x42, 0x43]));
        expect(ret).assertEqual('ABC');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x00, 0x7F]));
        expect(ret).assertEqual('\u0000');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xC2, 0xA9]));
        expect(ret).assertEqual('©');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(ret).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE2, 0x98, 0x80]));
        expect(ret).assertEqual('☀');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]));
        expect(ret).assertEqual('😀');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1200
     * @tc.name testTdDecodeEncoding002
     * @tc.desc Verify TextDecoder decodeToString with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]));
        expect(ret.length).assertEqual(2);

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(ret).assertEqual('你好');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0x61, 0x62]));
        expect(ret).assertEqual('你ab');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0xE4, 0xBD, 0xA0]));
        expect(ret).assertEqual('a你');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xF4, 0x8F, 0xBF, 0xBF]));
        expect(ret).assertEqual('􏿿');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xF4, 0x90, 0x80, 0x80]));
        expect(ret).assertEqual('����');

      }
      {

        let decoder = util.TextDecoder.create('utf-16le');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x00]));
        expect(ret).assertEqual('a');

      }
      {

        let decoder = util.TextDecoder.create('utf-16be');
        let ret = decoder.decodeToString(new Uint8Array([0x00, 0x61]));
        expect(ret).assertEqual('a');

      }
      {

        let decoder = util.TextDecoder.create('utf-16le');
        let ret = decoder.decodeToString(new Uint8Array([0x60, 0x4F]));
        expect(ret).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('utf-16be');
        let ret = decoder.decodeToString(new Uint8Array([0x4F, 0x60]));
        expect(ret).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1300
     * @tc.name testTdDecodeEncoding003
     * @tc.desc Verify TextDecoder decodeToString with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-16le');
        let ret = decoder.decodeToString(new Uint8Array([0x41, 0x00, 0x00, 0x00]));
        expect(ret).assertEqual('A\u0000');

      }
      {

        let decoder = util.TextDecoder.create('gbk');
        let ret = decoder.decodeToString(new Uint8Array([0xC4, 0xE3]));
        expect(ret).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('gb18030');
        let ret = decoder.decodeToString(new Uint8Array([0xC4, 0xE3]));
        expect(ret).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('big5');
        let ret = decoder.decodeToString(new Uint8Array([0xA7, 0x41]));
        expect(ret).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('iso-8859-1');
        let ret = decoder.decodeToString(new Uint8Array([0xE9]));
        expect(ret).assertEqual('é');

      }
      {

        let decoder = util.TextDecoder.create('euc-jp');
        let ret = decoder.decodeToString(new Uint8Array([0xA4, 0xA2]));
        expect(ret).assertEqual('あ');

      }
      {

        let decoder = util.TextDecoder.create('shift_jis');
        let ret = decoder.decodeToString(new Uint8Array([0x82, 0xA0]));
        expect(ret).assertEqual('あ');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0xC3]));
        expect(ret).assertEqual('a�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x62, 0xE4]));
        expect(ret).assertEqual('b�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x62, 0xE4, 0xBD]));
        expect(ret).assertEqual('b�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1400
     * @tc.name testTdDecodeEncoding004
     * @tc.desc Verify TextDecoder decodeToString with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x63, 0xF0]));
        expect(ret).assertEqual('c�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x63, 0xF0, 0x9F]));
        expect(ret).assertEqual('c�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x63, 0xF0, 0x9F, 0x98]));
        expect(ret).assertEqual('c�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE2, 0x98]));
        expect(ret).assertEqual('�');

      }
      {

        let decoder = util.TextDecoder.create('utf-16le');
        let ret = decoder.decodeToString(new Uint8Array([0x41, 0x00, 0x42]));
        expect(ret).assertEqual('A�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let big = new Uint8Array(10000);
        for (let i = 0; i < 10000; i++) {
          big[i] = 0x61;
        }
        let ret = decoder.decodeToString(big);
        expect(ret.length).assertEqual(10000);

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([72, 101, 108, 108, 111]));
        expect(out).assertEqual('Hello');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x61]));
        expect(out).assertEqual('a');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x61, 0xE4, 0xBD, 0xA0, 0x31]));
        expect(out).assertEqual('a你1');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x00, 0x61]));
        expect(out).assertEqual('\u0000a');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1500
     * @tc.name testTdDecodeEncoding005
     * @tc.desc Verify TextDecoder decodeToString with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.TextDecoder();
        let a = decoder.decodeToString(new Uint8Array([0x61]));
        let b = decoder.decodeToString(new Uint8Array([0x62]));
        expect(a + b).assertEqual('ab');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([72, 101, 108, 108, 111, 32, 87, 111, 114, 108, 100]));
        expect(out).assertEqual('Hello World');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([97, 98, 99, 49, 50, 51, 88, 89, 90]));
        expect(out).assertEqual('abc123XYZ');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(out).assertEqual('你好');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98, 0x80]));
        expect(out).assertEqual('😀');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD, 0xE4, 0xB8, 0x96, 0xE7, 0x95, 0x8C]));
        expect(out).assertEqual('你好世界');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(out.length).assertEqual(3);

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x6D, 0x61, 0x69, 0x6E]));
        expect(out.length).assertEqual(4);

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]));
        expect(out.length).assertEqual(2);

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD, 0xE4, 0xB8, 0x96, 0xE7, 0x95, 0x8C]));
        expect(out.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1600
     * @tc.name testTdDecodeEncoding006
     * @tc.desc Verify TextDecoder decodeToString with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x61, 0xE4, 0xBD, 0xA0]));
        expect(out.length).assertEqual(2);

      }
      {
        let decoder = new util.TextDecoder();
        let input: number[] = [];
        for (let i = 0; i < 100; i++) {
          input.push(0x61);
        }
        let out = decoder.decodeToString(new Uint8Array(input));
        expect(out.length).assertEqual(100);

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xC3, 0xA9]));
        expect(out).assertEqual('é');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(out).assertEqual('你');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0xBD]));
        expect(out).assertEqual('�');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xF0, 0x9F]));
        expect(out).assertEqual('�');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x61, 0xC3]));
        expect(out).assertEqual('a�');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0x61]));
        expect(out).assertEqual('�' + 'a');

      }
      {

        let decoder = util.TextDecoder.create('utf-16le');
        let opt: util.DecodeToStringOptions = { stream: true };
        let ret1 = decoder.decodeToString(new Uint8Array([0x4F]), opt);
        let ret2 = decoder.decodeToString(new Uint8Array([0x60]), opt);
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('恏');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE4, 0x61]));
        expect(ret).assertEqual('�a');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1700
     * @tc.name testTdDecodeUnicode001
     * @tc.desc Verify TextDecoder decodeToString with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0x00, 0xE4, 0xBD, 0xA0]));
        expect(ret).assertEqual('你\u0000你');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0x31]));
        expect(out).assertEqual('你1');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let full = new Uint8Array([0x61, 0xE4, 0xBD, 0xA0, 0x62]);
        let view = full.subarray(1, 4);
        let out = decoder.decodeToString(view);
        expect(out).assertEqual('你');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let full = new Uint8Array([0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD]);
        let v1 = full.subarray(0, 3);
        let v2 = full.subarray(3, 6);
        let r1 = decoder.decodeToString(v1);
        let r2 = decoder.decodeToString(v2);
        expect(r1).assertEqual('你');
        expect(r2).assertEqual('好');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ab = new ArrayBuffer(0);
        let empty = new Uint8Array(ab, 0, 0);
        let ret1 = decoder.decodeToString(empty);
        let ret2 = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0]));
        expect(ret1).assertEqual('');
        expect(ret2).assertEqual('你');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1800
     * @tc.name testTdDecodeInvisible001
     * @tc.desc Verify TextDecoder decodeToString with invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeInvisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xE2]));
        expect(ret).assertEqual('你�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xC0, 0x80]));
        expect(ret).assertEqual('��');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE0, 0x80, 0x80]));
        expect(ret).assertEqual('���');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xC2, 0x41]));
        expect(ret).assertEqual('�A');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xC0]));
        expect(ret).assertEqual('�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE0]));
        expect(ret).assertEqual('�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xF0]));
        expect(ret).assertEqual('�');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xC3]));
        expect(out).assertEqual('�');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4]));
        expect(out).assertEqual('�');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xF0]));
        expect(out).assertEqual('�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_1900
     * @tc.name testTdDecodeInvisible002
     * @tc.desc Verify TextDecoder decodeToString with invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeInvisible002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xC3, 0xE4]));
        expect(out).assertEqual('��');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x80]));
        expect(out).assertEqual('�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xC0, 0xAF]));
        expect(ret).assertEqual('��');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE0, 0x80, 0xAF]));
        expect(ret).assertEqual('���');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_2000
     * @tc.name testTdDecodeControl001
     * @tc.desc Verify TextDecoder decodeToString with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x00]));
        expect(ret).assertEqual('\u0000');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x00, 0x00, 0x00]));
        expect(ret).assertEqual('\u0000\u0000\u0000');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x00]));
        expect(ret).assertEqual('a\u0000');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x00, 0x61]));
        expect(ret).assertEqual('\u0000a');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x7F]));
        expect(out).assertEqual('');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x61, 0x00, 0x62]));
        expect(out.length).assertEqual(3);

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let input = new Uint8Array([0xE6, 0x88, 0x91, 0x00, 0xE7, 0x88, 0xB1]);
        let before: number[] = [];
        for (let i = 0; i < input.length; i++) {
          before.push(input[i]);
        }
        decoder.decodeToString(input);
        for (let j = 0; j < input.length; j++) {
          expect(input[j]).assertEqual(before[j]);
        }

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ab = new ArrayBuffer(2);
        let u16 = new Uint16Array(ab);
        let u8 = new Uint8Array(ab);
        u16[0] = 0x0061;
        let out = decoder.decodeToString(u8);
        expect(out).assertEqual('a\u0000');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_2100
     * @tc.name testTdDecodeSpecial001
     * @tc.desc Verify TextDecoder decodeToString with special format content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeSpecial001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([97, 98, 0, 99]));
        expect(ret).assertEqual('ab\u0000c');
        expect(JSON.stringify(ret)).assertEqual('"ab\\u0000c"');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ab = new ArrayBuffer(6);
        let u8 = new Uint8Array(ab);
        u8[0] = 0x61;
        u8[1] = 0x62;
        u8[2] = 0x63;
        u8[3] = 0x64;
        u8[4] = 0x65;
        u8[5] = 0x66;
        let left = new Uint8Array(ab, 0, 3);
        let right = new Uint8Array(ab, 3, 3);
        decoder.decodeToString(left);
        u8[2] = 0x31;
        expect(decoder.decodeToString(left)).assertEqual('ab1');
        expect(decoder.decodeToString(right)).assertEqual('def');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_2200
     * @tc.name testTdDecodeBoundary001
     * @tc.desc Verify TextDecoder decodeToString with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([]));
        expect(out).assertEqual('');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([]));
        expect(out.length).assertEqual(0);

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE6, 0x88, 0x91, 0xE3, 0x80]));
        expect(ret).assertEqual('我�');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_2300
     * @tc.name testTdDecodeConsistency001
     * @tc.desc Verify TextDecoder decodeToString state consistency and shared options
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let input = new Uint8Array([0xE4, 0xBD, 0xA0]);
        let ret1 = decoder.decodeToString(input);
        let ret2 = decoder.decodeToString(input);
        expect(ret1).assertEqual('你');
        expect(ret2).assertEqual(ret1);

      }
      {
        let decoder = new util.TextDecoder();
        let input = new Uint8Array([0x6E, 0x65, 0x77]);
        let first = decoder.decodeToString(input);
        let second = decoder.decodeToString(input);
        expect(second).assertEqual(first);

      }
      {
        let d1 = new util.TextDecoder();
        let d2 = new util.TextDecoder();
        let input = new Uint8Array([0xE4, 0xBD, 0xA0]);
        expect(d2.decodeToString(input)).assertEqual(d1.decodeToString(input));

      }
      {
        let decoder = new util.TextDecoder();
        let input = new Uint8Array([0x72, 0x65, 0x70]);
        let r1 = decoder.decodeToString(input);
        let r2 = decoder.decodeToString(input);
        let r3 = decoder.decodeToString(input);
        expect(r3).assertEqual(r1);
        expect(r2).assertEqual(r1);

      }
      {
        let decoder = new util.TextDecoder();
        let ab = new ArrayBuffer(5);
        let u8 = new Uint8Array(ab);
        u8[0] = 0x68;
        u8[1] = 0x69;
        u8[2] = 0x6A;
        u8[3] = 0x6B;
        u8[4] = 0x6C;
        let fullView = new Uint8Array(ab, 0, 5);
        expect(decoder.decodeToString(fullView)).assertEqual(decoder.decodeToString(u8));

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_2400
     * @tc.name testTdDecodeBasic001
     * @tc.desc Verify TextDecoder decodeToString with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let raw = new Uint8Array([0x00, 0x61, 0x62, 0x63, 0x00]);
        let view = new Uint8Array(raw.buffer, 1, 3);
        let ret = decoder.decodeToString(view);
        expect(ret).assertEqual('abc');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let input = new Uint8Array([0xE4, 0xBD, 0xA0, 0x61]);
        decoder.decodeToString(input);
        expect(input[0]).assertEqual(0xE4);
        expect(input[3]).assertEqual(0x61);

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(ret.length).assertEqual(3);

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([72, 105]));
        expect(out).assertEqual('Hi');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x61]));
        expect(out.length).assertEqual(1);

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x09, 0x0A, 0x0D]));
        expect(out).assertEqual('\t\n\r');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x21, 0x40, 0x23]));
        expect(out).assertEqual('!@#');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x31, 0x32, 0x33]));
        expect(out).assertEqual('123');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x20, 0x20, 0x20]));
        expect(out).assertEqual('   ');

      }
      {
        let decoder = new util.TextDecoder();
        let input = new Uint8Array([0x61, 0x62, 0x63]);
        decoder.decodeToString(input);
        input[0] = 0x58;
        let out = decoder.decodeToString(input);
        expect(out).assertEqual('Xbc');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_2500
     * @tc.name testTdDecodeBasic002
     * @tc.desc Verify TextDecoder decodeToString with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x74, 0x79, 0x70, 0x65]));
        expect(out).assertEqual('type');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xE4, 0xB8, 0x96]));
        expect(out).assertEqual('世');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x61, 0x62]));
        expect(out.charCodeAt(0)).assertEqual(97);
        expect(out.charCodeAt(1)).assertEqual(98);

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x7B, 0x7D]));
        expect(out).assertEqual('{}');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x0A, 0x0D]));
        expect(out).assertEqual('\n\r');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0x61, 0x20]));
        expect(out).assertEqual('a ');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([97, 98, 0, 99]));
        expect(out.length).assertEqual(4);

      }
      {
        let decoder = new util.TextDecoder();
        let input = new Uint8Array([65, 66, 67]);
        decoder.decodeToString(input);
        expect(input[0]).assertEqual(65);
        expect(input[1]).assertEqual(66);
        expect(input[2]).assertEqual(67);

      }
      {
        let decoder = new util.TextDecoder();
        let input = new Uint8Array([77, 78, 79, 80]);
        decoder.decodeToString(input);
        expect(input.length).assertEqual(4);

      }
      {
        let decoder = new util.TextDecoder();
        let input = new Uint8Array([0xFF, 0xFE, 0xFD]);
        decoder.decodeToString(input);
        expect(input[0]).assertEqual(255);
        expect(input[1]).assertEqual(254);
        expect(input[2]).assertEqual(253);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_2600
     * @tc.name testTdDecodeBasic003
     * @tc.desc Verify TextDecoder decodeToString with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let decoder = new util.TextDecoder();
        decoder.decodeToString(new Uint8Array([0x61]));
        let out = decoder.decodeToString(new Uint8Array([0x62]));
        expect(out).assertEqual('b');

      }
      {
        let decoder = new util.TextDecoder();
        let p1 = decoder.decodeToString(new Uint8Array([0x61]));
        let p2 = decoder.decodeToString(new Uint8Array([0x62, 0x63]));
        let whole = decoder.decodeToString(new Uint8Array([0x61, 0x62, 0x63]));
        expect(p1 + p2).assertEqual(whole);

      }
      {
        let decoder = new util.TextDecoder();
        let full = new Uint8Array([0x41, 0x42, 0x43, 0x44]);
        let view = full.subarray(1, 3);
        let out = decoder.decodeToString(view);
        expect(out).assertEqual('BC');

      }
      {
        let decoder = new util.TextDecoder();
        let ab = new ArrayBuffer(6);
        let u8 = new Uint8Array(ab);
        u8[0] = 0x58;
        u8[1] = 0x59;
        u8[2] = 0x5A;
        let offset = new Uint8Array(ab, 1, 2);
        let out = decoder.decodeToString(offset);
        expect(out).assertEqual('YZ');

      }
      {
        let decoder = new util.TextDecoder();
        let ab = new ArrayBuffer(6);
        let u8 = new Uint8Array(ab);
        u8[0] = 0x31;
        u8[1] = 0x32;
        u8[2] = 0x33;
        u8[3] = 0x34;
        u8[4] = 0x35;
        u8[5] = 0x36;
        let left = new Uint8Array(ab, 0, 3);
        let right = new Uint8Array(ab, 3, 3);
        expect(decoder.decodeToString(left)).assertEqual('123');
        expect(decoder.decodeToString(right)).assertEqual('456');

      }
      {
        let decoder = new util.TextDecoder();
        let ab = new ArrayBuffer(3);
        let u8 = new Uint8Array(ab);
        u8[0] = 0x61;
        u8[1] = 0x62;
        u8[2] = 0x63;
        decoder.decodeToString(u8);
        u8[1] = 0x58;
        let out = decoder.decodeToString(u8);
        expect(out).assertEqual('aXc');

      }
      {
        let decoder = new util.TextDecoder();
        let full = new Uint8Array([0x61, 0x62, 0x63]);
        let emptyView = full.subarray(2, 2);
        let out = decoder.decodeToString(emptyView);
        expect(out).assertEqual('');

      }
      {
        let decoder = new util.TextDecoder();
        let out = decoder.decodeToString(new Uint8Array([0xF0, 0x9F, 0x98]));
        expect(out).assertEqual('�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let input = new Uint8Array([0x31, 0x32, 0x33, 0x34]);
        let lenBefore = input.length;
        let blBefore = input.byteLength;
        decoder.decodeToString(input);
        expect(input.length).assertEqual(lenBefore);
        expect(input.byteLength).assertEqual(blBefore);

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ab = new ArrayBuffer(4);
        let u8 = new Uint8Array(ab);
        u8[0] = 0x61;
        u8[1] = 0x62;
        u8[2] = 0x63;
        u8[3] = 0x64;
        let view = new Uint8Array(ab, 0, 4);
        decoder.decodeToString(view);
        u8[0] = 0x5A;
        let out = decoder.decodeToString(view);
        expect(out).assertEqual('Zbcd');

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTDECODER_DECODE_TO_STRING_2700
     * @tc.name testTdDecodeBasic004
     * @tc.desc Verify TextDecoder decodeToString with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTdDecodeBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ab = new ArrayBuffer(6);
        let u8 = new Uint8Array(ab);
        u8[0] = 0x41;
        u8[1] = 0x42;
        u8[2] = 0x43;
        u8[3] = 0x44;
        u8[4] = 0x45;
        u8[5] = 0x46;
        let v1 = new Uint8Array(ab, 1, 3);
        let v2 = new Uint8Array(ab, 4, 2);
        expect(decoder.decodeToString(v1)).assertEqual('BCD');
        expect(decoder.decodeToString(v2)).assertEqual('EF');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ab = new ArrayBuffer(3);
        let u8 = new Uint8Array(ab);
        u8[0] = 0xE8;
        u8[1] = 0xAF;
        u8[2] = 0x95;
        let view = new Uint8Array(ab, 0, 3);
        let r1 = decoder.decodeToString(view);
        let r2 = decoder.decodeToString(view);
        expect(r1.length).assertEqual(1);
        expect(r2.length).assertEqual(1);

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ret = decoder.decodeToString(new Uint8Array([0xE4, 0xBD, 0xA0, 0xF0]));
        expect(ret).assertEqual('你�');

      }
      {

        let decoder = util.TextDecoder.create('utf-8');
        let ab = new ArrayBuffer(4);
        let front = new Uint8Array(ab, 0, 2);
        let back = new Uint8Array(ab, 2, 2);
        front[0] = 0xE4;
        front[1] = 0xBD;
        back[0] = 0xA0;
        back[1] = 0x61;
        let out = decoder.decodeToString(new Uint8Array(ab, 0, 4));
        expect(out).assertEqual('你a');

      }
    });

  });
}
