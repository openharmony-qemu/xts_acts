'use static';

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
  beforeAll, afterEach, beforeEach, afterAll, describe, it, expect, TestType, Size, Level
} from '@ohos/hypium-static/src/main/indexStatic';
import util from '@ohos.util';
import Utils from './../Util.test';

class Base64ModeHolder {
  mode: util.Type;

  constructor(mode: util.Type) {
    this.mode = mode;
  }
}

class Base64Payload {
  bytes: Uint8Array;

  constructor(bytes: Uint8Array) {
    this.bytes = bytes;
  }
}

class Base64Worker {
  encodeBasicText(helper: util.Base64Helper, src: Uint8Array): string {
    return helper.encodeToStringSync(src, util.Type.BASIC);
  }

  decodeBasicText(helper: util.Base64Helper, text: string): Uint8Array {
    return helper.decodeSync(text, util.Type.BASIC);
  }
}

function encodeUrlSafeText(helper: util.Base64Helper, src: Uint8Array): string {
  return helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
}

function encodeBasicBytes(helper: util.Base64Helper, src: Uint8Array): Uint8Array {
  return helper.encodeSync(src, util.Type.BASIC);
}

function buildRepeatingBytes(count: int, value: int): Uint8Array {
  let out: Uint8Array = new Uint8Array(count);
  for (let i: int = 0; i < count; i++) {
    out.$_set(i, value);
  }
  return out;
}

export default function typeTest(): void {
  describe('TypeTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_0100
     * @tc.name testType001
     * @tc.desc Merged batch (4 tests): Format constants and alphabet slots: verifies the format constant and alphabet slot layout, including numeric positions and offset relations.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify util.Type exposes BASIC, MIME, BASIC_URL_SAFE and MIME_URL_SAFE at the numeric positions 0, 1, 2 and 3 ---
      {
        let values: int[] = [util.Type.BASIC, util.Type.MIME, util.Type.BASIC_URL_SAFE, util.Type.MIME_URL_SAFE];
        expect(values[0]).assertEqual(0);
        expect(values[1]).assertEqual(1);
        expect(values[2]).assertEqual(2);
        expect(values[3]).assertEqual(3);
      }

      // --- [2] Verify positions 2 and 3 select the URL safe formats encoding 251,255,254 as '-__-' and 251,239,255 as '--__' with a line break ---
      {
        let mode: int = util.Type.BASIC_URL_SAFE;
        expect(mode).assertEqual(2);
        let helper: util.Base64Helper = new util.Base64Helper();
        expect(helper.encodeToStringSync(new Uint8Array([251, 255, 254]), util.Type.BASIC_URL_SAFE)).assertEqual('-__-');
        let helper_2: util.Base64Helper = new util.Base64Helper();
        let encoded: string = helper_2.encodeToStringSync(new Uint8Array([251, 239, 255]), util.Type.MIME_URL_SAFE);
        let expected: string[] = ['--__\r\n'];
        expect(encoded).assertEqual(expected[0]);
        expect(util.Type.MIME_URL_SAFE).assertEqual(3);
      }

      // --- [3] Verify the four members of util.Type sit in strictly ascending numeric order ---
      {
        let basic: int = util.Type.BASIC;
        let mime: int = util.Type.MIME;
        let basicUrlSafe: int = util.Type.BASIC_URL_SAFE;
        let mimeUrlSafe: int = util.Type.MIME_URL_SAFE;
        expect(basic).assertLess(mime);
        expect(mime).assertLess(basicUrlSafe);
        expect(basicUrlSafe).assertLess(mimeUrlSafe);
      }

      // --- [4] Verify each URL safe member sits two above its standard counterpart, the four values sum to 6 and the two pairs differ ---
      {
        let basic: int = util.Type.BASIC;
        let mime: int = util.Type.MIME;
        let basicUrlSafe: int = util.Type.BASIC_URL_SAFE;
        let mimeUrlSafe: int = util.Type.MIME_URL_SAFE;
        expect(basicUrlSafe - basic).assertEqual(2);
        expect(mimeUrlSafe - mime).assertEqual(2);
        expect(basic + mime + basicUrlSafe + mimeUrlSafe).assertEqual(6);
        expect(basic === mime).assertFalse();
        expect(basicUrlSafe === mimeUrlSafe).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_0200
     * @tc.name testType002
     * @tc.desc Merged batch (5 tests): BASIC encoding and decoding: encodeSync in util.Type.BASIC mode yields the standard alphabet byte codes 43 and 118; BASIC encodeSync and BASIC decodeSync return an object that is a Uint8Array; BASIC encodes the byte triple 251,255,255 as '+///' using the two standard alphabet slots 62 and 63; a byte array read from a class field encodes to the same text as an equal local array; BASIC decoding of 'YWI=' yields the bytes 97 and 98.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify encodeSync in util.Type.BASIC mode yields the standard alphabet byte codes 43 and 118 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: Uint8Array = helper.encodeSync(new Uint8Array([0xFA, 0xFE, 0xFD]), util.Type.BASIC);
        expect(encoded.toString()).assertEqual('43,118,55,57');
      }

      // --- [2] Verify BASIC encodeSync and BASIC decodeSync return an object that is a Uint8Array ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: Uint8Array | string = helper.encodeSync(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        expect(encoded instanceof Uint8Array).assertTrue();
        let helper_2: util.Base64Helper = new util.Base64Helper();
        let decoded: Uint8Array | string = helper_2.decodeSync('YWI=', util.Type.BASIC);
        expect(decoded instanceof Uint8Array).assertTrue();
      }

      // --- [3] Verify BASIC encodes the byte triple 251,255,255 as '+///' using the two standard alphabet slots 62 and 63 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: string = helper.encodeToStringSync(new Uint8Array([251, 255, 255]), util.Type.BASIC);
        expect(encoded).assertEqual('+///');
      }

      // --- [4] Verify a byte array read from a class field encodes to the same text as an equal local array ---
      {
        let payload: Base64Payload = new Base64Payload(new Uint8Array([104, 105, 106]));
        let helper: util.Base64Helper = new util.Base64Helper();
        let fromField: string = helper.encodeToStringSync(payload.bytes, util.Type.BASIC);
        let fromLocal: string = helper.encodeToStringSync(new Uint8Array([104, 105, 106]), util.Type.BASIC);
        expect(fromField).assertEqual(fromLocal);
        expect(fromField).assertEqual('aGlq');
      }

      // --- [5] Verify BASIC decoding of 'YWI=' yields the bytes 97 and 98 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let decoded: Uint8Array = helper.decodeSync('YWI=', util.Type.BASIC);
        let first: double = decoded.$_get(0);
        expect(first).assertEqual(97);
        expect(decoded.$_get(1)).assertEqual(98);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_0300
     * @tc.name testType003
     * @tc.desc Merged batch (5 tests): BASIC encoding and decoding: BASIC encodeSync expands the four byte input 104,105,106,107 to eight bytes, the four thirds ratio; a 58 byte BASIC result contains no carriage return at all; encodeToStringSync in util.Type.BASIC mode encodes the byte triple 255,255,255 as '////'; decodeSync in util.Type.BASIC mode restores the byte triple 250,254,253 from '+v79'; decodeSync with explicit util.Type.BASIC decodes a Uint8Array source into the last original byte.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify BASIC encodeSync expands the four byte input 104,105,106,107 to eight bytes, the four thirds ratio ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: Uint8Array = helper.encodeSync(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC);
        expect(encoded.byteLength).assertEqual(8);
      }

      // --- [2] Verify a 58 byte BASIC result contains no carriage return at all ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array(58);
        for (let i: int = 0; i < 58; i++) {
          src.$_set(i, 0);
        }
        let encoded: string = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(encoded.indexOf('\r')).assertEqual(-1);
      }

      // --- [3] Verify encodeToStringSync in util.Type.BASIC mode encodes the byte triple 255,255,255 as '////' ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let raw: Uint8Array = new Uint8Array([0xFF, 0xFF, 0xFF]);
        let encoded: string = helper.encodeToStringSync(raw, util.Type.BASIC);
        expect(encoded.length).assertEqual(4);
        expect(encoded).assertEqual('////');
      }

      // --- [4] Verify decodeSync in util.Type.BASIC mode restores the byte triple 250,254,253 from '+v79' ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encodedInput: string = '+v79';
        let decoded: Uint8Array = helper.decodeSync(encodedInput, util.Type.BASIC);
        expect(decoded.$_get(0)).assertEqual(250);
        expect(decoded.$_get(1)).assertEqual(254);
        expect(decoded.$_get(2)).assertEqual(253);
      }

      // --- [5] Verify decodeSync with explicit util.Type.BASIC decodes a Uint8Array source into the last original byte ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let decoded: Uint8Array = helper.decodeSync(new Uint8Array([100, 50, 86, 122]), util.Type.BASIC);
        expect(decoded.$_get(2)).assertEqual(115);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_0400
     * @tc.name testType004
     * @tc.desc Merged batch (5 tests): BASIC encoding and decoding: BASIC encodes the all zero triple 0,0,0 into 'AAAA' whose end characters are the alphabet slot zero code 65; encodeSync of a subarray view at byte offset 2 encodes its three bytes and keeps the view offset; a view of the first three buffer bytes and a view of the last three encode to different text; a view over three buffer bytes encodes to the same text as the standalone copy of them; decodeSync of the empty text under BASIC yields a zero length Uint8Array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify BASIC encodes the all zero triple 0,0,0 into 'AAAA' whose end characters are the alphabet slot zero code 65 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: string = helper.encodeToStringSync(new Uint8Array([0, 0, 0]), util.Type.BASIC);
        expect(encoded.length).assertEqual(4);
        expect(encoded).assertEqual('AAAA');
        expect(encoded.charCodeAt(0)).assertEqual(65);
        expect(encoded.charCodeAt(3)).assertEqual(65);
      }

      // --- [2] Verify encodeSync of a subarray view at byte offset 2 encodes its three bytes and keeps the view offset ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let buffer: Uint8Array = new Uint8Array([120, 120, 104, 105, 106]);
        let view: Uint8Array = buffer.subarray(2, 5);
        let encoded: Uint8Array = helper.encodeSync(view, util.Type.BASIC);
        expect(encoded.toString()).assertEqual('97,71,108,113');
        expect(view.byteOffset).assertEqual(2);
        expect(view.byteLength).assertEqual(3);
      }

      // --- [3] Verify a view of the first three buffer bytes and a view of the last three encode to different text ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let buffer: Uint8Array = new Uint8Array([104, 105, 106, 107, 108, 109]);
        let head: Uint8Array = buffer.subarray(0, 3);
        let tail: Uint8Array = buffer.subarray(3, 6);
        let fromHead: string = helper.encodeToStringSync(head, util.Type.BASIC);
        let fromTail: string = helper.encodeToStringSync(tail, util.Type.BASIC);
        expect(fromHead).assertEqual('aGlq');
        expect(fromTail).assertEqual('a2xt');
      }

      // --- [4] Verify a view over three buffer bytes encodes to the same text as the standalone copy of them ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let buffer: Uint8Array = new Uint8Array([120, 120, 104, 105, 106]);
        let view: Uint8Array = buffer.subarray(2, 5);
        let standalone: Uint8Array = new Uint8Array([104, 105, 106]);
        let fromView: Uint8Array = helper.encodeSync(view, util.Type.BASIC);
        let fromArray: Uint8Array = helper.encodeSync(standalone, util.Type.BASIC);
        expect(fromView.toString()).assertEqual(fromArray.toString());
      }

      // --- [5] Verify decodeSync of the empty text under BASIC yields a zero length Uint8Array ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let decoded: Uint8Array = helper.decodeSync('', util.Type.BASIC);
        expect(decoded.length).assertEqual(0);
        expect(decoded.buffer.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_0500
     * @tc.name testType005
     * @tc.desc Merged batch (1 test): BASIC encoding and decoding: an empty source under BASIC encodeSync yields a zero length array.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify an empty source under BASIC encodeSync yields a zero length array ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: Uint8Array = helper.encodeSync(new Uint8Array(0), util.Type.BASIC);
        expect(encoded.byteLength).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_0600
     * @tc.name testType006
     * @tc.desc Merged batch (5 tests): MIME wrapping and line breaks: a builder function returns 57 bytes of the requested value that encode into 78 MIME characters; MIME and MIME_URL_SAFE diverge for 58 copies of 251 in alphabet characters and padding; MIME wraps at 76 characters, so 56 or 57 bytes give 78 characters, 58 bytes give 84 and every break is 13 then 10; MIME line counts and tail lengths for the critical sizes 56, 133 and 171 bytes; MIME decoding ignores a trailing carriage return and line feed.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a builder function returns 57 bytes of the requested value that encode into 78 MIME characters ---
      {
        let src: Uint8Array = buildRepeatingBytes(57, 0x61);
        let helper: util.Base64Helper = new util.Base64Helper();
        expect(src.byteLength).assertEqual(57);
        expect(src.$_get(56)).assertEqual(97);
        expect(helper.encodeToStringSync(src, util.Type.MIME).length).assertEqual(78);
      }

      // --- [2] Verify MIME and MIME_URL_SAFE diverge for 58 copies of 251 in alphabet characters and padding ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = buildRepeatingBytes(58, 251);
        let mime: string = helper.encodeToStringSync(src, util.Type.MIME);
        let urlSafe: string = helper.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        expect(mime.endsWith('==\r\n')).assertTrue();
        expect(urlSafe.indexOf('=')).assertEqual(-1);
        expect(mime.indexOf('+')).assertLarger(-1);
        expect(urlSafe.indexOf('+')).assertEqual(-1);
      }

      // --- [3] Verify MIME wraps at 76 characters, so 56 or 57 bytes give 78 characters, 58 bytes give 84 and every break is 13 then 10 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = buildRepeatingBytes(57, 0x61);
        let basic: string = helper.encodeToStringSync(src, util.Type.BASIC);
        let urlSafe: string = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        let mime: string = helper.encodeToStringSync(src, util.Type.MIME);
        let mimeUrlSafe: string = helper.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        expect(basic.length).assertEqual(76);
        expect(urlSafe.length).assertEqual(76);
        expect(mime.length).assertEqual(78);
        expect(mimeUrlSafe.length).assertEqual(78);
        expect(helper.encodeSync(src, util.Type.BASIC).byteLength).assertEqual(76);
        expect(mime.indexOf('\r\n')).assertEqual(76);
        expect(mime.charCodeAt(76)).assertEqual(13);
        expect(mime.charCodeAt(77)).assertEqual(10);
        expect(mime.endsWith('\r\n')).assertTrue();
        expect(basic.indexOf('\r\n')).assertEqual(-1);
        let fills: int[] = [0, 255];
        for (const fill of fills) {
          let filled: Uint8Array = new Uint8Array(58);
          for (let i: int = 0; i < 58; i++) {
            filled.$_set(i, fill);
          }
          let text: string = helper.encodeToStringSync(filled, util.Type.MIME);
          expect(text.length).assertEqual(84);
          expect(text.indexOf('\r')).assertEqual(76);
          let lines: string[] = text.split('\r\n');
          expect(lines[0].length).assertEqual(76);
        }
        let sixty: string = helper.encodeToStringSync(buildRepeatingBytes(58, 0x61), util.Type.MIME);
        expect(sixty.length).assertEqual(84);
        let secondLine: string = sixty.split('\r\n')[1];
        expect(secondLine).assertEqual('YQ==');
        let urlSafeText: string = helper.encodeToStringSync(buildRepeatingBytes(58, 251), util.Type.MIME_URL_SAFE);
        let urlParts: string[] = urlSafeText.split('\r\n');
        expect(urlParts.length).assertEqual(3);
        expect(urlParts[1].length).assertEqual(2);
        expect(urlParts[2].length).assertEqual(0);
      }

      // --- [4] Verify MIME line counts and tail lengths for the critical sizes 56, 133 and 171 bytes ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let oneLine: string = helper.encodeToStringSync(buildRepeatingBytes(56, 0x61), util.Type.MIME);
        expect(oneLine.length).assertEqual(78);
        expect(oneLine.indexOf('=')).assertEqual(75);
        expect(oneLine.endsWith('\r\n')).assertTrue();
        let middle: string[] = helper.encodeToStringSync(buildRepeatingBytes(133, 0x61), util.Type.MIME).split('\r\n');
        expect(middle.length).assertEqual(4);
        expect(middle[2].length).assertEqual(28);
        expect(middle[3].length).assertEqual(0);
        let longText: string = helper.encodeToStringSync(buildRepeatingBytes(171, 0x61), util.Type.MIME);
        expect(longText.length).assertEqual(234);
        expect(longText.split('\r\n').length).assertEqual(4);
      }

      // --- [5] Verify MIME decoding ignores a trailing carriage return and line feed ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let decoded: Uint8Array = helper.decodeSync('+v79\r\n', util.Type.MIME);
        expect(decoded.$_get(0)).assertEqual(250);
        expect(decoded.byteLength).assertEqual(3);
        let padded: Uint8Array = helper.decodeSync('YWI=\r\n', util.Type.MIME);
        expect(padded.$_get(0)).assertEqual(97);
        expect(padded.byteLength).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_0700
     * @tc.name testType007
     * @tc.desc Merged batch (1 test): MIME wrapping and line breaks: MIME decoders accept texts that end with a line break and restore the original byte count.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify MIME decoders accept texts that end with a line break and restore the original byte count ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let headBytes: Uint8Array = helper.decodeSync('-v79\r\n', util.Type.MIME_URL_SAFE);
        expect(headBytes.$_get(0)).assertEqual(250);
        expect(headBytes.byteLength).assertEqual(3);
        let triple: Uint8Array = helper.decodeSync('--__\r\n', util.Type.MIME_URL_SAFE);
        expect(triple.$_get(0)).assertEqual(251);
        expect(triple.$_get(1)).assertEqual(239);
        expect(triple.$_get(2)).assertEqual(255);
        expect(triple.byteLength).assertEqual(3);
        let text: string = 'YWFh'.repeat(19) + '\r\n';
        let wide: Uint8Array = helper.decodeSync(text, util.Type.MIME);
        expect(wide.byteLength).assertEqual(57);
        expect(wide.$_get(0)).assertEqual(97);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_0800
     * @tc.name testType008
     * @tc.desc Merged batch (5 tests): URL-safe alphabet and padding: MIME and MIME_URL_SAFE agree on a 57 byte padding free source; a mode read from a class field drives encodeToStringSync to the URL safe text '-v79'; short and empty inputs keep their format padding and always end with one line break; the MIME text of 57 bytes decodes under MIME_URL_SAFE to the same bytes as under MIME; decodeSync in util.Type.BASIC_URL_SAFE mode restores the first byte of '-v79' as 250.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify MIME and MIME_URL_SAFE agree on a 57 byte padding free source while BASIC_URL_SAFE maps byte codes 43 and 118 to 45 and 118 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = buildRepeatingBytes(57, 0x61);
        let mime: string = helper.encodeToStringSync(src, util.Type.MIME);
        let urlSafe: string = helper.encodeToStringSync(src, util.Type.MIME_URL_SAFE);
        expect(urlSafe).assertEqual(mime);
        expect(mime.endsWith('\r\n')).assertTrue();
        let helper_2: util.Base64Helper = new util.Base64Helper();
        let raw: Uint8Array = new Uint8Array([0xFA, 0xFE, 0xFD]);
        let encoded: Uint8Array = helper_2.encodeSync(raw, util.Type.BASIC_URL_SAFE);
        let codes: string = encoded.toString();
        expect(codes).assertEqual('45,118,55,57');
      }

      // --- [2] Verify a mode read from a class field drives encodeToStringSync to the URL safe text '-v79' ---
      {
        let holder: Base64ModeHolder = new Base64ModeHolder(util.Type.BASIC_URL_SAFE);
        let helper: util.Base64Helper = new util.Base64Helper();
        let text: string = helper.encodeToStringSync(new Uint8Array([250, 254, 253]), holder.mode);
        expect(text).assertEqual('-v79');
      }

      // --- [3] Verify short and empty inputs keep their format padding and always end with one line break ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let triple: Uint8Array = new Uint8Array([0xFA, 0xFE, 0xFD]);
        expect(JSON.stringify(helper.encodeToStringSync(triple, util.Type.MIME))).assertEqual('"+v79\\r\\n"');
        expect(helper.encodeToStringSync(triple, util.Type.MIME_URL_SAFE)).assertEqual('-v79\r\n');
        expect(JSON.stringify(helper.encodeToStringSync(new Uint8Array([97]), util.Type.MIME))).assertEqual('"YQ==\\r\\n"');
        expect(helper.encodeToStringSync(new Uint8Array([0xFB]), util.Type.MIME_URL_SAFE)).assertEqual('-w\r\n');
        let emptyView: Uint8Array = new Uint8Array(new ArrayBuffer(4), 0, 0);
        let emptyText: string = helper.encodeToStringSync(emptyView, util.Type.MIME);
        expect(emptyText.length).assertEqual(2);
        expect(emptyText.endsWith('\r\n')).assertTrue();
      }

      // --- [4] Verify the MIME text of 57 bytes decodes under MIME_URL_SAFE to the same bytes as under MIME ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = buildRepeatingBytes(57, 0x61);
        let text: string = helper.encodeToStringSync(src, util.Type.MIME);
        let viaMime: Uint8Array = helper.decodeSync(text, util.Type.MIME);
        let viaUrlSafe: Uint8Array = helper.decodeSync(text, util.Type.MIME_URL_SAFE);
        expect(viaUrlSafe.byteLength).assertEqual(57);
        expect(viaUrlSafe.$_get(56)).assertEqual(viaMime.$_get(56));
      }

      // --- [5] Verify decodeSync in util.Type.BASIC_URL_SAFE mode restores the first byte of '-v79' as 250 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let decoded: Uint8Array = helper.decodeSync('-v79', util.Type.BASIC_URL_SAFE);
        let head: double = decoded.$_get(0);
        expect(head).assertEqual(250);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_0900
     * @tc.name testType009
     * @tc.desc Merged batch (5 tests): URL-safe alphabet and padding: BASIC_URL_SAFE encodes the byte quadruple 104,105,106,107 as 'aGlqaw' with the padding dropped; BASIC_URL_SAFE maps both the 62 and the 63 alphabet slot of the byte triple 251,255,255 to '-___'; the URL safe line breaking format still appends its line break for an empty source; BASIC_URL_SAFE encodeSync returns the alphabet byte codes 45,95,95,45 of '-__-'; BASIC_URL_SAFE decoding of '-___' yields the bytes 251 and 255.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify BASIC_URL_SAFE encodes the byte quadruple 104,105,106,107 as 'aGlqaw' with the padding dropped ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: string = helper.encodeToStringSync(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC_URL_SAFE);
        expect(encoded.indexOf('=')).assertEqual(-1);
        expect(encoded).assertEqual('aGlqaw');
      }

      // --- [2] Verify BASIC_URL_SAFE maps both the 62 and the 63 alphabet slot of the byte triple 251,255,255 to '-___' ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let slots: Uint8Array = new Uint8Array([0xFB, 0xFF, 0xFF]);
        let encoded: string = helper.encodeToStringSync(slots, util.Type.BASIC_URL_SAFE);
        expect(encoded).assertEqual('-___');
        expect(encoded.length).assertEqual(4);
      }

      // --- [3] Verify the URL safe line breaking format still appends its line break for an empty source while the plain format returns the empty string ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let urlSafe: string =
          helper.encodeToStringSync(new Uint8Array(0), util.Type.MIME_URL_SAFE);
        let plain: string = helper.encodeToStringSync(new Uint8Array(0), util.Type.BASIC);
        expect(JSON.stringify(urlSafe)).assertEqual('"\\r\\n"');
        expect(plain).assertEqual('');
      }

      // --- [4] Verify BASIC_URL_SAFE encodeSync returns the alphabet byte codes 45,95,95,45 of '-__-' ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: Uint8Array = helper.encodeSync(new Uint8Array([251, 255, 254]), util.Type.BASIC_URL_SAFE);
        expect(encoded.toString()).assertEqual('45,95,95,45');
        expect(encoded.length).assertEqual(4);
      }

      // --- [5] Verify BASIC_URL_SAFE decoding of '-___' yields the bytes 251 and 255 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let urlSafe: string = '-___';
        let decoded: Uint8Array = helper.decodeSync(urlSafe, util.Type.BASIC_URL_SAFE);
        expect(decoded.$_get(0)).assertEqual(251);
        expect(decoded.byteLength).assertEqual(3);
        expect(decoded.$_get(2)).assertEqual(255);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1000
     * @tc.name testType010
     * @tc.desc Merged batch (5 tests): URL-safe alphabet and padding: BASIC_URL_SAFE decoding of '-w==' and of the unpadded '-w' both yield the single byte 251; the URL safe format drops the padding that BASIC keeps, giving two, three and four characters by residue; URL safe and standard alphabets differ only at the two special slots; BASIC padding follows the residue: two equal signs for one byte, one for two bytes and none for three; two helper instances produce identical URL safe text for the same input.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify BASIC_URL_SAFE decoding of '-w==' and of the unpadded '-w' both yield the single byte 251 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let padded: Uint8Array = helper.decodeSync('-w==', util.Type.BASIC_URL_SAFE);
        expect(padded.byteLength).assertEqual(1);
        let unpadded: Uint8Array = helper.decodeSync('-w', util.Type.BASIC_URL_SAFE);
        expect(unpadded.byteLength).assertEqual(1);
        expect(unpadded.$_get(0)).assertEqual(251);
        expect(padded.$_get(0)).assertEqual(251);
      }

      // --- [2] Verify the URL safe format drops the padding that BASIC keeps, giving two, three and four characters by residue ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let single: string = helper.encodeToStringSync(new Uint8Array([0]), util.Type.BASIC_URL_SAFE);
        expect(single.length).assertEqual(2);
        expect(single).assertEqual('AA');
        let pair: string = helper.encodeToStringSync(new Uint8Array([0, 0]), util.Type.BASIC_URL_SAFE);
        expect(pair.length).assertEqual(3);
        expect(pair).assertEqual('AAA');
        let triple: string = helper.encodeToStringSync(new Uint8Array([0, 0, 0]), util.Type.BASIC_URL_SAFE);
        expect(triple.length).assertEqual(4);
        expect(triple.indexOf('=')).assertEqual(-1);
      }

      // --- [3] Verify URL safe and standard alphabets differ only at the two special slots while either decoder reads the shared characters ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let slotSrc: Uint8Array = new Uint8Array([0xFA, 0xFE, 0xFD]);
        expect(helper.encodeToStringSync(slotSrc, util.Type.BASIC)).assertEqual('+v79');
        expect(helper.encodeToStringSync(slotSrc, util.Type.BASIC_URL_SAFE)).assertEqual('-v79');
        let specialSrc: Uint8Array = new Uint8Array([251, 255, 255]);
        let basic: string = helper.encodeToStringSync(specialSrc, util.Type.BASIC);
        let urlSafe: string = helper.encodeToStringSync(specialSrc, util.Type.BASIC_URL_SAFE);
        expect(basic).assertEqual('+///');
        expect(urlSafe).assertEqual('-___');
        let basicUrlSafe: Uint8Array = helper.decodeSync('aGlq', util.Type.BASIC_URL_SAFE);
        let mimeUrlSafe: Uint8Array = helper.decodeSync('aGlq\r\n', util.Type.MIME_URL_SAFE);
        expect(mimeUrlSafe.$_get(2)).assertEqual(basicUrlSafe.$_get(2));
        expect(mimeUrlSafe.byteLength).assertEqual(3);
        let plain: Uint8Array = helper.decodeSync('aGlq', util.Type.BASIC);
        expect(plain.$_get(1)).assertEqual(basicUrlSafe.$_get(1));
        expect(plain.$_get(1)).assertEqual(105);
        let wideSrc: Uint8Array = buildRepeatingBytes(57, 0x61);
        let wideText: string = helper.encodeToStringSync(wideSrc, util.Type.BASIC);
        let wideDecoded: Uint8Array = helper.decodeSync(wideText, util.Type.BASIC_URL_SAFE);
        expect(wideText.indexOf('+')).assertEqual(-1);
        expect(wideDecoded.byteLength).assertEqual(57);
      }

      // --- [4] Verify BASIC padding follows the residue: two equal signs for one byte, one for two bytes and none for three ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let one: string = helper.encodeToStringSync(new Uint8Array([251]), util.Type.BASIC);
        expect(one).assertEqual('+w==');
        expect(one.length).assertEqual(4);
        expect(one.endsWith('==')).assertTrue();
        let two: string = helper.encodeToStringSync(new Uint8Array([104, 105]), util.Type.BASIC);
        expect(two.length).assertEqual(4);
        expect(two.endsWith('=')).assertTrue();
        expect(two.endsWith('==')).assertFalse();
        let zeroPair: string = helper.encodeToStringSync(new Uint8Array([0, 0]), util.Type.BASIC);
        expect(zeroPair.length).assertEqual(4);
        let four: string = helper.encodeToStringSync(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC);
        expect(four).assertEqual('aGlqaw==');
        expect(four.indexOf('=')).assertEqual(6);
        let fourSafe: string = helper.encodeToStringSync(new Uint8Array([104, 105, 106, 107]), util.Type.BASIC_URL_SAFE);
        expect(fourSafe.indexOf('=')).assertEqual(-1);
      }

      // --- [5] Verify two helper instances produce identical URL safe text for the same input ---
      {
        let first: util.Base64Helper = new util.Base64Helper();
        let second: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([250, 254, 253]);
        let left: string = first.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        let right: string = second.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(left).assertEqual(right);
        expect(left).assertEqual('-v79');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1100
     * @tc.name testType011
     * @tc.desc Merged batch (1 test): URL-safe alphabet and padding: encodeSync rejects util.Type.MIME and util.Type.MIME_URL_SAFE with a BusinessError.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify encodeSync rejects util.Type.MIME and util.Type.MIME_URL_SAFE with a BusinessError ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let bytes: Uint8Array = new Uint8Array([115, 49, 51]);
        let unsupported: util.Type[] = [util.Type.MIME, util.Type.MIME_URL_SAFE];
        for (const mode of unsupported) {
          try {
            helper.encodeSync(bytes, mode);
            expect().assertFail();
          } catch (e) {
            expect(e.name).assertEqual('BusinessError');
          }
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1200
     * @tc.name testType012
     * @tc.desc Merged batch (4 tests): Default format behavior: verifies behavior when no format is supplied, covering typed array views.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify encodeSync without options returns the BASIC bytes 100,50,86,122, identical to the explicit util.Type.BASIC call ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([119, 101, 115]);
        let omitted: Uint8Array = helper.encodeSync(src);
        let explicit: Uint8Array = helper.encodeSync(src, util.Type.BASIC);
        expect(omitted.toString()).assertEqual('100,50,86,122');
        expect(omitted.toString()).assertEqual(explicit.toString());
      }

      // --- [2] Verify default options match explicit util.Type.BASIC: encodeToStringSync yields d2Vz and decodeSync restores 119 to 115 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([119, 101, 115]);
        let omitted: string = helper.encodeToStringSync(src);
        let explicit: string = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(omitted).assertEqual('d2Vz');
        expect(omitted).assertEqual(explicit);
        let helper_2: util.Base64Helper = new util.Base64Helper();
        let omitted_2: Uint8Array = helper_2.decodeSync('d2Vz');
        let explicit_2: Uint8Array = helper_2.decodeSync('d2Vz', util.Type.BASIC);
        expect(omitted_2.$_get(0)).assertEqual(119);
        expect(omitted_2.$_get(2)).assertEqual(115);
        expect(omitted_2.toString()).assertEqual(explicit_2.toString());
      }

      // --- [3] Verify the default format emits no carriage return, proving it is one of the non line breaking formats ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: string = helper.encodeToStringSync(new Uint8Array([104, 105, 106, 107]));
        expect(encoded.indexOf('\r\n')).assertEqual(-1);
      }

      // --- [4] Verify decodeSync without options decodes a Uint8Array source using the default BASIC alphabet ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let decoded: Uint8Array = helper.decodeSync(new Uint8Array([100, 50, 86, 122]));
        expect(decoded.$_get(0)).assertEqual(119);
        expect(decoded.byteLength).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1300
     * @tc.name testType013
     * @tc.desc Merged batch (4 tests): Asynchronous APIs: verifies asynchronous encoding and decoding results, covering typed array views.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
      // --- [1] Verify asynchronous calls that omit the format resolve like the explicit BASIC call for encode, encodeToString and decode ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([119, 101, 115]);
        let omittedBytes: Uint8Array = await helper.encode(src);
        let explicitBytes: Uint8Array = await helper.encode(src, util.Type.BASIC);
        expect(omittedBytes.toString()).assertEqual('100,50,86,122');
        expect(omittedBytes.byteLength).assertEqual(4);
        expect(explicitBytes.$_get(0)).assertEqual(100);
        expect(explicitBytes.byteLength).assertEqual(4);
        expect(omittedBytes.toString()).assertEqual(explicitBytes.toString());
        let omittedText: string = await helper.encodeToString(src);
        let explicitText: string = await helper.encodeToString(src, util.Type.BASIC);
        expect(omittedText).assertEqual('d2Vz');
        expect(explicitText.length).assertEqual(4);
        expect(explicitText.substring(3)).assertEqual('z');
        expect(omittedText).assertEqual(explicitText);
        let omittedDecoded: Uint8Array = await helper.decode('d2Vz');
        let explicitDecoded: Uint8Array = await helper.decode('d2Vz', util.Type.BASIC);
        expect(omittedDecoded.$_get(0)).assertEqual(119);
        expect(explicitDecoded.byteLength).assertEqual(3);
        expect(explicitDecoded.$_get(1)).assertEqual(101);
        let shortSrc: Uint8Array = new Uint8Array([104, 105, 106]);
        let shortOmitted: string = await helper.encodeToString(shortSrc);
        let shortExplicit: string = await helper.encodeToString(shortSrc, util.Type.BASIC);
        expect(shortOmitted).assertEqual('aGlq');
        expect(shortOmitted).assertEqual(shortExplicit);
      }

      // --- [2] Verify synchronous and asynchronous encoders and decoders agree byte for byte in every format and both async paths resolve to Uint8Array ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([119, 101, 115]);
        let syncBytes: Uint8Array = helper.encodeSync(src, util.Type.BASIC);
        let asyncBytes: Uint8Array = await helper.encode(src, util.Type.BASIC);
        expect(asyncBytes.toString()).assertEqual(syncBytes.toString());
        let slotSrc: Uint8Array = new Uint8Array([0xFA, 0xFE, 0xFD]);
        let syncSafe: string = helper.encodeToStringSync(slotSrc, util.Type.BASIC_URL_SAFE);
        let asyncSafe: string = await helper.encodeToString(slotSrc, util.Type.BASIC_URL_SAFE);
        expect(asyncSafe).assertEqual(syncSafe);
        let syncMime: Uint8Array = helper.decodeSync('+v79\r\n', util.Type.MIME);
        let asyncMime: Uint8Array = await helper.decode('+v79\r\n', util.Type.MIME);
        expect(asyncMime.$_get(0)).assertEqual(syncMime.$_get(0));
        let syncPadded: Uint8Array = helper.decodeSync('YWI=', util.Type.BASIC);
        let asyncPadded: Uint8Array = await helper.decode('YWI=', util.Type.BASIC);
        expect(asyncPadded.toString()).assertEqual(syncPadded.toString());
        let lineSrc: Uint8Array = new Uint8Array([89, 87, 73, 61, 13, 10]);
        let asyncLine: Uint8Array = await helper.decode(lineSrc, util.Type.MIME);
        let syncLine: Uint8Array = helper.decodeSync('YWI=\r\n', util.Type.MIME);
        expect(asyncLine.toString()).assertEqual(syncLine.toString());
        let wideSrc: Uint8Array = buildRepeatingBytes(57, 0x61);
        let asyncWide: string = await helper.encodeToString(wideSrc, util.Type.MIME);
        let syncWide: string = helper.encodeToStringSync(wideSrc, util.Type.MIME);
        expect(asyncWide).assertEqual(syncWide);
        let asyncSafeBytes: Uint8Array = await helper.decode('--__\r\n', util.Type.MIME_URL_SAFE);
        let syncSafeBytes: Uint8Array = helper.decodeSync('--__\r\n', util.Type.MIME_URL_SAFE);
        expect(asyncSafeBytes.$_get(2)).assertEqual(syncSafeBytes.$_get(2));
        expect(asyncSafeBytes.$_get(0)).assertEqual(251);
        let helper_2: util.Base64Helper = new util.Base64Helper();
        let encoded: Uint8Array | string = await helper_2.encode(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        expect(encoded instanceof Uint8Array).assertTrue();
        let decoded: Uint8Array | string = await helper_2.decode('YWI=\r\n', util.Type.MIME);
        expect(decoded instanceof Uint8Array).assertTrue();
      }

      // --- [3] Verify an asynchronous decode of the 78 character MIME text restores 57 bytes ending in 97 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = buildRepeatingBytes(57, 0x61);
        let text: string = helper.encodeToStringSync(src, util.Type.MIME);
        let decoded: Uint8Array = await helper.decode(text, util.Type.MIME);
        expect(decoded.byteLength).assertEqual(57);
        expect(decoded.$_get(56)).assertEqual(97);
      }

      // --- [4] Verify asynchronous results use their own buffers and remain distinct from synchronous results ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([250, 254, 253]);
        let encoded: Uint8Array = await helper.encode(src, util.Type.BASIC_URL_SAFE);
        expect(encoded.buffer === src.buffer).assertFalse();
        let asyncBytes: Uint8Array = await helper.decode('YWI=', util.Type.BASIC);
        let syncBytes: Uint8Array = helper.decodeSync('YWI=', util.Type.BASIC);
        expect(asyncBytes === syncBytes).assertFalse();
        expect(asyncBytes.byteLength).assertEqual(syncBytes.byteLength);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1400
     * @tc.name testType014
     * @tc.desc Merged batch (5 tests): Round-trip integrity: text round trips restore the source byte for byte under all four formats, including residue lengths; round trips through the byte and text APIs restore equal arrays and re-encoding a decoded BASIC text is stable; re-encoding a source after its first byte is zeroed yields 'AGVz' instead of 'd2Vz'; encode decode encode chains are fixpoints and cross-mode re-encodes drop line breaks and padding; the 'plus slash slash slash' text decodes to bytes that re-encode as '-___' when URL safe.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify text round trips restore the source byte for byte under all four formats, including residue lengths ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let modes: util.Type[] = [util.Type.BASIC, util.Type.BASIC_URL_SAFE, util.Type.MIME, util.Type.MIME_URL_SAFE, util.Type.BASIC];
        let sources: Uint8Array[] = [
          new Uint8Array([115, 49, 51, 0, 255]),
          new Uint8Array([250, 254, 253]),
          new Uint8Array(57),
          new Uint8Array(58),
          new Uint8Array([104, 105, 106, 107, 0, 255])
        ];
        for (let i: int = 0; i < 57; i++) {
          sources[2].$_set(i, i % 256);
        }
        for (let i: int = 0; i < 58; i++) {
          sources[3].$_set(i, 255 - i);
        }
        for (let i: int = 0; i < modes.length; i++) {
          let text: string = helper.encodeToStringSync(sources[i], modes[i]);
          let back: Uint8Array = helper.decodeSync(text, modes[i]);
          expect(back.toString()).assertEqual(sources[i].toString());
        }
      }

      // --- [2] Verify round trips through the byte and text APIs restore equal arrays and re-encoding a decoded BASIC text is stable ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let safeSrc: Uint8Array = new Uint8Array([251, 255, 254]);
        let safeBytes: Uint8Array = helper.encodeSync(safeSrc, util.Type.BASIC_URL_SAFE);
        let safeBack: Uint8Array = helper.decodeSync(safeBytes, util.Type.BASIC_URL_SAFE);
        expect(safeBack.toString()).assertEqual(safeSrc.toString());
        let wideSrc: Uint8Array = buildRepeatingBytes(57, 0x61);
        let wideText: string = helper.encodeToStringSync(wideSrc, util.Type.MIME);
        let wideBack: Uint8Array = helper.decodeSync(wideText, util.Type.MIME);
        expect(wideBack.toString()).assertEqual(wideSrc.toString());
        let residSrc: Uint8Array = buildRepeatingBytes(58, 0x61);
        let residText: string = helper.encodeToStringSync(residSrc, util.Type.MIME);
        let residBack: Uint8Array = helper.decodeSync(residText, util.Type.MIME);
        expect(residBack.byteLength).assertEqual(58);
        expect(residBack.$_get(57)).assertEqual(97);
        expect(residBack.toString()).assertEqual(residSrc.toString());
        let decoded: Uint8Array = helper.decodeSync('d2Vz', util.Type.BASIC);
        expect(helper.encodeToStringSync(decoded, util.Type.BASIC)).assertEqual('d2Vz');
      }

      // --- [3] Verify re-encoding a source after its first byte is zeroed yields 'AGVz' instead of 'd2Vz' ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([119, 101, 115]);
        let first: string = helper.encodeToStringSync(src, util.Type.BASIC);
        src.$_set(0, 0);
        let second: string = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(first).assertEqual('d2Vz');
        expect(second).assertEqual('AGVz');
      }

      // --- [4] Verify encode decode encode chains are fixpoints and cross-mode re-encodes drop line breaks and padding ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let safeText: string = helper.encodeToStringSync(helper.decodeSync('-___', util.Type.BASIC_URL_SAFE), util.Type.BASIC_URL_SAFE);
        expect(safeText).assertEqual('-___');
        let mimeDecoded: Uint8Array = helper.decodeSync('YWI=\r\n', util.Type.MIME);
        let basicReencoded: string = helper.encodeToStringSync(mimeDecoded, util.Type.BASIC);
        expect(basicReencoded).assertEqual('YWI=');
        expect(basicReencoded.indexOf('\r')).assertEqual(-1);
        let safeDecoded: Uint8Array = helper.decodeSync('--__\r\n', util.Type.MIME_URL_SAFE);
        expect(helper.encodeToStringSync(safeDecoded, util.Type.MIME_URL_SAFE)).assertEqual('--__\r\n');
        expect(safeDecoded.byteLength).assertEqual(3);
        let wideSrc: Uint8Array = buildRepeatingBytes(57, 0x61);
        let first: string = helper.encodeToStringSync(wideSrc, util.Type.MIME);
        let middle: Uint8Array = helper.decodeSync(first, util.Type.MIME);
        let second: string = helper.encodeToStringSync(middle, util.Type.MIME);
        expect(second).assertEqual(first);
        expect(first.length).assertEqual(78);
        let denseSrc: Uint8Array = new Uint8Array(114);
        for (let i: int = 0; i < 114; i++) {
          denseSrc.$_set(i, i % 256);
        }
        let denseText: string = helper.encodeToStringSync(denseSrc, util.Type.MIME);
        let denseBack: Uint8Array = helper.decodeSync(denseText, util.Type.MIME);
        expect(denseBack.$_get(76)).assertEqual(76);
        expect(denseBack.byteLength).assertEqual(114);
      }

      // --- [5] Verify the 'plus slash slash slash' text decodes to bytes that re-encode as '-___' when URL safe ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let decoded: Uint8Array = helper.decodeSync('+///', util.Type.BASIC);
        let reencoded: string = helper.encodeToStringSync(decoded, util.Type.BASIC_URL_SAFE);
        expect(reencoded).assertEqual('-___');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1500
     * @tc.name testType015
     * @tc.desc Merged batch (1 test): Round-trip integrity: round trips across the one, two, four, three and five byte residues and the all zero text.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify round trips across the one, two, four, three and five byte residues and the all zero text ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let three: Uint8Array = new Uint8Array([104, 105, 106]);
        let four: Uint8Array = new Uint8Array([104, 105, 106, 107]);
        let five: Uint8Array = new Uint8Array([104, 105, 106, 107, 0]);
        let residues: Uint8Array[] = [three, four, five];
        for (const item of residues) {
          let text: string = helper.encodeToStringSync(item, util.Type.BASIC);
          expect(helper.decodeSync(text, util.Type.BASIC).toString()).assertEqual(item.toString());
        }
        let one: Uint8Array = new Uint8Array([251]);
        let two: Uint8Array = new Uint8Array([251, 255]);
        let quad: Uint8Array = new Uint8Array([251, 255, 254, 253]);
        let safeResidues: Uint8Array[] = [one, two, quad];
        for (const item of safeResidues) {
          let text: string = helper.encodeToStringSync(item, util.Type.BASIC_URL_SAFE);
          expect(helper.decodeSync(text, util.Type.BASIC_URL_SAFE).toString()).assertEqual(item.toString());
        }
        let safeSrc: Uint8Array = new Uint8Array([251, 255, 254]);
        let safeText: string = helper.encodeToStringSync(safeSrc, util.Type.MIME_URL_SAFE);
        let safeBack: Uint8Array = helper.decodeSync(safeText, util.Type.MIME_URL_SAFE);
        expect(safeText).assertEqual('-__-\r\n');
        expect(safeBack.toString()).assertEqual(safeSrc.toString());
        let mimeDecoded: Uint8Array = helper.decodeSync('YWI=\r\n', util.Type.MIME);
        expect(mimeDecoded.byteLength).assertEqual(2);
        expect(helper.encodeToStringSync(mimeDecoded, util.Type.BASIC_URL_SAFE)).assertEqual('YWI');
        let zeros: Uint8Array = helper.decodeSync('AAAA', util.Type.BASIC);
        expect(zeros.toString()).assertEqual('0,0,0');
        expect(helper.encodeToStringSync(zeros, util.Type.BASIC)).assertEqual('AAAA');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1600
     * @tc.name testType016
     * @tc.desc Merged batch (5 tests): Source and result buffering: a byte array held in a class field keeps every byte after an encode of it; encodeToStringSync and encodeSync leave the source bytes unchanged in every format; encode and decode leave bytes outside a subarray view unchanged and return a snapshot detached from later source edits; encode and decode results own separate buffers and never return the helper itself; the byte array produced by encodeSync and decodeSync is a fresh Uint8Array rather than the source object.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a byte array held in a class field keeps every byte after an encode of it ---
      {
        let payload: Base64Payload = new Base64Payload(new Uint8Array([104, 105, 106, 107]));
        let helper: util.Base64Helper = new util.Base64Helper();
        let before: string = payload.bytes.toString();
        helper.encodeSync(payload.bytes, util.Type.BASIC);
        expect(payload.bytes.toString()).assertEqual(before);
      }

      // --- [2] Verify encodeToStringSync and encodeSync leave the source bytes unchanged in every format ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let urlSafeSrc: Uint8Array = new Uint8Array([0xFA, 0xFE, 0xFD]);
        helper.encodeToStringSync(urlSafeSrc, util.Type.MIME_URL_SAFE);
        expect(urlSafeSrc.$_get(0)).assertEqual(250);
        expect(urlSafeSrc.$_get(2)).assertEqual(253);
        let basicSrc: Uint8Array = new Uint8Array([104, 105, 106, 107]);
        helper.encodeToStringSync(basicSrc, util.Type.BASIC);
        expect(basicSrc.$_get(0)).assertEqual(104);
        let urlSafeText: Uint8Array = new Uint8Array([251, 255, 255]);
        let encodedSafe: string = helper.encodeToStringSync(urlSafeText, util.Type.BASIC_URL_SAFE);
        expect(encodedSafe.length).assertEqual(4);
        expect(urlSafeText.$_get(2)).assertEqual(255);
        let mimeSrc: Uint8Array = new Uint8Array(58);
        for (let i: int = 0; i < 58; i++) {
          mimeSrc.$_set(i, 0xFB);
        }
        helper.encodeToStringSync(mimeSrc, util.Type.MIME);
        expect(mimeSrc.$_get(0)).assertEqual(251);
        let bytesSrc: Uint8Array = new Uint8Array([251, 255, 254]);
        helper.encodeSync(bytesSrc, util.Type.BASIC_URL_SAFE);
        expect(bytesSrc.byteLength).assertEqual(3);
      }

      // --- [3] Verify encode and decode leave bytes outside a subarray view unchanged and return a snapshot detached from later source edits ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encodeBuffer: Uint8Array = new Uint8Array([120, 120, 104, 105, 106]);
        let encodeView: Uint8Array = encodeBuffer.subarray(2, 5);
        helper.encodeSync(encodeView, util.Type.BASIC);
        expect(encodeBuffer.$_get(0)).assertEqual(120);
        expect(encodeBuffer.$_get(1)).assertEqual(120);
        let decodeBuffer: Uint8Array = new Uint8Array([100, 50, 86, 122, 120]);
        let decodeView: Uint8Array = decodeBuffer.subarray(0, 4);
        let decoded: Uint8Array = helper.decodeSync(decodeView, util.Type.BASIC);
        expect(decoded.$_get(0)).assertEqual(119);
        expect(decoded.byteLength).assertEqual(3);
        expect(decodeBuffer.$_get(4)).assertEqual(120);
        let src: Uint8Array = new Uint8Array([119, 101, 115]);
        let snapshot: Uint8Array = helper.encodeSync(src, util.Type.BASIC);
        src.$_set(0, 0);
        expect(snapshot.toString()).assertEqual('100,50,86,122');
      }

      // --- [4] Verify encode and decode results own separate buffers and never return the helper itself ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encodeSrc: Uint8Array = new Uint8Array([115, 49, 51]);
        let encoded: Uint8Array = helper.encodeSync(encodeSrc, util.Type.BASIC);
        expect(encoded.buffer === encodeSrc.buffer).assertFalse();
        let decodeSrc: Uint8Array = new Uint8Array([99, 122, 69, 122]);
        let decoded: Uint8Array = helper.decodeSync(decodeSrc, util.Type.BASIC);
        expect(decoded.buffer === decodeSrc.buffer).assertFalse();
        let encodedReturn: Uint8Array | util.Base64Helper = helper.encodeSync(new Uint8Array([115, 49, 51]), util.Type.BASIC);
        expect(encodedReturn === helper).assertFalse();
        let decodedReturn: Uint8Array | util.Base64Helper = helper.decodeSync('YWI=', util.Type.BASIC);
        expect(decodedReturn === helper).assertFalse();
        let textReturn: string | util.Base64Helper = helper.encodeToStringSync(new Uint8Array([104, 105, 106]), util.Type.BASIC);
        expect(textReturn instanceof util.Base64Helper).assertFalse();
      }

      // --- [5] Verify the byte array produced by encodeSync and decodeSync is a fresh Uint8Array rather than the source object ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let checker: util.types = new util.types();
        let src: Uint8Array = new Uint8Array([119, 101, 115]);
        let encoded: Uint8Array = helper.encodeSync(src, util.Type.BASIC);
        let decoded: Uint8Array = helper.decodeSync(encoded, util.Type.BASIC);
        expect(checker.isUint8Array(encoded)).assertTrue();
        expect(checker.isUint8Array(decoded)).assertTrue();
        expect(encoded !== src).assertTrue();
        expect(decoded !== src).assertTrue();
        expect(decoded.length).assertEqual(src.length);
        expect(decoded[0]).assertEqual(119);
        expect(decoded[2]).assertEqual(115);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1700
     * @tc.name testType017
     * @tc.desc Merged batch (3 tests): Source and result buffering: decode results own a buffer that starts at offset 0 and matches the decoded byte length; encodeSync results own a buffer that starts at offset 0 and matches the encoded byte length; decoding leaves the source unchanged and repeated encode or decode calls return distinct equal arrays.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify decode results own a buffer that starts at offset 0 and matches the decoded byte length ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let basic: Uint8Array = helper.decodeSync('YWI=', util.Type.BASIC);
        expect(basic.byteOffset).assertEqual(0);
        expect(basic.buffer.byteLength).assertEqual(basic.byteLength);
        let urlSafe: Uint8Array = helper.decodeSync('-___', util.Type.BASIC_URL_SAFE);
        expect(urlSafe.byteOffset).assertEqual(0);
        expect(urlSafe.buffer.byteLength).assertEqual(urlSafe.byteLength);
      }

      // --- [2] Verify encodeSync results own a buffer that starts at offset 0 and matches the encoded byte length ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let encoded: Uint8Array = helper.encodeSync(new Uint8Array([104, 105, 106]), util.Type.BASIC);
        expect(encoded.byteOffset).assertEqual(0);
        expect(encoded.buffer.byteLength).assertEqual(encoded.byteLength);
      }

      // --- [3] Verify decoding leaves the source unchanged and repeated encode or decode calls return distinct equal arrays ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let decodeSrc: Uint8Array = new Uint8Array([99, 122, 69, 122]);
        helper.decodeSync(decodeSrc, util.Type.BASIC);
        expect(decodeSrc.$_get(3)).assertEqual(122);
        let mimeSrc: Uint8Array = new Uint8Array([89, 87, 73, 61, 13, 10]);
        let mimeBefore: string = mimeSrc.toString();
        helper.decodeSync(mimeSrc, util.Type.MIME);
        expect(mimeSrc.toString()).assertEqual(mimeBefore);
        let encodeSrc: Uint8Array = new Uint8Array([104, 105, 106, 107, 0]);
        let encodeBefore: string = encodeSrc.toString();
        helper.encodeToStringSync(encodeSrc, util.Type.BASIC);
        expect(encodeSrc.toString()).assertEqual(encodeBefore);
        let src: Uint8Array = new Uint8Array([115, 49, 51]);
        let first: Uint8Array = helper.encodeSync(src, util.Type.BASIC);
        let second: Uint8Array = helper.encodeSync(src, util.Type.BASIC);
        expect(first === second).assertFalse();
        expect(first.toString()).assertEqual(second.toString());
        let decodedA: Uint8Array = helper.decodeSync('YWI=', util.Type.BASIC);
        let decodedB: Uint8Array = helper.decodeSync('YWI=', util.Type.BASIC);
        expect(decodedA === decodedB).assertFalse();
        expect(decodedA.byteLength).assertEqual(decodedB.byteLength);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1800
     * @tc.name testType018
     * @tc.desc Merged batch (5 tests): API consistency and helper transport: encoding through a module level function returns the same text as the direct call; the two module level encoder functions pick their own formats for one shared source; a worker class method that encodes returns the same text as the direct call; a worker class method that decodes returns the same bytes as the direct call; the BASIC byte array and the BASIC text encoder agree code unit by code unit on the same input.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify encoding through a module level function returns the same text as the direct call ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([250, 254, 253]);
        let viaFunction: string = encodeUrlSafeText(helper, src);
        let direct: string = helper.encodeToStringSync(src, util.Type.BASIC_URL_SAFE);
        expect(viaFunction).assertEqual(direct);
        expect(viaFunction).assertEqual('-v79');
      }

      // --- [2] Verify the two module level encoder functions pick their own formats for one shared source ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([250, 254, 253]);
        let text: string = encodeUrlSafeText(helper, src);
        let bytes: Uint8Array = encodeBasicBytes(helper, src);
        expect(bytes.toString()).assertEqual('43,118,55,57');
        expect(text).assertEqual('-v79');
      }

      // --- [3] Verify a worker class method that encodes returns the same text as the direct call ---
      {
        let worker: Base64Worker = new Base64Worker();
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([104, 105, 106]);
        let viaMethod: string = worker.encodeBasicText(helper, src);
        let direct: string = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(viaMethod).assertEqual(direct);
        expect(viaMethod).assertEqual('aGlq');
      }

      // --- [4] Verify a worker class method that decodes returns the same bytes as the direct call ---
      {
        let worker: Base64Worker = new Base64Worker();
        let helper: util.Base64Helper = new util.Base64Helper();
        let viaMethod: Uint8Array = worker.decodeBasicText(helper, 'd2Vz');
        let direct: Uint8Array = helper.decodeSync('d2Vz', util.Type.BASIC);
        expect(viaMethod.toString()).assertEqual(direct.toString());
        expect(viaMethod.$_get(2)).assertEqual(115);
      }

      // --- [5] Verify the BASIC byte array and the BASIC text encoder agree code unit by code unit on the same input ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([251, 255, 254]);
        let encoded: Uint8Array = helper.encodeSync(src, util.Type.BASIC);
        let text: string = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(encoded.$_get(0)).assertEqual(text.charCodeAt(0));
        expect(encoded.$_get(1)).assertEqual(text.charCodeAt(1));
        expect(encoded.byteLength).assertEqual(text.length);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_1900
     * @tc.name testType019
     * @tc.desc Merged batch (5 tests): API consistency and helper transport: decoding a byte array that carries the line break matches the string decode under MIME; decoding the character codes of 'd2Vz' as a byte array matches the string decode; reassigning the mode field between two calls changes the text from '+v79' to '-v79'; one helper instance encodes and then decodes in sequence and restores the original bytes; one helper instance handles all four modes in sequence with no mode sticking between calls.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify decoding a byte array that carries the line break matches the string decode under MIME ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([89, 87, 73, 61, 13, 10]);
        let fromBytes: Uint8Array = helper.decodeSync(src, util.Type.MIME);
        let fromText: Uint8Array = helper.decodeSync('YWI=\r\n', util.Type.MIME);
        expect(fromBytes.$_get(1)).assertEqual(fromText.$_get(1));
        expect(fromText.$_get(1)).assertEqual(98);
      }

      // --- [2] Verify decoding the character codes of 'd2Vz' as a byte array matches the string decode ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([100, 50, 86, 122]);
        let fromBytes: Uint8Array = helper.decodeSync(src, util.Type.BASIC);
        let fromText: Uint8Array = helper.decodeSync('d2Vz', util.Type.BASIC);
        expect(fromBytes.$_get(0)).assertEqual(fromText.$_get(0));
        expect(src.$_get(0)).assertEqual('d2Vz'.charCodeAt(0));
      }

      // --- [3] Verify reassigning the mode field between two calls changes the text from '+v79' to '-v79' ---
      {
        let holder: Base64ModeHolder = new Base64ModeHolder(util.Type.BASIC);
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([250, 254, 253]);
        let first: string = helper.encodeToStringSync(src, holder.mode);
        holder.mode = util.Type.BASIC_URL_SAFE;
        let second: string = helper.encodeToStringSync(src, holder.mode);
        expect(first).assertEqual('+v79');
        expect(second).assertEqual('-v79');
      }

      // --- [4] Verify one helper instance encodes and then decodes in sequence and restores the original bytes ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([104, 105, 106]);
        let text: string = helper.encodeToStringSync(src, util.Type.BASIC);
        let decoded: Uint8Array = helper.decodeSync(text, util.Type.BASIC);
        expect(decoded.$_get(0)).assertEqual(104);
        expect(decoded.byteLength).assertEqual(3);
      }

      // --- [5] Verify one helper instance handles all four modes in sequence with no mode sticking between calls ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = buildRepeatingBytes(57, 0x61);
        let basic: string = helper.encodeToStringSync(new Uint8Array([104, 105, 106]), util.Type.BASIC);
        let urlSafe: string = helper.encodeToStringSync(new Uint8Array([104, 105, 106]), util.Type.BASIC_URL_SAFE);
        let mime: string = helper.encodeToStringSync(src, util.Type.MIME);
        let decoded: Uint8Array = helper.decodeSync('-___\r\n', util.Type.MIME_URL_SAFE);
        expect(basic).assertEqual('aGlq');
        expect(urlSafe).assertEqual('aGlq');
        expect(mime.length).assertEqual(78);
        expect(decoded.$_get(0)).assertEqual(251);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_2000
     * @tc.name testType020
     * @tc.desc Merged batch (1 test): API consistency and helper transport: a helper instance still encodes after a byte array call was rejected for the MIME mode.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify a helper instance still encodes after a byte array call was rejected for the MIME mode ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let src: Uint8Array = new Uint8Array([115, 49, 51]);
        try {
          helper.encodeSync(src, util.Type.MIME);
          expect().assertFail();
        } catch (e) {
          expect(e.name).assertEqual('BusinessError');
        }
        let text: string = helper.encodeToStringSync(src, util.Type.BASIC);
        expect(text).assertEqual('czEz');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_TYPE_2100
     * @tc.name testType021
     * @tc.desc Merged batch (2 tests): Miscellaneous checks: verifies remaining edge cases, covering alphabet edge cases and related edge cases.
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testType021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // --- [1] Verify BASIC decoding is case sensitive, reading 'aGlq' as 104 and 'AGLQ' as 0 and 208 ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let lower: Uint8Array = helper.decodeSync('aGlq', util.Type.BASIC);
        let upper: Uint8Array = helper.decodeSync('AGLQ', util.Type.BASIC);
        expect(lower.$_get(0)).assertEqual(104);
        expect(upper.$_get(0)).assertEqual(0);
        expect(upper.$_get(2)).assertEqual(208);
      }

      // --- [2] Verify decoders skip a trailing character outside their alphabet without changing the decoded bytes ---
      {
        let helper: util.Base64Helper = new util.Base64Helper();
        let clean: Uint8Array = helper.decodeSync('Ki+/', util.Type.BASIC);
        let jotted: Uint8Array = helper.decodeSync('Ki+/-', util.Type.BASIC);
        expect(jotted.byteLength).assertEqual(clean.byteLength);
        expect(jotted.$_get(0)).assertEqual(42);
        expect(jotted.$_get(2)).assertEqual(191);
        let crTail: Uint8Array = helper.decodeSync('YWJj\r', util.Type.BASIC);
        expect(crTail.$_get(0)).assertEqual(97);
        expect(crTail.$_get(2)).assertEqual(99);
        expect(crTail.byteLength).assertEqual(3);
        let urlSafeTail: Uint8Array = helper.decodeSync('QWJD+', util.Type.BASIC_URL_SAFE);
        expect(urlSafeTail.byteLength).assertEqual(3);
        expect(urlSafeTail.$_get(0)).assertEqual(65);
        expect(urlSafeTail.$_get(2)).assertEqual(67);
        let mimeTail: Uint8Array = helper.decodeSync('MTIz-', util.Type.MIME);
        expect(mimeTail.$_get(0)).assertEqual(49);
        expect(mimeTail.$_get(2)).assertEqual(51);
        let lineSafeTail: Uint8Array = helper.decodeSync('-v79+', util.Type.MIME_URL_SAFE);
        expect(lineSafeTail.$_get(1)).assertEqual(254);
        expect(lineSafeTail.$_get(2)).assertEqual(253);
      }
    });

  });
}
