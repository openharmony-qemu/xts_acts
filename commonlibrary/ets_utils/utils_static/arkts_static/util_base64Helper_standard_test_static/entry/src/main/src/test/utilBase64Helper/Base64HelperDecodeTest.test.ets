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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '../../../../hypium/index';
import util from "@ohos.util";
import Utils from '../utilcommon.test';
import { byteStr } from '../utilcommon.test';

import { AnyType } from "../../../../hypium/module/types/common";


export default function Base64HelperDecodeTest(): void {
  describe('Base64HelperDecodeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_0100
     * @tc.name testB64DecodeThrows001
     * @tc.desc Verify Base64Helper decode and decodeSync throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let base64Helper = new util.Base64Helper();
        let n: Uint8Array | string | null = null;
        try {
          await base64Helper.decode(n!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let base64Helper = new util.Base64Helper();
        let u: Uint8Array | string | undefined = undefined;
        try {
          await base64Helper.decode(u!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let base64Helper = new util.Base64Helper();
        try {
          let badType: Object = 7;
          await base64Helper.decode('YWI=', badType as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let base64Helper = new util.Base64Helper();
        let o: util.Type | null = null;
        try {
          base64Helper.decode('YWI=', o! as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('NullPointerError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let base64Helper = new util.Base64Helper();
        let nan: number = Number.NaN;
        try {
          base64Helper.decode('YWI=', nan as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let nan: number = Number.NaN;
        try {
          b64.decode(nan as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let num: number = 123;
        try {
          b64.decode(num as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let m: Map<string, number> = new Map<string, number>();
        try {
          b64.decode(m as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let arr: number[] = [1, 2, 3];
        try {
          b64.decode(arr as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let flag: boolean = true;
        try {
          b64.decode(flag as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_0200
     * @tc.name testB64DecodeThrows002
     * @tc.desc Verify Base64Helper decode and decodeSync throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let ou: util.Type | undefined = undefined;
        try {
          await b64.decode("YWI=", ou! as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let bad: number = 99;
        try {
          b64.decode("YWI=", bad as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let zero: number = 0;
        try {
          await b64.decode("YWI=", zero as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let neg: number = -1;
        try {
          b64.decode("YWI=", neg as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        try {
          let badType: Object = 7;
          b64.decodeSync("TWFu", badType as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let base64Helper = new util.Base64Helper();
        let bad: Uint8Array = new Uint8Array([255, 255, 255, 255]);
        try {
          base64Helper.decodeSync((bad) as string, util.Type.BASIC);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }
        let r: Uint8Array = base64Helper.decodeSync("YWJj", util.Type.BASIC);
        let actual1: number = r.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 99;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let n: Uint8Array | string | null = null;
        try {
          base64Helper.decodeSync(n!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let base64Helper = new util.Base64Helper();
        let u: Uint8Array | string | undefined = undefined;
        try {
          base64Helper.decodeSync(u!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_0300
     * @tc.name testB64DecodeMime001
     * @tc.desc Verify Base64Helper decode and decodeSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeMime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("Ymlu", util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(2);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("Ymlu", util.Type.MIME_URL_SAFE);
        let actual1: number = val.$_get(1);
        let expected1: int = 105;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(2);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 109, 108, 117]);
        let val = await base64Helper.decode(src, util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 109, 108, 117]);
        let val = await base64Helper.decode(src, util.Type.MIME_URL_SAFE);
        let actual1: number = val.$_get(1);
        let expected1: int = 105;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(2);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([45, 45, 95, 95, 13, 10]);
        let val = await base64Helper.decode(src, util.Type.MIME_URL_SAFE);
        let actual1: int = val.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 251;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 109, 108, 117, 13, 10]);
        let fromString = await base64Helper.decode("Ymlu\r\n", util.Type.MIME);
        let fromBytes = await base64Helper.decode(src, util.Type.MIME);
        let actual1: number = fromString.$_get(0);
        let expected1: int = 98;
        expect(actual1).assertEqual(expected1);
        let actual2: number = fromString.$_get(1);
        let expected2: int = 105;
        expect(actual2).assertEqual(expected2);
        let actual3: number = fromString.$_get(2);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);
        let actual4: int = fromString.length;
        let expected4: int = 3;
        expect(actual4).assertEqual(expected4);
        expect(fromBytes.$_get(0)).assertEqual(98);
        expect(fromBytes.$_get(1)).assertEqual(105);
        expect(fromBytes.$_get(2)).assertEqual(110);
        expect(fromBytes.length).assertEqual(3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("aGVsbG8=", util.Type.MIME);
        let actual1: number = val.$_get(0);
        let expected1: int = 104;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(4);
        let expected2: int = 111;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("aGVsbG8\r\n", util.Type.MIME_URL_SAFE);
        let actual1: number = val.$_get(0);
        let expected1: int = 104;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(4);
        let expected2: int = 111;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("Ymlu\r\n", util.Type.MIME);
        let actual1: number = val.$_get(0);
        let expected1: int = 98;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(2);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("\r\nYmlu", util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_0400
     * @tc.name testB64DecodeMime002
     * @tc.desc Verify Base64Helper decode and decodeSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeMime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("TWFu\r\nYmlu", util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 6;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 77;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(3);
        let expected3: int = 98;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("Ymlu\r\n\r\nYmlu", util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 6;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(5);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("YmM=\r\n", util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 2;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(1);
        let expected3: int = 99;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("--__\r\n", util.Type.MIME_URL_SAFE);
        let actual1: number = val.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(2);
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("TWFu\r\n--__", util.Type.MIME_URL_SAFE);
        let actual1: int = val.length;
        let expected1: int = 6;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(3);
        let expected2: int = 251;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let raw: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          raw.$_set(i, i);
        }
        let enc: string = base64Helper.encodeToStringSync(raw, util.Type.MIME);
        let val = await base64Helper.decode(enc, util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 100;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 0;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(99);
        let expected3: int = 99;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let raw: Uint8Array = new Uint8Array(1000);
        for (let i = 0; i < 1000; i++) {
          raw.$_set(i, i % 253);
        }
        let enc: string = base64Helper.encodeToStringSync(raw, util.Type.MIME_URL_SAFE);
        let val = await base64Helper.decode(enc, util.Type.MIME_URL_SAFE);
        let actual1: int = val.length;
        let expected1: int = 1000;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 0;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(999);
        let expected3: int = 240;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode('', util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let val2 = await base64Helper.decode('YWJj\r\n', util.Type.MIME);
        let actual2: int = val2.length;
        let expected2: int = 3;
        expect(actual2).assertEqual(expected2);
        let byte0: number = val2.$_get(0);
        let expectByte0: int = 97;
        expect(byte0).assertEqual(expectByte0);
        let byte2: number = val2.$_get(2);
        let expectByte2: int = 99;
        expect(byte2).assertEqual(expectByte2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode('', util.Type.MIME_URL_SAFE);
        let actual1: int = val.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let val2 = await base64Helper.decode('YWJj\r\n', util.Type.MIME_URL_SAFE);
        let actual2: int = val2.length;
        let expected2: int = 3;
        expect(actual2).assertEqual(expected2);
        let byte0: number = val2.$_get(0);
        let expectByte0: int = 97;
        expect(byte0).assertEqual(expectByte0);
        let byte2: number = val2.$_get(2);
        let expectByte2: int = 99;
        expect(byte2).assertEqual(expectByte2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode(new Uint8Array(0), util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let val2 = await base64Helper.decode(new Uint8Array([89, 87, 74, 106]), util.Type.MIME);
        let actual2: int = val2.length;
        let expected2: int = 3;
        expect(actual2).assertEqual(expected2);
        let byte0: number = val2.$_get(0);
        let expectByte0: int = 97;
        expect(byte0).assertEqual(expectByte0);
        let byte2: number = val2.$_get(2);
        let expectByte2: int = 99;
        expect(byte2).assertEqual(expectByte2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_0500
     * @tc.name testB64DecodeMime003
     * @tc.desc Verify Base64Helper decode and decodeSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeMime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWI=\r\n', util.Type.MIME);
          let actual1: number = val.$_get(0);
          let expected1: int = 97;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 98;
          expect(actual2).assertEqual(expected2);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWI=\r\n\r\n', util.Type.MIME);
          let actual1: number = val.$_get(0);
          let expected1: int = 97;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 98;
          expect(actual2).assertEqual(expected2);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('\r\nYWI=', util.Type.MIME);
          let actual1: number = val.$_get(0);
          let expected1: int = 97;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 98;
          expect(actual2).assertEqual(expected2);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWJj\r\nYWI=', util.Type.MIME);
          let actual1: int = val.byteLength;
          let expected1: int = 5;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(0);
          let expected2: int = 97;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(1);
          let expected3: int = 98;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(2);
          let expected4: int = 99;
          expect(actual4).assertEqual(expected4);
          let actual5: number = val.$_get(3);
          let expected5: int = 97;
          expect(actual5).assertEqual(expected5);
          let actual6: number = val.$_get(4);
          let expected6: int = 98;
          expect(actual6).assertEqual(expected6);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('-___\r\n', util.Type.MIME_URL_SAFE);
          let actual1: number = val.$_get(0);
          let expected1: int = 251;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 255;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 255;
          expect(actual3).assertEqual(expected3);

      }
      {
          let base64Helper = new util.Base64Helper();
          let arr: Uint8Array = new Uint8Array(100);
          for (let i = 0; i < 100; i++) {
            arr.$_set(i, i);
          }
          let enc: string = base64Helper.encodeToStringSync(arr, util.Type.MIME);
          let val = await base64Helper.decode(enc, util.Type.MIME);
          let actual1: int = val.length;
          let expected1: int = 100;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWI=\r\nYWJj', util.Type.MIME);
          let actual1: int = val.byteLength;
          let expected1: int = 2;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(0);
          let expected2: int = 97;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(1);
          let expected3: int = 98;
          expect(actual3).assertEqual(expected3);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWI=\r\nYWJj', util.Type.MIME);
          let actual1: int = val.byteOffset;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('-___\r\n', util.Type.MIME_URL_SAFE);
          let actual1: int = val.byteOffset;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let src: string = 'TWFu\r\nYWI=';
          let val = await base64Helper.decode(src, util.Type.MIME);
          let actual1: int = val.length;
          let expected1: int = 5;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(0);
          let expected2: int = 77;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(1);
          let expected3: int = 97;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(2);
          let expected4: int = 110;
          expect(actual4).assertEqual(expected4);
          let actual5: number = val.$_get(3);
          let expected5: int = 97;
          expect(actual5).assertEqual(expected5);
          let actual6: number = val.$_get(4);
          let expected6: int = 98;
          expect(actual6).assertEqual(expected6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_0600
     * @tc.name testB64DecodeMime004
     * @tc.desc Verify Base64Helper decode and decodeSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeMime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let base64Helper = new util.Base64Helper();
          let src: string = '-___\r\n';
          let val = await base64Helper.decode(src, util.Type.MIME_URL_SAFE);
          let actual1: int = val.length;
          let expected1: int = 3;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(0);
          let expected2: int = 251;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(1);
          let expected3: int = 255;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(2);
          let expected4: int = 255;
          expect(actual4).assertEqual(expected4);

      }
      {
          let base64Helper = new util.Base64Helper();
          let arr: Uint8Array = new Uint8Array(100);
          for (let i = 0; i < 100; i++) {
            arr.$_set(i, i);
          }
          let enc: string = base64Helper.encodeToStringSync(arr, util.Type.MIME);
          let val = await base64Helper.decode(enc, util.Type.MIME);
          let actual1: number = val.$_get(0);
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(99);
          let expected2: int = 99;
          expect(actual2).assertEqual(expected2);

      }
      {
          let base64Helper = new util.Base64Helper();
          let arr57: Uint8Array = new Uint8Array(57);
          for (let i = 0; i < 57; i++) {
            arr57.$_set(i, i);
          }
          let enc57: string = base64Helper.encodeToStringSync(arr57, util.Type.MIME);
          let actual1: int = enc57.length;
          let expected1: int = 78;
          expect(actual1).assertEqual(expected1);
          let actual2: number = enc57.indexOf('\r');
          let expected2: int = 76;
          expect(actual2).assertEqual(expected2);
          let val = await base64Helper.decode(enc57, util.Type.MIME);
          let actual3: int = val.length;
          let expected3: int = 57;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(0);
          let expected4: int = 0;
          expect(actual4).assertEqual(expected4);
          let actual5: number = val.$_get(56);
          let expected5: int = 56;
          expect(actual5).assertEqual(expected5);

      }
      {
          let base64Helper = new util.Base64Helper();
          let arr58: Uint8Array = new Uint8Array(58);
          for (let i = 0; i < 58; i++) {
            arr58.$_set(i, i);
          }
          let enc58: string = base64Helper.encodeToStringSync(arr58, util.Type.MIME);
          let actual1: int = enc58.length;
          let expected1: int = 84;
          expect(actual1).assertEqual(expected1);
          let actual2: number = enc58.indexOf('\r\n');
          let expected2: int = 76;
          expect(actual2).assertEqual(expected2);
          let lines58: string[] = enc58.split('\r\n');
          let actual3: int = lines58[0].length;
          let expected3: int = 76;
          expect(actual3).assertEqual(expected3);
          let val = await base64Helper.decode(enc58, util.Type.MIME);
          let actual4: int = val.length;
          let expected4: int = 58;
          expect(actual4).assertEqual(expected4);
          let actual5: number = val.$_get(57);
          let expected5: int = 57;
          expect(actual5).assertEqual(expected5);

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync("YWI+", util.Type.MIME_URL_SAFE);
        expect(byteStr(val)).assertEqual("97,98");

      }
      {
        let b64 = new util.Base64Helper();
        let line: string = '';
        for (let i = 0; i < 76; i++) {
          line = line + 'A';
        }
        let val: Uint8Array = b64.decodeSync(line + "\r\n" + '!', util.Type.MIME);
        expect(val.length).assertEqual(57);
        expect(val.$_get(0)).assertEqual(0);
        expect(val.$_get(56)).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode('', util.Type.MIME);
        expect(byteStr(val)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let mime: Uint8Array = b64.decodeSync("Y!", util.Type.MIME);
        let safe: Uint8Array = b64.decodeSync("Y!", util.Type.BASIC_URL_SAFE);
        expect(byteStr(mime)).assertEqual("");
        expect(byteStr(safe)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let line: string = '';
        for (let i = 0; i < 76; i++) {
          line = line + 'A';
        }
        let val: Uint8Array = b64.decodeSync(line + "\r\n" + "YQ==", util.Type.MIME);
        let actual1: int = val.length;
        let expected1: int = 58;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 0;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(56);
        let expected3: int = 0;
        expect(actual3).assertEqual(expected3);
        let actual4: number = val.$_get(57);
        let expected4: int = 97;
        expect(actual4).assertEqual(expected4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFu\r\nTWFu", util.Type.MIME);
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(5);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_0700
     * @tc.name testB64DecodeMime005
     * @tc.desc Verify Base64Helper decode and decodeSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeMime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("--8=\r\n-w==", util.Type.MIME_URL_SAFE);
        expect(byteStr(r)).assertEqual("251,239");

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("-w==\r\n-w==", util.Type.MIME_URL_SAFE);
        expect(byteStr(r)).assertEqual("251");

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync(new Uint8Array(0), util.Type.BASIC);
        let actual1: int = r.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let rMime = b64.decodeSync(new Uint8Array(0), util.Type.MIME);
        expect(rMime.length).assertEqual(0);
        let rUrl = b64.decodeSync(new Uint8Array(0), util.Type.BASIC_URL_SAFE);
        expect(rUrl.length).assertEqual(0);
        let rMimeUrl = b64.decodeSync(new Uint8Array(0), util.Type.MIME_URL_SAFE);
        expect(rMimeUrl.length).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync(
          "TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n",
          util.Type.MIME,
        );
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(2);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("--8=\r\n", util.Type.MIME_URL_SAFE);
        let actual1: number = r.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 239;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFu\r\n", util.Type.MIME);
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 97;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFuTWFu", util.Type.MIME);
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(5);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFu\nTWFu", util.Type.MIME);
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(5);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("-w==\n-w==", util.Type.MIME_URL_SAFE);
        expect(byteStr(r)).assertEqual("251");

      }
      {
        let b64 = new util.Base64Helper();
        let line = "QXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJr";
        let r = b64.decodeSync(line, util.Type.MIME);
        let actual1: int = r.length;
        let expected1: int = 57;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(0);
        let expected2: int = 65;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(56);
        let expected3: int = 107;
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_0800
     * @tc.name testB64DecodeMime006
     * @tc.desc Verify Base64Helper decode and decodeSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeMime006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let line = "QXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJrVFMgQXJr\r\nVFMgQXJr";
        let r = b64.decodeSync(line, util.Type.MIME);
        let actual1: int = r.length;
        let expected1: int = 63;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(0);
        let expected2: int = 65;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(62);
        let expected3: int = 107;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("_w==\r\n_w==", util.Type.MIME_URL_SAFE);
        expect(byteStr(r)).assertEqual("255");

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWI=\r\n\r\n", util.Type.MIME);
        let actual1: number = result.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(1);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("\r\nYWI=", util.Type.MIME);
        let actual1: number = result.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(1);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWI=\r\nYWJj", util.Type.MIME);
        expect(byteStr(result)).assertEqual("97,98");

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("-___\r\n", util.Type.MIME_URL_SAFE);
        expect(byteStr(result)).assertEqual("251,255,255");

      }
      {
        let base64Helper = new util.Base64Helper();
        let arr: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          arr.$_set(i, i);
        }
        let enc: string = base64Helper.encodeToStringSync(arr, util.Type.MIME);
        let mimeHasCrLf: boolean = enc.indexOf("\r\n") >= 0;
        expect(mimeHasCrLf).assertTrue();
        let dec: Uint8Array = base64Helper.decodeSync(enc, util.Type.MIME);
        let actual1: number = dec.$_get(0);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec.$_get(99);
        let expected2: int = 99;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let arr: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          arr.$_set(i, i);
        }
        let enc: string = base64Helper.encodeToStringSync(arr, util.Type.MIME);
        let dec: Uint8Array = base64Helper.decodeSync(enc, util.Type.MIME);
        let actual1: int = dec.length;
        let expected1: int = 100;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWI=\r\nYWJj", util.Type.MIME);
        let actual1: int = result.byteLength;
        let expected1: int = 2;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 87, 73, 61]);
        let dec: Uint8Array = base64Helper.decodeSync(src, util.Type.MIME);
        expect(byteStr(dec)).assertEqual("97,98");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_0900
     * @tc.name testB64DecodeMime007
     * @tc.desc Verify Base64Helper decode and decodeSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeMime007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWI=\r\nYWJj", util.Type.MIME);
        let actual1: int = result.byteOffset;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("-___\r\n", util.Type.MIME_URL_SAFE);
        let actual1: int = result.byteOffset;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWI=\r\nYWJj", util.Type.MIME);
        let actual1: int = result.byteLength;
        let expected1: int = 2;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(0);
        let expected2: int = 97;
        expect(actual2).assertEqual(expected2);
        let actual3: number = result.$_get(1);
        let expected3: int = 98;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWI-", util.Type.MIME);
        expect(byteStr(r)).assertEqual("97,98");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWI_", util.Type.MIME);
        expect(byteStr(r)).assertEqual("97,98");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("-___+", util.Type.MIME_URL_SAFE);
        expect(byteStr(r)).assertEqual("251,255,255");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("_--_/", util.Type.MIME_URL_SAFE);
        expect(byteStr(r)).assertEqual("255,239,191");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWI=;YWJj", util.Type.MIME);
        expect(byteStr(r)).assertEqual("97,98");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWI= YWJj", util.Type.MIME);
        expect(byteStr(r)).assertEqual("97,98");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWI=\r\n!", util.Type.MIME);
        expect(byteStr(r)).assertEqual("97,98");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1000
     * @tc.name testB64DecodeMime008
     * @tc.desc Verify Base64Helper decode and decodeSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeMime008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWI=\r\n-_--", util.Type.MIME);
        expect(byteStr(r)).assertEqual("97,98");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("\r\n====", util.Type.MIME);
        expect(byteStr(r)).assertEqual("");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("\r\n\r\n!", util.Type.MIME);
        expect(byteStr(r)).assertEqual("");

      }
      {
        let base64Helper = new util.Base64Helper();
        let line: string = '';
        for (let i = 0; i < 19; i++) {
          line = line + "QUFB";
        }
        let src: string = line + "\r\n!";
        let r: Uint8Array = base64Helper.decodeSync(src, util.Type.MIME);
        expect(r.length).assertEqual(57);
        expect(r.$_get(0)).assertEqual(65);
        expect(r.$_get(56)).assertEqual(65);

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YW\r\nJj", util.Type.MIME);
        let actual1: int = r.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(0);
        let expected2: int = 97;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(1);
        let expected3: int = 98;
        expect(actual3).assertEqual(expected3);
        let actual4: number = r.$_get(2);
        let expected4: int = 99;
        expect(actual4).assertEqual(expected4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1100
     * @tc.name testB64DecodeUrlSafe001
     * @tc.desc Verify Base64Helper decode and decodeSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeUrlSafe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("Ymlu", util.Type.BASIC_URL_SAFE);
        let actual1: int = val.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 109, 108, 117]);
        let val = await base64Helper.decode(src, util.Type.BASIC_URL_SAFE);
        let actual1: int = val.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(2);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([45, 45, 95, 95]);
        let val = await base64Helper.decode(src, util.Type.BASIC_URL_SAFE);
        let actual1: number = val.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(2);
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([45, 45, 95, 95]);
        let fromString = await base64Helper.decode("--__", util.Type.BASIC_URL_SAFE);
        let fromBytes = await base64Helper.decode(src, util.Type.BASIC_URL_SAFE);
        let actual1: number = fromString.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);
        let actual2: number = fromString.$_get(1);
        let expected2: int = 239;
        expect(actual2).assertEqual(expected2);
        let actual3: number = fromString.$_get(2);
        let expected3: int = 255;
        expect(actual3).assertEqual(expected3);
        let actual4: int = fromString.length;
        let expected4: int = 3;
        expect(actual4).assertEqual(expected4);
        expect(fromBytes.$_get(0)).assertEqual(251);
        expect(fromBytes.length).assertEqual(3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("aGVsbG8", util.Type.BASIC_URL_SAFE);
        let actual1: number = val.$_get(0);
        let expected1: int = 104;
        expect(actual1).assertEqual(expected1);
        let actual2: int = val.length;
        let expected2: int = 5;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let all: Uint8Array = new Uint8Array(256);
        for (let i = 0; i < 256; i++) {
          all.$_set(i, i);
        }
        let enc: string = base64Helper.encodeToStringSync(all, util.Type.BASIC_URL_SAFE);
        let val = await base64Helper.decode(enc, util.Type.BASIC_URL_SAFE);
        let actual1: number = val.$_get(0);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(128);
        let expected2: int = 128;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(255);
        let expected3: int = 255;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode('', util.Type.BASIC_URL_SAFE);
        let actual1: int = val.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let val2 = await base64Helper.decode('-___', util.Type.BASIC_URL_SAFE);
        let actual2: int = val2.length;
        let expected2: int = 3;
        expect(actual2).assertEqual(expected2);
        let byte0: number = val2.$_get(0);
        let expectByte0: int = 251;
        expect(byte0).assertEqual(expectByte0);
        let byte1: number = val2.$_get(1);
        let expectByte1: int = 255;
        expect(byte1).assertEqual(expectByte1);
        let byte2: number = val2.$_get(2);
        let expectByte2: int = 255;
        expect(byte2).assertEqual(expectByte2);

      }
      {
          let base64Helper = new util.Base64Helper();
          let type = new util.types();
          let src: Uint8Array = new Uint8Array([45, 95, 95, 95]);
          let val = await base64Helper.decode(src, util.Type.BASIC_URL_SAFE);
          let actual1: boolean = type.isUint8Array(val);
          expect(actual1).assertTrue();

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('_--_', util.Type.BASIC_URL_SAFE);
          let actual1: number = val.$_get(0);
          let expected1: int = 255;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 239;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 191;
          expect(actual3).assertEqual(expected3);

      }
      {
          let base64Helper = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([45, 95, 95, 95]);
          let val = await base64Helper.decode(src, util.Type.BASIC_URL_SAFE);
          let actual1: number = val.$_get(0);
          let expected1: int = 251;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 255;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 255;
          expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1200
     * @tc.name testB64DecodeUrlSafe002
     * @tc.desc Verify Base64Helper decode and decodeSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeUrlSafe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('-___', util.Type.BASIC_URL_SAFE);
          let actual1: int = val.length;
          let expected1: int = 3;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('-___', util.Type.BASIC_URL_SAFE);
          let actual1: int = val.byteLength;
          let expected1: int = 3;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(0);
          let expected2: int = 251;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(1);
          let expected3: int = 255;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(2);
          let expected4: int = 255;
          expect(actual4).assertEqual(expected4);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('-___', util.Type.BASIC_URL_SAFE);
          let actual1: int = val.byteOffset;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('8J-YgA', util.Type.BASIC_URL_SAFE);
          let actual1: number = val.$_get(0);
          let expected1: int = 240;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 159;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 152;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(3);
          let expected4: int = 128;
          expect(actual4).assertEqual(expected4);

      }
      {
          let base64Helper = new util.Base64Helper();
          let arr: Uint8Array = new Uint8Array([251, 255, 254]);
          let enc: string = base64Helper.encodeToStringSync(arr, util.Type.BASIC_URL_SAFE);
          let val = await base64Helper.decode(enc, util.Type.BASIC_URL_SAFE);
          let actual1: number = val.$_get(0);
          let expected1: int = 251;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 255;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 254;
          expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode(new Uint8Array(0), util.Type.BASIC_URL_SAFE);
        expect(byteStr(val)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode("-w==", util.Type.BASIC_URL_SAFE);
        expect(byteStr(val)).assertEqual("251");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode("____", util.Type.BASIC_URL_SAFE);
        expect(byteStr(val)).assertEqual("255,255,255");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode("-___", util.Type.BASIC_URL_SAFE);
        expect(byteStr(val)).assertEqual("251,255,255");

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("-w==", util.Type.BASIC_URL_SAFE);
        let actual1: number = r.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1300
     * @tc.name testB64DecodeUrlSafe003
     * @tc.desc Verify Base64Helper decode and decodeSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeUrlSafe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("_w==", util.Type.BASIC_URL_SAFE);
        let actual1: number = r.$_get(0);
        let expected1: int = 255;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("ywfi", util.Type.BASIC_URL_SAFE);
        expect(byteStr(r)).assertEqual("203,7,226");

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("--8=", util.Type.BASIC_URL_SAFE);
        let actual1: number = r.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 239;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFu-_8=", util.Type.BASIC_URL_SAFE);
        expect(byteStr(r)).assertEqual("77,97,110,251,255");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("+w==", util.Type.BASIC_URL_SAFE);
        expect(byteStr(r)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("TWFu/w==", util.Type.BASIC_URL_SAFE);
        expect(byteStr(r)).assertEqual("77,97,110");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("TWFu\r\nTWFu", util.Type.BASIC_URL_SAFE);
        expect(byteStr(r)).assertEqual("77,97,110,77,97,110");

      }
      {
        let base64Helper = new util.Base64Helper();
        let type = new util.types();
        let src: Uint8Array = new Uint8Array([45, 95, 95, 95]);
        let result: Uint8Array = base64Helper.decodeSync(src, util.Type.BASIC_URL_SAFE);
        let actual1: boolean = type.isUint8Array(result);
        expect(actual1).assertTrue();

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("-___", util.Type.BASIC_URL_SAFE);
        expect(byteStr(result)).assertEqual("251,255,255");

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("_--_", util.Type.BASIC_URL_SAFE);
        let actual1: number = result.$_get(0);
        let expected1: int = 255;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(1);
        let expected2: int = 239;
        expect(actual2).assertEqual(expected2);
        let actual3: number = result.$_get(2);
        let expected3: int = 191;
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1400
     * @tc.name testB64DecodeUrlSafe004
     * @tc.desc Verify Base64Helper decode and decodeSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeUrlSafe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let arr: Uint8Array = new Uint8Array([251, 255, 254]);
        let enc: string = base64Helper.encodeToStringSync(arr, util.Type.BASIC_URL_SAFE);
        let dec: Uint8Array = base64Helper.decodeSync(enc, util.Type.BASIC_URL_SAFE);
        let actual1: number = dec.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec.$_get(1);
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);
        let actual3: number = dec.$_get(2);
        let expected3: int = 254;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("-___", util.Type.BASIC_URL_SAFE);
        let actual1: int = result.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("-___", util.Type.BASIC_URL_SAFE);
        let actual1: int = result.byteOffset;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("-___", util.Type.BASIC_URL_SAFE);
        let actual1: int = result.byteLength;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(0);
        let expected2: int = 251;
        expect(actual2).assertEqual(expected2);
        let actual3: number = result.$_get(1);
        let expected3: int = 255;
        expect(actual3).assertEqual(expected3);
        let actual4: number = result.$_get(2);
        let expected4: int = 255;
        expect(actual4).assertEqual(expected4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWI+", util.Type.BASIC_URL_SAFE);
        expect(byteStr(r)).assertEqual("97,98");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("-___\r\n", util.Type.BASIC_URL_SAFE);
        expect(byteStr(r)).assertEqual("251,255,255");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("____", util.Type.BASIC_URL_SAFE);
        let actual1: number = r.$_get(0);
        let expected1: int = 255;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 255;
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1500
     * @tc.name testB64DecodeBoundary001
     * @tc.desc Verify Base64Helper decode and decodeSync with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let base64Helper = new util.Base64Helper();
        let fromString = await base64Helper.decode('', util.Type.BASIC);
        let fromBytes = await base64Helper.decode(new Uint8Array(0), util.Type.BASIC);
        let actual1: int = fromString.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: int = fromBytes.length;
        let expected2: int = 0;
        expect(actual2).assertEqual(expected2);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('', util.Type.BASIC);
          let actual1: int = val.length;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode(new Uint8Array(0), util.Type.BASIC);
          let actual1: int = val.length;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let inputs: string[] = ['@', '~', '<', ',', ':', '中', '\r', 'A', '!'];
        for (let i = 0; i < inputs.length; i++) {
          let val: Uint8Array = b64.decodeSync(inputs[i], util.Type.BASIC);
          expect(byteStr(val)).assertEqual("");
        }

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync("=AAA", util.Type.BASIC);
        expect(byteStr(val)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync("A=A=", util.Type.BASIC);
        expect(byteStr(val)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync("A===", util.Type.BASIC);
        expect(byteStr(val)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync("==YWJj", util.Type.BASIC);
        expect(byteStr(val)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let longStr: string = '';
        for (let i = 0; i < 9999; i++) {
          longStr = longStr + 'A';
        }
        let val: Uint8Array = b64.decodeSync(longStr, util.Type.BASIC);
        expect(val.length).assertEqual(7499);
        expect(val.$_get(0)).assertEqual(0);
        expect(val.$_get(7498)).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync(new Uint8Array([33, 33, 33, 33]), util.Type.BASIC);
        expect(byteStr(val)).assertEqual("");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1600
     * @tc.name testB64DecodeBoundary002
     * @tc.desc Verify Base64Helper decode and decodeSync with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync('');
        let actual1: int = r.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("!!");
        expect(byteStr(r)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("A===");
        expect(byteStr(r)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("=TWFu");
        expect(byteStr(r)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("-w==", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("_w==", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("");

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync('', util.Type.BASIC);
        let actual1: int = result.byteLength;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync('!', util.Type.BASIC);
        expect(byteStr(r)).assertEqual("");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync('\n', util.Type.BASIC);
        expect(byteStr(r)).assertEqual("");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync('\t', util.Type.BASIC);
        expect(byteStr(r)).assertEqual("");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1700
     * @tc.name testB64DecodeBoundary003
     * @tc.desc Verify Base64Helper decode and decodeSync with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let src: string = '';
        for (let i = 0; i < 10000; i++) {
          src = src + '!';
        }
        let r: Uint8Array = base64Helper.decodeSync(src, util.Type.BASIC);
        expect(byteStr(r)).assertEqual("");

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(0);
        let r: Uint8Array = base64Helper.decodeSync(src, util.Type.BASIC);
        let actual1: int = r.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let res: Uint8Array = base64Helper.decodeSync('!', util.Type.BASIC);
        expect(byteStr(res)).assertEqual("");
        let r: Uint8Array = base64Helper.decodeSync("YWI=", util.Type.BASIC);
        let actual1: number = r.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let res: Uint8Array = base64Helper.decodeSync('?', util.Type.BASIC);
        expect(byteStr(res)).assertEqual("");
        let r: Uint8Array = base64Helper.decodeSync("YWJj", util.Type.BASIC);
        let actual1: number = r.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 99;
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1800
     * @tc.name testB64DecodeConsistency001
     * @tc.desc Verify Base64Helper decode and decodeSync result consistency and aliasing behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 109, 108, 117]);
        let fromString = await base64Helper.decode("Ymlu", util.Type.BASIC);
        let fromBytes = await base64Helper.decode(src, util.Type.BASIC);
        let actual1: number = fromString.$_get(0);
        let expected1: int = 98;
        expect(actual1).assertEqual(expected1);
        let actual2: number = fromString.$_get(1);
        let expected2: int = 105;
        expect(actual2).assertEqual(expected2);
        let actual3: number = fromString.$_get(2);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);
        let actual4: int = fromString.length;
        let expected4: int = 3;
        expect(actual4).assertEqual(expected4);
        expect(fromBytes.$_get(0)).assertEqual(98);
        expect(fromBytes.$_get(1)).assertEqual(105);
        expect(fromBytes.$_get(2)).assertEqual(110);
        expect(fromBytes.length).assertEqual(3);

      }
      {
          let base64Helper = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([89, 87, 73, 61]);
          let val = await base64Helper.decode(src, util.Type.BASIC);
          val.$_set(0, 0);
          let actual1: number = src.$_get(0);
          let expected1: int = 89;
          expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 87, 73, 61]);
        let result: Uint8Array = base64Helper.decodeSync(src, util.Type.BASIC);
        result.$_set(0, 0);
        let actual1: number = src.$_get(0);
        let expected1: int = 89;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_1900
     * @tc.name testB64DecodeBasic001
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("Ymlu");
        let actual1: int = val.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 109, 108, 117]);
        let val = await base64Helper.decode(src);
        let actual1: int = val.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 105;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("Ymlu", util.Type.BASIC);
        let actual1: number = val.$_get(0);
        let expected1: int = 98;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 105;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("c2Vl");
        let actual1: number = val.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 101;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 101;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("QUJD");
        let actual1: number = val.$_get(0);
        let expected1: int = 65;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 66;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 67;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("aaaa");
        let actual1: number = val.$_get(0);
        let expected1: int = 105;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 166;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 154;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("MTIz");
        let actual1: number = val.$_get(0);
        let expected1: int = 49;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 50;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 51;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("QWJj");
        let actual1: number = val.$_get(0);
        let expected1: int = 65;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 99;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("SQ==");
        let actual1: int = val.length;
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 73;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("YmM=");
        let actual1: int = val.length;
        let expected1: int = 2;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(1);
        let expected3: int = 99;
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2000
     * @tc.name testB64DecodeBasic002
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("MTIzNDU=");
        let actual1: int = val.length;
        let expected1: int = 5;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(4);
        let expected2: int = 53;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("gAAA");
        let actual1: number = val.$_get(0);
        let expected1: int = 128;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 0;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("f39/");
        let actual1: number = val.$_get(0);
        let expected1: int = 127;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 127;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 127;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("AQ==");
        let actual1: int = val.length;
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 1;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("5ZCN");
        let actual1: int = val.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 229;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(1);
        let expected3: int = 144;
        expect(actual3).assertEqual(expected3);
        let actual4: number = val.$_get(2);
        let expected4: int = 141;
        expect(actual4).assertEqual(expected4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("w6k=");
        let actual1: int = val.length;
        let expected1: int = 2;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 195;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(1);
        let expected3: int = 169;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("YWIA");
        let actual1: number = val.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 0;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("AGFi");
        let actual1: number = val.$_get(0);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 97;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 98;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([83, 81, 61, 61]);
        let val = await base64Helper.decode(src, util.Type.BASIC);
        let actual1: int = val.length;
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 73;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("AQIDBAUG");
        let actual1: number = val.$_get(0);
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(3);
        let expected2: int = 4;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(5);
        let expected3: int = 6;
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2100
     * @tc.name testB64DecodeBasic003
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("//D/");
        let actual1: number = val.$_get(0);
        let expected1: int = 255;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 240;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 255;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("AP8A");
        let actual1: number = val.$_get(0);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 0;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("gICA");
        let actual1: number = val.$_get(0);
        let expected1: int = 128;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 128;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 128;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("AQEB");
        let actual1: number = val.$_get(0);
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 1;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 1;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("q///");
        let actual1: number = val.$_get(0);
        let expected1: int = 171;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(1);
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(2);
        let expected3: int = 255;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("c2VlYQ==");
        let actual1: int = val.length;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 115;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(3);
        let expected3: int = 97;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let val = await base64Helper.decode("MTIzNDU2Nzg5MDEy");
        let actual1: int = val.length;
        let expected1: int = 12;
        expect(actual1).assertEqual(expected1);
        let actual2: number = val.$_get(0);
        let expected2: int = 49;
        expect(actual2).assertEqual(expected2);
        let actual3: number = val.$_get(11);
        let expected3: int = 50;
        expect(actual3).assertEqual(expected3);

      }
      {
          let base64Helper = new util.Base64Helper();
          let type = new util.types();
          let val = await base64Helper.decode('czEz');
          let actual1: boolean = type.isUint8Array(val);
          expect(actual1).assertTrue();

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('TWFu', util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 77;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 97;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 110;
          expect(actual3).assertEqual(expected3);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('QQ==', util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 65;
          expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2200
     * @tc.name testB64DecodeBasic004
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWI=', util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 97;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 98;
          expect(actual2).assertEqual(expected2);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('5L2g5aW9', util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 228;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 189;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 160;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(3);
          let expected4: int = 229;
          expect(actual4).assertEqual(expected4);
          let actual5: number = val.$_get(4);
          let expected5: int = 165;
          expect(actual5).assertEqual(expected5);
          let actual6: number = val.$_get(5);
          let expected6: int = 189;
          expect(actual6).assertEqual(expected6);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('czEz');
          let actual1: number = val.$_get(0);
          let expected1: int = 115;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 49;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 51;
          expect(actual3).assertEqual(expected3);

      }
      {
          let base64Helper = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([89, 87, 73, 61]);
          let val = await base64Helper.decode(src, util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 97;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 98;
          expect(actual2).assertEqual(expected2);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('8J+YgA==', util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 240;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 159;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 152;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(3);
          let expected4: int = 128;
          expect(actual4).assertEqual(expected4);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWJj', util.Type.BASIC);
          let actual1: int = val.length;
          let expected1: int = 3;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('QQ==', util.Type.BASIC);
          let actual1: int = val.length;
          let expected1: int = 1;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWI=', util.Type.BASIC);
          let actual1: int = val.length;
          let expected1: int = 2;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('czEz');
          let actual1: int = val.length;
          let expected1: int = 3;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('8J+YgA==', util.Type.BASIC);
          let actual1: int = val.length;
          let expected1: int = 4;
          expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2300
     * @tc.name testB64DecodeBasic005
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let base64Helper = new util.Base64Helper();
          let big: Uint8Array = new Uint8Array(2000);
          for (let i = 0; i < 2000; i++) {
            big.$_set(i, i % 251);
          }
          let enc: string = base64Helper.encodeToStringSync(big, util.Type.BASIC);
          let val = await base64Helper.decode(enc, util.Type.BASIC);
          let actual1: int = val.length;
          let expected1: int = 2000;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWJj', util.Type.BASIC);
          let actual1: int = val.byteLength;
          let expected1: int = 3;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(0);
          let expected2: int = 97;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(1);
          let expected3: int = 98;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(2);
          let expected4: int = 99;
          expect(actual4).assertEqual(expected4);

      }
      {
          let base64Helper = new util.Base64Helper();
          let all: Uint8Array = new Uint8Array(256);
          for (let i = 0; i < 256; i++) {
            all.$_set(i, i);
          }
          let enc: string = base64Helper.encodeToStringSync(all, util.Type.BASIC);
          let val = await base64Helper.decode(enc, util.Type.BASIC);
          let actual1: int = val.byteLength;
          let expected1: int = 256;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([89, 109, 70, 117]);
          let val = await base64Helper.decode(src, util.Type.BASIC);
          let actual1: int = val.length;
          let expected1: int = 3;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(0);
          let expected2: int = 98;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(1);
          let expected3: int = 97;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(2);
          let expected4: int = 110;
          expect(actual4).assertEqual(expected4);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('YWJj', util.Type.BASIC);
          let actual1: int = val.byteOffset;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('czEz');
          let actual1: int = val.byteOffset;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let base64Helper = new util.Base64Helper();
          let r1 = await base64Helper.decode('czEz', util.Type.BASIC);
          let actual1: number = r1.$_get(0);
          let expected1: int = 115;
          expect(actual1).assertEqual(expected1);
          let actual2: number = r1.$_get(1);
          let expected2: int = 49;
          expect(actual2).assertEqual(expected2);
          let actual3: number = r1.$_get(2);
          let expected3: int = 51;
          expect(actual3).assertEqual(expected3);
          let r2 = await base64Helper.decode('czEz', util.Type.BASIC);
          let actual4: number = r2.$_get(0);
          let expected4: int = 115;
          expect(actual4).assertEqual(expected4);
          let actual5: int = r2.length;
          let expected5: int = 3;
          expect(actual5).assertEqual(expected5);

      }
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('SGVsbG8=', util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 72;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 101;
          expect(actual2).assertEqual(expected2);
          let actual3: int = val.length;
          let expected3: int = 5;
          expect(actual3).assertEqual(expected3);

      }
      {
          let base64Helper = new util.Base64Helper();
          let arr: Uint8Array = new Uint8Array([10, 20, 30]);
          let enc: string = base64Helper.encodeToStringSync(arr, util.Type.BASIC);
          let val = await base64Helper.decode(enc, util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 10;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 20;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 30;
          expect(actual3).assertEqual(expected3);

      }
      {
          let base64Helper = new util.Base64Helper();
          let all: Uint8Array = new Uint8Array(256);
          for (let i = 0; i < 256; i++) {
            all.$_set(i, i);
          }
          let enc: string = base64Helper.encodeToStringSync(all, util.Type.BASIC);
          let val = await base64Helper.decode(enc, util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(127);
          let expected2: int = 127;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(255);
          let expected3: int = 255;
          expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2400
     * @tc.name testB64DecodeBasic006
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let base64Helper = new util.Base64Helper();
          let val = await base64Helper.decode('AAAAA', util.Type.BASIC);
          let actual1: int = val.length;
          let expected1: int = 3;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(0);
          let expected2: int = 0;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(1);
          let expected3: int = 0;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(2);
          let expected4: int = 0;
          expect(actual4).assertEqual(expected4);

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync("QQ=", util.Type.BASIC);
        expect(byteStr(val)).assertEqual("65");

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync("YWI=Z", util.Type.BASIC);
        expect(byteStr(val)).assertEqual("97,98");

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync("AAAA==", util.Type.BASIC);
        expect(byteStr(val)).assertEqual("0,0,0");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode("ZQ==");
        expect(byteStr(val)).assertEqual("101");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode("AA==");
        expect(byteStr(val)).assertEqual('0');

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode("YQ==");
        expect(byteStr(val)).assertEqual("97");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode("////");
        expect(byteStr(val)).assertEqual("255,255,255");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode("zzzz");
        expect(byteStr(val)).assertEqual("207,60,243");

      }
      {
        let b64 = new util.Base64Helper();
        let val: Uint8Array = b64.decodeSync("YWJj YWJj", util.Type.BASIC);
        expect(byteStr(val)).assertEqual("97,98,99,97,98,99");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2500
     * @tc.name testB64DecodeBasic007
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.decode("YWI=");
        expect(byteStr(val)).assertEqual("97,98");

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("5L2g");
        let actual1: number = r.$_get(0);
        let expected1: int = 228;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 189;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 160;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("8J+YgA==", util.Type.BASIC);
        let actual1: number = r.$_get(0);
        let expected1: int = 240;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 159;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 152;
        expect(actual3).assertEqual(expected3);
        let actual4: number = r.$_get(3);
        let expected4: int = 128;
        expect(actual4).assertEqual(expected4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync(new Uint8Array([84, 81, 61, 61]));
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFu", util.Type.BASIC);
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TQ==");
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync(new Uint8Array([84, 81, 61, 61]), util.Type.BASIC);
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("YQBi");
        let actual1: number = r.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 0;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 98;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("AAAA");
        let actual1: number = r.$_get(0);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 0;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 0;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("////");
        let actual1: number = r.$_get(0);
        let expected1: int = 255;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 255;
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2600
     * @tc.name testB64DecodeBasic008
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFuTWFu");
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(3);
        let expected2: int = 77;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(5);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);
        let actual4: int = r.length;
        let expected4: int = 6;
        expect(actual4).assertEqual(expected4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFuTWFuTWFu");
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(6);
        let expected2: int = 77;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(8);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);
        let actual4: int = r.length;
        let expected4: int = 9;
        expect(actual4).assertEqual(expected4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFuTWFuTWFuTWFu");
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(9);
        let expected2: int = 77;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(11);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);
        let actual4: int = r.length;
        let expected4: int = 12;
        expect(actual4).assertEqual(expected4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFuTQ==");
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(2);
        let expected2: int = 110;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(3);
        let expected3: int = 77;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFuTWE=");
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(3);
        let expected2: int = 77;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(4);
        let expected3: int = 97;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFu/+8=");
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(3);
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(4);
        let expected3: int = 239;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("aGVsbG8=");
        let actual1: number = r.$_get(0);
        let expected1: int = 104;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 101;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 108;
        expect(actual3).assertEqual(expected3);
        let actual4: number = r.$_get(3);
        let expected4: int = 108;
        expect(actual4).assertEqual(expected4);
        let actual5: number = r.$_get(4);
        let expected5: int = 111;
        expect(actual5).assertEqual(expected5);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("YTph");
        let actual1: number = r.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 58;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 97;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync(new Uint8Array([99, 122, 69, 122]));
        let actual1: number = r.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 49;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 51;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync(new Uint8Array([84, 87, 70, 117, 43, 81, 61, 61]), util.Type.BASIC);
        let actual1: number = r.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(3);
        let expected2: int = 249;
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2700
     * @tc.name testB64DecodeBasic009
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("TWFu TWFu");
        expect(byteStr(r)).assertEqual("77,97,110,77,97,110");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("TWFu\t");
        expect(byteStr(r)).assertEqual("77,97,110");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("TWFu$");
        expect(byteStr(r)).assertEqual("77,97,110");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync(new Uint8Array([84, 87, 70, 117, 32, 84, 87, 70, 117]), util.Type.BASIC);
        expect(byteStr(r)).assertEqual("77,97,110,77,97,110");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("TQ=");
        expect(byteStr(r)).assertEqual("77");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("TWE");
        expect(byteStr(r)).assertEqual("77,97");

      }
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("TWFua");
        expect(byteStr(r)).assertEqual("77,97,110");

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("TWFu/+8=");
        let actual1: number = r.$_get(3);
        let expected1: int = 255;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(4);
        let expected2: int = 239;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let a = b64.decodeSync("TWFu", util.Type.BASIC);
        let actual1: number = a.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = a.$_get(1);
        let expected2: int = 97;
        expect(actual2).assertEqual(expected2);
        let actual3: number = a.$_get(2);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("+w==", util.Type.BASIC);
        let actual1: number = r.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2800
     * @tc.name testB64DecodeBasic010
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r: Uint8Array = b64.decodeSync("TWFu\r\nTWFu", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("77,97,110,77,97,110");

      }
      {
        let base64Helper = new util.Base64Helper();
        let type = new util.types();
        let result: Uint8Array = base64Helper.decodeSync("czEz");
        let actual1: boolean = type.isUint8Array(result);
        expect(actual1).assertTrue();

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("czEz", util.Type.BASIC);
        let actual1: number = result.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(1);
        let expected2: int = 49;
        expect(actual2).assertEqual(expected2);
        let actual3: number = result.$_get(2);
        let expected3: int = 51;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("QQ==", util.Type.BASIC);
        let actual1: number = result.$_get(0);
        let expected1: int = 65;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWI=", util.Type.BASIC);
        let actual1: number = result.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(1);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("5L2g5aW9", util.Type.BASIC);
        let actual1: number = result.$_get(0);
        let expected1: int = 228;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(1);
        let expected2: int = 189;
        expect(actual2).assertEqual(expected2);
        let actual3: number = result.$_get(2);
        let expected3: int = 160;
        expect(actual3).assertEqual(expected3);
        let actual4: number = result.$_get(3);
        let expected4: int = 229;
        expect(actual4).assertEqual(expected4);
        let actual5: number = result.$_get(4);
        let expected5: int = 165;
        expect(actual5).assertEqual(expected5);
        let actual6: number = result.$_get(5);
        let expected6: int = 189;
        expect(actual6).assertEqual(expected6);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("++++", util.Type.BASIC);
        let actual1: number = result.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(1);
        let expected2: int = 239;
        expect(actual2).assertEqual(expected2);
        let actual3: number = result.$_get(2);
        let expected3: int = 190;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("czEz");
        let actual1: number = result.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(1);
        let expected2: int = 49;
        expect(actual2).assertEqual(expected2);
        let actual3: number = result.$_get(2);
        let expected3: int = 51;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let arr: Uint8Array = new Uint8Array([10, 20, 30]);
        let enc: string = base64Helper.encodeToStringSync(arr, util.Type.BASIC);
        let dec: Uint8Array = base64Helper.decodeSync(enc, util.Type.BASIC);
        let actual1: number = dec.$_get(0);
        let expected1: int = 10;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec.$_get(1);
        let expected2: int = 20;
        expect(actual2).assertEqual(expected2);
        let actual3: number = dec.$_get(2);
        let expected3: int = 30;
        expect(actual3).assertEqual(expected3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let all: Uint8Array = new Uint8Array(256);
        for (let i = 0; i < 256; i++) {
          all.$_set(i, i);
        }
        let enc: string = base64Helper.encodeToStringSync(all, util.Type.BASIC);
        let dec: Uint8Array = base64Helper.decodeSync(enc, util.Type.BASIC);
        let actual1: number = dec.$_get(0);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec.$_get(127);
        let expected2: int = 127;
        expect(actual2).assertEqual(expected2);
        let actual3: number = dec.$_get(255);
        let expected3: int = 255;
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_2900
     * @tc.name testB64DecodeBasic011
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWJj", util.Type.BASIC);
        let actual1: int = result.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("QQ==", util.Type.BASIC);
        let actual1: int = result.length;
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWI=", util.Type.BASIC);
        let actual1: int = result.length;
        let expected1: int = 2;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let all: Uint8Array = new Uint8Array(256);
        for (let i = 0; i < 256; i++) {
          all.$_set(i, i);
        }
        let enc: string = base64Helper.encodeToStringSync(all, util.Type.BASIC);
        let dec: Uint8Array = base64Helper.decodeSync(enc, util.Type.BASIC);
        let actual1: int = dec.length;
        let expected1: int = 256;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("czEz");
        let actual1: int = result.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([99, 122, 69, 122]);
        let result: Uint8Array = base64Helper.decodeSync(src, util.Type.BASIC);
        let actual1: int = result.length;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("8J+YgA==", util.Type.BASIC);
        let actual1: int = result.length;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 87, 73, 61, 89, 87, 73, 61, 89, 87, 73, 61]);
        let dec: Uint8Array = base64Helper.decodeSync(src, util.Type.BASIC);
        expect(byteStr(dec)).assertEqual("97,98");

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWJj", util.Type.BASIC);
        let actual1: int = result.byteOffset;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let base64Helper = new util.Base64Helper();
        let result: Uint8Array = base64Helper.decodeSync("YWJj", util.Type.BASIC);
        let actual1: int = result.byteLength;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = result.$_get(0);
        let expected2: int = 97;
        expect(actual2).assertEqual(expected2);
        let actual3: number = result.$_get(1);
        let expected3: int = 98;
        expect(actual3).assertEqual(expected3);
        let actual4: number = result.$_get(2);
        let expected4: int = 99;
        expect(actual4).assertEqual(expected4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_3000
     * @tc.name testB64DecodeBasic012
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let r1: Uint8Array = base64Helper.decodeSync("czEz", util.Type.BASIC);
        let r2: Uint8Array = base64Helper.decodeSync("czEz", util.Type.BASIC);
        let actual1: boolean = r1 !== r2;
        expect(actual1).assertTrue();

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("!WJj", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("88,152");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YW!j", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("97,104");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWJj\n", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("97,98,99");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWJj ", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("97,98,99");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("AA=A", util.Type.BASIC);
        expect(byteStr(r)).assertEqual('0');

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("AA", util.Type.BASIC);
        expect(byteStr(r)).assertEqual('0');

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("AAAAA", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("0,0,0");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWI=\r\n", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("97,98");

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("ZZZZ", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("101,150,89");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_DECODE_3100
     * @tc.name testB64DecodeBasic013
     * @tc.desc Verify Base64Helper decode and decodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64DecodeBasic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("AA==", util.Type.BASIC);
        let actual1: int = r.length;
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(0);
        let expected2: int = 0;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("ZQ==", util.Type.BASIC);
        let actual1: int = r.length;
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(0);
        let expected2: int = 101;
        expect(actual2).assertEqual(expected2);

      }
      {
        let base64Helper = new util.Base64Helper();
        let r: Uint8Array = base64Helper.decodeSync("YWJjZA=", util.Type.BASIC);
        expect(byteStr(r)).assertEqual("97,98,99,100");

      }
    });

  });
}
