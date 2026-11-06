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
} from '@ohos/hypium-static/src/main/indexStatic';
import util from "@ohos.util";
import Utils from '../utilcommon.test';
import { Decimal } from '@kit.ArkTS';

function createCodec(): util.Base64Helper {
  let b64 = new util.Base64Helper();
  return b64;
}

function useCodec(codec: util.Base64Helper): number {
  return codec.encodeSync(new Uint8Array([1, 2, 3])).length;
}

export default function Base64HelperConstructorTest(): void {
  describe('Base64HelperConstructorTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_0100
     * @tc.name testB64CtorThrows001
     * @tc.desc Verify Base64Helper constructor and instance methods throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        try {
          b64.encodeSync(new Uint8Array([1, 2, 3]), util.Type.MIME);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(401);
        }

      }
      {
        let b6483 = new util.Base64Helper();
        let o: util.Type | null = null;
        try {
          b6483.decodeSync('TWFu', o! as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('NullPointerError');
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b6484 = new util.Base64Helper();
        let nan: number = Number.NaN;
        try {
          b6484.decodeSync('TWFu', nan as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('ClassCastError');
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_0200
     * @tc.name testB64CtorMime001
     * @tc.desc Verify Base64Helper constructor and instance methods with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorMime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("QQ==\r\n", util.Type.MIME);
        let actual1: number = r.$_get(0);
        let expected1: int = 65;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("--8=", util.Type.MIME_URL_SAFE);
        expect(r.$_get(0)).assertEqual(251);
        expect(r.$_get(1)).assertEqual(239);

      }
      {
        let b6476 = new util.Base64Helper();
        let mimeSrc = new Uint8Array(100);
        for (let i: int = 0; i < 100; i++) {
          mimeSrc.$_set(i, 97);
        }
        let mimeStr = b6476.encodeToStringSync(mimeSrc, util.Type.MIME);
        let actual1: boolean = mimeStr.indexOf('\r\n') >= 0;
        expect(actual1).assertTrue();
        let actual2: int = mimeStr.length;
        let expected2: int = 140;
        expect(actual2).assertEqual(expected2);
        let actual3: number = mimeStr.indexOf('\r\n');
        let expected3: int = 76;
        expect(actual3).assertEqual(expected3);
        let lines: string[] = mimeStr.split('\r\n');
        let actual4: int = lines[0].length;
        let expected4: int = 76;
        expect(actual4).assertEqual(expected4);
        let actual5: int = lines[1].length;
        let expected5: int = 60;
        expect(actual5).assertEqual(expected5);

      }
      {
        let b6478 = new util.Base64Helper();
        let mimeIn = 'TWFu\r\nYQ==\r\n';
        let dec78 = b6478.decodeSync(mimeIn, util.Type.MIME);
        let actual1: number = dec78.$_get(0);
        let expected1: int = 77;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec78.$_get(3);
        let expected2: int = 97;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6479 = new util.Base64Helper();
        let mimeSrc57 = new Uint8Array(57);
        for (let i: int = 0; i < 57; i++) {
          mimeSrc57.$_set(i, 97);
        }
        let mimeStr57 = b6479.encodeToStringSync(mimeSrc57, util.Type.MIME);
        let actual1: int = mimeStr57.length;
        let expected1: int = 78;
        expect(actual1).assertEqual(expected1);
        let actual2: number = mimeStr57.indexOf('\r');
        let expected2: int = 76;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6480 = new util.Base64Helper();
        let mimeSrc58 = new Uint8Array(58);
        for (let i: int = 0; i < 58; i++) {
          mimeSrc58.$_set(i, 97);
        }
        let mimeStr58 = b6480.encodeToStringSync(mimeSrc58, util.Type.MIME);
        let actual1: int = mimeStr58.length;
        let expected1: int = 84;
        expect(actual1).assertEqual(expected1);
        let actual2: number = mimeStr58.indexOf('\r\n');
        let expected2: int = 76;
        expect(actual2).assertEqual(expected2);
        let lines58: string[] = mimeStr58.split('\r\n');
        let actual3: string = lines58[1];
        let expected3: string = 'YQ==';
        expect(actual3).assertEqual(expected3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_0300
     * @tc.name testB64CtorUrlSafe001
     * @tc.desc Verify Base64Helper constructor and instance methods with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorUrlSafe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("--8=", util.Type.BASIC_URL_SAFE);
        expect(r.$_get(0)).assertEqual(251);
        expect(r.$_get(1)).assertEqual(239);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([255, 255, 255]), util.Type.BASIC_URL_SAFE);
        expect(r.$_get(0)).assertEqual(95);
        expect(r.$_get(1)).assertEqual(95);
        expect(r.$_get(2)).assertEqual(95);
        expect(r.$_get(3)).assertEqual(95);

      }
      {
        let b64 = new util.Base64Helper();
        let s = b64.encodeToStringSync(new Uint8Array([104, 105, 106]), util.Type.BASIC_URL_SAFE);
        expect(s).assertEqual("aGlq");

      }
      {
        let b6414 = new util.Base64Helper();
        let src14 = new Uint8Array([251, 239, 255]);
        let enc14 = b6414.encodeSync(src14, util.Type.BASIC_URL_SAFE);
        let actual1: number = enc14.$_get(0);
        let expected1: int = 45;
        expect(actual1).assertEqual(expected1);
        let actual2: number = enc14.$_get(3);
        let expected2: int = 95;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6422 = new util.Base64Helper();
        let dec22 = b6422.decodeSync('--__', util.Type.BASIC_URL_SAFE);
        let actual1: number = dec22.$_get(0);
        let expected1: int = 251;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec22.$_get(2);
        let expected2: int = 255;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6426 = new util.Base64Helper();
        let src26 = new Uint8Array([251, 239, 255]);
        let str26 = b6426.encodeToStringSync(src26, util.Type.BASIC_URL_SAFE);
        expect(str26).assertEqual('--__');

      }
      {
        let b6466 = new util.Base64Helper();
        let e66 = b6466.encodeSync(new Uint8Array([102, 111, 111]));
        let d66a = b6466.decodeSync('YWJj');
        let e66b = b6466.encodeSync(new Uint8Array([251, 239, 255]), util.Type.BASIC_URL_SAFE);
        let d66b = b6466.decodeSync('Zm9v');
        let actual1: number = e66.$_get(0);
        let expected1: int = 90;
        expect(actual1).assertEqual(expected1);
        let actual2: number = d66a.$_get(2);
        let expected2: int = 99;
        expect(actual2).assertEqual(expected2);
        let actual3: number = e66b.$_get(0);
        let expected3: int = 45;
        expect(actual3).assertEqual(expected3);
        let actual4: number = d66b.$_get(2);
        let expected4: int = 111;
        expect(actual4).assertEqual(expected4);

      }
      {
        let b6470 = new util.Base64Helper();
        let src70 = new Uint8Array([251, 239, 255]);
        let url70 = b6470.encodeSync(src70, util.Type.BASIC_URL_SAFE);
        let basic70 = b6470.encodeSync(src70);
        let actual1: number = url70.$_get(0);
        let expected1: int = 45;
        expect(actual1).assertEqual(expected1);
        let actual2: number = basic70.$_get(0);
        let expected2: int = 43;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6471 = new util.Base64Helper();
        let src71 = new Uint8Array([255, 255, 255]);
        let basic71 = b6471.encodeSync(src71);
        let url71 = b6471.encodeSync(src71, util.Type.BASIC_URL_SAFE);
        let actual1: number = basic71.$_get(0);
        let expected1: int = 47;
        expect(actual1).assertEqual(expected1);
        let actual2: number = url71.$_get(0);
        let expected2: int = 95;
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_0400
     * @tc.name testB64CtorBoundary001
     * @tc.desc Verify Base64Helper constructor and instance methods with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array(0));
        let actual1: number = r.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let actual1: string = b64.encodeToStringSync(new Uint8Array(0));
        let expected1: string = '';
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync(new Uint8Array(0));
        let actual1: number = r.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync('A');
        expect(r.byteLength).assertEqual(0);

      }
      {
        let b649 = new util.Base64Helper();
        let src9 = new Uint8Array(0);
        let enc9 = b649.encodeSync(src9);
        let actual1: int = enc9.byteLength;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6424 = new util.Base64Helper();
        let dec24 = b6424.decodeSync('');
        let actual1: int = dec24.byteLength;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6427 = new util.Base64Helper();
        let src27 = new Uint8Array(0);
        let str27 = b6427.encodeToStringSync(src27);
        expect(str27).assertEqual('');

      }
      {
        let b6467 = new util.Base64Helper();
        let e67a = b6467.encodeSync(new Uint8Array(0));
        let e67b = b6467.encodeSync(new Uint8Array([115, 49, 51]));
        let actual1: int = e67a.byteLength;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: number = e67b.$_get(0);
        let expected2: int = 99;
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_0500
     * @tc.name testB64CtorConsistency001
     * @tc.desc Verify Base64Helper constructor and instance methods result consistency and aliasing behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let input: Uint8Array = new Uint8Array([115, 49, 51]);
        let b64 = new util.Base64Helper();
        b64.encodeSync(input);
        let actual1: number = input.$_get(2);
        let expected1: int = 51;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6452 = new util.Base64Helper();
        let src52 = new Uint8Array([115, 49, 51]);
        b6452.encodeSync(src52);
        let actual1: number = src52.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6454 = new util.Base64Helper();
        let src54 = new Uint8Array([115, 49, 51]);
        let enc54 = b6454.encodeSync(src54);
        enc54.$_set(0, 0);
        let actual1: number = src54.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6455 = new util.Base64Helper();
        let src55 = new Uint8Array([115, 49, 51]);
        let enc55 = b6455.encodeSync(src55);
        src55.$_set(0, 0);
        let actual1: number = enc55.$_get(0);
        let expected1: int = 99;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6456 = new util.Base64Helper();
        let src56 = new Uint8Array([115, 49, 51]);
        b6456.encodeSync(src56);
        b6456.encodeSync(src56);
        let actual1: number = src56.$_get(2);
        let expected1: int = 51;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6457 = new util.Base64Helper();
        let src57 = new Uint8Array([115, 49, 51]);
        b6457.encodeToStringSync(src57);
        let actual1: number = src57.$_get(1);
        let expected1: int = 49;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6486 = new util.Base64Helper();
        let def86: Uint8Array = b6486.decodeSync('czEz');
        let basic86: Uint8Array = b6486.decodeSync('czEz', util.Type.BASIC);
        let actual1: number = def86.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);
        let actual2: number = basic86.$_get(0);
        let expected2: int = 115;
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_0600
     * @tc.name testB64CtorBasic001
     * @tc.desc Verify Base64Helper constructor and instance methods with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([115, 49, 51]));
        let actual1: number = r.length;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);

      }
      {
        let r = new util.Base64Helper().encodeSync(new Uint8Array([115, 49, 51]));
        let actual1: number = r.$_get(3);
        let expected1: int = 122;
        expect(actual1).assertEqual(expected1);

      }
      {
        let inst = createCodec();
        let actual1: string = inst.encodeToStringSync(new Uint8Array([102, 111, 111]));
        let expected1: string = "Zm9v";
        expect(actual1).assertEqual(expected1);

      }
      {
        let count: int = 0;
        for (let i = 0; i < 5; i++) {
          let b64 = new util.Base64Helper();
          let r = b64.encodeSync(new Uint8Array([i]));
          if (r.length === 4) {
            count = count + 1;
          }
        }
        expect(count).assertEqual(5);

      }
      {
        let b64 = new util.Base64Helper();
        let s = b64.encodeToStringSync(new Uint8Array([115, 49, 51]));
        let actual1: number = s.indexOf('\r');
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([115, 49, 51]));
        let actual1: number = r.$_get(0);
        let expected1: int = 99;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(1);
        let expected2: int = 122;
        expect(actual2).assertEqual(expected2);
        let actual3: number = r.$_get(2);
        let expected3: int = 69;
        expect(actual3).assertEqual(expected3);
        let actual4: number = r.$_get(3);
        let expected4: int = 122;
        expect(actual4).assertEqual(expected4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([1]));
        let actual1: number = r.$_get(0);
        let expected1: int = 65;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(3);
        let expected2: int = 61;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([0xef, 0xbb, 0xbf]));
        let actual1: number = r.$_get(0);
        let expected1: int = 55;
        expect(actual1).assertEqual(expected1);

      }
      {
        let full: Uint8Array = new Uint8Array(256);
        for (let i = 0; i < 256; i++) {
          full.$_set(i, i);
        }
        let b64 = new util.Base64Helper();
        let actual1: number = b64.encodeSync(full).length;
        let expected1: int = 344;
        expect(actual1).assertEqual(expected1);

      }
      {
        let big: Uint8Array = new Uint8Array(1000);
        for (let i = 0; i < 1000; i++) {
          big.$_set(i, i % 256);
        }
        let b64 = new util.Base64Helper();
        let actual1: number = b64.encodeSync(big).length;
        let expected1: int = 1336;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_0700
     * @tc.name testB64CtorBasic002
     * @tc.desc Verify Base64Helper constructor and instance methods with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let actual1: string = b64.encodeToStringSync(new Uint8Array([115, 49, 51]));
        let expected1: string = "czEz";
        expect(actual1).assertEqual(expected1);

      }
      {
        let big: Uint8Array = new Uint8Array(1000);
        for (let i = 0; i < 1000; i++) {
          big.$_set(i, i & 0xff);
        }
        let b64 = new util.Base64Helper();
        let actual1: number = b64.encodeToStringSync(big).length;
        let expected1: int = 1336;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let actual1: string = b64.encodeToStringSync(new Uint8Array([1, 2]));
        let expected1: string = "AQI=";
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let actual1: string = b64.encodeToStringSync(new Uint8Array([97, 98, 0, 99]));
        let expected1: string = "YWIAYw==";
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([102, 111, 111]);
        let bytes = b64.encodeSync(src);
        let str = b64.encodeToStringSync(src);
        let actual1: number = str.length;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);
        expect(str).assertEqual('Zm9v');
        expect(bytes.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let actual1: string = b64.encodeToStringSync(new Uint8Array([0, 0, 0]));
        let expected1: string = "AAAA";
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let actual1: string = b64.encodeToStringSync(new Uint8Array([97, 98, 99]));
        let expected1: string = "YWJj";
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("czEz");
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
        let r = b64.decodeSync(new Uint8Array([99, 122, 69, 122]));
        let actual1: number = r.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("Zg==");
        let actual1: number = r.$_get(0);
        let expected1: int = 102;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_0800
     * @tc.name testB64CtorBasic003
     * @tc.desc Verify Base64Helper constructor and instance methods with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("Zm8=");
        let actual1: number = r.$_get(1);
        let expected1: int = 111;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("Zm9v");
        let actual1: number = r.$_get(2);
        let expected1: int = 111;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("AAAA");
        let actual1: number = r.$_get(0);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("77u/");
        let actual1: number = r.$_get(0);
        let expected1: int = 239;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.$_get(2);
        let expected2: int = 191;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("aGVsbG8=");
        let actual1: number = r.$_get(4);
        let expected1: int = 111;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("AA==");
        let actual1: number = r.$_get(0);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("YQ==");
        let actual1: number = r.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("AQID");
        let actual1: number = r.$_get(2);
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let dec = b64.decodeSync("czEz");
        let enc = b64.encodeToStringSync(dec);
        expect(enc).assertEqual("czEz");

      }
      {
        let a = new util.Base64Helper();
        let b = new util.Base64Helper();
        let enc = a.encodeSync(new Uint8Array([115, 49, 51]));
        let dec = b.decodeSync(enc);
        let actual1: number = dec.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_0900
     * @tc.name testB64CtorBasic004
     * @tc.desc Verify Base64Helper constructor and instance methods with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let s = b64.encodeToStringSync(new Uint8Array([102, 111, 111]));
        let dec = b64.decodeSync(s);
        let actual1: number = dec.$_get(2);
        let expected1: int = 111;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let first = b64.encodeToStringSync(new Uint8Array([99, 122, 69, 122]));
        expect(first).assertEqual("Y3pFeg==");

      }
      {
        let b64 = new util.Base64Helper();
        let ra = b64.encodeSync(new Uint8Array([1, 2, 3]));
        let rb = b64.encodeSync(new Uint8Array([4, 5, 6]));
        let actual1: number = ra.$_get(3);
        let expected1: int = 68;
        expect(actual1).assertEqual(expected1);
        let actual2: number = rb.$_get(3);
        let expected2: int = 71;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        for (let i = 0; i < 3; i++) {
          let enc = b64.encodeSync(new Uint8Array([i + 1, i + 2, i + 3]));
          let dec = b64.decodeSync(enc);
          expect(dec.$_get(0)).assertEqual(i + 1);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let decodedTwoBytes = b64.decodeSync("Zg==");
        let decodedFourBytes = b64.decodeSync("Zm9v");
        let actual1: number = decodedTwoBytes.$_get(0);
        let expected1: int = 102;
        expect(actual1).assertEqual(expected1);
        let actual2: number = decodedFourBytes.$_get(2);
        let expected2: int = 111;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let dec = b64.decodeSync("YWI=");
        let enc = b64.encodeSync(dec);
        let actual1: number = enc.$_get(0);
        let expected1: int = 89;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let encoded: string = b64.encodeToStringSync(new Uint8Array([1, 2, 3]));
        let fromString = b64.decodeSync(encoded);
        let fromLiteral = b64.decodeSync("AQID");
        expect(fromString.$_get(0)).assertEqual(1);
        expect(fromLiteral.$_get(0)).assertEqual(1);

      }
      {
        let b64 = new util.Base64Helper();
        let s = b64.encodeToStringSync(new Uint8Array([104, 101, 108, 108, 111]));
        let r = b64.encodeSync(new Uint8Array([115, 49, 51]));
        let actual1: number = s.length;
        let expected1: int = 8;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r.length;
        let expected2: int = 4;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b64 = new util.Base64Helper();
        let actual1: number = useCodec(b64);
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("!!not-base64!!");
        expect(r.byteLength).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_1000
     * @tc.name testB64CtorBasic005
     * @tc.desc Verify Base64Helper constructor and instance methods with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorBasic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("c zEz");
        expect(r.byteLength).assertEqual(3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.decodeSync("Ymlu", util.Type.BASIC);
        expect(r.$_get(0)).assertEqual(98);
        expect(r.$_get(1)).assertEqual(105);
        expect(r.$_get(2)).assertEqual(110);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        expect(r.$_get(0)).assertEqual(99);
        expect(r.$_get(1)).assertEqual(122);
        expect(r.$_get(2)).assertEqual(69);
        expect(r.$_get(3)).assertEqual(122);

      }
      {
        let b6420 = new util.Base64Helper();
        let dec20 = b6420.decodeSync('YWI=');
        let actual1: number = dec20.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec20.$_get(1);
        let expected2: int = 98;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6425 = new util.Base64Helper();
        let src25 = new Uint8Array([115, 49, 51]);
        let str25 = b6425.encodeToStringSync(src25);
        expect(str25).assertEqual('czEz');

      }
      {
          let b6428 = new util.Base64Helper();
          let src28 = new Uint8Array([115, 49, 51]);
          let val = await b6428.encode(src28);
          let actual1: number = val.$_get(0);
          let expected1: int = 99;
          expect(actual1).assertEqual(expected1);

      }
      {
          let b6429 = new util.Base64Helper();
          let val = await b6429.decode('czEz');
          let actual1: number = val.$_get(0);
          let expected1: int = 115;
          expect(actual1).assertEqual(expected1);

      }
      {
          let b6430 = new util.Base64Helper();
          let src30 = new Uint8Array([115, 49, 51]);
          let val = await b6430.encodeToString(src30);
          expect(val).assertEqual('czEz');

      }
      {
        let b6432 = new util.Base64Helper();
        let src32 = new Uint8Array([104, 101, 108, 108, 111]);
        let enc32 = b6432.encodeSync(src32);
        let dec32 = b6432.decodeSync(enc32);
        let actual1: number = enc32.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec32.$_get(4);
        let expected2: int = 111;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6433 = new util.Base64Helper();
        let dec33 = b6433.decodeSync('TWFu');
        let enc33 = b6433.encodeSync(dec33);
        let actual1: number = enc33.$_get(0);
        let expected1: int = 84;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_1100
     * @tc.name testB64CtorBasic006
     * @tc.desc Verify Base64Helper constructor and instance methods with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorBasic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b6434 = new util.Base64Helper();
        let src34 = new Uint8Array([228, 189, 160]);
        let str34 = b6434.encodeToStringSync(src34);
        let dec34 = b6434.decodeSync(str34);
        expect(str34).assertEqual('5L2g');
        let actual1: number = dec34.$_get(1);
        let expected1: int = 189;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6435 = new util.Base64Helper();
        let dec35 = b6435.decodeSync('czEz');
        let enc35 = b6435.encodeSync(dec35);
        let actual1: number = enc35.$_get(0);
        let expected1: int = 99;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6436 = new util.Base64Helper();
        let src36 = new Uint8Array([239, 187, 191]);
        let enc36 = b6436.encodeSync(src36);
        let dec36 = b6436.decodeSync(enc36);
        let actual1: number = dec36.$_get(0);
        let expected1: int = 239;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec36.$_get(2);
        let expected2: int = 191;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6437 = new util.Base64Helper();
        let src37 = new Uint8Array([97, 98, 0, 99]);
        let enc37 = b6437.encodeSync(src37);
        let actual1: number = enc37.$_get(0);
        let expected1: int = 89;
        expect(actual1).assertEqual(expected1);
        let actual2: number = enc37.$_get(2);
        let expected2: int = 73;
        expect(actual2).assertEqual(expected2);
        let actual3: number = enc37.$_get(5);
        let expected3: int = 119;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b6438 = new util.Base64Helper();
        let dec38 = b6438.decodeSync('YWIAYw=');
        let actual1: number = dec38.$_get(2);
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec38.$_get(3);
        let expected2: int = 99;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6439 = new util.Base64Helper();
        let dec39a = b6439.decodeSync('czEz');
        let dec39b = b6439.decodeSync(new Uint8Array([99, 122, 69, 122]));
        let actual1: number = dec39a.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec39b.$_get(0);
        let expected2: int = 115;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6440 = new util.Base64Helper();
        let src40 = new Uint8Array([115, 49, 51]);
        let enc40 = b6440.encodeSync(src40);
        let actual1: int = enc40.byteLength;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6446 = new util.Base64Helper();
        let src46 = new Uint8Array([115, 49, 51]);
        let str46 = b6446.encodeToStringSync(src46);
        let actual1: int = str46.length;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6447 = new util.Base64Helper();
        let dec47 = b6447.decodeSync('czEz');
        let actual1: int = dec47.byteLength;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6448 = new util.Base64Helper();
        let dec48 = b6448.decodeSync('YQ==');
        let actual1: int = dec48.byteLength;
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_1200
     * @tc.name testB64CtorBasic007
     * @tc.desc Verify Base64Helper constructor and instance methods with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorBasic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b6449 = new util.Base64Helper();
        let dec49 = b6449.decodeSync('AAAA');
        let actual1: int = dec49.byteLength;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6451 = new util.Base64Helper();
        let src51 = new Uint8Array([115, 49, 51]);
        let dec51 = b6451.decodeSync(b6451.encodeSync(src51));
        let actual1: int = dec51.byteLength;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6453 = new util.Base64Helper();
        let src53 = new Uint8Array([115, 49, 51]);
        let enc53 = b6453.encodeSync(src53);
        let actual1: int = src53.byteLength;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: int = enc53.byteLength;
        let expected2: int = 4;
        expect(actual2).assertEqual(expected2);
        let actual3: number = enc53.$_get(0);
        let expected3: int = 99;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b6459 = new util.Base64Helper();
        let dec59 = b6459.decodeSync('czEz');
        let actual1: int = dec59.byteOffset;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b6460 = new util.Base64Helper();
        let dec60 = b6460.decodeSync('czEz');
        let actual1: int = dec60.byteLength;
        let expected1: int = 3;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec60.$_get(0);
        let expected2: int = 115;
        expect(actual2).assertEqual(expected2);
        let actual3: number = dec60.$_get(1);
        let expected3: int = 49;
        expect(actual3).assertEqual(expected3);
        let actual4: number = dec60.$_get(2);
        let expected4: int = 51;
        expect(actual4).assertEqual(expected4);

      }
      {
        let b6461 = new util.Base64Helper();
        let src61 = new Uint8Array([115, 49, 51]);
        let enc61 = b6461.encodeSync(src61);
        let actual1: int = enc61.byteLength;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);
        let actual2: number = enc61.$_get(0);
        let expected2: int = 99;
        expect(actual2).assertEqual(expected2);
        let actual3: number = enc61.$_get(1);
        let expected3: int = 122;
        expect(actual3).assertEqual(expected3);
        let actual4: number = enc61.$_get(2);
        let expected4: int = 69;
        expect(actual4).assertEqual(expected4);
        let actual5: number = enc61.$_get(3);
        let expected5: int = 122;
        expect(actual5).assertEqual(expected5);

      }
      {
        let b6463 = new util.Base64Helper();
        let src63 = new Uint8Array([115, 49, 51]);
        let enc63 = b6463.encodeSync(src63);
        let dec63 = b6463.decodeSync(enc63);
        let actual1: number = dec63.$_get(0);
        let expected1: int = 115;
        expect(actual1).assertEqual(expected1);
        let actual2: number = dec63.$_get(2);
        let expected2: int = 51;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6464 = new util.Base64Helper();
        let e64a = b6464.encodeSync(new Uint8Array([97]));
        let e64b = b6464.encodeSync(new Uint8Array([104, 105]));
        let e64c = b6464.encodeSync(new Uint8Array([77, 97, 110]));
        let actual1: number = e64a.$_get(0);
        let expected1: int = 89;
        expect(actual1).assertEqual(expected1);
        let actual2: number = e64b.$_get(0);
        let expected2: int = 97;
        expect(actual2).assertEqual(expected2);
        let actual3: number = e64c.$_get(0);
        let expected3: int = 84;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b6465 = new util.Base64Helper();
        let d65a = b6465.decodeSync('YQ==');
        let d65b = b6465.decodeSync('aGk=');
        let d65c = b6465.decodeSync('TWFu');
        let actual1: number = d65a.$_get(0);
        let expected1: int = 97;
        expect(actual1).assertEqual(expected1);
        let actual2: number = d65b.$_get(0);
        let expected2: int = 104;
        expect(actual2).assertEqual(expected2);
        let actual3: number = d65c.$_get(2);
        let expected3: int = 110;
        expect(actual3).assertEqual(expected3);

      }
      {
        let c1 = new util.Base64Helper();
        let c2 = new util.Base64Helper();
        let r69a = c1.encodeSync(new Uint8Array([115, 49, 51]));
        let r69b = c2.encodeSync(new Uint8Array([97]));
        let actual1: number = r69a.$_get(0);
        let expected1: int = 99;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r69b.$_get(0);
        let expected2: int = 89;
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_CONSTRUCTOR_1300
     * @tc.name testB64CtorBasic008
     * @tc.desc Verify Base64Helper constructor and instance methods with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64CtorBasic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let b6472 = new util.Base64Helper();
          let src72 = new Uint8Array([115, 49, 51]);
          let sync72 = b6472.encodeToStringSync(src72);
          let val = await b6472.encode(src72);
          expect(sync72).assertEqual('czEz');
          let actual1: number = val.$_get(0);
          let expected1: int = 99;
          expect(actual1).assertEqual(expected1);

      }
      {
        let b6474 = new util.Base64Helper();
        let big74 = new Uint8Array(1024);
        let str74 = b6474.encodeToStringSync(big74);
        let small74 = b6474.encodeSync(new Uint8Array([77, 97, 110]));
        let actual1: int = str74.length;
        let expected1: int = 1368;
        expect(actual1).assertEqual(expected1);
        let actual2: number = small74.$_get(0);
        let expected2: int = 84;
        expect(actual2).assertEqual(expected2);

      }
      {
        let b6475 = new util.Base64Helper();
        let src75 = new Uint8Array([115, 49, 51]);
        let e75a = b6475.encodeSync(src75);
        let e75b = b6475.encodeSync(src75);
        let actual1: int = e75a.byteLength;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);
        let actual2: number = e75b.$_get(0);
        let expected2: int = 99;
        expect(actual2).assertEqual(expected2);

      }
    });

  });
}
