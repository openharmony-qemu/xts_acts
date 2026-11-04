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

export default function TextEncoderEncodeIntoTest(): void {
  describe('TextEncoderEncodeIntoTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_0100
     * @tc.name testTeIntoThrows001
     * @tc.desc Verify TextEncoder encodeInto throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        try {
          let v3e1: ESObject = ESValue.Null;
          te.encodeInto(v3e1 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e2: ESObject = ESValue.wrapNumber(0);
          te.encodeInto(v3e2 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e3: ESObject = ESValue.wrapNumber(12345);
          te.encodeInto(v3e3 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e4: ESObject = ESValue.wrapNumber(-1);
          te.encodeInto(v3e4 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e5: ESObject = ESValue.wrapNumber(3.14);
          te.encodeInto(v3e5 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e7: ESObject = ESValue.wrapNumber(Number.NaN);
          te.encodeInto(v3e7 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e8: ESObject = ESValue.wrapNumber(Number.POSITIVE_INFINITY);
          te.encodeInto(v3e8 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e9: ESObject = ESValue.wrapNumber(-Number.POSITIVE_INFINITY);
          te.encodeInto(v3e9 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e11: ESObject = ESValue.wrapBoolean(true);
          te.encodeInto(v3e11 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e12: ESObject = ESValue.wrapBoolean(false);
          te.encodeInto(v3e12 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_0200
     * @tc.name testTeIntoThrows002
     * @tc.desc Verify TextEncoder encodeInto throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let arrIllegal: int[] = [];
        try {
          let v3e14: ESObject = ESValue.wrap(arrIllegal);
          te.encodeInto(v3e14 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let u8Illegal: Uint8Array = new Uint8Array([97]);
        try {
          let v3e15: ESObject = ESValue.wrap(u8Illegal);
          te.encodeInto(v3e15 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let mapIllegal: Map<string, int> = new Map<string, int>();
        try {
          let v3e16: ESObject = ESValue.wrap(mapIllegal);
          te.encodeInto(v3e16 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dateIllegal = new Date();
        try {
          let v3e17: ESObject = ESValue.wrap(dateIllegal);
          te.encodeInto(v3e17 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let regIllegal: RegExp = new RegExp('a');
        try {
          let v3e18: ESObject = ESValue.wrap(regIllegal);
          te.encodeInto(v3e18 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let abIllegal = new ArrayBuffer(4);
        try {
          let v3e19: ESObject = ESValue.wrap(abIllegal);
          te.encodeInto(v3e19 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_0300
     * @tc.name testTeIntoSemantics001
     * @tc.desc Verify TextEncoder encodeInto read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoSemantics001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let r1 = te.encodeInto('abc');
        r1[0] = 65;
        let r2 = te.encodeInto('abc');
        expect(r2[0]).assertEqual(97);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('abc');
        expect(result.byteOffset).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('中');
        expect(result.buffer.byteLength).assertEqual(result.byteLength);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('😀');
        expect(result.buffer.byteLength).assertEqual(4);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('abc');
        expect(result.buffer.byteLength).assertEqual(6);

      }
      {
        let te = new util.TextEncoder();
        let r1 = te.encodeInto('abc');
        let r2 = te.encodeInto('abc');
        expect(r1.buffer).not().assertEqual(r2.buffer);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_0400
     * @tc.name testTeIntoEncoding001
     * @tc.desc Verify TextEncoder encodeInto with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoEncoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('0');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(48);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('~');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(126);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(127);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('abc');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(97);
          expect(bytes.$_get(1)).assertEqual(98);
          expect(bytes.$_get(2)).assertEqual(99);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto(' ');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(194);
          expect(bytes.$_get(1)).assertEqual(160);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\uD800a');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(4);
          expect(bytes.$_get(0)).assertEqual(237);
          expect(bytes.$_get(1)).assertEqual(160);
          expect(bytes.$_get(2)).assertEqual(128);
          expect(bytes.$_get(3)).assertEqual(97);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('a\uDC00');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(4);
          expect(bytes.$_get(0)).assertEqual(97);
          expect(bytes.$_get(1)).assertEqual(237);
          expect(bytes.$_get(2)).assertEqual(176);
          expect(bytes.$_get(3)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('😀a');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(5);
          expect(bytes.$_get(0)).assertEqual(240);
          expect(bytes.$_get(1)).assertEqual(159);
          expect(bytes.$_get(2)).assertEqual(152);
          expect(bytes.$_get(3)).assertEqual(128);
          expect(bytes.$_get(4)).assertEqual(97);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('a😀');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(5);
          expect(bytes.$_get(0)).assertEqual(97);
          expect(bytes.$_get(1)).assertEqual(240);
          expect(bytes.$_get(2)).assertEqual(159);
          expect(bytes.$_get(3)).assertEqual(152);
          expect(bytes.$_get(4)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(127);
          expect(bytes.$_get(1)).assertEqual(194);
          expect(bytes.$_get(2)).assertEqual(128);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_0500
     * @tc.name testTeIntoEncoding002
     * @tc.desc Verify TextEncoder encodeInto with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoEncoding002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = util.TextEncoder.create('utf-8');
          let result: Uint8Array | undefined = textEncoder.encodeInto('中');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(228);
          expect(bytes.$_get(1)).assertEqual(184);
          expect(bytes.$_get(2)).assertEqual(173);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let longInput: string = '';
          for (let i: int = 0; i < 10000; i++) {
            longInput += 'a';
          }
          let result: Uint8Array | undefined = textEncoder.encodeInto(longInput);
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(10000);
          expect(bytes.$_get(0)).assertEqual(97);
          expect(bytes.$_get(9999)).assertEqual(97);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let result = te.encodeInto('中');
        expect(result.length).assertEqual(2);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('abc');
        expect(result.length).assertEqual(6);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let result = te.encodeInto('中');
        expect(result[0]).assertEqual(214);
        expect(result[1]).assertEqual(208);

      }
      {
        let te = util.TextEncoder.create('gb18030');
        let result = te.encodeInto('中');
        expect(result[0]).assertEqual(214);
        expect(result[1]).assertEqual(208);

      }
      {
        let te = util.TextEncoder.create('big5');
        let result = te.encodeInto('中');
        expect(result[0]).assertEqual(164);
        expect(result[1]).assertEqual(164);

      }
      {
        let te = util.TextEncoder.create('euc-jp');
        let result = te.encodeInto('あ');
        expect(result[0]).assertEqual(164);
        expect(result[1]).assertEqual(162);

      }
      {
        let te = util.TextEncoder.create('shift_jis');
        let result = te.encodeInto('あ');
        expect(result[0]).assertEqual(130);
        expect(result[1]).assertEqual(160);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('abc');
        expect(result[0]).assertEqual(97);
        expect(result[1]).assertEqual(0);
        expect(result[2]).assertEqual(98);
        expect(result[3]).assertEqual(0);
        expect(result[4]).assertEqual(99);
        expect(result[5]).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_0600
     * @tc.name testTeIntoEncoding003
     * @tc.desc Verify TextEncoder encodeInto with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoEncoding003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = util.TextEncoder.create('utf-16be');
        let result = te.encodeInto('abc');
        expect(result[0]).assertEqual(0);
        expect(result[1]).assertEqual(97);
        expect(result[2]).assertEqual(0);
        expect(result[3]).assertEqual(98);
        expect(result[4]).assertEqual(0);
        expect(result[5]).assertEqual(99);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('中');
        expect(result[0]).assertEqual(45);
        expect(result[1]).assertEqual(78);

      }
      {
        let te = util.TextEncoder.create('utf-16be');
        let result = te.encodeInto('中');
        expect(result[0]).assertEqual(78);
        expect(result[1]).assertEqual(45);

      }
      {
        let te = util.TextEncoder.create('euc-jp');
        let result = te.encodeInto('中');
        expect(result[0]).assertEqual(195);
        expect(result[1]).assertEqual(230);

      }
      {
        let te = util.TextEncoder.create('shift_jis');
        let result = te.encodeInto('中');
        expect(result[0]).assertEqual(146);
        expect(result[1]).assertEqual(134);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let result = te.encodeInto('a');
        expect(result[0]).assertEqual(97);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('😀');
        expect(result[0]).assertEqual(61);
        expect(result[1]).assertEqual(216);
        expect(result[2]).assertEqual(0);
        expect(result[3]).assertEqual(222);

      }
      {
        let te = util.TextEncoder.create('utf-16be');
        let result = te.encodeInto('😀');
        expect(result[0]).assertEqual(216);
        expect(result[1]).assertEqual(61);
        expect(result[2]).assertEqual(222);
        expect(result[3]).assertEqual(0);

      }
      {
        let te = util.TextEncoder.create('shift_jis');
        let result = te.encodeInto('ｱ');
        expect(result[0]).assertEqual(177);

      }
      {
        let te = util.TextEncoder.create('euc-jp');
        let result = te.encodeInto('ｱ');
        expect(result[0]).assertEqual(142);
        expect(result[1]).assertEqual(177);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_0700
     * @tc.name testTeIntoEncoding004
     * @tc.desc Verify TextEncoder encodeInto with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoEncoding004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('a');
        expect(result.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('x'.repeat(100));
        expect(result.length).assertEqual(100);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('x'.repeat(10000));
        expect(result.length).assertEqual(10000);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('ab');
        expect(result.length).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('abc');
        expect(result.length).assertEqual(result.byteLength);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('中');
        expect(result.length).assertEqual(2);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let result = te.encodeInto('b');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(2);
        expect(bytes.$_get(0)).assertEqual(98);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let result = te.encodeInto('日');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(2);
        expect(bytes.$_get(0)).assertEqual(200);
        expect(bytes.$_get(1)).assertEqual(213);

      }
      {
        let te = util.TextEncoder.create('big5');
        let result = te.encodeInto('Z');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(2);
        expect(bytes.$_get(0)).assertEqual(90);

      }
      {
        let te = util.TextEncoder.create('euc-jp');
        let result = te.encodeInto('b');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(3);
        expect(bytes.$_get(0)).assertEqual(98);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_0800
     * @tc.name testTeIntoEncoding005
     * @tc.desc Verify TextEncoder encodeInto with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoEncoding005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = util.TextEncoder.create('euc-jp');
        let result = te.encodeInto('日');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(3);
        expect(bytes.$_get(0)).assertEqual(198);
        expect(bytes.$_get(1)).assertEqual(252);

      }
      {
        let te = util.TextEncoder.create('shift_jis');
        let result = te.encodeInto('日');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(2);
        expect(bytes.$_get(0)).assertEqual(147);
        expect(bytes.$_get(1)).assertEqual(250);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('ab');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(97);
        expect(bytes.$_get(1)).assertEqual(0);
        expect(bytes.$_get(2)).assertEqual(98);
        expect(bytes.$_get(3)).assertEqual(0);

      }
      {
        let te = util.TextEncoder.create('utf-16be');
        let result = te.encodeInto('ab');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(0);
        expect(bytes.$_get(1)).assertEqual(97);
        expect(bytes.$_get(2)).assertEqual(0);
        expect(bytes.$_get(3)).assertEqual(98);

      }
      {
        let te = util.TextEncoder.create('gb18030');
        let result = te.encodeInto('日');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(200);
        expect(bytes.$_get(1)).assertEqual(213);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('文');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(2);
        expect(bytes.$_get(0)).assertEqual(135);
        expect(bytes.$_get(1)).assertEqual(101);

      }
      {
        let te = util.TextEncoder.create('big5');
        let result = te.encodeInto('文');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(2);
        expect(bytes.$_get(0)).assertEqual(164);
        expect(bytes.$_get(1)).assertEqual(229);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let result = te.encodeInto('あ');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(2);
        expect(bytes.$_get(0)).assertEqual(164);
        expect(bytes.$_get(1)).assertEqual(162);

      }
      {
        let te = util.TextEncoder.create('gb18030');
        let result = te.encodeInto('Z');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(90);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let result = te.encodeInto('');
        expect(result!.length).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_0900
     * @tc.name testTeIntoEncoding006
     * @tc.desc Verify TextEncoder encodeInto with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoEncoding006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('');
        expect(result!.length).assertEqual(0);

      }
      {
        let te = util.TextEncoder.create('big5');
        let result = te.encodeInto('');
        expect(result!.length).assertEqual(0);

      }
      {
        let te = util.TextEncoder.create('euc-jp');
        let result = te.encodeInto('');
        expect(result!.length).assertEqual(0);

      }
      {
        let te = util.TextEncoder.create('gb18030');
        let result = te.encodeInto('');
        expect(result!.length).assertEqual(0);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let result = te.encodeInto('中中');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(214);
        expect(bytes.$_get(1)).assertEqual(208);
        expect(bytes.$_get(2)).assertEqual(214);
        expect(bytes.$_get(3)).assertEqual(208);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('aa');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(97);
        expect(bytes.$_get(1)).assertEqual(0);
        expect(bytes.$_get(2)).assertEqual(97);
        expect(bytes.$_get(3)).assertEqual(0);

      }
      {
        let te = util.TextEncoder.create('utf-16be');
        let result = te.encodeInto('aa');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(0);
        expect(bytes.$_get(1)).assertEqual(97);
        expect(bytes.$_get(2)).assertEqual(0);
        expect(bytes.$_get(3)).assertEqual(97);

      }
      {
        let te = util.TextEncoder.create('big5');
        let result = te.encodeInto('文文');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(164);
        expect(bytes.$_get(1)).assertEqual(229);
        expect(bytes.$_get(2)).assertEqual(164);
        expect(bytes.$_get(3)).assertEqual(229);

      }
      {
        let te = util.TextEncoder.create('shift_jis');
        let result = te.encodeInto('ああ');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(130);
        expect(bytes.$_get(1)).assertEqual(160);
        expect(bytes.$_get(2)).assertEqual(130);
        expect(bytes.$_get(3)).assertEqual(160);

      }
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('😀😀');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(8);
        expect(bytes.$_get(0)).assertEqual(61);
        expect(bytes.$_get(1)).assertEqual(216);
        expect(bytes.$_get(2)).assertEqual(0);
        expect(bytes.$_get(3)).assertEqual(222);
        expect(bytes.$_get(4)).assertEqual(61);
        expect(bytes.$_get(5)).assertEqual(216);
        expect(bytes.$_get(6)).assertEqual(0);
        expect(bytes.$_get(7)).assertEqual(222);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1000
     * @tc.name testTeIntoEncoding007
     * @tc.desc Verify TextEncoder encodeInto with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoEncoding007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = util.TextEncoder.create('utf-16le');
        let result = te.encodeInto('中中');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(45);
        expect(bytes.$_get(1)).assertEqual(78);
        expect(bytes.$_get(2)).assertEqual(45);
        expect(bytes.$_get(3)).assertEqual(78);

      }
      {
        let te = util.TextEncoder.create('utf-16be');
        let result = te.encodeInto('中中');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(4);
        expect(bytes.$_get(0)).assertEqual(78);
        expect(bytes.$_get(1)).assertEqual(45);
        expect(bytes.$_get(2)).assertEqual(78);
        expect(bytes.$_get(3)).assertEqual(45);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1100
     * @tc.name testTeIntoUnicode001
     * @tc.desc Verify TextEncoder encodeInto with Unicode multilingual content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoUnicode001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('中');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(228);
          expect(bytes.$_get(1)).assertEqual(184);
          expect(bytes.$_get(2)).assertEqual(173);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('가');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(234);
          expect(bytes.$_get(1)).assertEqual(176);
          expect(bytes.$_get(2)).assertEqual(128);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('中');
        expect(result[0]).assertEqual(228);
        expect(result[1]).assertEqual(184);
        expect(result[2]).assertEqual(173);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('你');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(3);
        expect(bytes.$_get(0)).assertEqual(228);
        expect(bytes.$_get(1)).assertEqual(189);
        expect(bytes.$_get(2)).assertEqual(160);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1200
     * @tc.name testTeIntoEmoji001
     * @tc.desc Verify TextEncoder encodeInto with emoji and surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoEmoji001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('😀');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(4);
          expect(bytes.$_get(0)).assertEqual(240);
          expect(bytes.$_get(1)).assertEqual(159);
          expect(bytes.$_get(2)).assertEqual(152);
          expect(bytes.$_get(3)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\uD800');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(237);
          expect(bytes.$_get(1)).assertEqual(160);
          expect(bytes.$_get(2)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\uDC00');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(237);
          expect(bytes.$_get(1)).assertEqual(176);
          expect(bytes.$_get(2)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\uDC04');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(237);
          expect(bytes.$_get(1)).assertEqual(176);
          expect(bytes.$_get(2)).assertEqual(132);

      }
      {
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let result: Uint8Array | undefined = textEncoder.encodeInto('\uD800\u00A5\u00A5');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(7);
        expect(bytes.$_get(0)).assertEqual(237);
        expect(bytes.$_get(1)).assertEqual(160);
        expect(bytes.$_get(2)).assertEqual(128);
        expect(bytes.$_get(3)).assertEqual(194);
        expect(bytes.$_get(4)).assertEqual(165);
        expect(bytes.$_get(5)).assertEqual(194);
        expect(bytes.$_get(6)).assertEqual(165);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\u0000😀');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(5);
          expect(bytes.$_get(0)).assertEqual(0);
          expect(bytes.$_get(1)).assertEqual(240);
          expect(bytes.$_get(2)).assertEqual(159);
          expect(bytes.$_get(3)).assertEqual(152);
          expect(bytes.$_get(4)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('👨‍👩‍👧');
          let bytes: Uint8Array = result!;
          let expected: number[] = [240,159,145,168,226,128,141,240,159,145,169,226,128,141,240,159,145,167];
          expect(bytes.byteLength).assertEqual(expected.length);
          for (let j: int = 0; j < expected.length; j++) {
            expect(bytes.$_get(j)).assertEqual(expected[j]);
          }

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('😀');
        expect(result.length).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('😀');
        expect(result[0]).assertEqual(240);
        expect(result[1]).assertEqual(159);
        expect(result[2]).assertEqual(152);
        expect(result[3]).assertEqual(128);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('😀😀');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(8);
        expect(bytes.$_get(0)).assertEqual(240);
        expect(bytes.$_get(1)).assertEqual(159);
        expect(bytes.$_get(2)).assertEqual(152);
        expect(bytes.$_get(3)).assertEqual(128);
        expect(bytes.$_get(4)).assertEqual(240);
        expect(bytes.$_get(5)).assertEqual(159);
        expect(bytes.$_get(6)).assertEqual(152);
        expect(bytes.$_get(7)).assertEqual(128);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1300
     * @tc.name testTeIntoEmoji002
     * @tc.desc Verify TextEncoder encodeInto with emoji and surrogate pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoEmoji002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('퟿');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(3);
        expect(bytes.$_get(0)).assertEqual(237);
        expect(bytes.$_get(1)).assertEqual(159);
        expect(bytes.$_get(2)).assertEqual(191);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('\uDBFF');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(3);
        expect(bytes.$_get(0)).assertEqual(237);
        expect(bytes.$_get(1)).assertEqual(175);
        expect(bytes.$_get(2)).assertEqual(191);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('\uDFFF');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(3);
        expect(bytes.$_get(0)).assertEqual(237);
        expect(bytes.$_get(1)).assertEqual(191);
        expect(bytes.$_get(2)).assertEqual(191);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1400
     * @tc.name testTeIntoInvisible001
     * @tc.desc Verify TextEncoder encodeInto with invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoInvisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('́');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(204);
          expect(bytes.$_get(1)).assertEqual(129);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('�');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(239);
          expect(bytes.$_get(1)).assertEqual(191);
          expect(bytes.$_get(2)).assertEqual(189);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('￾');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(239);
          expect(bytes.$_get(1)).assertEqual(191);
          expect(bytes.$_get(2)).assertEqual(190);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('‍');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(226);
          expect(bytes.$_get(1)).assertEqual(128);
          expect(bytes.$_get(2)).assertEqual(141);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('　');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(227);
          expect(bytes.$_get(1)).assertEqual(128);
          expect(bytes.$_get(2)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('️');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(239);
          expect(bytes.$_get(1)).assertEqual(184);
          expect(bytes.$_get(2)).assertEqual(143);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1500
     * @tc.name testTeIntoControl001
     * @tc.desc Verify TextEncoder encodeInto with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoControl001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\u0000');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(0);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('	');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(9);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\r');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(13);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\f');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(12);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\u001F');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(31);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\r\n');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(13);
          expect(bytes.$_get(1)).assertEqual(10);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('a\u0000b');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(97);
          expect(bytes.$_get(1)).assertEqual(0);
          expect(bytes.$_get(2)).assertEqual(98);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('a\u0000');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(97);
          expect(bytes.$_get(1)).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('中\0A');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(5);
        expect(bytes.$_get(0)).assertEqual(228);
        expect(bytes.$_get(1)).assertEqual(184);
        expect(bytes.$_get(2)).assertEqual(173);
        expect(bytes.$_get(3)).assertEqual(0);
        expect(bytes.$_get(4)).assertEqual(65);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1600
     * @tc.name testTeIntoBoundary001
     * @tc.desc Verify TextEncoder encodeInto with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto();
          expect(result!.length).assertEqual(0);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('');
          expect(result!.length).assertEqual(0);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('​');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(226);
          expect(bytes.$_get(1)).assertEqual(128);
          expect(bytes.$_get(2)).assertEqual(139);

      }
      {
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let result: Uint8Array | undefined = textEncoder.encodeInto('ا');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(2);
        expect(bytes.$_get(0)).assertEqual(216);
        expect(bytes.$_get(1)).assertEqual(167);

      }
      {
        let textEncoder: util.TextEncoder = new util.TextEncoder();
        let result: Uint8Array | undefined = textEncoder.encodeInto('П');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(2);
        expect(bytes.$_get(0)).assertEqual(208);
        expect(bytes.$_get(1)).assertEqual(159);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('𐀀');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(4);
          expect(bytes.$_get(0)).assertEqual(240);
          expect(bytes.$_get(1)).assertEqual(144);
          expect(bytes.$_get(2)).assertEqual(128);
          expect(bytes.$_get(3)).assertEqual(128);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('');
        expect(result[0]).assertEqual(127);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('');
        expect(result[0]).assertEqual(194);
        expect(result[1]).assertEqual(128);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('߿');
        expect(result[0]).assertEqual(223);
        expect(result[1]).assertEqual(191);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('ࠀ');
        expect(result[0]).assertEqual(224);
        expect(result[1]).assertEqual(160);
        expect(result[2]).assertEqual(128);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1700
     * @tc.name testTeIntoBoundary002
     * @tc.desc Verify TextEncoder encodeInto with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let inputU: string | undefined = undefined;
        let result = te.encodeInto(inputU);
        expect(result!.length).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3e10: ESObject = ESValue.wrapNumber(9007199254740991);
          te.encodeInto(v3e10 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('');
        expect(result!.length).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto();
        expect(result!.length).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('');
        expect(result.length).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let r1 = te.encodeInto('');
        let r2 = te.encodeInto('bb');
        expect(r1!.length).assertEqual(0);
        let bytes2: Uint8Array = r2!;
        expect(bytes2.$_get(0)).assertEqual(98);
        expect(bytes2.$_get(1)).assertEqual(98);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1800
     * @tc.name testTeIntoConsistency001
     * @tc.desc Verify TextEncoder encodeInto state consistency and default values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let r1 = te.encodeInto('abc');
        let r2 = te.encodeInto('abc');
        expect(r1[0]).assertEqual(r2[0]);
        expect(r1[1]).assertEqual(r2[1]);
        expect(r1[2]).assertEqual(r2[2]);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('中中');
        let bytes: Uint8Array = result!;
        expect(bytes.byteLength).assertEqual(6);
        expect(bytes.$_get(0)).assertEqual(228);
        expect(bytes.$_get(1)).assertEqual(184);
        expect(bytes.$_get(2)).assertEqual(173);
        expect(bytes.$_get(3)).assertEqual(228);
        expect(bytes.$_get(4)).assertEqual(184);
        expect(bytes.$_get(5)).assertEqual(173);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_1900
     * @tc.name testTeIntoBasic001
     * @tc.desc Verify TextEncoder encodeInto with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\n');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(10);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto(' ');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(32);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('A');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(65);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('a');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(1);
          expect(bytes.$_get(0)).assertEqual(97);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\n\r');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(10);
          expect(bytes.$_get(1)).assertEqual(13);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('a\nb');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(97);
          expect(bytes.$_get(1)).assertEqual(10);
          expect(bytes.$_get(2)).assertEqual(98);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('16');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(49);
          expect(bytes.$_get(1)).assertEqual(54);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(194);
          expect(bytes.$_get(1)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(194);
          expect(bytes.$_get(1)).assertEqual(159);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('¥');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(194);
          expect(bytes.$_get(1)).assertEqual(165);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_2000
     * @tc.name testTeIntoBasic002
     * @tc.desc Verify TextEncoder encodeInto with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('é');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(195);
          expect(bytes.$_get(1)).assertEqual(169);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('߿');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(2);
          expect(bytes.$_get(0)).assertEqual(223);
          expect(bytes.$_get(1)).assertEqual(191);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('ࠀ');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(224);
          expect(bytes.$_get(1)).assertEqual(160);
          expect(bytes.$_get(2)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('你好');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(6);
          expect(bytes.$_get(0)).assertEqual(228);
          expect(bytes.$_get(1)).assertEqual(189);
          expect(bytes.$_get(2)).assertEqual(160);
          expect(bytes.$_get(3)).assertEqual(229);
          expect(bytes.$_get(4)).assertEqual(165);
          expect(bytes.$_get(5)).assertEqual(189);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('￿');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(239);
          expect(bytes.$_get(1)).assertEqual(191);
          expect(bytes.$_get(2)).assertEqual(191);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto(' ');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(226);
          expect(bytes.$_get(1)).assertEqual(128);
          expect(bytes.$_get(2)).assertEqual(168);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto(' ');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(226);
          expect(bytes.$_get(1)).assertEqual(128);
          expect(bytes.$_get(2)).assertEqual(169);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('あ');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(227);
          expect(bytes.$_get(1)).assertEqual(129);
          expect(bytes.$_get(2)).assertEqual(130);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(238);
          expect(bytes.$_get(1)).assertEqual(128);
          expect(bytes.$_get(2)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\uFEFF');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(239);
          expect(bytes.$_get(1)).assertEqual(187);
          expect(bytes.$_get(2)).assertEqual(191);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_2100
     * @tc.name testTeIntoBasic003
     * @tc.desc Verify TextEncoder encodeInto with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('􏿿');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(4);
          expect(bytes.$_get(0)).assertEqual(244);
          expect(bytes.$_get(1)).assertEqual(143);
          expect(bytes.$_get(2)).assertEqual(191);
          expect(bytes.$_get(3)).assertEqual(191);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('\uD800\uD800');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(6);
          expect(bytes.$_get(0)).assertEqual(239);
          expect(bytes.$_get(1)).assertEqual(191);
          expect(bytes.$_get(2)).assertEqual(189);
          expect(bytes.$_get(3)).assertEqual(237);
          expect(bytes.$_get(4)).assertEqual(160);
          expect(bytes.$_get(5)).assertEqual(128);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('a中b');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(5);
          expect(bytes.$_get(0)).assertEqual(97);
          expect(bytes.$_get(1)).assertEqual(228);
          expect(bytes.$_get(2)).assertEqual(184);
          expect(bytes.$_get(3)).assertEqual(173);
          expect(bytes.$_get(4)).assertEqual(98);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('Hello, 世界');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(13);
          expect(bytes.$_get(0)).assertEqual(72);
          expect(bytes.$_get(1)).assertEqual(101);
          expect(bytes.$_get(2)).assertEqual(108);
          expect(bytes.$_get(3)).assertEqual(108);
          expect(bytes.$_get(4)).assertEqual(111);
          expect(bytes.$_get(5)).assertEqual(44);
          expect(bytes.$_get(6)).assertEqual(32);
          expect(bytes.$_get(7)).assertEqual(228);
          expect(bytes.$_get(8)).assertEqual(184);
          expect(bytes.$_get(9)).assertEqual(150);
          expect(bytes.$_get(10)).assertEqual(231);
          expect(bytes.$_get(11)).assertEqual(149);
          expect(bytes.$_get(12)).assertEqual(140);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('é');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(3);
          expect(bytes.$_get(0)).assertEqual(101);
          expect(bytes.$_get(1)).assertEqual(204);
          expect(bytes.$_get(2)).assertEqual(129);

      }
      {
          let textEncoder: util.TextEncoder = new util.TextEncoder();
          let result: Uint8Array | undefined = textEncoder.encodeInto('߿ࠀ');
          let bytes: Uint8Array = result!;
          expect(bytes.byteLength).assertEqual(5);
          expect(bytes.$_get(0)).assertEqual(223);
          expect(bytes.$_get(1)).assertEqual(191);
          expect(bytes.$_get(2)).assertEqual(224);
          expect(bytes.$_get(3)).assertEqual(160);
          expect(bytes.$_get(4)).assertEqual(128);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('z');
        expect(result.length).assertEqual(1);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('abc');
        expect(result.length).assertEqual(3);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('hello');
        expect(result.length).assertEqual(5);

      }
      {
        let te = new util.TextEncoder();
        let result = te.encodeInto('abc');
        expect(result[0]).assertEqual(97);
        expect(result[1]).assertEqual(98);
        expect(result[2]).assertEqual(99);

      }
    });

  });
}
