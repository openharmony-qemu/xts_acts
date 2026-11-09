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

export default function Base64HelperEncodeToStringTest(): void {
  describe('Base64HelperEncodeToStringTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_0100
     * @tc.name testB64ToStrThrows001
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrThrows001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        try {
          let nullSrc: Uint8Array | null = null;
          await b64.encodeToString(nullSrc!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        try {
          let undefinedSrc: Uint8Array | undefined = undefined;
          await b64.encodeToString(undefinedSrc!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let n5: number = Number.NaN;
        try {
          await b64.encodeToString(n5 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let n6: number = 123.45;
        try {
          await b64.encodeToString(n6 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let s7: string = "abc";
        try {
          await b64.encodeToString(s7 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let f8: boolean = true;
        try {
          await b64.encodeToString(f8 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let obj: Record<string, int> = { "a-b": 1 };
        try {
          await b64.encodeToString(obj as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let arr: Array<int> = [65, 66, 67];
        try {
          await b64.encodeToString(arr as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let map: Map<int, int> = new Map<int, int>();
        try {
          await b64.encodeToString(map as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let set: Set<int> = new Set<int>();
        try {
          await b64.encodeToString(set as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_0200
     * @tc.name testB64ToStrThrows002
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrThrows002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let dt13: Date = new Date(0);
        try {
          await b64.encodeToString(dt13 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let re14: RegExp = new RegExp('a');
        try {
          await b64.encodeToString(re14 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let key: object = {};
        let wm: WeakMap<object, int> = new WeakMap<object, int>();
        wm.set(key, 1);
        try {
          await b64.encodeToString(wm as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let fn16: Function = (): void => {};
        try {
          await b64.encodeToString(fn16 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let p17: Promise<number> = Promise.resolve(1.0);
        try {
          await b64.encodeToString(p17 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        try {
          let badInt: Object = 2147483647;
          await b64.encodeToString(new Uint8Array([65, 66, 67]), badInt as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        try {
          await b64.encodeToString(new Uint8Array([65, 66, 67]), Number.NaN as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        try {
          let nullType: util.Type | null = null;
          await b64.encodeToString(new Uint8Array([65, 66, 67]), nullType!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        try {
          let mimeStr: string = "MIME";
          await b64.encodeToString(new Uint8Array([65, 66, 67]), mimeStr as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let opt: Record<string, int> = {};
        try {
          await b64.encodeToString(new Uint8Array([65, 66, 67]), opt as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_0300
     * @tc.name testB64ToStrThrows003
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrThrows003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        try {
          let flag: boolean = true;
          await b64.encodeToString(new Uint8Array([65, 66, 67]), flag as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        try {
          let undefType: util.Type | undefined = undefined;
          let val = await b64.encodeToString(new Uint8Array([65, 66, 67]), undefType!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let negZero: number = -0;
        try {
          let val = await b64.encodeToString(new Uint8Array([65, 66, 67]), negZero as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let b64 = new util.Base64Helper();
        let n: Uint8Array | null = null;
        try {
          await b64.encodeToString(n!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }
        let val = await b64.encodeToString(new Uint8Array([1, 2, 3]));
        expect(val).assertEqual("AQID");

      }
      {
        let b64 = new util.Base64Helper();
        let o: util.Type | null = null;
        try {
          await b64.encodeToString(new Uint8Array([65, 66, 67]), o! as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }
        let val = await b64.encodeToString(new Uint8Array([255]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("_w");

      }
      {
        let helper = new util.Base64Helper();
        let val: Uint8Array | null = null;
        try {
          helper.encodeToStringSync(val!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let nan: number = Number.NaN;
        try {
          helper.encodeToStringSync(nan as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let num: number = 123.45;
        try {
          helper.encodeToStringSync(num as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let s: string = "abc";
        try {
          helper.encodeToStringSync(s as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let flag: boolean = true;
        try {
          helper.encodeToStringSync(flag as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_0400
     * @tc.name testB64ToStrThrows004
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrThrows004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let helper = new util.Base64Helper();
        let obj: Record<string, int> = { "a-b": 1 };
        try {
          helper.encodeToStringSync(obj as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let arr: Array<int> = [65, 66, 67];
        try {
          helper.encodeToStringSync(arr as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let map: Map<int, int> = new Map<int, int>();
        try {
          helper.encodeToStringSync(map as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let set: Set<int> = new Set<int>();
        try {
          helper.encodeToStringSync(set as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let dt: Date = new Date(0);
        try {
          helper.encodeToStringSync(dt as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let re: RegExp = new RegExp('a');
        try {
          helper.encodeToStringSync(re as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let key: object = {};
        let wm: WeakMap<object, int> = new WeakMap<object, int>();
        wm.set(key, 1);
        try {
          helper.encodeToStringSync(wm as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let fn: Function = (): void => {};
        try {
          helper.encodeToStringSync(fn as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let p: Promise<number> = Promise.resolve(1.0);
        try {
          helper.encodeToStringSync(p as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let i32: Int32Array = new Int32Array([1, 2, 3]);
        try {
          helper.encodeToStringSync(i32 as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_0500
     * @tc.name testB64ToStrThrows005
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync throws on invalid input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrThrows005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let helper = new util.Base64Helper();
        let dv: DataView = new DataView(new ArrayBuffer(4));
        try {
          helper.encodeToStringSync(dv as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let u8c: Uint8ClampedArray = new Uint8ClampedArray([1, 2, 3]);
        try {
          helper.encodeToStringSync(u8c as Uint8Array);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        try {
          let badType: util.Type | null = null;
          helper.encodeToStringSync(src, badType! as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        try {
          let nan: number = Number.NaN;
          helper.encodeToStringSync(src, nan as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        try {
          let mode: string = "MIME";
          helper.encodeToStringSync(src, mode as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        try {
          let opt: Record<string, int> = {};
          helper.encodeToStringSync(src, opt as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        try {
          let flag: boolean = true;
          helper.encodeToStringSync(src, flag as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        try {
          let undefType: util.Type | undefined = undefined;
          helper.encodeToStringSync(src, undefType!);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("NullPointerError");
          expect(e.code).assertEqual(0);
        }

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        let negZero: number = -0;
        try {
          helper.encodeToStringSync(src, negZero as object as util.Type);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual("ClassCastError");
          expect(e.code).assertEqual(0);
        }

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_0600
     * @tc.name testB64ToStrMime001
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrMime001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big, util.Type.MIME);
        expect(val.includes("\r\n")).assertTrue();
        expect(val.length).assertEqual(140);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big, util.Type.MIME_URL_SAFE);
        expect(val.length).assertEqual(138);
        expect(val.includes("\r\n")).assertTrue();

      }
      {
        let src: Uint8Array = new Uint8Array(58);
        for (let i = 0; i < 58; i++) {
          src.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(src, util.Type.MIME);
        let crlfIndex: number = val.indexOf("\r\n");
        let expectedCrlfIndex: int = 76;
        expect(crlfIndex).assertEqual(expectedCrlfIndex);
        let lines: string[] = val.split("\r\n");
        let line1: string = lines[1];
        let expectedLine1: string = "YQ==";
        expect(line1).assertEqual(expectedLine1);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big, util.Type.MIME);
        let lines: string[] = val.split("\r\n");
        expect(lines[1].endsWith("YQ==")).assertTrue();
        expect(val.length).assertEqual(140);

      }
      {
        let big: Uint8Array = new Uint8Array(1000);
        for (let i = 0; i < 1000; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big, util.Type.MIME);
        let lines: string[] = val.split("\r\n");
        expect(val.length).assertEqual(1372);
        for (let i = 0; i < lines.length; i++) {
          let lineLen: int = lines[i].length;
          let overLimit: boolean = (lineLen > 76);
          expect(overLimit).assertFalse();
        }

      }
      {
        let src: Uint8Array = new Uint8Array(58);
        for (let i = 0; i < 58; i++) {
          src.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(src, util.Type.MIME_URL_SAFE);
        let lines: string[] = val.split("\r\n");
        let line1: string = lines[1];
        let expectedLine1: string = "YQ";
        expect(line1).assertEqual(expectedLine1);
        expect(val.length).assertEqual(82);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big, util.Type.MIME);
        let crlfIndex: number = val.indexOf("\r\n");
        let expectedCrlfIndex: int = 76;
        expect(crlfIndex).assertEqual(expectedCrlfIndex);
        expect(val.length).assertEqual(140);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big, util.Type.MIME);
        expect(val.endsWith("\r\n")).assertTrue();
        expect(val.length).assertEqual(140);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big, util.Type.MIME_URL_SAFE);
        for (let i = 0; i < val.length; i++) {
          let ch: string = String(val.charAt(i));
          let isUnsafeChar: boolean = (ch === '+' || ch === '/' || ch === '=');
          expect(isUnsafeChar).assertFalse();
        }

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big, util.Type.MIME_URL_SAFE);
        let lines: string[] = val.split("\r\n");
        for (let i = 0; i < lines.length; i++) {
          let lineLen: int = lines[i].length;
          let overLimit: boolean = (lineLen > 76);
          expect(overLimit).assertFalse();
        }
        expect(val.length).assertEqual(138);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_0700
     * @tc.name testB64ToStrMime002
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrMime002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array(0), util.Type.MIME);
        expect(val).assertEqual("\r\n");
        expect(val.length).assertEqual(2);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77, 97, 110]), util.Type.MIME);
        expect(val).assertEqual("TWFu\r\n");
        expect(val.length).assertEqual(6);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(58);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME);
        expect(val).assertEqual("QUFB".repeat(19) + "\r\n" + "QQ==" + "\r\n");
        expect(val.length).assertEqual(84);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(57);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME);
        expect(val).assertEqual("QUFB".repeat(19) + "\r\n");
        expect(val.length).assertEqual(78);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x61, 0x62, 0x63]), util.Type.MIME);
        expect(val).assertEqual("YWJj\r\n");
        expect(val.length).assertEqual(6);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(58);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME);
        let sub76to78: string = val.substring(76, 78);
        let expectedSub76to78: string = "\r\n";
        expect(sub76to78).assertEqual(expectedSub76to78);
        expect(val.length).assertEqual(84);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(256);
        for (let i: int = 0; i < 256; i++) {
          src.$_set(i, i);
        }
        let val = await b64.encodeToString(src, util.Type.MIME);
        let firstLineLen: int = val.split("\r\n")[0].length;
        let expectedFirstLineLen: int = 76;
        expect(firstLineLen).assertEqual(expectedFirstLineLen);
        expect(val.length).assertEqual(354);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(115);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME);
        expect(val.endsWith("\r\n")).assertTrue();
        expect(val.length).assertEqual(162);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(58);
        src.fill(0x41);
        let mimeVal = await b64.encodeToString(src, util.Type.MIME);
        let basicVal = await b64.encodeToString(src, util.Type.BASIC);
        expect(mimeVal).assertEqual("QUFB".repeat(19) + "\r\n" + "QQ==" + "\r\n");
        expect(basicVal).assertEqual("QUFB".repeat(19) + "QQ==");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xfb, 0xef, 0xbe]), util.Type.MIME_URL_SAFE);
        expect(val).assertEqual("----\r\n");
        expect(val.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_0800
     * @tc.name testB64ToStrMime003
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrMime003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(57);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME_URL_SAFE);
        expect(val).assertEqual("QUFB".repeat(19) + "\r\n");
        expect(val.length).assertEqual(78);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(59);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME_URL_SAFE);
        let crlfCount: number = val.split("\r\n").length - 1;
        expect(crlfCount).assertEqual(2);
        expect(val.length).assertEqual(83);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(58);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME_URL_SAFE);
        expect(val.endsWith("\r\n")).assertTrue();
        expect(val.length).assertEqual(82);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(59);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME_URL_SAFE);
        expect(val).assertEqual("QUFB".repeat(19) + "\r\nQUE\r\n");
        expect(val.length).assertEqual(83);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(58);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME);
        let syncVal: string = b64.encodeToStringSync(src, util.Type.MIME);
        expect(val).assertEqual(syncVal);
        expect(val.length).assertEqual(84);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(59);
        src.fill(0x41);
        let val = await b64.encodeToString(src, util.Type.MIME_URL_SAFE);
        let syncVal: string = b64.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        expect(val).assertEqual(syncVal);
        expect(val.length).assertEqual(83);

      }
      {
        let b64 = new util.Base64Helper();
        let r1: string = '';
        let val = await b64.encodeToString(new Uint8Array([0xfb, 0xef, 0xbe]), util.Type.BASIC);
        r1 = val;
        let r2 = await b64.encodeToString(new Uint8Array([0xfb, 0xef, 0xbe]), util.Type.MIME_URL_SAFE);
        expect(r1).assertEqual("++++");
        expect(r2).assertEqual("----\r\n");

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(58);
        src.fill(0x41);
        let basic = await b64.encodeToString(src, util.Type.BASIC);

        let mime = await b64.encodeToString(src, util.Type.MIME);
        let basicCrIndex: number = basic.indexOf('\r');
        let expectedBasicCrIndex: int = -1;
        expect(basicCrIndex).assertEqual(expectedBasicCrIndex);
        let mimeCrIndex: number = mime.indexOf('\r');
        let expectedMimeCrIndex: int = 76;
        expect(mimeCrIndex).assertEqual(expectedMimeCrIndex);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([1, 2, 3, 4]), util.Type.MIME);
        expect(val).assertEqual("AQIDBA==\r\n");
        expect(val.length).assertEqual(10);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x41]), util.Type.MIME);
        expect(val).assertEqual("QQ==\r\n");
        expect(val.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_0900
     * @tc.name testB64ToStrMime004
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrMime004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([]), util.Type.MIME);
        expect(val).assertEqual("\r\n");
        expect(val.length).assertEqual(2);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x41]), util.Type.MIME_URL_SAFE);
        expect(val).assertEqual("QQ\r\n");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([]), util.Type.MIME_URL_SAFE);
        expect(val).assertEqual("\r\n");
        expect(val.length).assertEqual(2);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big, util.Type.MIME);
        expect(r.includes("\r\n")).assertTrue();
        expect(r.length).assertEqual(140);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big, util.Type.MIME_URL_SAFE);
        expect(r.includes("\r\n")).assertTrue();
        expect(r.length).assertEqual(138);

      }
      {
        let src: Uint8Array = new Uint8Array(57);
        for (let i = 0; i < 57; i++) {
          src.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(src, util.Type.MIME);
        let outLen: int = r.length;
        let expectedOutLen: int = 78;
        expect(outLen).assertEqual(expectedOutLen);
        let crIndex: number = r.indexOf('\r');
        let expectedCrIndex: int = 76;
        expect(crIndex).assertEqual(expectedCrIndex);

      }
      {
        let src: Uint8Array = new Uint8Array(58);
        for (let i = 0; i < 58; i++) {
          src.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(src, util.Type.MIME);
        let crlfIndex: number = r.indexOf("\r\n");
        let expectedCrlfIndex: int = 76;
        expect(crlfIndex).assertEqual(expectedCrlfIndex);
        let lines: string[] = r.split("\r\n");
        let line1: string = lines[1];
        let expectedLine1: string = "YQ==";
        expect(line1).assertEqual(expectedLine1);

      }
      {
        let big: Uint8Array = new Uint8Array(2048);
        for (let i = 0; i < 2048; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big, util.Type.MIME);
        let crlfIndex: number = r.indexOf("\r\n");
        let expectedCrlfIndex: int = 76;
        expect(crlfIndex).assertEqual(expectedCrlfIndex);
        expect(r.length).assertEqual(2804);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array(0), util.Type.MIME);
        expect(r).assertEqual("\r\n");
        expect(r.length).assertEqual(2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97, 110]), util.Type.MIME);
        expect(r).assertEqual("TWFu\r\n");
        expect(r.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1000
     * @tc.name testB64ToStrMime005
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrMime005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let src: Uint8Array = new Uint8Array(57);
        for (let i = 0; i < 57; i++) {
          src.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        let outLen: int = r.length;
        let expectedOutLen: int = 78;
        expect(outLen).assertEqual(expectedOutLen);
        let crIndex: number = r.indexOf('\r');
        let expectedCrIndex: int = 76;
        expect(crIndex).assertEqual(expectedCrIndex);

      }
      {
        let src: Uint8Array = new Uint8Array(58);
        for (let i = 0; i < 58; i++) {
          src.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        let lines: string[] = r.split("\r\n");
        let line1: string = lines[1];
        let expectedLine1: string = "YQ";
        expect(line1).assertEqual(expectedLine1);
        expect(r.length).assertEqual(82);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big, util.Type.MIME_URL_SAFE);
        let lines: string[] = r.split("\r\n");
        let line1Len: int = lines[1].length;
        let expectedLine1Len: int = 58;
        expect(line1Len).assertEqual(expectedLine1Len);
        expect(r.endsWith("\r\n")).assertTrue();

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array(0), util.Type.MIME_URL_SAFE);
        expect(r).assertEqual("\r\n");
        expect(r.length).assertEqual(2);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big, util.Type.MIME);
        let lines: string[] = r.split("\r\n");
        for (let i = 0; i < lines.length; i++) {
          let lineLen: int = lines[i].length;
          let overLimit: boolean = (lineLen > 76);
          expect(overLimit).assertFalse();
        }
        expect(r.length).assertEqual(140);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big, util.Type.MIME);
        expect(r.endsWith("\r\n")).assertTrue();
        expect(r.length).assertEqual(140);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big, util.Type.MIME_URL_SAFE);
        let lines: string[] = r.split("\r\n");
        expect(r.length).assertEqual(138);
        for (let i = 0; i < lines.length; i++) {
          let lineLen: int = lines[i].length;
          let overLimit: boolean = (lineLen > 76);
          expect(overLimit).assertFalse();
        }

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big, util.Type.MIME_URL_SAFE);
        for (let i = 0; i < r.length; i++) {
          let ch: string = String(r.charAt(i));
          let isUnsafeChar: boolean = (ch === '+' || ch === '/' || ch === '=');
          expect(isUnsafeChar).assertFalse();
        }
        expect(r.length).assertEqual(138);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let a = b64.encodeToStringSync(big, util.Type.BASIC);
        let b = b64.encodeToStringSync(big, util.Type.MIME);
        let sub0to76: string = a.substring(0, 76);
        let expectedSub0to76: string = b.substring(0, 76);
        expect(sub0to76).assertEqual(expectedSub0to76);
        expect(a.length).assertEqual(136);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([
          77, 97, 110, 105, 115, 100, 105, 115, 116, 105, 110, 103, 117, 105, 115, 104, 101, 100, 110, 111, 116, 111, 110, 108, 121, 98, 121,
          104, 105, 115, 114, 101, 97, 115, 111, 110, 98, 117, 116, 98, 121, 116, 104, 105, 115, 115, 105, 110, 103, 117, 108, 97, 114, 112,
          97, 115, 115, 105, 111, 110, 102, 114, 111, 109, 111, 116, 104, 101, 114, 97, 110, 105, 109, 97, 108, 115, 119, 104, 105, 99, 104,
          105, 115, 97, 108, 117, 115, 116, 111, 102, 116, 104, 101, 109, 105, 110, 100, 101, 120, 99, 101, 101, 100, 115, 116, 104, 101, 115,
          104, 111, 114, 116, 118, 101, 104, 101, 109, 101, 110, 99, 101, 111, 102, 97, 110, 121, 99, 97, 114, 110, 97, 108, 112, 108, 101,
          97, 115, 117, 114, 101,
        ]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.MIME);
        let sub0to76: string = result.substring(0, 76);
        let expectedSub0to76: string = "TWFuaXNkaXN0aW5ndWlzaGVkbm90b25seWJ5aGlzcmVhc29uYnV0Ynl0aGlzc2luZ3VsYXJwYXNz";
        expect(sub0to76).assertEqual(expectedSub0to76);
        expect(result.length).assertEqual(194);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1100
     * @tc.name testB64ToStrMime006
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrMime006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(58);
        src.fill(0x41);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.MIME);
        let sub76to78: string = result.substring(76, 78);
        let expectedSub76to78: string = "\r\n";
        expect(sub76to78).assertEqual(expectedSub76to78);
        expect(result.length).assertEqual(84);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(115);
        src.fill(0x41);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.MIME);
        let lines: string[] = result.split("\r\n");
        let maxLen: number = 0;
        for (let i: int = 0; i < lines.length; i++) {
          if (lines[i].length > maxLen) {
            maxLen = lines[i].length;
          }
        }
        expect(maxLen).assertEqual(76);
        expect(result.length).assertEqual(162);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(115);
        src.fill(0x41);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.MIME);
        expect(result.endsWith("\r\n")).assertTrue();
        expect(result.length).assertEqual(162);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(115);
        src.fill(0x41);
        let mimeResult: string = base64Helper.encodeToStringSync(src, util.Type.MIME);
        let stripped: string = mimeResult.split("\r\n").join('');
        let basicResult: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(stripped).assertEqual(basicResult);
        expect(mimeResult.length).assertEqual(162);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(59);
        src.fill(0x41);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        let lines: string[] = result.split("\r\n");
        let maxLen: number = 0;
        for (let i: int = 0; i < lines.length; i++) {
          if (lines[i].length > maxLen) {
            maxLen = lines[i].length;
          }
        }
        expect(maxLen).assertEqual(76);
        expect(result.length).assertEqual(83);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(59);
        src.fill(0x41);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        expect(result.endsWith("\r\n")).assertTrue();
        expect(result.length).assertEqual(83);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0xfb, 0xef, 0xbe]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        expect(result).assertEqual("----\r\n");
        expect(result.length).assertEqual(6);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(57);
        src.fill(0x41);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.MIME);
        let crIndex: number = result.indexOf('\r');
        let expectedCrIndex: int = 76;
        expect(crIndex).assertEqual(expectedCrIndex);
        expect(result.length).assertEqual(78);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(58);
        src.fill(0x41);
        let mimeResult: string = base64Helper.encodeToStringSync(src, util.Type.MIME);
        let basicResult: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(mimeResult).assertEqual("QUFB".repeat(19) + "\r\n" + "QQ==" + "\r\n");
        expect(basicResult).assertEqual("QUFB".repeat(19) + "QQ==");

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x41]);
        let result = helper.encodeToStringSync(src, util.Type.MIME);
        expect(result).assertEqual("QQ==\r\n");
        expect(result.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1200
     * @tc.name testB64ToStrMime007
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with MIME type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrMime007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x41, 0x42]);
        let result = helper.encodeToStringSync(src, util.Type.MIME);
        expect(result).assertEqual("QUI=\r\n");
        expect(result.length).assertEqual(6);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x41, 0x42, 0x43]);
        let result = helper.encodeToStringSync(src, util.Type.MIME);
        expect(result).assertEqual("QUJD\r\n");
        expect(result.length).assertEqual(6);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array(20);
        let result = helper.encodeToStringSync(src, util.Type.MIME);
        expect(result).assertEqual("AAAAAAAAAAAAAAAAAAAAAAAAAAA=\r\n");
        expect(result.length).assertEqual(30);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array(55);
        let result = helper.encodeToStringSync(src, util.Type.MIME);
        let crlfIndex: number = result.indexOf("\r\n");
        let expectedCrlfIndex: int = 76;
        expect(crlfIndex).assertEqual(expectedCrlfIndex);
        expect(result.length).assertEqual(78);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x41]);
        let result = helper.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        let ref: string = result;
        let expectedRef: string = "QQ\r\n";
        expect(ref).assertEqual(expectedRef);
        expect(result.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1300
     * @tc.name testB64ToStrUrlSafe001
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrUrlSafe001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([104, 105, 106]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("aGlq");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array(0), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual('');
        expect(val.length).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([251]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("-w");
        expect(val.length).assertEqual(2);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77, 97]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("TWE");
        expect(val.length).assertEqual(3);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([255, 255, 255]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("____");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xfb, 0xff, 0xff]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("-___");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let a = await b64.encodeToString(new Uint8Array([77, 97, 110]), util.Type.BASIC);
        let b = await b64.encodeToString(new Uint8Array([77, 97, 110]), util.Type.BASIC_URL_SAFE);
        expect(a).assertEqual(b);
        expect(a.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xfb, 0xef, 0xbe]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("----");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0, 0, 255]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("AAD_");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([240, 159, 152, 128]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("8J-YgA");
        expect(val.length).assertEqual(6);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1400
     * @tc.name testB64ToStrUrlSafe002
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrUrlSafe002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xef, 0xbb, 0xbf]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("77u_");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x61, 0x62, 0x00, 0x63]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("YWIAYw");
        expect(val.length).assertEqual(6);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x61]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("YQ");
        expect(val.length).assertEqual(2);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x61, 0x62]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("YWI");
        expect(val.length).assertEqual(3);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([104, 101, 108, 108, 111]);
        let val = await b64.encodeToString(src, util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual("aGVsbG8");
        expect(val.length).assertEqual(7);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0xfb, 0xef, 0xbe]);
        let val = await b64.encodeToString(src, util.Type.BASIC_URL_SAFE);
        let syncVal: string = b64.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual(syncVal);
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let basic: string = '';
        let val = await b64.encodeToString(new Uint8Array([0xff, 0xff, 0xff]), util.Type.BASIC);
        basic = val;
        let safe = await b64.encodeToString(new Uint8Array([0xff, 0xff, 0xff]), util.Type.BASIC_URL_SAFE);
        let basicCharAt0: string = String(basic.charAt(0));
        let expectedBasicCharAt0: string = '/';
        expect(basicCharAt0).assertEqual(expectedBasicCharAt0);
        let safeCharAt0: string = String(safe.charAt(0));
        let expectedSafeCharAt0: string = '_';
        expect(safeCharAt0).assertEqual(expectedSafeCharAt0);

      }
      {
        let b64 = new util.Base64Helper();
        let basic: string = '';
        let val = await b64.encodeToString(new Uint8Array([0xfb, 0xef, 0xbe]), util.Type.BASIC);
        basic = val;
        let safe = await b64.encodeToString(new Uint8Array([0xfb, 0xef, 0xbe]), util.Type.BASIC_URL_SAFE);
        let basicCharAt0: string = String(basic.charAt(0));
        let expectedBasicCharAt0: string = '+';
        expect(basicCharAt0).assertEqual(expectedBasicCharAt0);
        let safeCharAt0: string = String(safe.charAt(0));
        let expectedSafeCharAt0: string = '-';
        expect(safeCharAt0).assertEqual(expectedSafeCharAt0);

      }
      {
        let b64 = new util.Base64Helper();
        let basic = await b64.encodeToString(new Uint8Array([0x61]), util.Type.BASIC);

        let safe = await b64.encodeToString(new Uint8Array([0x61]), util.Type.BASIC_URL_SAFE);
        let basicEqIndex: number = basic.indexOf('=');
        let expectedBasicEqIndex: int = 2;
        expect(basicEqIndex).assertEqual(expectedBasicEqIndex);
        let safeEqIndex: number = safe.indexOf('=');
        let expectedSafeEqIndex: int = -1;
        expect(safeEqIndex).assertEqual(expectedSafeEqIndex);

      }
      {
        let b64 = new util.Base64Helper();
        let basic = await b64.encodeToString(new Uint8Array([0x61]), util.Type.BASIC);

        let safe = await b64.encodeToString(new Uint8Array([0x61]), util.Type.BASIC_URL_SAFE);
        let lenDelta: int = basic.length - safe.length;
        let expectedLenDelta: int = 2;
        expect(lenDelta).assertEqual(expectedLenDelta);
        expect(basic.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1500
     * @tc.name testB64ToStrUrlSafe003
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrUrlSafe003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([]), util.Type.BASIC_URL_SAFE);
        expect(val).assertEqual('');
        expect(val.length).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x41]), util.Type.BASIC_URL_SAFE);
        let eqIndex: number = val.indexOf('=');
        let expectedEqIndex: int = -1;
        expect(eqIndex).assertEqual(expectedEqIndex);
        expect(val.length).assertEqual(2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97, 110]), util.Type.BASIC_URL_SAFE);
        expect(r).assertEqual("TWFu");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array(0), util.Type.BASIC_URL_SAFE);
        expect(r).assertEqual('');
        expect(r.length).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([251]), util.Type.BASIC_URL_SAFE);
        expect(r).assertEqual("-w");
        expect(r.length).assertEqual(2);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97]), util.Type.BASIC_URL_SAFE);
        expect(r).assertEqual("TWE");
        expect(r.length).assertEqual(3);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0xf8, 0, 0]), util.Type.BASIC_URL_SAFE);
        expect(r).assertEqual("-AAA");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([255, 255, 255]), util.Type.BASIC_URL_SAFE);
        expect(r).assertEqual("____");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let a = b64.encodeToStringSync(new Uint8Array([77, 97, 110]), util.Type.BASIC);
        let b = b64.encodeToStringSync(new Uint8Array([77, 97, 110]), util.Type.BASIC_URL_SAFE);
        expect(a).assertEqual(b);
        expect(a.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x61]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("YQ");
        expect(result.length).assertEqual(2);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1600
     * @tc.name testB64ToStrUrlSafe004
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrUrlSafe004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x61, 0x62]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("YWI");
        expect(result.length).assertEqual(3);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x61, 0x62, 0x63, 0x64]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("YWJjZA");
        expect(result.length).assertEqual(6);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([104, 101, 108, 108, 111]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("aGVsbG8");
        expect(result.length).assertEqual(7);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual('');
        expect(result.length).assertEqual(0);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x41]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("QQ");
        expect(result.length).assertEqual(2);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0xff]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("_w");
        expect(result.length).assertEqual(2);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0xfb]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("-w");
        expect(result.length).assertEqual(2);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x00]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("AA");
        expect(result.length).assertEqual(2);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x41, 0x42]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("QUI");
        expect(result.length).assertEqual(3);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0xff, 0xff, 0xff]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("____");
        expect(result.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1700
     * @tc.name testB64ToStrUrlSafe005
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with URL-safe type variants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrUrlSafe005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0xfb, 0xfb, 0xfb]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(result).assertEqual("-_v7");
        expect(result.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1800
     * @tc.name testB64ToStrBoundary001
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with boundary sizes and values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big);
        let crIndex: number = val.indexOf('\r');
        let expectedCrIndex: int = -1;
        expect(crIndex).assertEqual(expectedCrIndex);
        expect(val.length).assertEqual(136);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array(0));
        expect(val).assertEqual('');
        expect(val.length).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(0);
        let val = await b64.encodeToString(src, util.Type.BASIC);
        let syncVal: string = b64.encodeToStringSync(src, util.Type.BASIC);
        expect(val).assertEqual(syncVal);
        expect(val.length).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(100);
        src.fill(0x61);
        let val = await b64.encodeToString(src);
        expect(val.length).assertEqual(136);
        let firstChar: number = val.charCodeAt(0);
        let expectedFirstChar: number = 89;
        expect(firstChar).assertEqual(expectedFirstChar);
        let lastChar: number = val.charCodeAt(135);
        let expectedLastChar: number = 61;
        expect(lastChar).assertEqual(expectedLastChar);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array(0));
        expect(r).assertEqual('');
        expect(r.length).assertEqual(0);

      }
      {
        let helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(100);
        src.fill(0x61);
        let result: string = helper.encodeToStringSync(src);
        expect(result.length).assertEqual(136);
        let firstChar: number = result.charCodeAt(0);
        let expectedFirstChar: number = 89;
        expect(firstChar).assertEqual(expectedFirstChar);
        let lastChar: number = result.charCodeAt(135);
        let expectedLastChar: number = 61;
        expect(lastChar).assertEqual(expectedLastChar);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_1900
     * @tc.name testB64ToStrBasic001
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77, 97, 110]));
        expect(val).assertEqual("TWFu");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77, 97, 110]), util.Type.BASIC);
        expect(val).assertEqual("TWFu");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let syncVal = b64.encodeToStringSync(new Uint8Array([115, 49, 51]));
        let val = await b64.encodeToString(new Uint8Array([115, 49, 51]));
        expect(val).assertEqual(syncVal);
        expect(syncVal.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77]), util.Type.BASIC);
        expect(val).assertEqual("TQ==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([255]), util.Type.BASIC);
        expect(val).assertEqual("/w==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77, 97]), util.Type.BASIC);
        expect(val).assertEqual("TWE=");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([97, 98, 99]), util.Type.BASIC);
        expect(val).assertEqual("YWJj");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77, 97, 110, 1]), util.Type.BASIC);
        expect(val).assertEqual("TWFuAQ==");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77, 97, 110, 77, 97]), util.Type.BASIC);
        expect(val).assertEqual("TWFuTWE=");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77, 97, 110, 77, 97, 110]), util.Type.BASIC);
        expect(val).assertEqual("TWFuTWFu");
        expect(val.length).assertEqual(8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2000
     * @tc.name testB64ToStrBasic002
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([77, 97, 110, 77, 97, 110, 1]), util.Type.BASIC);
        expect(val).assertEqual("TWFuTWFuAQ==");
        expect(val.length).assertEqual(12);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0, 0, 0, 0, 0, 0]), util.Type.BASIC);
        expect(val).assertEqual("AAAAAAAA");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([9]), util.Type.BASIC);
        expect(val).assertEqual("CQ==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([32]), util.Type.BASIC);
        expect(val).assertEqual("IA==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([43]), util.Type.BASIC);
        expect(val).assertEqual("Kw==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([62]), util.Type.BASIC);
        expect(val).assertEqual("Pg==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([65]), util.Type.BASIC);
        expect(val).assertEqual("QQ==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([67]), util.Type.BASIC);
        expect(val).assertEqual("Qw==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([127]), util.Type.BASIC);
        expect(val).assertEqual("fw==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([251]), util.Type.BASIC);
        expect(val).assertEqual("+w==");
        expect(val.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2100
     * @tc.name testB64ToStrBasic003
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xf8, 0, 0]), util.Type.BASIC);
        expect(val).assertEqual("+AAA");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xfc, 0, 0]), util.Type.BASIC);
        expect(val).assertEqual("/AAA");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xe2, 0x98, 0x83]), util.Type.BASIC);
        expect(val).assertEqual("4piD");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([97, 98, 0]), util.Type.BASIC);
        expect(val).assertEqual("YWIA");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([97, 0, 99, 0]), util.Type.BASIC);
        expect(val).assertEqual("YQBjAA==");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x80, 0x81]), util.Type.BASIC);
        expect(val).assertEqual("gIE=");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([13, 10]), util.Type.BASIC);
        expect(val).assertEqual("DQo=");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([9, 10]), util.Type.BASIC);
        expect(val).assertEqual("CQo=");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0, 0, 1]), util.Type.BASIC);
        expect(val).assertEqual("AAAB");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x41, 0x42, 0x43]), util.Type.BASIC);
        expect(val).assertEqual("QUJD");
        expect(val.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2200
     * @tc.name testB64ToStrBasic004
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x2b, 0x2f, 0x3d]), util.Type.BASIC);
        expect(val).assertEqual("Ky89");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xff, 0]), util.Type.BASIC);
        expect(val).assertEqual("/wA=");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x80, 0, 0]), util.Type.BASIC);
        expect(val).assertEqual("gAAA");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([255, 255, 255, 255, 255, 255]), util.Type.BASIC);
        expect(val).assertEqual("////////");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xfb, 0xff, 0xff]), util.Type.BASIC);
        expect(val).assertEqual("+///");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC);
        expect(val).assertEqual("aGlqaw==");
        expect(val.length).assertEqual(8);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(big, util.Type.BASIC);
        let outLen: int = val.length;
        let expectedOutLen: int = 136;
        expect(outLen).assertEqual(expectedOutLen);
        expect(val).assertEqual("YWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYQ==");

      }
      {
        let arr: number[] = [];
        for (let i = 0; i < 256; i++) {
          arr.push(i);
        }
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array(arr), util.Type.BASIC);
        let outLen: int = val.length;
        let expectedOutLen: int = 344;
        expect(outLen).assertEqual(expectedOutLen);
        expect(val.charCodeAt(0)).assertEqual(65);

      }
      {
        let buf: Uint8Array = new Uint8Array([0, 77, 97, 110, 0]);
        let view = buf.subarray(1, 4);
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("TWFu");
        expect(val.length).assertEqual(4);

      }
      {
        let buf: Uint8Array = new Uint8Array([0, 77, 97, 110, 0]);
        let view = buf.subarray(0, 5);
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("AE1hbgA=");
        expect(val.length).assertEqual(8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2300
     * @tc.name testB64ToStrBasic005
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let buf: Uint8Array = new Uint8Array([1, 2, 3, 251]);
        let view = buf.subarray(3, 4);
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("+w==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([115, 49, 51]);
        let val = await b64.encodeToString(src);
        let czEzIndex: number = val.indexOf("czEz");
        let expectedCzEzIndex: int = 0;
        expect(czEzIndex).assertEqual(expectedCzEzIndex);
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0, 0, 0]), util.Type.BASIC);
        expect(val).assertEqual("AAAA");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x61, 0x62, 0x00, 0x63]), util.Type.BASIC);
        expect(val).assertEqual("YWIAYw==");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([240, 159, 152, 128]), util.Type.BASIC);
        expect(val).assertEqual("8J+YgA==");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xfb, 0xef]), util.Type.BASIC);
        expect(val).assertEqual("++8=");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xef, 0xbb, 0xbf]), util.Type.BASIC);
        expect(val).assertEqual("77u/");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x80]), util.Type.BASIC);
        expect(val).assertEqual("gA==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x3e, 0x01, 0x02]), util.Type.BASIC);
        expect(val).assertEqual("PgEC");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]), util.Type.BASIC);
        expect(val).assertEqual("aGVsbG8gd29ybGQ=");
        expect(val.length).assertEqual(16);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2400
     * @tc.name testB64ToStrBasic006
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x61, 0x62, 0x63]), util.Type.BASIC);
        let outLen: int = val.length;
        let expectedOutLen: int = 4;
        expect(outLen).assertEqual(expectedOutLen);
        expect(val).assertEqual("YWJj");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x61, 0x62, 0x63, 0x64]), util.Type.BASIC);
        let outLen: int = val.length;
        let expectedOutLen: int = 8;
        expect(outLen).assertEqual(expectedOutLen);
        expect(val).assertEqual("YWJjZA==");

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x61]), util.Type.BASIC);
        let outLen: int = val.length;
        let expectedOutLen: int = 4;
        expect(outLen).assertEqual(expectedOutLen);
        expect(val).assertEqual("YQ==");

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([77, 97, 110, 105, 115]);
        let val = await b64.encodeToString(src, util.Type.BASIC);
        expect(val).assertEqual("TWFuaXM=");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(256);
        for (let i: int = 0; i < 256; i++) {
          src.$_set(i, i);
        }
        let val = await b64.encodeToString(src, util.Type.BASIC);
        let syncVal: string = b64.encodeToStringSync(src, util.Type.BASIC);
        expect(val).assertEqual(syncVal);
        expect(val.length).assertEqual(344);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([115, 49, 51]));

        let upper = val.toUpperCase();
        expect(upper).assertEqual("CZEZ");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let fill: Uint8Array = new Uint8Array(ab);
        fill.$_set(0, 0x00);
        fill.$_set(1, 0x61);
        fill.$_set(2, 0x62);
        fill.$_set(3, 0x63);
        fill.$_set(4, 0x00);
        fill.$_set(5, 0x00);
        let view: Uint8Array = new Uint8Array(ab, 1, 3);
        let val = await b64.encodeToString(view, util.Type.BASIC);
        expect(val).assertEqual("YWJj");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let base: Uint8Array = new Uint8Array([0x61, 0x62, 0x63, 0x64, 0x65, 0x66]);
        let view: Uint8Array = base.subarray(1, 4);
        let val = await b64.encodeToString(view, util.Type.BASIC);
        expect(val).assertEqual("YmNk");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let ab: ArrayBuffer = new ArrayBuffer(5);
        let fill: Uint8Array = new Uint8Array(ab);
        fill.$_set(0, 104);
        fill.$_set(1, 101);
        fill.$_set(2, 108);
        fill.$_set(3, 108);
        fill.$_set(4, 111);
        let view: Uint8Array = new Uint8Array(ab);
        let val = await b64.encodeToString(view, util.Type.BASIC);
        expect(val).assertEqual("aGVsbG8=");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let fill: Uint8Array = new Uint8Array(ab);
        fill.$_set(0, 0x61);
        fill.$_set(1, 0x62);
        fill.$_set(2, 0x63);
        fill.$_set(3, 0x64);
        fill.$_set(4, 0x65);
        fill.$_set(5, 0x66);
        let viewA: Uint8Array = new Uint8Array(ab, 0, 3);
        let viewB: Uint8Array = new Uint8Array(ab, 3, 3);
        let valA = await b64.encodeToString(viewA, util.Type.BASIC);
        let valB = await b64.encodeToString(viewB, util.Type.BASIC);
        expect(valA).assertEqual("YWJj");
        expect(valB).assertEqual("ZGVm");

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2500
     * @tc.name testB64ToStrBasic007
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let fill: Uint8Array = new Uint8Array(ab);
        fill.$_set(0, 0x61);
        fill.$_set(1, 0x62);
        fill.$_set(2, 0x63);
        fill.$_set(3, 0x64);
        fill.$_set(4, 0x65);
        fill.$_set(5, 0x66);
        let view: Uint8Array = new Uint8Array(ab, 1, 3);
        let val = await b64.encodeToString(view, util.Type.BASIC);
        expect(val).assertEqual("YmNk");
        let secondByte: number = fill.$_get(1);
        let expectedSecondByte: number = 0x62;
        expect(secondByte).assertEqual(expectedSecondByte);
        let fourthByte: number = fill.$_get(3);
        let expectedFourthByte: number = 0x64;
        expect(fourthByte).assertEqual(expectedFourthByte);

      }
      {
        let b64 = new util.Base64Helper();
        let base: Uint8Array = new Uint8Array([0x61, 0x62, 0x63, 0x64, 0x65, 0x66]);
        let view: Uint8Array = base.subarray(2, 5);
        let val = await b64.encodeToString(view, util.Type.BASIC);
        let outLen: int = val.length;
        let expectedOutLen: int = 4;
        expect(outLen).assertEqual(expectedOutLen);
        expect(val).assertEqual("Y2Rl");

      }
      {
        let b64 = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        let val = await b64.encodeToString(src);
        expect(val).assertEqual("QUJD");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        let val = await b64.encodeToString(src, util.Type.BASIC);
        expect(val).assertEqual("QUJD");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let base = new Uint8Array([1, 2, 3, 4, 5]);
        let view = base.subarray(-1);
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("BQ==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let base = new Uint8Array([1, 2, 3, 4, 5]);
        let view = base.subarray(-2);
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("BAU=");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let base = new Uint8Array([1, 2, 3, 4, 5]);
        let view = base.subarray(-5);
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("AQIDBAU=");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let base = new Uint8Array([1, 2, 3, 4, 5]);
        let view = base.subarray(1);
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("AgMEBQ==");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let base = new Uint8Array([1, 2, 3, 4, 5]);
        let view = base.subarray(2147483647);
        let val = await b64.encodeToString(view);
        expect(val).assertEqual('');
        expect(val.length).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let base = new Uint8Array([1, 2, 3, 4, 5]);
        let view = base.subarray(0, -1);
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("AQIDBA==");
        expect(val.length).assertEqual(8);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2600
     * @tc.name testB64ToStrBasic008
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let base = new Uint8Array([1, 2, 3, 4, 5]);
        let view = base.subarray(0, -2);
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("AQID");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let base = new Uint8Array([1, 2, 3, 4, 5]);
        let view = base.subarray(0, -4);
        let val = await b64.encodeToString(view);
        expect(val).assertEqual("AQ==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([]), util.Type.BASIC);
        expect(val).assertEqual('');
        expect(val.length).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array(new ArrayBuffer(0)));
        expect(val).assertEqual('');
        expect(val.length).assertEqual(0);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x00]), util.Type.BASIC);
        expect(val).assertEqual("AA==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x01]), util.Type.BASIC);
        expect(val).assertEqual("AQ==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x02]), util.Type.BASIC);
        expect(val).assertEqual("Ag==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x3f]), util.Type.BASIC);
        expect(val).assertEqual("Pw==");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0x01, 0x01, 0x01]), util.Type.BASIC);
        expect(val).assertEqual("AQEB");
        expect(val.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0xfb, 0xfb, 0xfb]), util.Type.BASIC);
        expect(val).assertEqual("+/v7");
        expect(val.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2700
     * @tc.name testB64ToStrBasic009
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      {
        let b64 = new util.Base64Helper();
        let s: Uint8Array = new Uint8Array(6);
        for (let i = 0; i < 6; i++) {
          s.$_set(i, 0x3f);
        }
        let val = await b64.encodeToString(s);
        expect(val).assertEqual("Pz8/Pz8/");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let zeros: Uint8Array = new Uint8Array([0, 0, 0, 0, 0, 0, 0, 0, 0, 0]);
        let val = await b64.encodeToString(zeros, util.Type.BASIC);
        let outLen: int = val.length;
        let expectedOutLen: int = 16;
        expect(outLen).assertEqual(expectedOutLen);
        expect(val).assertEqual("AAAAAAAAAAAAAA==");

      }
      {
        let b64 = new util.Base64Helper();
        let src = new Uint8Array(60);
        let val = await b64.encodeToString(src, util.Type.BASIC);
        let crlfIndex: number = val.indexOf("\r\n");
        let expectedCrlfIndex: int = -1;
        expect(crlfIndex).assertEqual(expectedCrlfIndex);
        expect(val.length).assertEqual(80);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([0, 1, 2, 3, 4, 5, 6, 7, 8, 9]));
        expect(val).assertEqual("AAECAwQFBgcICQ==");
        expect(val.length).assertEqual(16);

      }
      {
        let b64 = new util.Base64Helper();
        let val = await b64.encodeToString(new Uint8Array([97, 98, 0, 99]));
        expect(val).assertEqual("YWIAYw==");
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let src = new Uint8Array([104, 101, 108, 108, 111]);
        let val = await b64.encodeToString(src, util.Type.BASIC);
        let syncR = b64.encodeToStringSync(src, util.Type.BASIC);
        expect(val).assertEqual(syncR);
        expect(val.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([65, 66, 67, 68, 69, 70, 71]);
        let implicit = await b64.encodeToString(src);
        let explicit = await b64.encodeToString(src, util.Type.BASIC);
        let implicitStr: string = implicit;
        let expectedImplicitStr: string = explicit;
        expect(implicitStr).assertEqual(expectedImplicitStr);
        expect(implicit.length).assertEqual(12);

      }
      {
        let b64 = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([65, 66, 67, 68, 69]);
        let val = await b64.encodeToString(src);
        let golden: string = "QUJDREU=";
        expect(val.length).assertEqual(8);
        for (let i = 0; i < golden.length; i++) {
          expect(val.charCodeAt(i)).assertEqual(golden.charCodeAt(i));
        }

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97, 110]));
        expect(r).assertEqual("TWFu");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        expect(r).assertEqual("czEz");
        expect(r.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2800
     * @tc.name testB64ToStrBasic010
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big);
        let crIndex: number = r.indexOf('\r');
        let expectedCrIndex: int = -1;
        expect(crIndex).assertEqual(expectedCrIndex);
        expect(r.length).assertEqual(136);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77]), util.Type.BASIC);
        expect(r).assertEqual("TQ==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([255]), util.Type.BASIC);
        expect(r).assertEqual("/w==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97]), util.Type.BASIC);
        expect(r).assertEqual("TWE=");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97, 110]), util.Type.BASIC);
        expect(r).assertEqual("TWFu");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0, 0, 0]), util.Type.BASIC);
        expect(r).assertEqual("AAAA");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97, 110, 1]), util.Type.BASIC);
        expect(r).assertEqual("TWFuAQ==");
        expect(r.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97, 110, 77, 97]), util.Type.BASIC);
        expect(r).assertEqual("TWFuTWE=");
        expect(r.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97, 110, 77, 97, 110]), util.Type.BASIC);
        expect(r).assertEqual("TWFuTWFu");
        expect(r.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([77, 97, 110, 77, 97, 110, 1]), util.Type.BASIC);
        expect(r).assertEqual("TWFuTWFuAQ==");
        expect(r.length).assertEqual(12);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_2900
     * @tc.name testB64ToStrBasic011
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0, 0, 0, 0, 0, 0]), util.Type.BASIC);
        expect(r).assertEqual("AAAAAAAA");
        expect(r.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0]), util.Type.BASIC);
        expect(r).assertEqual("AA==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([1]), util.Type.BASIC);
        expect(r).assertEqual("AQ==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([62]), util.Type.BASIC);
        expect(r).assertEqual("Pg==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([63]), util.Type.BASIC);
        expect(r).assertEqual("Pw==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([251]), util.Type.BASIC);
        expect(r).assertEqual("+w==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0xf8, 0, 0]), util.Type.BASIC);
        expect(r).assertEqual("+AAA");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0xfc, 0, 0]), util.Type.BASIC);
        expect(r).assertEqual("/AAA");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0xef, 0xbb, 0xbf]), util.Type.BASIC);
        expect(r).assertEqual("77u/");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0xe2, 0x98, 0x83]), util.Type.BASIC);
        expect(r).assertEqual("4piD");
        expect(r.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_3000
     * @tc.name testB64ToStrBasic012
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([97, 98, 0]), util.Type.BASIC);
        expect(r).assertEqual("YWIA");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([97, 0, 99, 0]), util.Type.BASIC);
        expect(r).assertEqual("YQBjAA==");
        expect(r.length).assertEqual(8);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([128]), util.Type.BASIC);
        expect(r).assertEqual("gA==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0x80, 0x81]), util.Type.BASIC);
        expect(r).assertEqual("gIE=");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([13, 10]), util.Type.BASIC);
        expect(r).assertEqual("DQo=");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0, 0, 1]), util.Type.BASIC);
        expect(r).assertEqual("AAAB");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0x41, 0x42, 0x43]), util.Type.BASIC);
        expect(r).assertEqual("QUJD");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([127]), util.Type.BASIC);
        expect(r).assertEqual("fw==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([43]), util.Type.BASIC);
        expect(r).assertEqual("Kw==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([10]), util.Type.BASIC);
        expect(r).assertEqual("Cg==");
        expect(r.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_3100
     * @tc.name testB64ToStrBasic013
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([9]), util.Type.BASIC);
        expect(r).assertEqual("CQ==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([32]), util.Type.BASIC);
        expect(r).assertEqual("IA==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([65]), util.Type.BASIC);
        expect(r).assertEqual("QQ==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([67]), util.Type.BASIC);
        expect(r).assertEqual("Qw==");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0x2b, 0x2f, 0x3d]), util.Type.BASIC);
        expect(r).assertEqual("Ky89");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0xff, 0]), util.Type.BASIC);
        expect(r).assertEqual("/wA=");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([0x80, 0, 0]), util.Type.BASIC);
        expect(r).assertEqual("gAAA");
        expect(r.length).assertEqual(4);

      }
      {
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(new Uint8Array([255, 255, 255, 255, 255, 255]), util.Type.BASIC);
        expect(r).assertEqual("////////");
        expect(r.length).assertEqual(8);

      }
      {
        let big: Uint8Array = new Uint8Array(100);
        for (let i = 0; i < 100; i++) {
          big.$_set(i, 97);
        }
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(big, util.Type.BASIC);
        let outLen: int = r.length;
        let expectedOutLen: int = 136;
        expect(outLen).assertEqual(expectedOutLen);
        let crIndex: number = r.indexOf('\r');
        let expectedCrIndex: int = -1;
        expect(crIndex).assertEqual(expectedCrIndex);

      }
      {
        let buf: Uint8Array = new Uint8Array([0, 77, 97, 110, 0]);
        let view = buf.subarray(1, 4);
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(view);
        expect(r).assertEqual("TWFu");
        expect(r.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_3200
     * @tc.name testB64ToStrBasic014
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let buf: Uint8Array = new Uint8Array([0, 77, 97, 110, 0]);
        let view = buf.subarray(0, 5);
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(view);
        expect(r).assertEqual("AE1hbgA=");
        expect(r.length).assertEqual(8);

      }
      {
        let buf: Uint8Array = new Uint8Array([1, 2, 3, 251]);
        let view = buf.subarray(3, 4);
        let b64 = new util.Base64Helper();
        let r = b64.encodeToStringSync(view);
        expect(r).assertEqual("+w==");
        expect(r.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(0);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual('');
        expect(result.length).assertEqual(0);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x61]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("YQ==");
        expect(result.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x61, 0x62]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("YWI=");
        expect(result.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x61, 0x62, 0x63]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("YWJj");
        expect(result.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x61, 0x62, 0x63, 0x64]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("YWJjZA==");
        expect(result.length).assertEqual(8);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([77, 97, 110]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("TWFu");
        expect(result.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("aGVsbG8gd29ybGQ=");
        expect(result.length).assertEqual(16);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x00, 0x00, 0x00]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("AAAA");
        expect(result.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_3300
     * @tc.name testB64ToStrBasic015
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x80]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("gA==");
        expect(result.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x00, 0x00]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("AAA=");
        expect(result.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([104, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100]);
        let result: string = base64Helper.encodeToStringSync(src);
        expect(result).assertEqual("aGVsbG8gd29ybGQ=");
        expect(result.length).assertEqual(16);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([77, 97, 110, 105, 115]);
        let result: string = base64Helper.encodeToStringSync(src);
        let lfIndex: number = result.indexOf('\n');
        let expectedLfIndex: int = -1;
        expect(lfIndex).assertEqual(expectedLfIndex);
        expect(result.length).assertEqual(8);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x61, 0x62]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result.endsWith('=')).assertTrue();
        expect(result.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0x61, 0x62, 0x63, 0x64, 0x65]);
        let result: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("YWJjZGU=");
        expect(result.length).assertEqual(8);

      }
      {
        let base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([0xfb, 0xef, 0xbe]);
        let r1: string = base64Helper.encodeToStringSync(src, util.Type.BASIC);
        let r2: string = base64Helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        let r3: string = base64Helper.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        expect(r1).assertEqual("++++");
        expect(r2).assertEqual("----");
        expect(r3).assertEqual("----\r\n");

      }
      {
        let base64Helper = new util.Base64Helper();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let fill: Uint8Array = new Uint8Array(ab);
        fill.$_set(0, 0x00);
        fill.$_set(1, 0x61);
        fill.$_set(2, 0x62);
        fill.$_set(3, 0x63);
        fill.$_set(4, 0x00);
        fill.$_set(5, 0x00);
        let view: Uint8Array = new Uint8Array(ab, 1, 3);
        let result: string = base64Helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("YWJj");
        expect(result.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let fill: Uint8Array = new Uint8Array(ab);
        fill.$_set(0, 0x61);
        fill.$_set(1, 0x62);
        fill.$_set(2, 0x63);
        fill.$_set(3, 0x64);
        fill.$_set(4, 0x65);
        fill.$_set(5, 0x66);
        let view: Uint8Array = new Uint8Array(ab, 3, 3);
        let result: string = base64Helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("ZGVm");
        expect(result.length).assertEqual(4);

      }
      {
        let base64Helper = new util.Base64Helper();
        let base: Uint8Array = new Uint8Array([0x61, 0x62, 0x63, 0x64, 0x65, 0x66]);
        let view: Uint8Array = base.subarray(1, 4);
        let result: string = base64Helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("YmNk");
        expect(result.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_3400
     * @tc.name testB64ToStrBasic016
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let base64Helper = new util.Base64Helper();
        let ab: ArrayBuffer = new ArrayBuffer(6);
        let fill: Uint8Array = new Uint8Array(ab);
        fill.$_set(0, 0x61);
        fill.$_set(1, 0x62);
        fill.$_set(2, 0x63);
        fill.$_set(3, 0x64);
        fill.$_set(4, 0x65);
        fill.$_set(5, 0x66);
        let viewA: Uint8Array = new Uint8Array(ab, 0, 3);
        let viewB: Uint8Array = new Uint8Array(ab, 3, 3);
        let rA: string = base64Helper.encodeToStringSync(viewA, util.Type.BASIC);
        let rB: string = base64Helper.encodeToStringSync(viewB, util.Type.BASIC);
        expect(rA).assertEqual("YWJj");
        expect(rB).assertEqual("ZGVm");

      }
      {
        let base64Helper = new util.Base64Helper();
        let ab: ArrayBuffer = new ArrayBuffer(5);
        let fill: Uint8Array = new Uint8Array(ab);
        fill.$_set(0, 104);
        fill.$_set(1, 101);
        fill.$_set(2, 108);
        fill.$_set(3, 108);
        fill.$_set(4, 111);
        let view: Uint8Array = new Uint8Array(ab);
        let result: string = base64Helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("aGVsbG8=");
        expect(result.length).assertEqual(8);

      }
      {
        let base64Helper = new util.Base64Helper();
        let base: Uint8Array = new Uint8Array([0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68]);
        let view: Uint8Array = base.subarray(2, 5);
        let result: string = base64Helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("Y2Rl");
        let outLen: int = result.length;
        let expectedOutLen: int = 4;
        expect(outLen).assertEqual(expectedOutLen);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        let result = helper.encodeToStringSync(src);
        expect(result).assertEqual("QUJD");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([65, 66, 67]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("QUJD");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x41]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("QQ==");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x00]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("AA==");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0xff]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("/w==");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0xfb]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("+w==");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0x41, 0x42]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("QUI=");
        expect(result.length).assertEqual(4);

      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BASE64HELPER_ENCODE_TO_STRING_3500
     * @tc.name testB64ToStrBasic017
     * @tc.desc Verify Base64Helper encodeToString and encodeToStringSync with basic input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testB64ToStrBasic017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([0xfb, 0xfb, 0xfb]);
        let result = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(result).assertEqual("+/v7");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let base = new Uint8Array([65, 66, 67]);
        let view = base.subarray(-1);
        let result = helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("Qw==");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let base = new Uint8Array([65, 66, 67]);
        let view = base.subarray(-2);
        let result = helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("QkM=");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let base = new Uint8Array([65, 66, 67]);
        let view = base.subarray(-3);
        let result = helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("QUJD");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let base = new Uint8Array([65, 66, 67]);
        let view = base.subarray(0, -1);
        let result = helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("QUI=");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let base = new Uint8Array([65, 66, 67]);
        let view = base.subarray(0, -2);
        let result = helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("QQ==");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let base = new Uint8Array([65, 66, 67]);
        let view = base.subarray(1, 2);
        let result = helper.encodeToStringSync(view, util.Type.BASIC);
        expect(result).assertEqual("Qg==");
        expect(result.length).assertEqual(4);

      }
      {
        let helper = new util.Base64Helper();
        let src = new Uint8Array([116, 101, 115, 116]);
        let result = helper.encodeToStringSync(src);
        let ref: string = result;
        let expectedRef: string = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(ref).assertEqual(expectedRef);
        expect(result.length).assertEqual(8);

      }
      {
        let helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([65, 66, 67, 68, 69]);
        let result: string = helper.encodeToStringSync(src);
        let golden: string = "QUJDREU=";
        expect(result.length).assertEqual(8);
        for (let i = 0; i < golden.length; i++) {
          expect(result.charCodeAt(i)).assertEqual(golden.charCodeAt(i));
        }

      }
    });

  });
}
