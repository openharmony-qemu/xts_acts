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

class ProbeClass03 {
  tag: int = 1;
}

interface ProbeIface03 {
  tag: int;
}

function probeFn03(): int {
  return 0;
}

export default function TextEncoderEncodeIntoUint8ArrayTest(): void {
  describe('TextEncoderEncodeIntoUint8ArrayTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_0100
     * @tc.name testTeIntoU8Throws001
     * @tc.desc Verify TextEncoder encodeIntoUint8Array throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Throws001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let obj03: ProbeIface03 = { tag: 7 };
  let v: ESObject = ESValue.wrap(obj03);
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(probeFn03);
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3d1: ESObject = ESValue.Undefined;
          te.encodeIntoUint8Array('ab', v3d1 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3d2: ESObject = ESValue.Null;
          te.encodeIntoUint8Array('ab', v3d2 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3d3: ESObject = ESValue.wrapNumber(0);
          te.encodeIntoUint8Array('ab', v3d3 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3d4: ESObject = ESValue.wrapNumber(Number.NaN);
          te.encodeIntoUint8Array('ab', v3d4 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3d5: ESObject = ESValue.wrapBoolean(true);
          te.encodeIntoUint8Array('ab', v3d5 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3d6: ESObject = ESValue.wrapBoolean(false);
          te.encodeIntoUint8Array('ab', v3d6 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3d7: ESObject = ESValue.wrapString('abc');
          te.encodeIntoUint8Array('ab', v3d7 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let objD03: ProbeIface03 = { tag: 9 };
  let v: ESObject = ESValue.wrap(objD03);
        let te = new util.TextEncoder();
        try {
          te.encodeIntoUint8Array('ab', v as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_0200
     * @tc.name testTeIntoU8Throws002
     * @tc.desc Verify TextEncoder encodeIntoUint8Array throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Throws002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
  let v: ESObject = ESValue.wrap(new ProbeClass03());
        let te = new util.TextEncoder();
        try {
          te.encodeIntoUint8Array('ab', v as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let arr03: Array<number> = [1, 2, 3];
  let v: ESObject = ESValue.wrap(arr03);
        let te = new util.TextEncoder();
        try {
          te.encodeIntoUint8Array('ab', v as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new ArrayBuffer(4));
        let te = new util.TextEncoder();
        try {
          te.encodeIntoUint8Array('ab', v as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new Map<string, int>());
        let te = new util.TextEncoder();
        try {
          te.encodeIntoUint8Array('ab', v as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new Set<string>());
        let te = new util.TextEncoder();
        try {
          te.encodeIntoUint8Array('ab', v as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new Int8Array(4));
        let te = new util.TextEncoder();
        try {
          te.encodeIntoUint8Array('ab', v as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new Uint8ClampedArray(4));
        let te = new util.TextEncoder();
        try {
          te.encodeIntoUint8Array('ab', v as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let dv03: ArrayBuffer = new ArrayBuffer(4);
  let v: ESObject = ESValue.wrap(new DataView(dv03));
        let te = new util.TextEncoder();
        try {
          te.encodeIntoUint8Array('ab', v as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_0300
     * @tc.name testTeIntoU8Semantics001
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('ab', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(2);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('a', dest);
        expect(result.read).assertEqual(1);
        expect(dest[0]).assertEqual(97);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('abcd', dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(4);
        expect(dest[0]).assertEqual(97);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        textEncoder.encodeIntoUint8Array('\t', dest);
        expect(dest[0]).assertEqual(9);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        textEncoder.encodeIntoUint8Array('\n', dest);
        expect(dest[0]).assertEqual(10);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('é', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(2);
        expect(dest[0]).assertEqual(195);
        expect(dest[1]).assertEqual(169);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('😀', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);
        expect(dest[0]).assertEqual(240);
        expect(dest[1]).assertEqual(159);
        expect(dest[2]).assertEqual(152);
        expect(dest[3]).assertEqual(128);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('\ud83d', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[0]).assertEqual(237);
        expect(dest[1]).assertEqual(160);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = textEncoder.encodeIntoUint8Array('中abc', dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_0400
     * @tc.name testTeIntoU8Semantics002
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = textEncoder.encodeIntoUint8Array('中中', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(6);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        textEncoder.encodeIntoUint8Array('0123', dest);
        expect(dest[0]).assertEqual(48);
        expect(dest[1]).assertEqual(49);
        expect(dest[2]).assertEqual(50);
        expect(dest[3]).assertEqual(51);

      }
      {
        let textEncoder = new util.TextEncoder();
        let longInput: string = '';
        for (let i = 0; i < 200; i++) {
          longInput = longInput + 'a';
        }
        let dest: Uint8Array = new Uint8Array(200);
        let result = textEncoder.encodeIntoUint8Array(longInput, dest);
        expect(result.read).assertEqual(200);
        expect(result.written).assertEqual(200);

      }
      {
        let textEncoder = new util.TextEncoder();
        let longInput: string = '';
        for (let i = 0; i < 10000; i++) {
          longInput = longInput + 'a';
        }
        let dest: Uint8Array = new Uint8Array(10000);
        let result = textEncoder.encodeIntoUint8Array(longInput, dest);
        expect(result.read).assertEqual(10000);
        expect(result.written).assertEqual(10000);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = textEncoder.encodeIntoUint8Array('a😀b', dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(6);
        expect(dest[1]).assertEqual(240);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(11);
        let result = textEncoder.encodeIntoUint8Array('😀中😀', dest);
        expect(result.read).assertEqual(5);
        expect(result.written).assertEqual(11);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('aé', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(3);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('abcd', dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(4);
        expect(dest[3]).assertEqual(100);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(10);
        let result = textEncoder.encodeIntoUint8Array('ab', dest);
        expect(result.read).assertEqual(2);
        expect(dest[2]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        dest[0] = 255;
        dest[1] = 255;
        dest[2] = 255;
        dest[3] = 255;
        textEncoder.encodeIntoUint8Array('ab', dest);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(98);
        expect(dest[2]).assertEqual(255);
        expect(dest[3]).assertEqual(255);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_0500
     * @tc.name testTeIntoU8Semantics003
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(6);
        let dest: Uint8Array = new Uint8Array(buffer, 2, 4);
        let result = textEncoder.encodeIntoUint8Array('abcd', dest);
        expect(result.read).assertEqual(4);
        expect(dest[0]).assertEqual(97);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = textEncoder.encodeIntoUint8Array('a', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);
        expect(dest[0]).assertEqual(97);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let dest: Uint8Array = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('abcd', dest);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(98);
        expect(dest[2]).assertEqual(99);
        expect(dest[3]).assertEqual(100);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let dest: Uint8Array = new Uint8Array(buffer);
        let view2: Uint8Array = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('ab', dest);
        expect(view2[0]).assertEqual(97);
        expect(view2[1]).assertEqual(98);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(20);
        let result = textEncoder.encodeIntoUint8Array('hello world', dest);
        expect(result.read).assertEqual(11);
        expect(result.written).assertEqual(11);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        textEncoder.encodeIntoUint8Array('ab', dest);
        textEncoder.encodeIntoUint8Array('cd', dest);
        expect(dest[0]).assertEqual(99);
        expect(dest[1]).assertEqual(100);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array('😀a', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(5);
        expect(dest[0]).assertEqual(240);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('a中', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        textEncoder.encodeIntoUint8Array('中文', dest);
        expect(dest[3]).assertEqual(230);
        expect(dest[4]).assertEqual(150);
        expect(dest[5]).assertEqual(135);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(8);
        let result = textEncoder.encodeIntoUint8Array('abcdefgh', dest);
        expect(result.read).assertEqual(8);
        expect(result.written).assertEqual(8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_0600
     * @tc.name testTeIntoU8Semantics004
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array('é中', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(5);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(100);
        let result = textEncoder.encodeIntoUint8Array('ab', dest);
        expect(result.written).assertEqual(2);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(7);
        let result = textEncoder.encodeIntoUint8Array('中a中', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(7);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('abc', dest);
        expect(result.written).assertEqual(3);
        expect(dest[2]).assertEqual(99);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = textEncoder.encodeIntoUint8Array('\udc04\ud83d', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(6);
        expect(dest[0]).assertEqual(237);
        expect(dest[3]).assertEqual(237);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array('a\ud83db', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(5);
        expect(dest[1]).assertEqual(237);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('\u0000a', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(2);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('a\ud83d', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = textEncoder.encodeIntoUint8Array('abcd', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('abcd', dest);
        expect(result.read).assertEqual(3);
        expect(dest[2]).assertEqual(99);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_0700
     * @tc.name testTeIntoU8Semantics005
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('éé', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(2);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('éé', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(2);
        expect(dest[2]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('😀😀', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(7);
        let result = textEncoder.encodeIntoUint8Array('😀😀', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('中中', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array('你好', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[3]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = textEncoder.encodeIntoUint8Array('你好', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(6);
        expect(dest[0]).assertEqual(228);
        expect(dest[1]).assertEqual(189);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(7);
        let result = textEncoder.encodeIntoUint8Array('你好', dest);
        expect(result.read).assertEqual(2);
        expect(dest[6]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = textEncoder.encodeIntoUint8Array('aé', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);
        expect(dest[0]).assertEqual(97);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('中中', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[3]).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_0800
     * @tc.name testTeIntoU8Semantics006
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let bigInput: string = '';
        for (let i = 0; i < 1000; i++) {
          bigInput = bigInput + 'a';
        }
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array(bigInput, dest);
        expect(result.read).assertEqual(5);
        expect(result.written).assertEqual(5);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('abcd', dest);
        expect(result.read).assertEqual(2);
        expect(dest[1]).assertEqual(98);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('a中b', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('éé', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('aé', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);
        expect(dest[1]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(8);
        let result = textEncoder.encodeIntoUint8Array('中中中', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(6);
        expect(dest[6]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array('😀😀', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);
        expect(dest[4]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('abcd', dest);
        expect(result.written).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        te.encodeIntoUint8Array('abcd', dest);
        expect(dest[0]).assertEqual(97);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = te.encodeIntoUint8Array('中', dest);
        expect(result.read < result.written).assertTrue();
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_0900
     * @tc.name testTeIntoU8Semantics007
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('abc', dest);
        expect(result.read).assertEqual(result.written);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('abcd', dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('a', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('中', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('😀', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = te.encodeIntoUint8Array('a中b', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(5);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(100);
        let result = te.encodeIntoUint8Array('x'.repeat(100), dest);
        expect(result.read).assertEqual(100);
        expect(result.written).assertEqual(100);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(30);
        let result = te.encodeIntoUint8Array('中'.repeat(10), dest);
        expect(result.read).assertEqual(10);
        expect(result.written).assertEqual(30);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(11);
        let result = te.encodeIntoUint8Array('中a中a中', dest);
        expect(result.read).assertEqual(5);
        expect(result.written).assertEqual(11);

      }
      {
        let te = new util.TextEncoder('utf-16le');
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('ab', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1000
     * @tc.name testTeIntoU8Semantics008
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder('utf-16le');
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('中', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(2);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('中', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(2);

      }
      {
        let te = new util.TextEncoder('utf-16le');
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('😀', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);

      }
      {
        let te = new util.TextEncoder('utf-16be');
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('中', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(2);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('    ', dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = te.encodeIntoUint8Array('a\nb', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(3);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        te.encodeIntoUint8Array('abcd', dest);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(98);
        expect(dest[2]).assertEqual(99);
        expect(dest[3]).assertEqual(100);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        te.encodeIntoUint8Array('中', dest);
        expect(dest[0]).assertEqual(228);
        expect(dest[1]).assertEqual(184);
        expect(dest[2]).assertEqual(173);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        te.encodeIntoUint8Array('😀', dest);
        expect(dest[0]).assertEqual(240);
        expect(dest[1]).assertEqual(159);
        expect(dest[2]).assertEqual(152);
        expect(dest[3]).assertEqual(128);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        te.encodeIntoUint8Array('a中b', dest);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(228);
        expect(dest[2]).assertEqual(184);
        expect(dest[3]).assertEqual(173);
        expect(dest[4]).assertEqual(98);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1100
     * @tc.name testTeIntoU8Semantics009
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        te.encodeIntoUint8Array('\0', dest);
        expect(dest[0]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        te.encodeIntoUint8Array('012', dest);
        expect(dest[0]).assertEqual(48);
        expect(dest[1]).assertEqual(49);
        expect(dest[2]).assertEqual(50);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array([170, 170, 170, 170]);
        te.encodeIntoUint8Array('ab', dest);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(98);

      }
      {
        let te = new util.TextEncoder('utf-16le');
        let dest: Uint8Array = new Uint8Array(4);
        te.encodeIntoUint8Array('ab', dest);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(0);
        expect(dest[2]).assertEqual(98);
        expect(dest[3]).assertEqual(0);

      }
      {
        let te = util.TextEncoder.create('gbk');
        let dest: Uint8Array = new Uint8Array(2);
        te.encodeIntoUint8Array('中', dest);
        expect(dest[0]).assertEqual(214);
        expect(dest[1]).assertEqual(208);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        te.encodeIntoUint8Array('你好', dest);
        expect(dest[0]).assertEqual(228);
        expect(dest[1]).assertEqual(189);
        expect(dest[2]).assertEqual(160);
        expect(dest[3]).assertEqual(229);
        expect(dest[4]).assertEqual(165);
        expect(dest[5]).assertEqual(189);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array([170, 170, 170, 170, 170, 170]);
        te.encodeIntoUint8Array('ab', dest);
        expect(dest[2]).assertEqual(170);
        expect(dest[3]).assertEqual(170);
        expect(dest[4]).assertEqual(170);
        expect(dest[5]).assertEqual(170);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let before = dest.length;
        te.encodeIntoUint8Array('中', dest);
        expect(dest.length).assertEqual(before);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        te.encodeIntoUint8Array('a中b', dest);
        expect(dest.length).assertEqual(dest.byteLength);

      }
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(6);
        let dest: Uint8Array = new Uint8Array(buf);
        let before = dest.buffer.byteLength;
        te.encodeIntoUint8Array('中a', dest);
        expect(dest.buffer.byteLength).assertEqual(before);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1200
     * @tc.name testTeIntoU8Semantics010
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(64);
        te.encodeIntoUint8Array('abcd', dest);
        expect(dest.length).assertEqual(64);

      }
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(8);
        let dest: Uint8Array = new Uint8Array(buf, 2, 4);
        te.encodeIntoUint8Array('abcd', dest);
        expect(dest.length).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let r1 = te.encodeIntoUint8Array('ab', dest);
        let r2 = te.encodeIntoUint8Array('ab', dest);
        expect(r1.read).assertEqual(r2.read);
        expect(r1.written).assertEqual(r2.written);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let r1 = te.encodeIntoUint8Array('ab', dest);
        let r2 = te.encodeIntoUint8Array('ab', dest);
        expect(r1).not().assertEqual(r2);

      }
      {
        let te = new util.TextEncoder();
        let dest1: Uint8Array = new Uint8Array(3);
        te.encodeIntoUint8Array('中', dest1);
        let dest2: Uint8Array = new Uint8Array(1);
        let result = te.encodeIntoUint8Array('a', dest2);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = te.encodeIntoUint8Array('ab', dest);
        dest[0] = 65;
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(2);

      }
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(4);
        let dest: Uint8Array = new Uint8Array(buf);
        te.encodeIntoUint8Array('abcd', dest);
        expect(dest.buffer).assertEqual(buf);

      }
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(4);
        let dest: Uint8Array = new Uint8Array(buf);
        te.encodeIntoUint8Array('abcd', dest);
        let check: Uint8Array = new Uint8Array(buf);
        expect(check[0]).assertEqual(97);
        expect(check[1]).assertEqual(98);
        expect(check[2]).assertEqual(99);
        expect(check[3]).assertEqual(100);

      }
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(6);
        let dest: Uint8Array = new Uint8Array(buf);
        let view = dest.subarray(0, 3);
        te.encodeIntoUint8Array('abc', view);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(98);
        expect(dest[2]).assertEqual(99);
        expect(dest[3]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(4);
        let dest: Uint8Array = new Uint8Array(buf);
        let view = dest.subarray(0, 2);
        te.encodeIntoUint8Array('中', dest);
        expect(view[0]).assertEqual(228);
        expect(view[1]).assertEqual(184);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1300
     * @tc.name testTeIntoU8Semantics011
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(8);
        let dest: Uint8Array = new Uint8Array(buf, 2, 4);
        te.encodeIntoUint8Array('abcd', dest);
        let check: Uint8Array = new Uint8Array(buf);
        expect(check[0]).assertEqual(0);
        expect(check[1]).assertEqual(0);
        expect(check[2]).assertEqual(97);
        expect(check[3]).assertEqual(98);
        expect(check[4]).assertEqual(99);
        expect(check[5]).assertEqual(100);
        expect(check[6]).assertEqual(0);
        expect(check[7]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(4);
        let dest: Uint8Array = new Uint8Array(buf);
        let dest2: Uint8Array = new Uint8Array(buf);
        te.encodeIntoUint8Array('ab', dest);
        expect(dest2[0]).assertEqual(97);
        expect(dest2[1]).assertEqual(98);

      }
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(8);
        let dest: Uint8Array = new Uint8Array(buf, 2, 4);
        te.encodeIntoUint8Array('abcd', dest);
        expect(dest.byteOffset).assertEqual(2);

      }
      {
        let te = new util.TextEncoder();
        let buf = new ArrayBuffer(8);
        let dest: Uint8Array = new Uint8Array(buf);
        let view = dest.subarray(3, 7);
        te.encodeIntoUint8Array('abcd', view);
        expect(view.byteOffset).assertEqual(3);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = te.encodeIntoUint8Array('ab', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = te.encodeIntoUint8Array('中', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = te.encodeIntoUint8Array('中', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = te.encodeIntoUint8Array('😀', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = te.encodeIntoUint8Array('中b', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = te.encodeIntoUint8Array('abcd', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1400
     * @tc.name testTeIntoU8Semantics012
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = te.encodeIntoUint8Array('a中😀', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(8);
        let result = te.encodeIntoUint8Array('a中😀', dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(8);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = te.encodeIntoUint8Array('abc', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(3);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(100);
        let result = te.encodeIntoUint8Array('x'.repeat(10000), dest);
        expect(result.read).assertEqual(100);
        expect(result.written).assertEqual(100);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array([170, 170, 170, 170]);
        let result = te.encodeIntoUint8Array('abc', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(3);
        expect(dest[3]).assertEqual(170);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        te.encodeIntoUint8Array('abcd', dest);
        expect(dest.length).assertEqual(2);

      }
      {
        let te = new util.TextEncoder();
        let dest1: Uint8Array = new Uint8Array(3);
        let r1 = te.encodeIntoUint8Array('中b', dest1);
        expect(r1.read).assertEqual(1);
        let dest2: Uint8Array = new Uint8Array(4);
        let r2 = te.encodeIntoUint8Array('中b', dest2);
        expect(r2.read).assertEqual(2);
        expect(r2.written).assertEqual(4);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u1: ESObject = ESValue.Undefined;
          te.encodeIntoUint8Array(v3u1 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u2: ESObject = ESValue.Null;
          te.encodeIntoUint8Array(v3u2 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u3: ESObject = ESValue.wrapNumber(0);
          te.encodeIntoUint8Array(v3u3 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1500
     * @tc.name testTeIntoU8Semantics013
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u4: ESObject = ESValue.wrapNumber(-1);
          te.encodeIntoUint8Array(v3u4 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u5: ESObject = ESValue.wrapNumber(Number.NaN);
          te.encodeIntoUint8Array(v3u5 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u6: ESObject = ESValue.wrapNumber(Number.POSITIVE_INFINITY);
          te.encodeIntoUint8Array(v3u6 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u7: ESObject = ESValue.wrapNumber(-Number.POSITIVE_INFINITY);
          te.encodeIntoUint8Array(v3u7 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u8: ESObject = ESValue.wrapBoolean(true);
          te.encodeIntoUint8Array(v3u8 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u9: ESObject = ESValue.wrapBoolean(false);
          te.encodeIntoUint8Array(v3u9 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u10: ESObject = ESValue.wrapNumber(3.14);
          te.encodeIntoUint8Array(v3u10 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u11: ESObject = ESValue.wrapNumber(Double.MAX_VALUE);
          te.encodeIntoUint8Array(v3u11 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u12: ESObject = ESValue.wrapNumber(Double.MIN_VALUE);
          te.encodeIntoUint8Array(v3u12 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          let v3u13: ESObject = ESValue.wrapBigInt(BigInt(7));
          te.encodeIntoUint8Array(v3u13 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1600
     * @tc.name testTeIntoU8Semantics014
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
  let v: ESObject = ESValue.wrap(new ProbeClass03());
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new Date());
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new Map<string, int>());
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new Set<string>());
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new RegExp('a', 'g'));
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new Uint8Array([97, 98]));
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
  let v: ESObject = ESValue.wrap(new Int8Array([1, 2]));
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let ab03: ArrayBuffer = new ArrayBuffer(4);
  let v: ESObject = ESValue.wrap(new DataView(ab03));
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(16);
        try {
          te.encodeIntoUint8Array(v as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let wrappedDest: ESObject = ESValue.wrapBigInt(BigInt(7));
          te.encodeIntoUint8Array('ab', wrappedDest as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3c3: ESObject = ESValue.Null;
          te.encodeIntoUint8Array('', v3c3 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1700
     * @tc.name testTeIntoU8Semantics015
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        try {
          let v3c4: ESObject = ESValue.Null;
          let v3c5: ESObject = ESValue.Null;
          te.encodeIntoUint8Array(v3c4 as string, v3c5 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        dest[0] = 0;
        dest[1] = 0;
        dest[2] = 0;
        dest[3] = 0;
        te.encodeIntoUint8Array('a', dest);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let r = te.encodeIntoUint8Array('aaaaa', dest);
        expect(r.read).assertEqual(5);
        expect(r.written).assertEqual(5);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(10);
        let r = te.encodeIntoUint8Array('ééééé', dest);
        expect(r.read).assertEqual(5);
        expect(r.written).assertEqual(10);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(256);
        for (let i = 0; i < 256; i++) {
          dest[i] = 255;
        }
        te.encodeIntoUint8Array('中', dest);
        expect(dest[0]).assertEqual(228);
        expect(dest[1]).assertEqual(184);
        expect(dest[2]).assertEqual(173);
        expect(dest[3]).assertEqual(255);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let r = te.encodeIntoUint8Array('\udc04ab', dest);
        expect(r.read).assertEqual(0);
        expect(r.written).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let r = te.encodeIntoUint8Array('\udc04a', dest);
        expect(r.read).assertEqual(1);
        expect(r.written).assertEqual(3);
        expect(dest[0]).assertEqual(237);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let r = te.encodeIntoUint8Array('\udc04a', dest);
        expect(r.read).assertEqual(2);
        expect(r.written).assertEqual(4);
        expect(dest[3]).assertEqual(97);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let r = te.encodeIntoUint8Array('\udc04\udc04b', dest);
        expect(r.read).assertEqual(1);
        expect(r.written).assertEqual(3);
        expect(dest[3]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let r = te.encodeIntoUint8Array('😀a', dest);
        expect(r.read).assertEqual(0);
        expect(r.written).assertEqual(0);
        expect(dest[0]).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1800
     * @tc.name testTeIntoU8Semantics016
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let r = te.encodeIntoUint8Array('a😀b', dest);
        expect(r.read).assertEqual(4);
        expect(r.written).assertEqual(6);
        expect(dest[5]).assertEqual(98);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let r = te.encodeIntoUint8Array('abcde', dest);
        expect(r.read).assertEqual(4);
        expect(r.written).assertEqual(4);
        expect(dest[3]).assertEqual(100);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        try {
          let v3s1: ESObject = ESValue.Null;
          te.encodeIntoUint8Array(v3s1 as string, dest);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
        let r2 = te.encodeIntoUint8Array('ab', dest);
        expect(r2.read).assertEqual(2);
        expect(r2.written).assertEqual(2);

      }
      {
        let te = new util.TextEncoder();
        try {
          let v3s2: ESObject = ESValue.Null;
          te.encodeIntoUint8Array('ab', v3s2 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }
        let dest: Uint8Array = new Uint8Array(4);
        let r2 = te.encodeIntoUint8Array('ab', dest);
        expect(r2.read).assertEqual(2);
        expect(r2.written).assertEqual(2);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let r = te.encodeIntoUint8Array('a😀', dest);
        expect(r.read).assertEqual(1);
        expect(r.written).assertEqual(1);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let r = te.encodeIntoUint8Array('a中', dest);
        expect(r.read).assertEqual(1);
        expect(r.written).assertEqual(1);
        expect(dest[1]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let r = te.encodeIntoUint8Array('a中', dest);
        expect(r.read).assertEqual(2);
        expect(r.written).assertEqual(4);
        expect(dest[3]).assertEqual(173);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let r = te.encodeIntoUint8Array('a😀', dest);
        expect(r.read).assertEqual(3);
        expect(r.written).assertEqual(5);
        expect(dest[4]).assertEqual(128);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let r = te.encodeIntoUint8Array('a😀中', dest);
        expect(r.read).assertEqual(3);
        expect(r.written).assertEqual(5);
        expect(dest[5]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let r = te.encodeIntoUint8Array('', dest);
        expect(r.read).assertEqual(1);
        expect(r.written).assertEqual(2);
        expect(dest[0]).assertEqual(194);
        expect(dest[1]).assertEqual(128);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_1900
     * @tc.name testTeIntoU8Semantics017
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let r = te.encodeIntoUint8Array('😀', dest);
        expect(r.read).assertEqual(2);
        expect(r.written).assertEqual(4);
        expect(dest[0]).assertEqual(240);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let r = te.encodeIntoUint8Array('中', dest);
        expect(r.read).assertEqual(1);
        expect(r.written).assertEqual(3);
        expect(dest[0]).assertEqual(228);

      }
      {
        let te = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(6);
        let dest: Uint8Array = new Uint8Array(buffer, 2, 3);
        let r = te.encodeIntoUint8Array('abcd', dest);
        expect(r.read).assertEqual(3);
        expect(r.written).assertEqual(3);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(98);
        expect(dest[2]).assertEqual(99);

      }
      {
        let te = new util.TextEncoder();
        let big: string = '';
        for (let i = 0; i < 1000; i++) {
          big = big + '中';
        }
        let dest: Uint8Array = new Uint8Array(100000);
        let r = te.encodeIntoUint8Array(big, dest);
        expect(r.read).assertEqual(1000);
        expect(r.written).assertEqual(3000);
        expect(dest[0]).assertEqual(228);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let r = te.encodeIntoUint8Array('é中', dest);
        expect(r.read).assertEqual(2);
        expect(r.written).assertEqual(5);
        expect(dest[5]).assertEqual(0);

      }
      {
        let te = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let r = te.encodeIntoUint8Array('中😀', dest);
        expect(r.read).assertEqual(1);
        expect(r.written).assertEqual(3);
        expect(dest[0]).assertEqual(228);
        expect(dest[2]).assertEqual(173);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('xyz', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(3);
        expect(dest[0]).assertEqual(120);

      }
      {
        let textEncoder = new util.TextEncoder();
        let destA: Uint8Array = new Uint8Array(4);
        let destB: Uint8Array = new Uint8Array(4);
        textEncoder.encodeIntoUint8Array('中a', destA);
        textEncoder.encodeIntoUint8Array('中a', destB);
        expect(destA[0]).assertEqual(destB[0]);
        expect(destA[1]).assertEqual(destB[1]);
        expect(destA[3]).assertEqual(destB[3]);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(7);
        let result = textEncoder.encodeIntoUint8Array('😀中', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(7);
        expect(dest[0]).assertEqual(240);
        expect(dest[3]).assertEqual(128);
        expect(dest[6]).assertEqual(173);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        textEncoder.encodeIntoUint8Array('987', dest);
        expect(dest[0]).assertEqual(57);
        expect(dest[1]).assertEqual(56);
        expect(dest[2]).assertEqual(55);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2000
     * @tc.name testTeIntoU8Semantics018
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        textEncoder.encodeIntoUint8Array('AbC', dest);
        expect(dest[0]).assertEqual(65);
        expect(dest[1]).assertEqual(98);
        expect(dest[2]).assertEqual(67);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let before: number = dest.byteLength;
        textEncoder.encodeIntoUint8Array('中', dest);
        expect(dest.byteLength).assertEqual(before);
        expect(before).assertEqual(6);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        dest[0] = 127;
        dest[1] = 127;
        dest[2] = 127;
        dest[3] = 127;
        textEncoder.encodeIntoUint8Array('ab', dest);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(98);
        expect(dest[2]).assertEqual(127);
        expect(dest[3]).assertEqual(127);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        dest[0] = 170;
        dest[1] = 170;
        dest[2] = 170;
        dest[3] = 170;
        textEncoder.encodeIntoUint8Array('中中', dest);
        expect(dest[0]).assertEqual(228);
        expect(dest[1]).assertEqual(184);
        expect(dest[2]).assertEqual(173);
        expect(dest[3]).assertEqual(170);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        textEncoder.encodeIntoUint8Array('ab', dest);
        expect(dest[0]).assertEqual(97);
        textEncoder.encodeIntoUint8Array('cd', dest);
        expect(dest[0]).assertEqual(99);
        textEncoder.encodeIntoUint8Array('ef', dest);
        expect(dest[0]).assertEqual(101);
        expect(dest[1]).assertEqual(102);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(8);
        let result = textEncoder.encodeIntoUint8Array('abc', dest);
        expect(result.read).assertEqual(3);
        expect(dest[3]).assertEqual(0);
        expect(dest[7]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(6);
        let dest: Uint8Array = new Uint8Array(buffer, 4, 2);
        textEncoder.encodeIntoUint8Array('ab', dest);
        let parent: Uint8Array = new Uint8Array(buffer);
        expect(parent[4]).assertEqual(97);
        expect(parent[5]).assertEqual(98);
        expect(parent[0]).assertEqual(0);
        expect(parent[3]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(5);
        let dest: Uint8Array = new Uint8Array(buffer, 1, 3);
        textEncoder.encodeIntoUint8Array('éa', dest);
        expect(dest[0]).assertEqual(195);
        expect(dest[1]).assertEqual(169);
        expect(dest[2]).assertEqual(97);

      }
      {
        let textEncoder = new util.TextEncoder();
        let destA: Uint8Array = new Uint8Array(4);
        let destB: Uint8Array = new Uint8Array(4);
        let r1 = textEncoder.encodeIntoUint8Array('abc', destA);
        let r2 = textEncoder.encodeIntoUint8Array('def', destB);
        expect(r1.read).assertEqual(3);
        expect(r1.written).assertEqual(3);
        expect(r2.read).assertEqual(3);
        expect(r2.written).assertEqual(3);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array('中é', dest);
        expect(result.written).assertEqual(5);
        expect(dest[4]).assertEqual(169);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2100
     * @tc.name testTeIntoU8Semantics019
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array('é中', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(5);
        expect(dest[2]).assertEqual(228);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('😀中', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        dest[0] = 66;
        dest[1] = 66;
        let result = textEncoder.encodeIntoUint8Array('', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);
        expect(dest[0]).assertEqual(66);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(7);
        let result = textEncoder.encodeIntoUint8Array('中😀', dest);
        expect(result.written).assertEqual(7);
        expect(result.read).assertEqual(3);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('好', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);
        expect(dest[0]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = textEncoder.encodeIntoUint8Array('\udc04', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('a\ud83d', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);
        expect(dest[0]).assertEqual(97);
        expect(dest[1]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('a\0b', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(3);
        expect(dest[1]).assertEqual(0);
        expect(dest[2]).assertEqual(98);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = textEncoder.encodeIntoUint8Array('\udc04\udc04', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(6);
        expect(dest[0]).assertEqual(237);
        expect(dest[3]).assertEqual(237);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('abcde', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(3);
        expect(dest[2]).assertEqual(99);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2200
     * @tc.name testTeIntoU8Semantics020
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = textEncoder.encodeIntoUint8Array('中', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);
        expect(dest[0]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = textEncoder.encodeIntoUint8Array('é', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('é', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(2);
        expect(dest[0]).assertEqual(195);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('😀', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array('中é', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(5);
        expect(dest[4]).assertEqual(169);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('中é', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[3]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = textEncoder.encodeIntoUint8Array('中é', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(5);
        expect(dest[5]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('中a', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('中a', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[2]).assertEqual(173);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('中a', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);
        expect(dest[3]).assertEqual(97);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2300
     * @tc.name testTeIntoU8Semantics021
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(4);
        let result = textEncoder.encodeIntoUint8Array('😀中', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);
        expect(dest[3]).assertEqual(128);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(6);
        let result = textEncoder.encodeIntoUint8Array('😀中', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(4);
        expect(dest[4]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(7);
        let result = textEncoder.encodeIntoUint8Array('😀中', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(7);
        expect(dest[6]).assertEqual(173);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(8);
        let result = textEncoder.encodeIntoUint8Array('😀中', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(7);
        expect(dest[7]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array('中😀', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[3]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(7);
        let result = textEncoder.encodeIntoUint8Array('中😀', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(7);
        expect(dest[3]).assertEqual(240);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = textEncoder.encodeIntoUint8Array('éa', dest);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('éa', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(2);
        expect(dest[1]).assertEqual(169);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('éa', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(3);
        expect(dest[2]).assertEqual(97);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = textEncoder.encodeIntoUint8Array('ab', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);
        expect(dest[0]).assertEqual(97);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2400
     * @tc.name testTeIntoU8Semantics022
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('aéé', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(1);
        expect(dest[1]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('aéé', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(3);
        expect(dest[2]).assertEqual(169);

      }
      {
        let textEncoder = new util.TextEncoder();
        let longInput: string = '';
        for (let i = 0; i < 30; i++) {
          longInput = longInput + '中';
        }
        let dest: Uint8Array = new Uint8Array(5);
        let result = textEncoder.encodeIntoUint8Array(longInput, dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[3]).assertEqual(0);
        expect(dest[4]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let longInput: string = '';
        for (let i = 0; i < 20; i++) {
          longInput = longInput + '😀';
        }
        let dest: Uint8Array = new Uint8Array(8);
        let result = textEncoder.encodeIntoUint8Array(longInput, dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(8);
        expect(dest[4]).assertEqual(240);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('abc', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(3);
        expect(dest[2]).assertEqual(99);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('é', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(2);
        expect(dest[2]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(9);
        let result = textEncoder.encodeIntoUint8Array('中😀é', dest);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(9);
        expect(dest[8]).assertEqual(169);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(8);
        let result = textEncoder.encodeIntoUint8Array('中😀é', dest);
        expect(result.read).assertEqual(3);
        expect(result.written).assertEqual(7);
        expect(dest[7]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(6);
        let dest: Uint8Array = new Uint8Array(buffer, 2, 4);
        textEncoder.encodeIntoUint8Array('ab', dest);
        let parent: Uint8Array = new Uint8Array(buffer);
        expect(parent[2]).assertEqual(97);
        expect(parent[3]).assertEqual(98);
        expect(parent[0]).assertEqual(0);
        expect(parent[1]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let view1: Uint8Array = new Uint8Array(buffer, 0, 4);
        textEncoder.encodeIntoUint8Array('abcd', view1);
        let view2: Uint8Array = new Uint8Array(buffer, 0, 4);
        expect(view2[0]).assertEqual(97);
        expect(view2[3]).assertEqual(100);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2500
     * @tc.name testTeIntoU8Semantics023
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(6);
        let dest: Uint8Array = new Uint8Array(buffer, 2, 2);
        let result = textEncoder.encodeIntoUint8Array('abcd', dest);
        expect(result.read).assertEqual(2);
        expect(result.written).assertEqual(2);
        let parent: Uint8Array = new Uint8Array(buffer);
        expect(parent[4]).assertEqual(0);
        expect(parent[5]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let dest: Uint8Array = new Uint8Array(buffer, 2, 4);
        textEncoder.encodeIntoUint8Array('abcd', dest);
        let parent: Uint8Array = new Uint8Array(buffer);
        expect(parent[2]).assertEqual(97);
        expect(parent[5]).assertEqual(100);
        expect(parent[0]).assertEqual(0);
        expect(parent[1]).assertEqual(0);
        expect(parent[6]).assertEqual(0);
        expect(parent[7]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let viewA: Uint8Array = new Uint8Array(buffer, 0, 2);
        let viewB: Uint8Array = new Uint8Array(buffer, 2, 2);
        textEncoder.encodeIntoUint8Array('ab', viewA);
        textEncoder.encodeIntoUint8Array('cd', viewB);
        let parent: Uint8Array = new Uint8Array(buffer);
        expect(parent[0]).assertEqual(97);
        expect(parent[1]).assertEqual(98);
        expect(parent[2]).assertEqual(99);
        expect(parent[3]).assertEqual(100);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(5);
        let dest: Uint8Array = new Uint8Array(buffer, 1, 3);
        textEncoder.encodeIntoUint8Array('abc', dest);
        let dv: DataView = new DataView(buffer);
        expect(dv.getUint8(1)).assertEqual(97);
        expect(dv.getUint8(2)).assertEqual(98);
        expect(dv.getUint8(3)).assertEqual(99);
        expect(dv.getUint8(0)).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let dest: Uint8Array = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('ab', dest);
        let reader: Uint8Array = new Uint8Array(buffer);
        let total: number = 0;
        for (let i = 0; i < 2; i++) {
          total = total + reader[i];
        }
        expect(total).assertEqual(195);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(6);
        let child: Uint8Array = new Uint8Array(buffer, 2, 2);
        let result = textEncoder.encodeIntoUint8Array('中', child);
        expect(result.read).assertEqual(0);
        expect(result.written).assertEqual(0);
        let parent: Uint8Array = new Uint8Array(buffer);
        expect(parent[2]).assertEqual(0);
        expect(parent[3]).assertEqual(0);

      }
      {
        let textEncoder = new util.TextEncoder();
        let textDecoder = new util.TextDecoder();
        let destA: Uint8Array = new Uint8Array(9);
        textEncoder.encodeIntoUint8Array('中😀é', destA);
        let roundTrip: string = textDecoder.decodeToString(destA);
        let destB: Uint8Array = new Uint8Array(9);
        let result = textEncoder.encodeIntoUint8Array(roundTrip, destB);
        expect(result.read).assertEqual(4);
        expect(result.written).assertEqual(9);
        expect(destB[0]).assertEqual(destA[0]);
        expect(destB[8]).assertEqual(destA[8]);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(8);
        let accumulated: number = 0;
        let r1 = textEncoder.encodeIntoUint8Array('中', dest);
        accumulated = accumulated + r1.written;
        let r2 = textEncoder.encodeIntoUint8Array('é', dest);
        accumulated = accumulated + r2.written;
        expect(accumulated).assertEqual(5);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        textEncoder.encodeIntoUint8Array('a', dest);
        expect(dest[0]).assertEqual(97);
        textEncoder.encodeIntoUint8Array('b', dest);
        expect(dest[0]).assertEqual(98);
        textEncoder.encodeIntoUint8Array('c', dest);
        expect(dest[0]).assertEqual(99);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(5);
        let dest: Uint8Array = new Uint8Array(buffer, 0, 3);
        let result = textEncoder.encodeIntoUint8Array('中a', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        let parent: Uint8Array = new Uint8Array(buffer);
        expect(parent[3]).assertEqual(0);
        expect(parent[4]).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2600
     * @tc.name testTeIntoU8Semantics024
     * @tc.desc Verify TextEncoder encodeIntoUint8Array read and written result reporting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Semantics024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(8);
        let dest: Uint8Array = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('aé', dest);
        let reader: Uint8Array = new Uint8Array(buffer, 0, 3);
        expect(reader[0]).assertEqual(97);
        expect(reader[1]).assertEqual(195);
        expect(reader[2]).assertEqual(169);

      }
      {
        let textEncoder = new util.TextEncoder();
        let destA: Uint8Array = new Uint8Array(4);
        let destB: Uint8Array = new Uint8Array(4);
        textEncoder.encodeIntoUint8Array('中a', destA);
        expect(destA[0]).assertEqual(228);
        expect(destA[1]).assertEqual(184);
        expect(destB[0]).assertEqual(0);
        expect(destB[1]).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2700
     * @tc.name testTeIntoU8Encoding001
     * @tc.desc Verify TextEncoder encodeIntoUint8Array with various encoding labels
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Encoding001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(8);
        let result = textEncoder.encodeIntoUint8Array('a b c', dest);
        expect(result.read).assertEqual(5);
        expect(result.written).assertEqual(5);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        textEncoder.encodeIntoUint8Array('', dest);
        expect(dest[0]).assertEqual(127);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        textEncoder.encodeIntoUint8Array('ABC', dest);
        expect(dest[0]).assertEqual(65);
        expect(dest[1]).assertEqual(66);
        expect(dest[2]).assertEqual(67);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('中', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[0]).assertEqual(228);
        expect(dest[1]).assertEqual(184);
        expect(dest[2]).assertEqual(173);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2800
     * @tc.name testTeIntoU8Invisible001
     * @tc.desc Verify TextEncoder encodeIntoUint8Array with invisible characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Invisible001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('\udc04', dest);
        expect(result.read).assertEqual(1);
        expect(dest[0]).assertEqual(237);
        expect(dest[1]).assertEqual(176);
        expect(dest[2]).assertEqual(132);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_2900
     * @tc.name testTeIntoU8Control001
     * @tc.desc Verify TextEncoder encodeIntoUint8Array with control characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Control001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        textEncoder.encodeIntoUint8Array('\r\n', dest);
        expect(dest[0]).assertEqual(13);
        expect(dest[1]).assertEqual(10);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(1);
        let result = textEncoder.encodeIntoUint8Array('\u0000', dest);
        expect(result.read).assertEqual(1);
        expect(dest[0]).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_3000
     * @tc.name testTeIntoU8Basic001
     * @tc.desc Verify TextEncoder encodeIntoUint8Array with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Basic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array(' ', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(2);
        expect(dest[0]).assertEqual(194);
        expect(dest[1]).assertEqual(160);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(2);
        let result = textEncoder.encodeIntoUint8Array('߿', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(2);
        expect(dest[0]).assertEqual(223);
        expect(dest[1]).assertEqual(191);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('ࠀ', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[0]).assertEqual(224);
        expect(dest[1]).assertEqual(160);
        expect(dest[2]).assertEqual(128);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('￿', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[0]).assertEqual(239);
        expect(dest[1]).assertEqual(191);
        expect(dest[2]).assertEqual(191);

      }
      {
        let textEncoder = new util.TextEncoder();
        let dest: Uint8Array = new Uint8Array(3);
        let result = textEncoder.encodeIntoUint8Array('\uFEFF', dest);
        expect(result.read).assertEqual(1);
        expect(result.written).assertEqual(3);
        expect(dest[0]).assertEqual(239);
        expect(dest[1]).assertEqual(187);
        expect(dest[2]).assertEqual(191);

      }
      {
        let te = new util.TextEncoder();
        let s = 'abc';
        let dest: Uint8Array = new Uint8Array(4);
        te.encodeIntoUint8Array(s, dest);
        expect(s).assertEqual('abc');

      }
      {
        let textEncoder = new util.TextEncoder();
        let input: string = '中a';
        let dest: Uint8Array = new Uint8Array(4);
        textEncoder.encodeIntoUint8Array(input, dest);
        expect(input).assertEqual('中a');
        expect(dest[0]).assertEqual(228);

      }
      {
        let textEncoder = new util.TextEncoder();
        let head: string = '中';
        let tail: string = 'a';
        let combined: string = head + tail;
        let dest: Uint8Array = new Uint8Array(4);
        textEncoder.encodeIntoUint8Array(combined, dest);
        expect(head).assertEqual('中');
        expect(tail).assertEqual('a');
        expect(dest[0]).assertEqual(228);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let dest: Uint8Array = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('ab', dest);
        let child: Uint8Array = new Uint8Array(buffer, 0, 2);
        expect(child[0]).assertEqual(97);
        expect(child[1]).assertEqual(98);

      }
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(4);
        let view1: Uint8Array = new Uint8Array(buffer, 0, 2);
        textEncoder.encodeIntoUint8Array('ab', view1);
        let view2: Uint8Array = new Uint8Array(buffer, 2, 2);
        expect(view2[0]).assertEqual(0);
        expect(view2[1]).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TEXTENCODER_ENCODE_INTO_UINT8ARRAY_3100
     * @tc.name testTeIntoU8Basic002
     * @tc.desc Verify TextEncoder encodeIntoUint8Array with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTeIntoU8Basic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let textEncoder = new util.TextEncoder();
        let buffer: ArrayBuffer = new ArrayBuffer(3);
        let dest: Uint8Array = new Uint8Array(buffer);
        textEncoder.encodeIntoUint8Array('abc', dest);
        let dv: DataView = new DataView(buffer);
        expect(dv.getUint8(0)).assertEqual(97);
        expect(dv.getUint8(1)).assertEqual(98);
        expect(dv.getUint8(2)).assertEqual(99);

      }
    });

  });
}
