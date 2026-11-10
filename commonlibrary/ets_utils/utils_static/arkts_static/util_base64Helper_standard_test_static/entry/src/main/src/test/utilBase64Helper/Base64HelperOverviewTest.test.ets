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

import { byteStr } from '../utilcommon.test';

export default function Base64HelperOverviewTest(): void {
  describe('Base64HelperOverviewTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_0100
     * @tc.name testB64OvThrows001
     * @tc.desc Verify Base64Helper overview behaviors throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let f1 = new util.Base64Helper();
        let s1: string = "TWFu";
        try {
          f1.encodeSync(s1 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let f2 = new util.Base64Helper();
        try {
          let n2: number = 12345;
          f2.decodeSync(n2 as string);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let f4 = new util.Base64Helper();
        let s4: string = "TWFu";
        try {
          await f4.encode(s4 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let g1 = new util.Base64Helper();
        try {
          g1.encodeSync(new Uint8Array([115, 49, 51]), util.Type.MIME);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(401);
        }

      }
      {
        let g2 = new util.Base64Helper();
        try {
          g2.encodeSync(new Uint8Array([115, 49, 51]), util.Type.MIME_URL_SAFE);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("BusinessError");
          expect(e.code).assertEqual(401);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_0200
     * @tc.name testB64OvMime001
     * @tc.desc Verify Base64Helper overview behaviors with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvMime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let t2 = new util.Base64Helper();
        let arr2 = new Uint8Array([
          77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111, 110, 108, 121, 98, 121,
          104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112,
          97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104,
          105, 115, 97, 108, 117, 115, 116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115,
          104, 111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108, 112, 108, 101,
          97, 115, 117, 114, 101,
        ]);
        let r2 = t2.encodeToStringSync(arr2, util.Type.MIME);
        let CrlfIndex: number = r2.indexOf("\r\n");
        let expectedCrlfIndex: int = 76;
        expect(CrlfIndex).assertEqual(expectedCrlfIndex);
        expect(r2.length).assertEqual(194);

      }
      {
        let t3 = new util.Base64Helper();
        let res: string = t3.encodeToStringSync(new Uint8Array([0, 0, 0]), util.Type.MIME);
        expect(res).assertEqual("AAAA\r\n");
        expect(res.length).assertEqual(6);

      }
      {
        let t4: number[] = [];
        for (let i = 0; i < 58; i++) {
          t4.push(0);
        }
        let r4 = new util.Base64Helper().encodeToStringSync(new Uint8Array(t4), util.Type.MIME);
        let CrlfIndex: number = r4.indexOf("\r\n");
        let expectedCrlfIndex: int = 76;
        expect(CrlfIndex).assertEqual(expectedCrlfIndex);
        expect(r4.length).assertEqual(84);

      }
      {
        let t8 = new util.Base64Helper();
        let arr8: number[] = [];
        for (let i = 0; i < 57; i++) {
          arr8.push(0xfb);
          arr8.push(0xff);
          arr8.push(0xff);
        }
        let r8 = t8.encodeToStringSync(new Uint8Array(arr8), util.Type.MIME_URL_SAFE);
        let CrlfIndex: number = r8.indexOf("\r\n");
        let expectedCrlfIndex: int = 76;
        expect(CrlfIndex).assertEqual(expectedCrlfIndex);
        expect(r8.length).assertEqual(234);

      }
      {
        let k3 = new util.Base64Helper();
        let m3 =
          "TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n";
        let r3 = k3.decodeSync(m3, util.Type.MIME);
        let outLen: int = r3.length;
        let expectedOutLen: int = 140;
        expect(outLen).assertEqual(expectedOutLen);
        expect(r3.length).assertEqual(140);

      }
      {
        let k4 = new util.Base64Helper();
        let m4 =
          "TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\nX19fLV9fXy1fX18tX19fLV9fXy1fX18tX19fLV9fXy1fX18tX19fLV9fXy1fX18tX19fLV9fXy1fX18tX19f\r\nX19fLV9fXy1fX18tX19fLV9fXy1fX18tX19fLV9fXy1fX18tX19fLV9fXy1fX18tX19fLV9fXy1fX18tX19fLV9fXw==\r\n";
        let r4 = k4.decodeSync(m4, util.Type.MIME_URL_SAFE);
        expect(r4.length).assertLarger(0);
        expect(r4.length).assertEqual(187);

      }
      {
        let e3 = new util.Base64Helper();
        let arr3 = new Uint8Array([
          77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111, 110, 108, 121, 98, 121,
          104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112,
          97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104,
          105, 115, 97, 108, 117, 115, 116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115,
          104, 111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108, 112, 108, 101,
          97, 115, 117, 114, 101,
        ]);
        let val = await e3.encodeToString(arr3, util.Type.MIME);
        let CrlfIndex: number = val.indexOf("\r\n");
        let expectedCrlfIndex: int = 76;
        expect(CrlfIndex).assertEqual(expectedCrlfIndex);
        expect(val.length).assertEqual(194);

      }
      {
        let e5 = new util.Base64Helper();
        let res: string = await e5.encodeToString(new Uint8Array([0, 0, 0]), util.Type.MIME);
        expect(res).assertEqual("AAAA\r\n");
        expect(res.length).assertEqual(6);

      }
      {
        let e6 = new util.Base64Helper();
        let m6 =
          "TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz\r\naW9uZnJvbW90aGVyYW5pbWFsc3doaWNoaXNhbHVzdG9mdGhlbWluZGV4Y2VlZHN0aGVzaG9ydHZl\r\naGVtZW5jZW9mYW55Y2FybmFscGxlYXN1cmU=\r\n";
        let val = await e6.decode(m6, util.Type.MIME);
        let outLen: int = val.length;
        let expectedOutLen: int = 140;
        expect(outLen).assertEqual(expectedOutLen);
        expect(val.length).assertEqual(140);

      }
      {
        let mimeInput5 = new Uint8Array([84, 87, 70, 117, 13, 10, 97, 71, 108, 113, 97, 119, 61, 61, 13, 10]);
        let r5 = new util.Base64Helper().decodeSync(mimeInput5, util.Type.MIME);
        let actual1: string = r5.toString();
        let expected1: string = "77,97,110,104,105,106,107";
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_0300
     * @tc.name testB64OvMime002
     * @tc.desc Verify Base64Helper overview behaviors with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvMime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let m2: number[] = [];
        for (let i = 0; i < 57; i++) {
          m2.push(0);
        }
        let r2 = new util.Base64Helper().encodeToStringSync(new Uint8Array(m2), util.Type.MIME);
        expect(r2.indexOf("\r\n")).assertEqual(76);

      }
      {
        let m4 = new util.Base64Helper();
        let r4 = m4.decodeSync("AAAA\r\n", util.Type.MIME);
        let actual1: string = r4.toString();
        let expected1: string = "0,0,0";
        expect(actual1).assertEqual(expected1);

      }
      {
        let m5 = new util.Base64Helper();
        let str5 = "TWFu\r\naGlqa2w=\r\n";
        let r5 = m5.decodeSync(str5, util.Type.MIME);
        let actual1: string = r5.toString();
        let expected1: string = "77,97,110,104,105,106,107,108";
        expect(actual1).assertEqual(expected1);

      }
      {
        let m6 = new util.Base64Helper();
        let r6 = m6.decodeSync('', util.Type.MIME);
        let actual1: int = r6.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);

      }
      {
        let f9 = new util.Base64Helper();
        let res: Uint8Array = f9.decodeSync("AAAAA", util.Type.MIME);
        expect(res.toString()).assertEqual("0,0,0");

      }
      {
        let p6 = new util.Base64Helper();
        let arr6: number[] = [];
        for (let i = 0; i < 150; i++) {
          arr6.push(65 + (i % 26));
        }
        let sync6 = p6.encodeToStringSync(new Uint8Array(arr6), util.Type.MIME);
        let val = await p6.encodeToString(new Uint8Array(arr6), util.Type.MIME);
        expect(val).assertEqual(sync6);

      }
      {
        let p7 = new util.Base64Helper();
        let val = await p7.decode("TWFu\r\naGlqa2w=\r\n", util.Type.MIME);
        let actual1: string = val.toString();
        let expected1: string = "77,97,110,104,105,106,107,108";
        expect(actual1).assertEqual(expected1);

      }
      {
        let j2 = new util.Base64Helper();
        let src2: number[] = [];
        for (let i = 0; i < 150; i++) {
          src2.push(65 + (i % 26));
        }
        let enc2 = j2.encodeToStringSync(new Uint8Array(src2), util.Type.MIME);
        let dec2 = j2.decodeSync(enc2, util.Type.MIME);
        let actual1: string = dec2.toString();
        let expected1: string = new Uint8Array(src2).toString();
        expect(actual1).assertEqual(expected1);

      }
      {
        let k3 = new util.Base64Helper();
        let bigArr3: number[] = [];
        for (let i = 0; i < 100; i++) {
          bigArr3.push(65 + (i % 26));
        }
        let bigOut3 = k3.encodeToStringSync(new Uint8Array(bigArr3), util.Type.MIME);
        let plainOut3 = k3.encodeToStringSync(new Uint8Array(bigArr3));
        let actual1: boolean = bigOut3.indexOf("\r\n") >= 0;
        expect(actual1).assertTrue();
        let actual2: string = bigOut3.split("\r\n").join('');
        let expected2: string = plainOut3;
        expect(actual2).assertEqual(expected2);
        let r3 = k3.encodeToStringSync(new Uint8Array([115, 49, 51]));
        let actual3: number = r3.indexOf('\r');
        let expected3: int = -1;
        expect(actual3).assertEqual(expected3);
        let actual4: number = r3.indexOf('\n');
        let expected4: int = -1;
        expect(actual4).assertEqual(expected4);
        expect(r3).assertEqual("czEz");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_0400
     * @tc.name testB64OvUrlSafe001
     * @tc.desc Verify Base64Helper overview behaviors with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvUrlSafe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let o2 = new util.Base64Helper();
        let r2 = o2.encodeSync(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC_URL_SAFE);
        let encodedStr: string = r2.toString();
        let expectedEncodedStr: string = "97,71,108,113,97,119";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r2.length).assertEqual(6);

      }
      {
        let o3: number[] = [];
        for (let i = 0; i < 256; i++) {
          o3.push(i);
        }
        let r3 = new util.Base64Helper().encodeSync(new Uint8Array(o3), util.Type.BASIC_URL_SAFE);
        let idx43: number = r3.toString().indexOf("43");
        let expectedIdx43: int = -1;
        expect(idx43).assertEqual(expectedIdx43);
        expect(r3.length).assertEqual(342);

      }
      {
        let o4 = new util.Base64Helper();
        let r4 = o4.encodeSync(new Uint8Array([0xfb, 0xff, 0xff]), util.Type.BASIC_URL_SAFE);
        expect(r4.toString().indexOf("95")).assertLarger(0);
        expect(r4.length).assertEqual(4);

      }
      {
        let t5 = new util.Base64Helper();
        let r5 = t5.encodeToStringSync(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC_URL_SAFE);
        let EqIndex: number = r5.indexOf('=');
        let expectedEqIndex: int = -1;
        expect(EqIndex).assertEqual(expectedEqIndex);
        expect(r5.length).assertEqual(6);

      }
      {
        let t6 = new util.Base64Helper();
        let syncOut: string = t6.encodeToStringSync(new Uint8Array([104, 105, 106]), util.Type.BASIC_URL_SAFE);
        let expectedSyncOut: string = "aGlq";
        expect(syncOut).assertEqual(expectedSyncOut);
        expect(syncOut.length).assertEqual(4);

      }
      {
        let t7 = new util.Base64Helper();
        let syncOut: string = t7.encodeToStringSync(new Uint8Array([0xfb, 0xff, 0xff]), util.Type.BASIC_URL_SAFE);
        let expectedSyncOut: string = "-___";
        expect(syncOut).assertEqual(expectedSyncOut);
        expect(syncOut.length).assertEqual(4);

      }
      {
        let k2 = new util.Base64Helper();
        let r2 = k2.decodeSync("-___", util.Type.BASIC_URL_SAFE);
        let encodedStr: string = r2.toString();
        let expectedEncodedStr: string = "251,255,255";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r2.length).assertEqual(3);

      }
      {
        let e2 = new util.Base64Helper();
        let val = await e2.encode(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC_URL_SAFE);
        let sync = e2.encodeSync(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC_URL_SAFE);
        let encodedStr: string = val.toString();
        let expectedEncodedStr: string = sync.toString();
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(val.length).assertEqual(6);

      }
      {
        let e4 = new util.Base64Helper();
        let val = await e4.encodeToString(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC_URL_SAFE);
        let EqIndex: number = val.indexOf('=');
        let expectedEqIndex: int = -1;
        expect(EqIndex).assertEqual(expectedEqIndex);
        expect(val.length).assertEqual(6);

      }
      {
        let w3 = new util.Base64Helper();
        let src3 = new Uint8Array([0xfb, 0xff, 0xff, 0, 127, 254]);
        let enc3 = w3.encodeSync(src3, util.Type.BASIC_URL_SAFE);
        let dec3 = w3.decodeSync(enc3, util.Type.BASIC_URL_SAFE);
        let encodedStr: string = dec3.toString();
        let expectedEncodedStr: string = src3.toString();
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(enc3.length).assertEqual(8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_0500
     * @tc.name testB64OvUrlSafe002
     * @tc.desc Verify Base64Helper overview behaviors with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvUrlSafe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let w4 = new util.Base64Helper();
        let src4 = new Uint8Array([104, 105, 106, 107, 108, 109, 110]);
        let a4 = w4.encodeToStringSync(src4, util.Type.BASIC);
        let b4 = w4.encodeToStringSync(src4, util.Type.BASIC_URL_SAFE);
        expect(a4 === b4).assertFalse();
        expect(a4.length).assertEqual(12);

      }
      {
        let s1: number[] = [];
        for (let i = 0; i < 256; i++) {
          s1.push(i);
        }
        let r1 = new util.Base64Helper().encodeToStringSync(new Uint8Array(s1), util.Type.BASIC_URL_SAFE);
        let actual1: number = r1.indexOf('+');
        let expected1: int = -1;
        expect(actual1).assertEqual(expected1);

      }
      {
        let s5 = new util.Base64Helper();
        let src5 = new Uint8Array([251, 255, 255, 0, 1, 2, 251, 255, 255]);
        let basic5 = s5.encodeToStringSync(src5, util.Type.BASIC);
        let url5 = s5.encodeToStringSync(src5, util.Type.BASIC_URL_SAFE);
        let trans5 = '';
        for (let k = 0; k < basic5.length; k++) {
          let ch = String(basic5.charAt(k));
          if (String(ch) === '+') {
            trans5 = trans5 + '-';
          } else if (String(ch) === '/') {
            trans5 = trans5 + '_';
          } else {
            trans5 = trans5 + ch;
          }
        }
        expect(trans5).assertEqual(url5);

      }
      {
        let f8 = new util.Base64Helper();
        let res: Uint8Array = f8.decodeSync("a+b/", util.Type.BASIC_URL_SAFE);
        expect(res.toString()).assertEqual("105");

      }
      {
        let j1 = new util.Base64Helper();
        let src1 = new Uint8Array([104, 105, 106]);
        let basic1 = j1.encodeToStringSync(src1, util.Type.BASIC);
        let url1 = j1.encodeToStringSync(src1, util.Type.BASIC_URL_SAFE);
        expect(basic1).assertEqual(url1);

      }
      {
        let j5 = new util.Base64Helper();
        let src5 = new Uint8Array([250, 251, 252, 253, 254, 255, 0, 1, 2]);
        let enc5 = j5.encodeSync(src5, util.Type.BASIC_URL_SAFE);
        let dec5 = j5.decodeSync(enc5, util.Type.BASIC_URL_SAFE);
        let actual1: string = dec5.toString();
        let expected1: string = src5.toString();
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_0600
     * @tc.name testB64OvBoundary001
     * @tc.desc Verify Base64Helper overview behaviors with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let f3 = new util.Base64Helper();
        let res: Uint8Array = f3.decodeSync("!!");
        expect(res.length).assertEqual(0);
        expect(res.byteLength).assertEqual(0);

      }
      {
        let f2 = new util.Base64Helper();
        let res: Uint8Array = f2.decodeSync("A===");
        expect(res.length).assertEqual(0);

      }
      {
        let f7 = new util.Base64Helper();
        let res: Uint8Array = f7.decodeSync("+___", util.Type.BASIC);
        expect(res.length).assertEqual(0);

      }
      {
        let p4 = new util.Base64Helper();
        let res: Uint8Array = await p4.decode("####");
        expect(res.length).assertEqual(0);

      }
      {
        let k1 = new util.Base64Helper();
        let out1: string[] = [];
        for (let i = 0; i < 3; i++) {
          out1.push(k1.encodeToStringSync(new Uint8Array([104, 105, 106, 107, 108, 109])));
        }
        let actual1: string = out1[0];
        let expected1: string = out1[1];
        expect(actual1).assertEqual(expected1);
        let actual2: string = out1[1];
        let expected2: string = out1[2];
        expect(actual2).assertEqual(expected2);
        let actual3: string = out1[0];
        let expected3: string = "aGlqa2xt";
        expect(actual3).assertEqual(expected3);

      }
      {
        let e1 = new util.Base64Helper();
        let empty: Uint8Array = new Uint8Array(0);
        let enc: string = e1.encodeToStringSync(empty);
        let actual1: int = enc.length;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let dec: Uint8Array = e1.decodeSync("");
        let actual2: int = dec.byteLength;
        let expected2: int = 0;
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_0700
     * @tc.name testB64OvConsistency001
     * @tc.desc Verify Base64Helper overview behaviors result consistency and aliasing behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvConsistency001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let o1 = new util.Base64Helper();
        let a1 = o1.encodeSync(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        let a2 = o1.encodeSync(new Uint8Array([115, 49, 51]));
        let encodedStr: string = a1.toString();
        let expectedEncodedStr: string = a2.toString();
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(a1.length).assertEqual(4);

      }
      {
        let w1 = new util.Base64Helper();
        let src1 = new Uint8Array([115, 49, 51, 0, 255, 1]);
        let enc1 = w1.encodeToStringSync(src1);
        let dec1 = w1.decodeSync(enc1);
        let encodedStr: string = dec1.toString();
        let expectedEncodedStr: string = src1.toString();
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(enc1.length).assertEqual(8);

      }
      {
        let w6 = new util.Base64Helper();
        let src6 = new Uint8Array([115, 49, 51]);
        let sync6 = w6.encodeSync(src6);
        let val = await w6.encode(src6);
        let encodedStr: string = val.toString();
        let expectedEncodedStr: string = sync6.toString();
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(sync6.length).assertEqual(4);

      }
      {
        let b1 = new util.Base64Helper();
        let src1 = new Uint8Array([115, 49, 51]);
        let r1 = b1.encodeSync(src1);
        let actual1: boolean = r1 === src1;
        expect(actual1).assertFalse();

      }
      {
        let p5 = new util.Base64Helper();
        let sync5 = p5.decodeSync("YQ==");
        let val = await p5.decode("YQ==");
        let actual1: string = val.toString();
        let expected1: string = sync5.toString();
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_0800
     * @tc.name testB64OvBasic001
     * @tc.desc Verify Base64Helper overview behaviors with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b5 = new util.Base64Helper();
        let r5 = b5.encodeSync(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        let encodedStr: string = r5.toString();
        let expectedEncodedStr: string = "99,122,69,122";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r5.length).assertEqual(4);

      }
      {
        let b6 = new util.Base64Helper();
        let r6 = b6.encodeToStringSync(new Uint8Array([115, 49, 51]));
        expect(r6).assertEqual("czEz");
        expect(r6.length).assertEqual(4);

      }
      {
        let b8 = new util.Base64Helper();
        let r8 = b8.decodeSync("czEz");
        let elem0: number = r8[0];
        let expectedElem0: int = 115;
        expect(elem0).assertEqual(expectedElem0);
        expect(r8.length).assertEqual(3);

      }
      {
        let b9 = new util.Base64Helper();
        let r9 = b9.decodeSync("czEz", util.Type.BASIC);
        let elem0: number = r9[0];
        let expectedElem0: int = 115;
        expect(elem0).assertEqual(expectedElem0);
        expect(r9.length).assertEqual(3);

      }
      {
        let b10 = new util.Base64Helper();
        let p10 = b10.encode(new Uint8Array([115, 49, 51]));
        let val = await p10;
        let encodedStr: string = val.toString();
        let expectedEncodedStr: string = "99,122,69,122";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(val.length).assertEqual(4);

      }
      {
        let b11 = new util.Base64Helper();
        let p11 = b11.encode(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        let val = await p11;
        let encodedStr: string = val.toString();
        let expectedEncodedStr: string = "99,122,69,122";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(val.length).assertEqual(4);

      }
      {
        let b12 = new util.Base64Helper();
        let p12 = b12.encodeToString(new Uint8Array([115, 49, 51]));
        let val = await p12;
        expect(val).assertEqual("czEz");
        expect(val.length).assertEqual(4);

      }
      {
        let b13 = new util.Base64Helper();
        let p13 = b13.encodeToString(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        let val = await p13;
        expect(val).assertEqual("czEz");
        expect(val.length).assertEqual(4);

      }
      {
        let b14 = new util.Base64Helper();
        let p14 = b14.decode("YQ==");
        let val = await p14;
        let elem0: number = val[0];
        let expectedElem0: int = 97;
        expect(elem0).assertEqual(expectedElem0);
        expect(val.length).assertEqual(1);

      }
      {
        let b15 = new util.Base64Helper();
        let p15 = b15.decode("YQ==", util.Type.BASIC);
        let val = await p15;
        let elem0: number = val[0];
        let expectedElem0: int = 97;
        expect(elem0).assertEqual(expectedElem0);
        expect(val.length).assertEqual(1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_0900
     * @tc.name testB64OvBasic002
     * @tc.desc Verify Base64Helper overview behaviors with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let h8 = new util.Base64Helper();
        let r8 = h8.encodeSync(new Uint8Array([0xef, 0xbb, 0xbf]));
        let encodedStr: string = r8.toString();
        let expectedEncodedStr: string = "55,55,117,47";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r8.length).assertEqual(4);

      }
      {
        let h9: number[] = [];
        for (let i = 0; i < 256; i++) {
          h9.push(i);
        }
        let r9 = new util.Base64Helper().encodeSync(new Uint8Array(h9));
        let outLen: int = r9.length;
        let expectedOutLen: int = 344;
        expect(outLen).assertEqual(expectedOutLen);
        expect(r9.$_get(0)).assertEqual(65);

      }
      {
        let s3 = new util.Base64Helper();
        let syncOut: string = s3.encodeToStringSync(new Uint8Array([255, 255, 255]));
        let expectedSyncOut: string = "////";
        expect(syncOut).assertEqual(expectedSyncOut);
        expect(syncOut.length).assertEqual(4);

      }
      {
        let s4 = new util.Base64Helper();
        let syncOut: string = s4.encodeToStringSync(new Uint8Array([97]));
        let expectedSyncOut: string = "YQ==";
        expect(syncOut).assertEqual(expectedSyncOut);
        expect(syncOut.length).assertEqual(4);

      }
      {
        let s5 = new util.Base64Helper();
        let syncOut: string = s5.encodeToStringSync(new Uint8Array([97, 98]));
        let expectedSyncOut: string = "YWI=";
        expect(syncOut).assertEqual(expectedSyncOut);
        expect(syncOut.length).assertEqual(4);

      }
      {
        let s6 = new util.Base64Helper();
        let syncOut: string = s6.encodeToStringSync(new Uint8Array([]));
        let expectedSyncOut: string = '';
        expect(syncOut).assertEqual(expectedSyncOut);
        expect(syncOut.length).assertEqual(0);

      }
      {
        let s8 = new util.Base64Helper();
        let syncOut: string = s8.encodeToStringSync(new Uint8Array([104, 105, 106, 107, 108]));
        let expectedSyncOut: string = "aGlqa2w=";
        expect(syncOut).assertEqual(expectedSyncOut);
        expect(syncOut.length).assertEqual(8);

      }
      {
        let s9: number[] = [];
        for (let i = 0; i < 56; i++) {
          s9.push(0);
        }
        let r9 = new util.Base64Helper().encodeToStringSync(new Uint8Array(s9));
        let outLen: int = r9.length;
        let expectedOutLen: int = 76;
        expect(outLen).assertEqual(expectedOutLen);
        expect(r9).assertEqual("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=");

      }
      {
        let t1 = new util.Base64Helper();
        let r1 = t1.encodeToStringSync(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        let CrIndex: number = r1.indexOf('\r');
        let expectedCrIndex: int = -1;
        expect(CrIndex).assertEqual(expectedCrIndex);
        expect(r1.length).assertEqual(4);

      }
      {
        let d1 = new util.Base64Helper();
        let r1 = d1.decodeSync("TWFu");
        let encodedStr: string = r1.toString();
        let expectedEncodedStr: string = "77,97,110";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r1.length).assertEqual(3);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_1000
     * @tc.name testB64OvBasic003
     * @tc.desc Verify Base64Helper overview behaviors with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let d3 = new util.Base64Helper();
        let r3 = d3.decodeSync("YWI=");
        let encodedStr: string = r3.toString();
        let expectedEncodedStr: string = "97,98";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r3.length).assertEqual(2);

      }
      {
        let d5 = new util.Base64Helper();
        let r5 = d5.decodeSync("AAAA");
        let encodedStr: string = r5.toString();
        let expectedEncodedStr: string = "0,0,0";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r5.length).assertEqual(3);

      }
      {
        let d6 = new util.Base64Helper();
        let r6 = d6.decodeSync("////");
        let encodedStr: string = r6.toString();
        let expectedEncodedStr: string = "255,255,255";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r6.length).assertEqual(3);

      }
      {
        let d7 = new util.Base64Helper();
        let r7 = d7.decodeSync("YWIAYw==");
        let encodedStr: string = r7.toString();
        let expectedEncodedStr: string = "97,98,0,99";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r7.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let decoded = base64Helper.decodeSync("MTIzNDU2");
        let encodedStr: string = decoded.toString();
        let expectedEncodedStr: string = "49,50,51,52,53,54";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(decoded.length).assertEqual(6);

      }
      {
        let d9 = new util.Base64Helper();
        let r9 = d9.decodeSync("VGVzdA==");
        let encodedStr: string = r9.toString();
        let expectedEncodedStr: string = "84,101,115,116";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r9.length).assertEqual(4);

      }
      {
        let d10 = new util.Base64Helper();
        let r10 = d10.decodeSync("MzFz");
        let encodedStr: string = r10.toString();
        let expectedEncodedStr: string = "51,49,115";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r10.length).assertEqual(3);

      }
      {
        let u1 = new util.Base64Helper();
        let r1 = u1.decodeSync(new Uint8Array([65, 65, 65, 65]));
        let encodedStr: string = r1.toString();
        let expectedEncodedStr: string = "0,0,0";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r1.length).assertEqual(3);

      }
      {
        let k1 = new util.Base64Helper();
        let r1 = k1.decodeSync("AAAA", util.Type.BASIC);
        let encodedStr: string = r1.toString();
        let expectedEncodedStr: string = "0,0,0";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(r1.length).assertEqual(3);

      }
      {
        let k5 = new util.Base64Helper();
        let res: Uint8Array = k5.decodeSync("AAAA\r\nAAAA", util.Type.BASIC);
        expect(res.toString()).assertEqual("0,0,0,0,0,0");
        expect(res.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_1100
     * @tc.name testB64OvBasic004
     * @tc.desc Verify Base64Helper overview behaviors with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let e7 = new util.Base64Helper();
        let val = await e7.decode("YWIAYw==", util.Type.BASIC);
        let encodedStr: string = val.toString();
        let expectedEncodedStr: string = "97,98,0,99";
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(val.length).assertEqual(4);

      }
      {
        let w2 = new util.Base64Helper();
        let src2 = new Uint8Array([104, 105, 106, 107, 108, 109]);
        let enc2 = w2.encodeSync(src2);
        let dec2 = w2.decodeSync(enc2);
        let encodedStr: string = dec2.toString();
        let expectedEncodedStr: string = src2.toString();
        expect(encodedStr).assertEqual(expectedEncodedStr);
        expect(enc2.length).assertEqual(8);

      }
      {
        let w5 = new util.Base64Helper();
        let src5 = new Uint8Array([115, 49, 51]);
        let sync5 = w5.encodeToStringSync(src5);
        let val = await w5.encodeToString(src5);
        expect(val).assertEqual(sync5);
        expect(sync5.length).assertEqual(4);

      }
      {
        let w7 = new util.Base64Helper();
        let src7 = new Uint8Array([104, 105, 106]);
        let str7 = w7.encodeToStringSync(src7);
        let bytes7 = w7.encodeSync(src7);
        let joined7 = '';
        for (let i = 0; i < bytes7.length; i++) {
          joined7 = joined7 + String.fromCharCode(Number(bytes7[i]).toInt());
        }
        expect(joined7).assertEqual(str7);
        expect(str7.length).assertEqual(4);

      }
      {
        let b2 = new util.Base64Helper();
        let src2 = new Uint8Array([115, 49, 51]);
        let r2 = b2.encodeSync(src2);
        let actual1: string = r2.toString();
        let expected1: string = "99,122,69,122";
        expect(actual1).assertEqual(expected1);

      }
      {
        let b3 = new util.Base64Helper();
        let r3a = b3.decodeSync("YQ==");
        let r3b = b3.decodeSync("YQ==");
        let actual1: int = r3a.byteLength;
        let expected1: int = 1;
        expect(actual1).assertEqual(expected1);
        let actual2: number = Number(r3a.$_get(0));
        let expected2: int = 97;
        expect(actual2).assertEqual(expected2);
        let actual3: number = Number(r3b.$_get(0));
        let expected3: int = 97;
        expect(actual3).assertEqual(expected3);

      }
      {
        let b8 = new util.Base64Helper();
        let r8 = b8.encodeSync(new Uint8Array([0]));
        let actual1: int = r8.length;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);

      }
      {
        let b9 = new util.Base64Helper();
        let actual1: string = b9.encodeToStringSync(new Uint8Array([0]));
        let expected1: string = "AA==";
        expect(actual1).assertEqual(expected1);

      }
      {
        let big1: number[] = [];
        for (let i = 0; i < 1024; i++) {
          big1.push(i % 256);
        }
        let r1 = new util.Base64Helper().encodeSync(new Uint8Array(big1));
        let actual1: int = r1.length;
        let expected1: int = 1368;
        expect(actual1).assertEqual(expected1);

      }
      {
        let big5: number[] = [];
        for (let i = 0; i < 1024; i++) {
          big5.push(i % 256);
        }
        let src5 = new Uint8Array(big5);
        let enc5 = new util.Base64Helper().encodeToStringSync(src5);
        let dec5 = new util.Base64Helper().decodeSync(enc5);
        let actual1: int = dec5.length;
        let expected1: int = 1024;
        expect(actual1).assertEqual(expected1);
        let actual2: string = dec5.toString();
        let expected2: string = src5.toString();
        expect(actual2).assertEqual(expected2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_1200
     * @tc.name testB64OvBasic005
     * @tc.desc Verify Base64Helper overview behaviors with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvBasic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let big7: number[] = [];
        for (let i = 0; i < 1024; i++) {
          big7.push(i % 256);
        }
        let r7 = new util.Base64Helper().encodeToStringSync(new Uint8Array(big7));
        let actual1: string = String(r7.charAt(r7.length - 1));
        let expected1: string = '=';
        expect(actual1).assertEqual(expected1);
        let actual2: string = String(r7.charAt(r7.length - 2));
        let expected2: string = '=';
        expect(actual2).assertEqual(expected2);

      }
      {
        let segmentBuffer1 = new Uint8Array(6);
        segmentBuffer1.set([0, 115, 49, 51, 0, 0]);
        let seg1 = segmentBuffer1.subarray(1, 4);
        let r1 = new util.Base64Helper().encodeSync(seg1);
        let actual1: string = r1.toString();
        let expected1: string = "99,122,69,122";
        expect(actual1).assertEqual(expected1);

      }
      {
        let segmentBuffer2 = new Uint8Array(8);
        segmentBuffer2.set([1, 2, 3, 4, 5, 6, 7, 8]);
        let seg2 = segmentBuffer2.subarray(2, 5);
        let r2 = new util.Base64Helper().encodeToStringSync(seg2);
        expect(r2).assertEqual("AwQF");

      }
      {
        let segmentBuffer3 = new Uint8Array(10);
        segmentBuffer3.set([255, 255, 115, 49, 51, 255, 255, 255, 255, 255]);
        let seg3 = segmentBuffer3.subarray(2, 5);
        let r3 = new util.Base64Helper().encodeToStringSync(seg3);
        expect(r3).assertEqual("czEz");

      }
      {
        let segmentBuffer4 = new Uint8Array(10);
        segmentBuffer4.set([0, 0, 0, 65, 65, 65, 65, 0, 0, 0]);
        let seg4 = segmentBuffer4.subarray(3, 7);
        let r4 = new util.Base64Helper().decodeSync(seg4);
        let actual1: string = r4.toString();
        let expected1: string = "0,0,0";
        expect(actual1).assertEqual(expected1);

      }
      {
        let arrayBuffer6 = new ArrayBuffer(3);
        let u8v6 = new Uint8Array(arrayBuffer6);
        u8v6.set([115, 49, 51]);
        let r6 = new util.Base64Helper().encodeSync(u8v6);
        let actual1: string = r6.toString();
        let expected1: string = "99,122,69,122";
        expect(actual1).assertEqual(expected1);

      }
      {
        let sourceBytes7 = new Uint8Array([115, 49, 51]);
        let r7 = new util.Base64Helper().encodeSync(sourceBytes7);
        let actual1: string = r7.toString();
        let expected1: string = "99,122,69,122";
        expect(actual1).assertEqual(expected1);

      }
      {
        let payload24 = new Uint8Array(24);
        let fill8: number[] = [];
        for (let i = 0; i < 24; i++) {
          fill8.push(i);
        }
        payload24.set(fill8);
        let r8 = new util.Base64Helper().encodeToStringSync(payload24);
        let actual1: int = r8.length;
        let expected1: int = 32;
        expect(actual1).assertEqual(expected1);

      }
      {
        let u1 = new util.Base64Helper();
        let bytes1 = new Uint8Array([0xe4, 0xbd, 0xa0, 0xe5, 0xa5, 0xbd]);
        let actual1: string = u1.encodeToStringSync(bytes1);
        let expected1: string = "5L2g5aW9";
        expect(actual1).assertEqual(expected1);

      }
      {
        let u2 = new util.Base64Helper();
        let r2 = u2.decodeSync("5L2g5aW9");
        let actual1: string = r2.toString();
        let expected1: string = "228,189,160,229,165,189";
        expect(actual1).assertEqual(expected1);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_1300
     * @tc.name testB64OvBasic006
     * @tc.desc Verify Base64Helper overview behaviors with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvBasic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let u3 = new util.Base64Helper();
        let actual1: string = u3.encodeToStringSync(new Uint8Array([0xe4]));
        let expected1: string = "5A==";
        expect(actual1).assertEqual(expected1);

      }
      {
        let u4 = new util.Base64Helper();
        let actual1: string = u4.encodeToStringSync(new Uint8Array([255, 255, 255, 255, 255, 255]));
        let expected1: string = "////////";
        expect(actual1).assertEqual(expected1);

      }
      {
        let u5: number[] = [];
        for (let i = 0; i < 12; i++) {
          if (i % 2 === 0) {
            u5.push(0);
          } else {
            u5.push(255);
          }
        }
        let r5 = new util.Base64Helper().encodeToStringSync(new Uint8Array(u5));
        let actual1: int = r5.length;
        let expected1: int = 16;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r5.indexOf('=');
        let expected2: int = -1;
        expect(actual2).assertEqual(expected2);

      }
      {
        let u6 = new util.Base64Helper();
        let actual1: string = u6.encodeToStringSync(new Uint8Array([127, 128]));
        let expected1: string = "f4A=";
        expect(actual1).assertEqual(expected1);

      }
      {
        let s4: number[] = [];
        for (let i = 0; i < 256; i++) {
          s4.push(i);
        }
        let enc4 = new util.Base64Helper().encodeToStringSync(new Uint8Array(s4), util.Type.BASIC_URL_SAFE);
        let valid4 = true;
        for (let j = 0; j < enc4.length; j++) {
          let c = String(enc4).charCodeAt(j);
          if (!((c >= 65 && c <= 90) || (c >= 97 && c <= 122) || (c >= 48 && c <= 57) || c === 45 || c === 95)) {
            valid4 = false;
          }
        }
        expect(valid4).assertTrue();

      }
      {
        let f1 = new util.Base64Helper();
        let res: Uint8Array = f1.decodeSync("AAA");
        expect(res.toString()).assertEqual("0,0");

      }
      {
        let f3 = new util.Base64Helper();
        let res: Uint8Array = f3.decodeSync("YQ==A");
        expect(res.toString()).assertEqual("97");

      }
      {
        let f4 = new util.Base64Helper();
        let res: Uint8Array = f4.decodeSync("AAAA AAAA");
        expect(res.toString()).assertEqual("0,0,0,0,0,0");

      }
      {
        let f10 = new util.Base64Helper();
        let res: Uint8Array = f10.decodeSync("AAAA ");
        expect(res.toString()).assertEqual("0,0,0");

      }
      {
        let f11 = new util.Base64Helper();
        let res: Uint8Array = f11.decodeSync("QQ");
        expect(res.toString()).assertEqual("65");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_OVERVIEW_1400
     * @tc.name testB64OvBasic007
     * @tc.desc Verify Base64Helper overview behaviors with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64OvBasic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let p1 = new util.Base64Helper();
        let val = await p1.encode(new Uint8Array([115, 49, 51]));
        expect(val.toString()).assertEqual("99,122,69,122");

      }
      {
        let p2 = new util.Base64Helper();
        let val = await p2.decode("YQ==");
        expect(val.toString()).assertEqual("97");

      }
      {
        let p3 = new util.Base64Helper();
        let val = await p3.encodeToString(new Uint8Array([115, 49, 51]));
        let actual1: int = val.length;
        let expected1: int = 4;
        expect(actual1).assertEqual(expected1);

      }
      {
        let j3 = new util.Base64Helper();
        let actual1: string = j3.encodeToStringSync(new Uint8Array([104, 105]));
        let expected1: string = "aGk=";
        expect(actual1).assertEqual(expected1);

      }
      {
        let j4: number[] = [];
        for (let i = 0; i < 15; i++) {
          j4.push(255);
        }
        let r4 = new util.Base64Helper().encodeToStringSync(new Uint8Array(j4));
        let actual1: int = r4.length;
        let expected1: int = 20;
        expect(actual1).assertEqual(expected1);
        let actual2: number = r4.indexOf('=');
        let expected2: int = -1;
        expect(actual2).assertEqual(expected2);

      }
      {
        let j6 = new util.Base64Helper();
        let actual1: string = j6.encodeToStringSync(new Uint8Array([104, 105, 106, 107, 108, 109]));
        let expected1: string = "aGlqa2xt";
        expect(actual1).assertEqual(expected1);

      }
      {
        let k2 = new util.Base64Helper();
        let bigArr: number[] = [];
        for (let i = 0; i < 500; i++) {
          bigArr.push(i % 256);
        }
        let bigOut = k2.encodeToStringSync(new Uint8Array(bigArr));
        let actual1: int = bigOut.length % 4;
        let expected1: int = 0;
        expect(actual1).assertEqual(expected1);
        let actual2: boolean = bigOut.indexOf("\r\n") === -1;
        expect(actual2).assertTrue();
        let actual3: string = bigOut.substring(bigOut.length - 1);
        let expected3: string = '=';
        expect(actual3).assertEqual(expected3);

      }
      {
        let k4 = new util.Base64Helper();
        let a4 = k4.encodeSync(new Uint8Array([115, 49, 51]));
        let b4 = k4.encodeToStringSync(new Uint8Array([104, 105, 106, 107, 108, 109]));
        let actual1: string = a4.toString();
        let expected1: string = "99,122,69,122";
        expect(actual1).assertEqual(expected1);
        expect(b4).assertEqual("aGlqa2xt");

      }
      {
        let k5 = new util.Base64Helper();
        let cur5 = new Uint8Array([115, 49, 51]);
        for (let i = 0; i < 3; i++) {
          cur5 = k5.encodeSync(cur5);
        }
        expect(cur5.length).assertEqual(12);

      }
      {
        let k6 = new util.Base64Helper();
        let dec6 = k6.decodeSync("YQ==");
        let enc6 = k6.encodeSync(dec6);
        let actual1: string = enc6.toString();
        let expected1: string = "89,81,61,61";
        expect(actual1).assertEqual(expected1);

      }
    });

  });
}
