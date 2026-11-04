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

export default function Base64HelperEncodeTest(): void {
  describe('Base64HelperEncodeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_0100
     * @tc.name testB64EncodeThrows001
     * @tc.desc Verify Base64Helper encode and encodeSync throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let b64 = new util.Base64Helper();
          try {
            await b64.encode(new Uint8Array([7]), util.Type.MIME_URL_SAFE);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual("BusinessError");
            expect(e.code).assertEqual(401);
          }

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([9, 10, 11]);
          try {
            await b64.encode(src, util.Type.MIME);
            expect().assertFail();
          } catch (e) {
            let actual1: number = src.$_get(0);
            let expected1: int = 9;
            expect(actual1).assertEqual(expected1);
            let actual2: number = src.$_get(2);
            let expected2: int = 11;
            expect(actual2).assertEqual(expected2);
            expect(e.name).assertEqual("BusinessError");
            expect(e.code).assertEqual(401);
          }

      }
      {
          let b64 = new util.Base64Helper();
          try {
            await b64.encode(new Uint8Array([115, 49, 51]), util.Type.MIME);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
            expect(e.code).assertEqual(401);
          }

      }
      {
          let b64 = new util.Base64Helper();
          try {
            await b64.encode(new Uint8Array([251, 239]), util.Type.MIME_URL_SAFE);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
            expect(e.code).assertEqual(401);
          }

      }
      {
          let b64 = new util.Base64Helper();
          try {
            await b64.encode(new Uint8Array([1, 2, 3]), util.Type.MIME);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
            expect(e.code).assertEqual(401);
          }
          try {
            await b64.encode(new Uint8Array([4, 5, 6]), util.Type.MIME);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
            expect(e.code).assertEqual(401);
          }

      }
      {
          let src: Uint8Array = new Uint8Array([115, 49, 51]);
          let b64 = new util.Base64Helper();
          try {
            await b64.encode(src, util.Type.MIME);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
            expect(e.code).assertEqual(401);
          }

      }
      {
          let b64 = new util.Base64Helper();
          let n: Uint8Array | null = null;
          try {
            await b64.encode(n!);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('NullPointerError');
            expect(e.code).assertEqual(0);
          }
          let val = await b64.encode(new Uint8Array([115, 49, 51]));
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 99;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let u: Uint8Array | undefined = undefined;
          try {
            await b64.encode(u!);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('NullPointerError');
            expect(e.code).assertEqual(0);
          }
          let val = await b64.encode(new Uint8Array([1, 2, 3]));
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 65;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let o: util.Type | null = null;
          try {
            await b64.encode(new Uint8Array([255]), o! as util.Type);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('NullPointerError');
            expect(e.code).assertEqual(0);
          }
          let val = await b64.encode(new Uint8Array([255]), util.Type.BASIC_URL_SAFE);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 95;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          try {
            await b64.encode(new Uint8Array([1, 2, 3]), util.Type.MIME);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
            expect(e.code).assertEqual(401);
          }
          try {
            await b64.encode(new Uint8Array([4, 5, 6]), util.Type.MIME);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
            expect(e.code).assertEqual(401);
          }
          let val = await b64.encode(new Uint8Array([0, 0, 0]));
          let fourthByte: number = val.$_get(3);
          let expectedFourthByte: int = 65;
          expect(fourthByte).assertEqual(expectedFourthByte);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_0200
     * @tc.name testB64EncodeThrows002
     * @tc.desc Verify Base64Helper encode and encodeSync throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let u: Uint8Array | undefined = undefined;
        try {
          b64.encodeSync(u!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        try {
          b64.encodeSync(new Uint8Array([251, 239]), util.Type.MIME_URL_SAFE);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(401);
        }

      }
      {
        let b64 = new util.Base64Helper();
        try {
          b64.encodeSync(new Uint8Array([1, 2, 3]), util.Type.MIME);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(401);
        }
        let r = b64.encodeSync(new Uint8Array([1, 2, 3]));
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 65;
        expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
        let b64 = new util.Base64Helper();
        try {
          b64.encodeSync(new Uint8Array([1, 2, 3]), util.Type.MIME);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(401);
        }
        try {
          b64.encodeSync(new Uint8Array([4, 5, 6]), util.Type.MIME);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(401);
        }

      }
      {
        let src: Uint8Array = new Uint8Array([115, 49, 51]);
        let b64 = new util.Base64Helper();
        try {
          b64.encodeSync(src, util.Type.MIME);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(401);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let n: Uint8Array | null = null;
        try {
          b64.encodeSync(n!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }
        let r = b64.encodeSync(new Uint8Array([115, 49, 51]));
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 99;
        expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
        let b64 = new util.Base64Helper();
        try {
          let u1: Uint8Array | undefined = undefined;
          b64.encodeSync(u1!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }
        try {
          let u2: Uint8Array | undefined = undefined;
          b64.encodeSync(u2!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let o: util.Type | null = null;
        try {
          b64.encodeSync(new Uint8Array([1, 2, 3]), o! as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }
        let r = b64.encodeSync(new Uint8Array([255]), util.Type.BASIC_URL_SAFE);
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 95;
        expect(firstByte).assertEqual(expectedFirstByte);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_0300
     * @tc.name testB64EncodeUrlSafe001
     * @tc.desc Verify Base64Helper encode and encodeSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeUrlSafe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array(0), util.Type.BASIC_URL_SAFE);
          let actual1: int = val.length;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([254, 255]), util.Type.BASIC_URL_SAFE);
          let actual1: number = val.$_get(0);
          let expected1: int = 95;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 118;
          expect(actual2).assertEqual(expected2);
          let actual3: int = val.length;
          let expected3: int = 3;
          expect(actual3).assertEqual(expected3);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([240, 159, 152, 128]), util.Type.BASIC_URL_SAFE);
          let actual1: number = val.$_get(0);
          let expected1: int = 56;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 74;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 45;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(3);
          let expected4: int = 89;
          expect(actual4).assertEqual(expected4);
          let actual5: number = val.$_get(4);
          let expected5: int = 103;
          expect(actual5).assertEqual(expected5);
          let actual6: number = val.$_get(5);
          let expected6: int = 65;
          expect(actual6).assertEqual(expected6);

      }
      {
          let full: Uint8Array = new Uint8Array(256);
          for (let i = 0; i < 256; i++) {
            full.$_set(i, i);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(full, util.Type.BASIC_URL_SAFE);
          for (let i = 0; i < val.length; i++) {
            let c: int = val.$_get(i).toInt();
            let inUrlSafeAlphabet: boolean =
              (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || (c >= 48 && c <= 57) || c === 45 || c === 95;
            expect(inUrlSafeAlphabet).assertTrue();
          }

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([251, 239]);
        let syncR = b64.encodeSync(src, util.Type.BASIC_URL_SAFE);
        let val = await b64.encode(src, util.Type.BASIC_URL_SAFE);
        let firstByte: number = val.$_get(0);
        let expectedFirstByte: number = syncR.$_get(0);
        expect(firstByte).assertEqual(expectedFirstByte);
        let thirdByte: number = val.$_get(2);
        let expectedThirdByte: number = syncR.$_get(2);
        expect(thirdByte).assertEqual(expectedThirdByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([115, 49, 51]), util.Type.BASIC_URL_SAFE);
          let outLen: int = val.length;
          let expectedOutLen: int = 4;
          expect(outLen).assertEqual(expectedOutLen);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 99;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([0xef, 0xbb, 0xbf]), util.Type.BASIC_URL_SAFE);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 55;
          expect(firstByte).assertEqual(expectedFirstByte);
          let secondByte: number = val.$_get(1);
          let expectedSecondByte: int = 55;
          expect(secondByte).assertEqual(expectedSecondByte);
          let fourthByte: number = val.$_get(3);
          let expectedFourthByte: int = 95;
          expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
          let big: Uint8Array = new Uint8Array(100);
          for (let i = 0; i < 100; i++) {
            big.$_set(i, i & 0xff);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(big, util.Type.BASIC_URL_SAFE);
          for (let i = 0; i < val.length; i++) {
            let c: int = val.$_get(i).toInt();
            let isBadChar: boolean = (c === 43 || c === 47);
            expect(isBadChar).assertFalse();
          }
          let outLen: int = val.length;
          let expectedOutLen: int = 134;
          expect(outLen).assertEqual(expectedOutLen);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([115, 49, 51]);
          let val = await b64.encode(src, util.Type.BASIC_URL_SAFE);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 99;
          expect(firstByte).assertEqual(expectedFirstByte);
          let secondByte: number = val.$_get(1);
          let expectedSecondByte: int = 122;
          expect(secondByte).assertEqual(expectedSecondByte);
          let thirdByte: number = val.$_get(2);
          let expectedThirdByte: int = 69;
          expect(thirdByte).assertEqual(expectedThirdByte);
          let fourthByte: number = val.$_get(3);
          let expectedFourthByte: int = 122;
          expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([251, 239]);
          let syncR = b64.encodeSync(src, util.Type.BASIC_URL_SAFE);
          let val = await b64.encode(src, util.Type.BASIC_URL_SAFE);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: number = syncR.$_get(0);
          expect(firstByte).assertEqual(expectedFirstByte);
          let outLen: int = val.length;
          let expectedOutLen: int = 3;
          expect(outLen).assertEqual(expectedOutLen);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_0400
     * @tc.name testB64EncodeUrlSafe002
     * @tc.desc Verify Base64Helper encode and encodeSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeUrlSafe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([251, 239]);
          let a = await b64.encode(src, util.Type.BASIC);
          let b = await b64.encode(src, util.Type.BASIC_URL_SAFE);
          let aOutLen: int = a.length;
          let expectedAOutLen: int = 4;
          expect(aOutLen).assertEqual(expectedAOutLen);
          let bOutLen: int = b.length;
          let expectedBOutLen: int = 3;
          expect(bOutLen).assertEqual(expectedBOutLen);

      }
      {
          let full: Uint8Array = new Uint8Array(256);
          for (let i = 0; i < 256; i++) {
            full.$_set(i, i);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(full, util.Type.BASIC_URL_SAFE);
          for (let i = 0; i < val.length; i++) {
            let c: int = val.$_get(i).toInt();
            let isUrlSafeChar: boolean = (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || (c >= 48 && c <= 57) || c === 45 || c === 95 || c === 61;
            expect(isUrlSafeChar).assertTrue();
          }
          let outLen: int = val.length;
          let expectedOutLen: int = 342;
          expect(outLen).assertEqual(expectedOutLen);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array(0), util.Type.BASIC_URL_SAFE);
          let outLen: int = val.length;
          let expectedOutLen: int = 0;
          expect(outLen).assertEqual(expectedOutLen);
          expect(val.toString()).assertEqual('');

      }
      {
          let buf: Uint8Array = new Uint8Array([1, 2, 3, 4, 5]);
          let b64 = new util.Base64Helper();
          let val = await b64.encode(buf.subarray(3, 3), util.Type.BASIC_URL_SAFE);
          let outLen: int = val.length;
          let expectedOutLen: int = 0;
          expect(outLen).assertEqual(expectedOutLen);
          expect(val.toString()).assertEqual('');

      }
      {
          let s: Uint8Array = new Uint8Array(6);
          for (let i = 0; i < 6; i++) {
            s.$_set(i, 255);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(s, util.Type.BASIC_URL_SAFE);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 95;
          expect(firstByte).assertEqual(expectedFirstByte);
          let eighthByte: number = val.$_get(7);
          let expectedEighthByte: int = 95;
          expect(eighthByte).assertEqual(expectedEighthByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([251]), util.Type.BASIC_URL_SAFE);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 45;
          expect(firstByte).assertEqual(expectedFirstByte);
          let outLen: int = val.length;
          let expectedOutLen: int = 2;
          expect(outLen).assertEqual(expectedOutLen);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([251, 239]), util.Type.BASIC_URL_SAFE);
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 45;
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = r.$_get(1);
        let expectedSecondByte: int = 45;
        expect(secondByte).assertEqual(expectedSecondByte);
        expect(r.$_get(2)).assertEqual(56);
        let outLen: int = r.length;
        let expectedOutLen: int = 3;
        expect(outLen).assertEqual(expectedOutLen);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([0xe2, 0x98, 0x83]), util.Type.BASIC_URL_SAFE);
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 52;
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = r.$_get(1);
        let expectedSecondByte: int = 112;
        expect(secondByte).assertEqual(expectedSecondByte);
        let thirdByte: number = r.$_get(2);
        let expectedThirdByte: int = 105;
        expect(thirdByte).assertEqual(expectedThirdByte);
        let fourthByte: number = r.$_get(3);
        let expectedFourthByte: int = 68;
        expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([251, 62, 255, 224, 1, 128]), util.Type.BASIC_URL_SAFE);
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 45;
        expect(firstByte).assertEqual(expectedFirstByte);
        let thirdByte: number = r.$_get(2);
        let expectedThirdByte: int = 55;
        expect(thirdByte).assertEqual(expectedThirdByte);
        let fourthByte: number = r.$_get(3);
        let expectedFourthByte: int = 95;
        expect(fourthByte).assertEqual(expectedFourthByte);
        let eighthByte: number = r.$_get(7);
        let expectedEighthByte: int = 65;
        expect(eighthByte).assertEqual(expectedEighthByte);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, i & 0xff);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(big, util.Type.BASIC_URL_SAFE);
        for (let i = 0; i < r.length; i++) {
          let c: int = (r.$_get(i)).toInt();
          let isBadChar: boolean = (c === 43 || c === 47);
        expect(r.length).assertEqual(134);
          expect(isBadChar).assertFalse();
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_0500
     * @tc.name testB64EncodeUrlSafe003
     * @tc.desc Verify Base64Helper encode and encodeSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeUrlSafe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let full: Uint8Array = new Uint8Array(256);
        for (let i = 0; i < 256; i++) {
          full.$_set(i, i);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(full, util.Type.BASIC_URL_SAFE);
        for (let i = 0; i < r.length; i++) {
          let c: int = (r.$_get(i)).toInt();
          let isUrlSafeChar: boolean = (c >= 65 && c <= 90) || (c >= 97 && c <= 122) || (c >= 48 && c <= 57) || c === 45 || c === 95 || c === 61;
        expect(r.length).assertEqual(342);
          expect(isUrlSafeChar).assertTrue();
        }

      }
      {
        let b64 = new util.Base64Helper();
        let a = b64.encodeSync(new Uint8Array([251, 239]), util.Type.BASIC);
        let b = b64.encodeSync(new Uint8Array([251, 239]), util.Type.BASIC_URL_SAFE);
        let aOutLen: int = a.length;
        let expectedAOutLen: int = 4;
        expect(aOutLen).assertEqual(expectedAOutLen);
        let bOutLen: int = b.length;
        let expectedBOutLen: int = 3;
        expect(bOutLen).assertEqual(expectedBOutLen);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([0xef, 0xbb, 0xbf]), util.Type.BASIC_URL_SAFE);
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 55;
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = r.$_get(1);
        let expectedSecondByte: int = 55;
        expect(secondByte).assertEqual(expectedSecondByte);
        let fourthByte: number = r.$_get(3);
        let expectedFourthByte: int = 95;
        expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
        let src: Uint8Array = new Uint8Array([104, 101, 108, 108, 111, 33]);
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(src, util.Type.BASIC_URL_SAFE);
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 97;
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = r.$_get(1);
        let expectedSecondByte: int = 71;
        expect(secondByte).assertEqual(expectedSecondByte);
        let thirdByte: number = r.$_get(2);
        let expectedThirdByte: int = 86;
        expect(thirdByte).assertEqual(expectedThirdByte);
        let fourthByte: number = r.$_get(3);
        let expectedFourthByte: int = 115;
        expect(fourthByte).assertEqual(expectedFourthByte);
        let fifthByte: number = r.$_get(4);
        let expectedFifthByte: int = 98;
        expect(fifthByte).assertEqual(expectedFifthByte);
        let sixthByte: number = r.$_get(5);
        let expectedSixthByte: int = 71;
        expect(sixthByte).assertEqual(expectedSixthByte);
        let seventhByte: number = r.$_get(6);
        let expectedSeventhByte: int = 56;
        expect(seventhByte).assertEqual(expectedSeventhByte);
        let eighthByte: number = r.$_get(7);
        let expectedEighthByte: int = 104;
        expect(eighthByte).assertEqual(expectedEighthByte);

      }
      {
        let b64 = new util.Base64Helper();
        let enc = b64.encodeSync(new Uint8Array([251, 239]), util.Type.BASIC_URL_SAFE);
        let dec = b64.decodeSync(enc, util.Type.BASIC_URL_SAFE);
        let firstByte: number = dec.$_get(0);
        let expectedFirstByte: int = 251;
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = dec.$_get(1);
        let expectedSecondByte: int = 239;
        expect(secondByte).assertEqual(expectedSecondByte);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([255]), util.Type.BASIC_URL_SAFE);
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 95;
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = r.$_get(1);
        let expectedSecondByte: int = 119;
        expect(secondByte).assertEqual(expectedSecondByte);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array(0), util.Type.BASIC_URL_SAFE);
        let outLen: int = r.length;
        let expectedOutLen: int = 0;
        expect(outLen).assertEqual(expectedOutLen);
        expect(r.toString()).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array([62]), util.Type.BASIC_URL_SAFE);
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 80;
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = r.$_get(1);
        let expectedSecondByte: int = 103;
        expect(secondByte).assertEqual(expectedSecondByte);
        let outLen: int = r.length;
        let expectedOutLen: int = 2;
        expect(outLen).assertEqual(expectedOutLen);

      }
      {
        let s: Uint8Array = new Uint8Array(6);
        for (let i = 0; i < 6; i++) {
          s.$_set(i, 255);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(s, util.Type.BASIC_URL_SAFE);
        let firstByte: number = r.$_get(0);
        let expectedFirstByte: int = 95;
        expect(firstByte).assertEqual(expectedFirstByte);
        let eighthByte: number = r.$_get(7);
        let expectedEighthByte: int = 95;
        expect(eighthByte).assertEqual(expectedEighthByte);

      }
      {
        let b64 = new util.Base64Helper();
        let a = b64.encodeSync(new Uint8Array([0]), util.Type.BASIC);
        let b = b64.encodeSync(new Uint8Array([0]), util.Type.BASIC_URL_SAFE);
        let aFirstByte: number = a.$_get(0);
        let expectedAFirstByte: int = 65;
        expect(aFirstByte).assertEqual(expectedAFirstByte);
        let bFirstByte: number = b.$_get(0);
        let expectedBFirstByte: int = 65;
        expect(bFirstByte).assertEqual(expectedBFirstByte);
        let outLen: int = b.length;
        let expectedOutLen: int = 2;
        expect(outLen).assertEqual(expectedOutLen);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_0600
     * @tc.name testB64EncodeUrlSafe004
     * @tc.desc Verify Base64Helper encode and encodeSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeUrlSafe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let a = b64.encodeSync(new Uint8Array([251, 251, 251]), util.Type.BASIC);
        let b = b64.encodeSync(new Uint8Array([251, 251, 251]), util.Type.BASIC_URL_SAFE);
        let aFirstByte: number = a.$_get(0);
        let expectedAFirstByte: int = 43;
        expect(aFirstByte).assertEqual(expectedAFirstByte);
        let bFirstByte: number = b.$_get(0);
        let expectedBFirstByte: int = 45;
        expect(bFirstByte).assertEqual(expectedBFirstByte);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_0700
     * @tc.name testB64EncodeBoundary001
     * @tc.desc Verify Base64Helper encode and encodeSync with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([]));
          let actual1: int = val.length;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let b64 = new util.Base64Helper();
          let ab: ArrayBuffer = new ArrayBuffer(0);
          let val = await b64.encode(new Uint8Array(ab));
          let actual1: int = val.length;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([5, 6, 7, 8]);
          let emptyView = src.subarray(2, 2);
          let val = await b64.encode(emptyView);
          let actual1: int = val.length;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([1, 2, 3]);
          let view = src.subarray(3, 1);
          let val = await b64.encode(view);
          let actual1: int = val.length;
          let expected1: int = 0;
          expect(actual1).assertEqual(expected1);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array(0));
          let outLen: int = val.length;
          let expectedOutLen: int = 0;
          expect(outLen).assertEqual(expectedOutLen);
          let outByteLen: int = val.byteLength;
          let expectedOutByteLen: int = 0;
          expect(outByteLen).assertEqual(expectedOutByteLen);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array(0));
          let outByteLen: int = val.byteLength;
          let expectedOutByteLen: int = 0;
          expect(outByteLen).assertEqual(expectedOutByteLen);
          expect(val.length).assertEqual(0);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([Number.MAX_SAFE_INTEGER]));
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 47;
          expect(firstByte).assertEqual(expectedFirstByte);
          let secondByte: number = val.$_get(1);
          let expectedSecondByte: int = 119;
          expect(secondByte).assertEqual(expectedSecondByte);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array(0), util.Type.BASIC);
        let outLen: int = r.length;
        let expectedOutLen: int = 0;
        expect(outLen).assertEqual(expectedOutLen);
        expect(r.toString()).assertEqual("");

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeSync(new Uint8Array(0));
        let outByteLen: int = r.byteLength;
        let expectedOutByteLen: int = 0;
        expect(outByteLen).assertEqual(expectedOutByteLen);
        expect(r.length).assertEqual(0);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_0800
     * @tc.name testB64EncodeConsistency001
     * @tc.desc Verify Base64Helper encode and encodeSync result consistency and aliasing behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([115, 49, 51]);
          let a = await b64.encode(src);
          let b = await b64.encode(src, util.Type.BASIC);
          let actual1: int = a.length;
          let expected1: int = 4;
          expect(actual1).assertEqual(expected1);
          let actual1b: int = b.length;
          let expected1b: int = 4;
          expect(actual1b).assertEqual(expected1b);
          let actual2: number = a.$_get(0);
          let expected2: int = 99;
          expect(actual2).assertEqual(expected2);
          let actual3: number = a.$_get(1);
          let expected3: int = 122;
          expect(actual3).assertEqual(expected3);
          let actual4: number = a.$_get(2);
          let expected4: int = 69;
          expect(actual4).assertEqual(expected4);
          let actual5: number = a.$_get(3);
          let expected5: int = 122;
          expect(actual5).assertEqual(expected5);
          for (let i = 0; i < a.length; i++) {
            let actualSame: number = b.$_get(i);
            let expectedSame: number = a.$_get(i);
            expect(actualSame).assertEqual(expectedSame);
          }

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([115, 49, 51]);
        let syncR = b64.encodeSync(src);
        let val = await b64.encode(src);
        let firstByte: number = val.$_get(0);
        let expectedFirstByte: number = syncR.$_get(0);
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = val.$_get(1);
        let expectedSecondByte: number = syncR.$_get(1);
        expect(secondByte).assertEqual(expectedSecondByte);
        let fourthByte: number = val.$_get(3);
        let expectedFourthByte: number = syncR.$_get(3);
        expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([115, 49, 51]);
        let str = b64.encodeToStringSync(src);
        let val = await b64.encode(src);
        let firstByte: number = val.$_get(0);
        let expectedFirstByte: number = String(str).charCodeAt(0);
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = val.$_get(1);
        let expectedSecondByte: number = String(str).charCodeAt(1);
        expect(secondByte).assertEqual(expectedSecondByte);
        let fourthByte: number = val.$_get(3);
        let expectedFourthByte: number = String(str).charCodeAt(3);
        expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([115, 49, 51]);
          let val = await b64.encode(src);
          src.$_set(0, 0);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 99;
          expect(firstByte).assertEqual(expectedFirstByte);
          let outLen: int = val.length;
          let expectedOutLen: int = 4;
          expect(outLen).assertEqual(expectedOutLen);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([115, 49, 51]);
          let syncR = b64.encodeSync(src, util.Type.BASIC);
          let val = await b64.encode(src, util.Type.BASIC);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: number = syncR.$_get(0);
          expect(firstByte).assertEqual(expectedFirstByte);
          let secondByte: number = val.$_get(1);
          let expectedSecondByte: number = syncR.$_get(1);
          expect(secondByte).assertEqual(expectedSecondByte);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([115, 49, 51]);
          let str = b64.encodeToStringSync(src);
          let val = await b64.encode(src);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: number = String(str).charCodeAt(0);
          expect(firstByte).assertEqual(expectedFirstByte);
          let secondByte: number = val.$_get(1);
          let expectedSecondByte: number = String(str).charCodeAt(1);
          expect(secondByte).assertEqual(expectedSecondByte);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([115, 49, 51]);
          let val = await b64.encode(src);
          val.$_set(0, 0);
          let firstByte: number = src.$_get(0);
          let expectedFirstByte: int = 115;
          expect(firstByte).assertEqual(expectedFirstByte);
          let valLen: int = val.length;
          let expectedValLen: int = 4;
          expect(valLen).assertEqual(expectedValLen);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([-1]));
          let syncR = b64.encodeSync(new Uint8Array([-1]));
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: number = syncR.$_get(0);
          expect(firstByte).assertEqual(expectedFirstByte);
          expect(val.length).assertEqual(4);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([104, 101, 108, 108, 111]);
          let implicit = await b64.encode(src);
          let explicit = await b64.encode(src, util.Type.BASIC);
          let implicitStr: string = implicit.toString();
          let expectedImplicitStr: string = explicit.toString();
          expect(implicitStr).assertEqual(expectedImplicitStr);
          expect(implicit.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let r1 = b64.encodeSync(new Uint8Array([115, 49, 51]));
        let r2 = b64.encodeSync(new Uint8Array([115, 49, 51]));
        let isSameRef: boolean = r1 === r2;
        expect(isSameRef).assertFalse();
        expect(r1.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_0900
     * @tc.name testB64EncodeConsistency002
     * @tc.desc Verify Base64Helper encode and encodeSync result consistency and aliasing behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeConsistency002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([115, 49, 51]);
        let bytes = b64.encodeSync(src);
        let str = b64.encodeToStringSync(src);
        let firstByte: number = bytes.$_get(0);
        let expectedFirstByte: number = String(str).charCodeAt(0);
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = bytes.$_get(1);
        let expectedSecondByte: number = String(str).charCodeAt(1);
        expect(secondByte).assertEqual(expectedSecondByte);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([115, 49, 51, 52, 53]);
        let implicit = b64.encodeSync(src);
        let explicit = b64.encodeSync(src, util.Type.BASIC);
        let implicitStr: string = implicit.toString();
        let expectedImplicitStr: string = explicit.toString();
        expect(implicitStr).assertEqual(expectedImplicitStr);
        expect(implicit.length).assertEqual(8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_1000
     * @tc.name testB64EncodeBasic001
     * @tc.desc Verify Base64Helper encode and encodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([127]));
          let actual1: number = val.$_get(0);
          let expected1: int = 102;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 119;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 61;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(3);
          let expected4: int = 61;
          expect(actual4).assertEqual(expected4);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([0xef, 0xbb, 0xbf]));
          let actual1: number = val.$_get(0);
          let expected1: int = 55;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 55;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 117;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(3);
          let expected4: int = 47;
          expect(actual4).assertEqual(expected4);

      }
      {
          let b64 = new util.Base64Helper();
          let buf: Uint8Array = new Uint8Array([9, 8, 2, 3, 4, 5]);
          let view = buf.subarray(2, 6);
          let val = await b64.encode(view);
          let actual1: number = val.$_get(0);
          let expected1: int = 65;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 103;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 77;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(3);
          let expected4: int = 69;
          expect(actual4).assertEqual(expected4);
          let actual5: number = val.$_get(4);
          let expected5: int = 66;
          expect(actual5).assertEqual(expected5);
          let actual6: number = val.$_get(5);
          let expected6: int = 81;
          expect(actual6).assertEqual(expected6);
          let actual7: number = val.$_get(6);
          let expected7: int = 61;
          expect(actual7).assertEqual(expected7);
          let actual8: number = val.$_get(7);
          let expected8: int = 61;
          expect(actual8).assertEqual(expected8);

      }
      {
          let big: Uint8Array = new Uint8Array(129);
          for (let i = 0; i < 129; i++) {
            big.$_set(i, i & 0xff);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(big);
          let actual1: number = val.$_get(0);
          let expected1: int = 65;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(val.length - 1);
          let expected2: int = 65;
          expect(actual2).assertEqual(expected2);

      }
      {
          let big: Uint8Array = new Uint8Array(129);
          for (let i = 0; i < 129; i++) {
            big.$_set(i, i & 0xff);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(big);
          let actual1: int = val.length;
          let expected1: int = 172;
          expect(actual1).assertEqual(expected1);

      }
      {
          let full: Uint8Array = new Uint8Array(256);
          for (let i = 0; i < 256; i++) {
            full.$_set(i, i);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(full);
          let actual1: number = val.$_get(0);
          let expected1: int = 65;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(val.length - 3);
          let expected2: int = 119;
          expect(actual2).assertEqual(expected2);

      }
      {
          let full: Uint8Array = new Uint8Array(256);
          for (let i = 0; i < 256; i++) {
            full.$_set(i, i);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(full);
          let actual1: int = val.length;
          let expected1: int = 344;
          expect(actual1).assertEqual(expected1);

      }
      {
          let big: Uint8Array = new Uint8Array(77);
          for (let i = 0; i < 77; i++) {
            big.$_set(i, i);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(big);
          let actual1: number = val.$_get(val.length - 4);
          let expected1: int = 83;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(val.length - 3);
          let expected2: int = 48;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(val.length - 2);
          let expected3: int = 119;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(val.length - 1);
          let expected4: int = 61;
          expect(actual4).assertEqual(expected4);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([43, 47, 61, 61]), util.Type.BASIC);
          let actual1: number = val.$_get(0);
          let expected1: int = 75;
          expect(actual1).assertEqual(expected1);
          let actual2: number = val.$_get(1);
          let expected2: int = 121;
          expect(actual2).assertEqual(expected2);
          let actual3: number = val.$_get(2);
          let expected3: int = 56;
          expect(actual3).assertEqual(expected3);
          let actual4: number = val.$_get(3);
          let expected4: int = 57;
          expect(actual4).assertEqual(expected4);
          let actual5: number = val.$_get(4);
          let expected5: int = 80;
          expect(actual5).assertEqual(expected5);
          let actual6: number = val.$_get(5);
          let expected6: int = 81;
          expect(actual6).assertEqual(expected6);
          let actual7: number = val.$_get(6);
          let expected7: int = 61;
          expect(actual7).assertEqual(expected7);
          let actual8: number = val.$_get(7);
          let expected8: int = 61;
          expect(actual8).assertEqual(expected8);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([115, 49, 51]);
        let val = await b64.encode(src);
        let firstByte: number = val.$_get(0);
        let expectedFirstByte: int = 99;
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = val.$_get(1);
        let expectedSecondByte: int = 122;
        expect(secondByte).assertEqual(expectedSecondByte);
        let thirdByte: number = val.$_get(2);
        let expectedThirdByte: int = 69;
        expect(thirdByte).assertEqual(expectedThirdByte);
        let fourthByte: number = val.$_get(3);
        let expectedFourthByte: int = 122;
        expect(fourthByte).assertEqual(expectedFourthByte);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_1100
     * @tc.name testB64EncodeBasic002
     * @tc.desc Verify Base64Helper encode and encodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([255, 255, 255]);
        let val = await b64.encode(src);
        let firstByte: number = val.$_get(0);
        let expectedFirstByte: int = 47;
        expect(firstByte).assertEqual(expectedFirstByte);
        let secondByte: number = val.$_get(1);
        let expectedSecondByte: int = 47;
        expect(secondByte).assertEqual(expectedSecondByte);
        let thirdByte: number = val.$_get(2);
        let expectedThirdByte: int = 47;
        expect(thirdByte).assertEqual(expectedThirdByte);
        let fourthByte: number = val.$_get(3);
        let expectedFourthByte: int = 47;
        expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([115, 49, 51]), util.Type.BASIC);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 99;
          expect(firstByte).assertEqual(expectedFirstByte);
          let outLen: int = val.length;
          let expectedOutLen: int = 4;
          expect(outLen).assertEqual(expectedOutLen);

      }
      {
          let b64 = new util.Base64Helper();
          let src = new Uint8Array([115, 49, 51]);
          let val = await b64.encode(src);
          let isSameRef: boolean = val === src;
          expect(isSameRef).assertFalse();
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 99;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([115, 49, 51]));
          let outByteLen: int = val.byteLength;
          let expectedOutByteLen: int = 4;
          expect(outByteLen).assertEqual(expectedOutByteLen);
          let outLen: int = val.length;
          let expectedOutLen: int = 4;
          expect(outLen).assertEqual(expectedOutLen);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([104, 101, 108, 108, 111, 33]), util.Type.BASIC);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 97;
          expect(firstByte).assertEqual(expectedFirstByte);
          let fifthByte: number = val.$_get(4);
          let expectedFifthByte: int = 98;
          expect(fifthByte).assertEqual(expectedFifthByte);
          let eighthByte: number = val.$_get(7);
          let expectedEighthByte: int = 104;
          expect(eighthByte).assertEqual(expectedEighthByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([0xe2, 0x98, 0x83]), util.Type.BASIC);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 52;
          expect(firstByte).assertEqual(expectedFirstByte);
          let secondByte: number = val.$_get(1);
          let expectedSecondByte: int = 112;
          expect(secondByte).assertEqual(expectedSecondByte);
          let thirdByte: number = val.$_get(2);
          let expectedThirdByte: int = 105;
          expect(thirdByte).assertEqual(expectedThirdByte);
          let fourthByte: number = val.$_get(3);
          let expectedFourthByte: int = 68;
          expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([1]), util.Type.BASIC);
          let outLen: int = val.length;
          let expectedOutLen: int = 4;
          expect(outLen).assertEqual(expectedOutLen);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 65;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([1, 2, 3]), util.Type.BASIC);
          let outLen: int = val.length;
          let expectedOutLen: int = 4;
          expect(outLen).assertEqual(expectedOutLen);
          let lastByte: number = val.$_get(3);
          let expectedLastByte: int = 68;
          expect(lastByte).assertEqual(expectedLastByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([1, 2, 3, 4, 5, 6]), util.Type.BASIC);
          let outLen: int = val.length;
          let expectedOutLen: int = 8;
          expect(outLen).assertEqual(expectedOutLen);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 65;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let big: Uint8Array = new Uint8Array(100);
          for (let i = 0; i < 100; i++) {
            big.$_set(i, i & 0xff);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(big, util.Type.BASIC);
          let outLen: int = val.length;
          let expectedOutLen: int = 136;
          expect(outLen).assertEqual(expectedOutLen);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 65;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_1200
     * @tc.name testB64EncodeBasic003
     * @tc.desc Verify Base64Helper encode and encodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let full: Uint8Array = new Uint8Array(256);
          for (let i = 0; i < 256; i++) {
            full.$_set(i, i);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(full, util.Type.BASIC);
          let outLen: int = val.length;
          let expectedOutLen: int = 344;
          expect(outLen).assertEqual(expectedOutLen);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 65;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([7]));
          expect(val.length).assertEqual(4);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 66;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([1, 2, 3]));
          expect(val.length).assertEqual(4);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 65;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([115, 49, 51]);
          let val = await b64.encode(src, util.Type.BASIC);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 99;
          expect(firstByte).assertEqual(expectedFirstByte);
          let secondByte: number = val.$_get(1);
          let expectedSecondByte: int = 122;
          expect(secondByte).assertEqual(expectedSecondByte);
          let thirdByte: number = val.$_get(2);
          let expectedThirdByte: int = 69;
          expect(thirdByte).assertEqual(expectedThirdByte);
          let fourthByte: number = val.$_get(3);
          let expectedFourthByte: int = 122;
          expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
          let b64 = new util.Base64Helper();
          let src: Uint8Array = new Uint8Array([115, 49, 51]);
          let val = await b64.encode(src);
          let isSameBuffer: boolean = val.buffer === src.buffer;
          expect(isSameBuffer).assertFalse();
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 99;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([115, 49, 51]));
          let byteOffset: int = val.byteOffset;
          let expectedByteOffset: int = 0;
          expect(byteOffset).assertEqual(expectedByteOffset);
          let outLen: int = val.length;
          let expectedOutLen: int = 4;
          expect(outLen).assertEqual(expectedOutLen);

      }
      {
          let b64 = new util.Base64Helper();
          let buf: Uint8Array = new Uint8Array([9, 8, 2, 3, 4, 5]);
          let view = buf.subarray(2, 6);
          let val = await b64.encode(view);
          let valFirstByte: number = val.$_get(0);
          let expectedValFirstByte: int = 65;
          expect(valFirstByte).assertEqual(expectedValFirstByte);
          let viewFirstByte: number = view.$_get(0);
          let expectedViewFirstByte: int = 2;
          expect(viewFirstByte).assertEqual(expectedViewFirstByte);
          let bufFirstByte: number = buf.$_get(0);
          let expectedBufFirstByte: int = 9;
          expect(bufFirstByte).assertEqual(expectedBufFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let a = await b64.encode(new Uint8Array([115, 49, 51]));
          let b = await b64.encode(new Uint8Array([115, 49, 51]));
          let isSameBuffer: boolean = a.buffer === b.buffer;
          expect(isSameBuffer).assertFalse();
          let bLen: int = b.length;
          let expectedBLen: int = 4;
          expect(bLen).assertEqual(expectedBLen);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([7]));
          let dec = b64.decodeSync(val);
          let firstByte: number = dec.$_get(0);
          let expectedFirstByte: int = 7;
          expect(firstByte).assertEqual(expectedFirstByte);
          let decLen: int = dec.length;
          let expectedDecLen: int = 1;
          expect(decLen).assertEqual(expectedDecLen);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([115, 49, 51]));
          let twice = b64.encodeSync(val);
          let firstByte: number = twice.$_get(0);
          let expectedFirstByte: int = 89;
          expect(firstByte).assertEqual(expectedFirstByte);
          let twiceLen: int = twice.length;
          let expectedTwiceLen: int = 8;
          expect(twiceLen).assertEqual(expectedTwiceLen);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_1300
     * @tc.name testB64EncodeBasic004
     * @tc.desc Verify Base64Helper encode and encodeSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64EncodeBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([7]));
          let again = await b64.encode(val);
          let outLen: int = again.length;
          let expectedOutLen: int = 8;
          expect(outLen).assertEqual(expectedOutLen);
          let firstByte: number = again.$_get(0);
          let expectedFirstByte: int = 81;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let b64 = new util.Base64Helper();
          let a = await b64.encode(new Uint8Array([115, 49, 51]));
          let b = await b64.encode(new Uint8Array([115, 49, 51]));
          let isSameRef: boolean = a === b;
          expect(isSameRef).assertFalse();
          let bLen: int = b.length;
          let expectedBLen: int = 4;
          expect(bLen).assertEqual(expectedBLen);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([1, 2, 3]), util.Type.BASIC);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 65;
          expect(firstByte).assertEqual(expectedFirstByte);
          expect(val.length).assertEqual(4);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([-128]));
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 103;
          expect(firstByte).assertEqual(expectedFirstByte);
          expect(val.length).assertEqual(4);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([Number.NaN]));
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 65;
          expect(firstByte).assertEqual(expectedFirstByte);
          let thirdByte: number = val.$_get(2);
          let expectedThirdByte: int = 61;
          expect(thirdByte).assertEqual(expectedThirdByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array([Number.POSITIVE_INFINITY]));
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 65;
          expect(firstByte).assertEqual(expectedFirstByte);
          let secondByte: number = val.$_get(1);
          let expectedSecondByte: int = 65;
          expect(secondByte).assertEqual(expectedSecondByte);

      }
      {
          let b64 = new util.Base64Helper();
          let val = await b64.encode(new Uint8Array(new ArrayBuffer(0)));
          let outLen: int = val.length;
          let expectedOutLen: int = 0;
          expect(outLen).assertEqual(expectedOutLen);
          expect(val.toString()).assertEqual('');

      }
      {
          let buf: Uint8Array = new Uint8Array([1, 2, 3]);
          let b64 = new util.Base64Helper();
          let val = await b64.encode(buf.subarray(0, 0));
          let outLen: int = val.length;
          let expectedOutLen: int = 0;
          expect(outLen).assertEqual(expectedOutLen);
          expect(val.toString()).assertEqual('');

      }
      {
          let s: Uint8Array = new Uint8Array(6);
          for (let i = 0; i < 6; i++) {
            s.$_set(i, 128);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(s);
          let outLen: int = val.length;
          let expectedOutLen: int = 8;
          expect(outLen).assertEqual(expectedOutLen);
          let firstByte: number = val.$_get(0);
          let expectedFirstByte: int = 103;
          expect(firstByte).assertEqual(expectedFirstByte);

      }
      {
          let s: Uint8Array = new Uint8Array(6);
          for (let i = 0; i < 6; i++) {
            s.$_set(i, 255);
          }
          let b64 = new util.Base64Helper();
          let val = await b64.encode(s);
          let outLen: int = val.length;
          let expectedOutLen: int = 8;
          expect(outLen).assertEqual(expectedOutLen);
          let eighthByte: number = val.$_get(7);
          let expectedEighthByte: int = 47;
          expect(eighthByte).assertEqual(expectedEighthByte);

      }
    });

  });
}
