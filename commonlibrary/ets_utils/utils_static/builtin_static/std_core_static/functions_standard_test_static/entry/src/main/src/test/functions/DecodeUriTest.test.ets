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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class DecodeUriToStringHelper {
  toString(): string {
    return "http://example.com/%41";
  }
}

export default function DecodeUriTest(): void {
  describe('DecodeUriTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0010
     * @tc.name testDecodeUri001
     * @tc.desc Verify decodeURI keeps reserved colon and slash percent-encoded when passing fully encoded scheme and host
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("https%3A%2F%2Fexample.com");
      expect(result).assertEqual("https%3A%2F%2Fexample.com");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0020
     * @tc.name testDecodeUri002
     * @tc.desc Verify decodeURI decodes to Chinese text when passing '%E4%B8%AD%E6%96%87'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%E4%B8%AD%E6%96%87");
      expect(result).assertEqual("中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0030
     * @tc.name testDecodeUri003
     * @tc.desc Verify decodeURI empty return when passing empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0040
     * @tc.name testDecodeUri004
     * @tc.desc Verify decodeURI unchanged when passing 'hello world' without escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("hello world");
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0050
     * @tc.name testDecodeUri005
     * @tc.desc Verify decodeURI keeps reserved :/? percent-encoded when passing '%3A%2F%2F' per decodeURI(uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%3A%2F%2F");
      expect(result).assertEqual("%3A%2F%2F");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0060
     * @tc.name testDecodeUri006
     * @tc.desc Verify decodeURI keeps reserved question mark percent-encoded when passing '%3F' per decodeURI(uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%3F");
      expect(result).assertEqual("%3F");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0070
     * @tc.name testDecodeUri007
     * @tc.desc Verify decodeURI keeps reserved hash percent-encoded when passing '%23' per decodeURI(uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%23");
      expect(result).assertEqual("%23");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0080
     * @tc.name testDecodeUri008
     * @tc.desc Verify decodeURI decodes to 'hello world' when passing 'hello%20world'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("hello%20world");
      expect(result).assertEqual("hello world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0090
     * @tc.name testDecodeUri009
     * @tc.desc Verify decodeURI throws ClassCastError when passing null (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI(null as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0100
     * @tc.name testDecodeUri010
     * @tc.desc Verify decodeURI throws ClassCastError when passing undefined (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI(undefined as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0110
     * @tc.name testDecodeUri011
     * @tc.desc Verify decodeURI throws ClassCastError when passing number 123 (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI(123 as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0120
     * @tc.name testDecodeUri012
     * @tc.desc Verify decodeURI throws ClassCastError when passing boolean true (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI(true as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0130
     * @tc.name testDecodeUri013
     * @tc.desc Verify decodeURI throws ClassCastError when passing array (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI(["hello"] as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0140
     * @tc.name testDecodeUri014
     * @tc.desc Verify decodeURI throws ClassCastError when passing plain object (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI({} as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0150
     * @tc.name testDecodeUri015
     * @tc.desc Verify decodeURI returns unchanged plain URI with literal ? and #
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("https://example.com/path?query=1#frag");
      expect(result).assertEqual("https://example.com/path?query=1#frag");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0160
     * @tc.name testDecodeUri016
     * @tc.desc Verify decodeURI decodes non-reserved UTF-8 in encoded path and query while keeping reserved characters percent-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("http%3A%2F%2Fexample.com%2Fpath%3Fname%3D%E4%B8%AD%E6%96%87");
      expect(result).assertEqual("http%3A%2F%2Fexample.com%2Fpath%3Fname%3D中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0170
     * @tc.name testDecodeUri017
     * @tc.desc Verify decodeURI('%25') returns '%'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%25");
      expect(result).assertEqual("%");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0180
     * @tc.name testDecodeUri018
     * @tc.desc Verify decodeURI does not map '+' to space (a+b and a+b+c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("a+b")).assertEqual("a+b");
      expect(decodeURI("a+b+c")).assertEqual("a+b+c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0190
     * @tc.name testDecodeUri019
     * @tc.desc Verify decodeURI returns same string when passing plain ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("hello");
      expect(result).assertEqual("hello");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0200
     * @tc.name testDecodeUri020
     * @tc.desc Verify common punctuation escapes decode correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%21%40%23%24%25%5E%26%2A%28%29");
      expect(result).assertEqual("!%40%23%24%^%26*()");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0210
     * @tc.name testDecodeUri021
     * @tc.desc Verify consecutive percent escapes decode correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%41%42%43");
      expect(result).assertEqual("ABC");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0220
     * @tc.name testDecodeUri022
     * @tc.desc [Security] decodeURI accepts overlong UTF-8 '%C0%80' (non-strict) and yields NUL without URIError; distinct byte sequences may normalize to the same code unit—do not use decoded output in path/C API handling without validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%C0%80");
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0230
     * @tc.name testDecodeUri023
     * @tc.desc Verify decode emoji UTF-8 percent sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%F0%9F%98%80")).assertEqual("\uD83D\uDE00");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0240
     * @tc.name testDecodeUri024
     * @tc.desc Verify decode zero-width space UTF-8 sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("hello%E2%80%8Bworld")).assertEqual("hello\u200Bworld");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0250
     * @tc.name testDecodeUri025
     * @tc.desc Verify decode CRLF percent escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("a%0D%0Ab")).assertEqual("a\r\nb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0260
     * @tc.name testDecodeUri026
     * @tc.desc Verify decode triple-space percent escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%20%20%20")).assertEqual("   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0270
     * @tc.name testDecodeUri027
     * @tc.desc Verify decode Russian UTF-8 sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%D0%90%D0%91%D0%92%D0%93%D0%94")).assertEqual("\u0410\u0411\u0412\u0413\u0414");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0280
     * @tc.name testDecodeUri028
     * @tc.desc Verify decode XSS percent-encoded script tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%3Cscript%3Ealert(1)%3C/script%3E")).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0290
     * @tc.name testDecodeUri029
     * @tc.desc Verify decode double-encoded space %2520 to literal %20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%2520")).assertEqual("%20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0300
     * @tc.name testDecodeUri030
     * @tc.desc Verify decode fullwidth em dash UTF-8 sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%E2%80%94")).assertEqual("\u2014");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0310
     * @tc.name testDecodeUri031
     * @tc.desc Verify decodeURI URIError when passing invalid percent escape %GG
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => { decodeURI("%GG"); }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0320
     * @tc.name testDecodeUri032
     * @tc.desc Verify decodeURI URIError when passing truncated UTF-8 escape %E4%B8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => { decodeURI("%E4%B8"); }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0330
     * @tc.name testDecodeUri033
     * @tc.desc Verify decodeURI URIError when passing mix of valid %20 and invalid %GG
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => { decodeURI("valid%20string%GG"); }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0340
     * @tc.name testDecodeUri034
     * @tc.desc Verify decodeURI URIError when passing lone percent %A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => { decodeURI("%A"); }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0350
     * @tc.name testDecodeUri035
     * @tc.desc Verify heavily percent-encoded string decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encoded: string = "%E4%B8%AD%E6%96%87%E8%AF%AD%E8%A8%80";
      expect(decodeURI(encoded)).assertEqual("中文语言");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0360
     * @tc.name testDecodeUri036
     * @tc.desc Verify decode two consecutive emoji UTF-8 percent sequences
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encoded: string = "%F0%9F%98%80%F0%9F%98%81";
      expect(decodeURI(encoded)).assertEqual("😀😁");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0370
     * @tc.name testDecodeUri037
     * @tc.desc Verify decodeURI decodes when passing long percent-encoded Chinese repeat 5000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let expected: string = "中".repeat(5000);
      let longStr: string = "%E4%B8%AD".repeat(5000);
      expect(decodeURI(longStr)).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0380
     * @tc.name testDecodeUri038
     * @tc.desc Verify decode percent-encoded Japanese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%E3%83%86%E3%82%B9%E3%83%88")).assertEqual("\u30c6\u30b9\u30c8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0390
     * @tc.name testDecodeUri039
     * @tc.desc Verify decode percent-encoded Korean
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%ED%85%8C%EC%8A%A4%ED%8A%B8")).assertEqual("\ud14c\uc2a4\ud2b8");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0400
     * @tc.name testDecodeUri040
     * @tc.desc Verify decodeURI URIError when passing percent sign only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI("%");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0410
     * @tc.name testDecodeUri041
     * @tc.desc Verify decodeURI URIError when passing invalid UTF-8 sequence %A1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI("%A1");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0420
     * @tc.name testDecodeUri042
     * @tc.desc Verify decodeURI('abcdefABCDEF0123456789') returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "abcdefABCDEF0123456789";
      let result: string = decodeURI(input);
      expect(result).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0430
     * @tc.name testDecodeUri043
     * @tc.desc Verify decodeURI keeps percent-encoded slash %2F unchanged (reserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("http://host/path%2Fend")).assertEqual("http://host/path%2Fend");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0440
     * @tc.name testDecodeUri044
     * @tc.desc Verify decodeURI decodes %7E to tilde (non-reserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("http://example.com/%7Euser")).assertEqual("http://example.com/~user");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0450
     * @tc.name testDecodeUri045
     * @tc.desc Verify decodeURI decodes UTF-8 percent for accented char
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("http://example.com/caf%C3%A9")).assertEqual("http://example.com/caf\u00E9");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0460
     * @tc.name testDecodeUri046
     * @tc.desc Verify second decodeURI on already-decoded URI is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: string = decodeURI("https%3A%2F%2Fexample.com%2Fpath");
      expect(decodeURI(first)).assertEqual(first);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0470
     * @tc.name testDecodeUri047
     * @tc.desc Verify decodeURI throws URIError when invalid percent %ZZ
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI("http://x/%ZZ");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0480
     * @tc.name testDecodeUri048
     * @tc.desc Verify decodeURI keeps %2c percent-encoded for reserved comma (does not decode to comma)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("ab%2cd")).assertEqual("ab%2cd");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0490
     * @tc.name testDecodeUri049
     * @tc.desc Verify decodeURI URIError when passing illegal UTF-8 %FE%FF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI("%FE%FF");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0500
     * @tc.name testDecodeUri050
     * @tc.desc Verify mixed decoded space and reserved colon in URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("http://host/hello%20world%3A80")).assertEqual("http://host/hello world%3A80");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0510
     * @tc.name testDecodeUri051
     * @tc.desc Verify decodeURI inverts encodeURI for Japanese path segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://example.com/\u65E5\u672C\u8A9E";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0520
     * @tc.name testDecodeUri052
     * @tc.desc Verify query-only string ?a=1&b=Chinese text round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "?a=1&b=中文";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0530
     * @tc.name testDecodeUri053
     * @tc.desc Verify decodeURI decodes UTF-8 percent sequence to CJK test
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%E6%B5%8B%E8%AF%95")).assertEqual("\u6D4B\u8BD5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0540
     * @tc.name testDecodeUri054
     * @tc.desc Verify decodeURI data: URI with encoded payload round-trips via decodeURI(encodeURI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "data:text/plain,hello world";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0550
     * @tc.name testDecodeUri055
     * @tc.desc Verify decodeURI throws ClassCastError when passing function (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI(((): void => {}) as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0560
     * @tc.name testDecodeUri056
     * @tc.desc Verify decode relative path with encoded CJK query (mirror of testEncodeUri068)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "/api/v1/search?q=%E6%B5%8B%E8%AF%95";
      expect(decodeURI(uri)).assertEqual("/api/v1/search?q=测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0570
     * @tc.name testDecodeUri057
     * @tc.desc Verify decode IPv6 host literal with percent-encoded brackets (mirror of testEncodeUri069)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "http://%5B2001:db8::1%5D/path";
      expect(decodeURI(uri)).assertEqual("http://[2001:db8::1]/path");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0580
     * @tc.name testDecodeUri058
     * @tc.desc Verify decodeURI throws ClassCastError when passing empty array (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [];
      expect((): void => {
        decodeURI(arr as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0590
     * @tc.name testDecodeUri059
     * @tc.desc Verify decodeURI throws ClassCastError when passing helper object (toString not used)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: DecodeUriToStringHelper = new DecodeUriToStringHelper();
      expect((): void => {
        decodeURI(obj as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0600
     * @tc.name testDecodeUri060
     * @tc.desc Verify fragment-only encoded CJK decodes after hash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("#%E4%B8%AD%E6%96%87")).assertEqual("#中文");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0610
     * @tc.name testDecodeUri061
     * @tc.desc Verify decodeURI tel: URI round-trips via decodeURI(encodeURI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "tel:+8613800138000";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0620
     * @tc.name testDecodeUri062
     * @tc.desc Verify decodeURI sms: URI with body text round-trips via decodeURI(encodeURI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "sms:+8613800138000?body=hello world";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0630
     * @tc.name testDecodeUri063
     * @tc.desc Verify decodeURI blob: URI round-trips via decodeURI(encodeURI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "blob:text/plain,hello";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0640
     * @tc.name testDecodeUri064
     * @tc.desc Verify decodeURI javascript: URI unchanged by encodeURI (parens not encoded); round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "javascript:alert(1)";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual(input);
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0650
     * @tc.name testDecodeUri065
     * @tc.desc Verify decodeURI returns unchanged protocol-relative URL and round-trips via encodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "//cdn.example.com/static/app.v1.js";
      expect(decodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0660
     * @tc.name testDecodeUri066
     * @tc.desc Verify decodeURI throws ClassCastError when passing boolean false (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI(false as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0670
     * @tc.name testDecodeUri067
     * @tc.desc Verify decodeURI reserved semicolon %3B stays percent-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%3B")).assertEqual("%3B");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0680
     * @tc.name testDecodeUri068
     * @tc.desc Verify decodeURI reserved ampersand %26 stays percent-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%26")).assertEqual("%26");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0690
     * @tc.name testDecodeUri069
     * @tc.desc Verify decodeURI reserved equals %3D stays percent-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%3D")).assertEqual("%3D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0700
     * @tc.name testDecodeUri070
     * @tc.desc Verify decodeURI ws:// URI round-trips via decodeURI(encodeURI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ws://host.example.com/path";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0710
     * @tc.name testDecodeUri071
     * @tc.desc Verify decodeURI decodes percent-encoded CJK in magnet: URI query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "magnet:?xt=urn:btih:abc123&dn=%E6%B5%8B%E8%AF%95";
      expect(decodeURI(uri)).assertEqual("magnet:?xt=urn:btih:abc123&dn=测试");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0720
     * @tc.name testDecodeUri072
     * @tc.desc Verify decodeURI decodes percent-encoded CJK in URI fragment (# preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "https://example.test/page#%E6%96%87%E6%A1%A3";
      expect(decodeURI(uri)).assertEqual("https://example.test/page#文档");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0730
     * @tc.name testDecodeUri073
     * @tc.desc Verify decodeURI decodes relative path from arkts-sta-functions.md example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "/search?q=ArkTS%20%E6%96%87%E6%A1%A3";
      expect(decodeURI(uri)).assertEqual("/search?q=ArkTS 文档");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0740
     * @tc.name testDecodeUri074
     * @tc.desc Verify decodeURI decodes query-only string golden (? preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "?q=ArkTS%20%E6%96%87%E6%A1%A3";
      expect(decodeURI(uri)).assertEqual("?q=ArkTS 文档");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0750
     * @tc.name testDecodeUri075
     * @tc.desc Verify decodeURI keeps encoded / ? # in full URI path per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "https://example.test/seg%2Fsub%3Fmark%23end";
      expect(decodeURI(uri)).assertEqual("https://example.test/seg%2Fsub%3Fmark%23end");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0760
     * @tc.name testDecodeUri076
     * @tc.desc Verify decodeURI keeps encoded colon %3A in path segment of full URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "https://example.test/foo%3Abar";
      expect(decodeURI(uri)).assertEqual("https://example.test/foo%3Abar");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0770
     * @tc.name testDecodeUri077
     * @tc.desc Verify decodeURI decodes CJK in query but keeps encoded slash in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "https://example.test/path%2Fmore?q=%E6%96%87%E6%A1%A3";
      expect(decodeURI(uri)).assertEqual("https://example.test/path%2Fmore?q=文档");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0780
     * @tc.name testDecodeUri078
     * @tc.desc Verify decodeURI arkts-sta-functions.md sample: encodeURI then decodeURI round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let raw: string = "https://example.test/search?q=ArkTS 文档";
      let uri: string = encodeURI(raw);
      expect(uri).assertEqual("https://example.test/search?q=ArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURI(uri)).assertEqual(raw);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0790
     * @tc.name testDecodeUri079
     * @tc.desc Verify decodeURI rejects escape %u output (malformed URI sequence); use unescape per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let escaped: string = escape("ArkTS 文档");
      expect(escaped).assertEqual("ArkTS%20%u6587%u6863");
      expect((): void => {
        decodeURI(escaped);
      }).assertThrowError('URIError');
      expect(unescape(escaped)).assertEqual("ArkTS 文档");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0800
     * @tc.name testDecodeUri080
     * @tc.desc Cross-API contrast: full URI with encodeURIComponent query value decodes via decodeURI on query only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let component: string = encodeURIComponent("ArkTS 文档");
      let uri: string = "https://example.test/search?q=" + component;
      expect(uri).assertEqual("https://example.test/search?q=ArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURI(uri)).assertEqual("https://example.test/search?q=ArkTS 文档");
      expect(decodeURIComponent(component)).assertEqual("ArkTS 文档");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0810
     * @tc.name testDecodeUri081
     * @tc.desc Cross-API contrast: decodeURI keeps encodeURIComponent path slash %2F; decodeURIComponent restores it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let segment: string = encodeURIComponent("docs/page");
      expect(segment).assertEqual("docs%2Fpage");
      expect(decodeURI(segment)).assertEqual("docs%2Fpage");
      expect(decodeURIComponent(segment)).assertEqual("docs/page");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0820
     * @tc.name testDecodeUri082
     * @tc.desc Cross-API contrast: decodeURI keeps encodeURIComponent & and = (%26 %3D); decodeURIComponent restores pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pair: string = encodeURIComponent("a&b=c");
      expect(pair).assertEqual("a%26b%3Dc");
      expect(decodeURI(pair)).assertEqual("a%26b%3Dc");
      expect(decodeURIComponent(pair)).assertEqual("a&b=c");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0830
     * @tc.name testDecodeUri083
     * @tc.desc Cross-API contrast: decodeURI keeps encodeURIComponent ? and = in component-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let component: string = encodeURIComponent("?x=1");
      expect(component).assertEqual("%3Fx%3D1");
      expect(decodeURI(component)).assertEqual("%3Fx%3D1");
      expect(decodeURIComponent(component)).assertEqual("?x=1");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0840
     * @tc.name testDecodeUri084
     * @tc.desc Verify 65535-char ASCII full URI round-trip via encodeURI and decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let raw: string = "https://example.test/data?" + "x".repeat(65535);
      expect(decodeURI(encodeURI(raw))).assertEqual(raw);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0850
     * @tc.name testDecodeUri085
     * @tc.desc Cross-API contrast: full URI with encodeURIComponent path and query; decodeURI keeps %2F and %26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "https://example.test/" + encodeURIComponent("a/b") + "?q=" + encodeURIComponent("x&y");
      expect(uri).assertEqual("https://example.test/a%2Fb?q=x%26y");
      expect(decodeURI(uri)).assertEqual("https://example.test/a%2Fb?q=x%26y");
      expect(decodeURIComponent("a%2Fb")).assertEqual("a/b");
      expect(decodeURIComponent("x%26y")).assertEqual("x&y");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0860
     * @tc.name testDecodeUri086
     * @tc.desc Verify static input date/time boundaries including invalid calendar values; decodeURI plain and round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: string[] = [
        "0000-00-00", "2099-12-31", "2024-02-29", "2026-13-01",
        "2026-13-05", "25:00:00", "2026-02-30", "2026/03/05"
      ];
      for (let d of dates) {
        expect(decodeURI(d)).assertEqual(d);
        expect(decodeURI(encodeURI(d))).assertEqual(d);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0870
     * @tc.name testDecodeUri087
     * @tc.desc Verify GBK mojibake string æµè¯ from static input data; decodeURI after encodeURI round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "æµè¯";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0880
     * @tc.name testDecodeUri088
     * @tc.desc Verify mixed-locale English and Chinese test string from static input data round-trips via decodeURI after encodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "Test 測試";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0890
     * @tc.name testDecodeUri089
     * @tc.desc Verify device emoji 📱📞 from static input data; decodeURI after encodeURI round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "📱📞";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0900
     * @tc.name testDecodeUri090
     * @tc.desc Verify business URL https://www.baidu.com from static input data; decodeURI after encodeURI round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://www.baidu.com";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0910
     * @tc.name testDecodeUri091
     * @tc.desc Verify incomplete emoji lone high surrogate \uD83D from static input data; decodeURI returns input unchanged (no percent sequences)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uD83D";
      expect(decodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0920
     * @tc.name testDecodeUri092
     * @tc.desc Verify decodeURI decodes file:// URI with percent-encoded space in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "file:///C:/test%20file/doc.txt";
      expect(decodeURI(uri)).assertEqual("file:///C:/test file/doc.txt");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0930
     * @tc.name testDecodeUri093
     * @tc.desc Verify decodeURI ftp:// URI round-trips via decodeURI(encodeURI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ftp://files.example.com/pub/readme.txt";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0940
     * @tc.name testDecodeUri094
     * @tc.desc Verify decodeURI mailto: URI round-trips via decodeURI(encodeURI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "mailto:user@example.com?subject=Hello";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0950
     * @tc.name testDecodeUri095
     * @tc.desc Verify static input ISO-8601 datetime 2026-03-05T10:30:00; decodeURI round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "2026-03-05T10:30:00";
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0960
     * @tc.name testDecodeUri096
     * @tc.desc Verify decodeURI reserved dollar %24 stays percent-encoded per decodeURI(uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%24")).assertEqual("%24");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0970
     * @tc.name testDecodeUri097
     * @tc.desc Verify decodeURI reserved plus %2B stays percent-encoded (distinct from literal a+b)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("a%2Bb")).assertEqual("a%2Bb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0980
     * @tc.name testDecodeUri098
     * @tc.desc [Security] decodeURI decodes percent-encoded NUL %00 to U+0000; callers must not pass decoded output to C APIs or path concatenation without explicit validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%00");
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_0990
     * @tc.name testDecodeUri099
     * @tc.desc Verify decodeURI decodes UTF-8 percent sequence for U+FFFE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%EF%BF%BE")).assertEqual("\uFFFE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1000
     * @tc.name testDecodeUri100
     * @tc.desc Verify decodeURI decodes UTF-8 percent sequence for U+FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%EF%BF%BF")).assertEqual("\uFFFF");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1010
     * @tc.name testDecodeUri101
     * @tc.desc Verify lone low surrogate \uDC00 from static input data; decodeURI returns input unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uDC00";
      expect(decodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1020
     * @tc.name testDecodeUri102
     * @tc.desc Verify isolated surrogate \uDC04 from static input data; decodeURI returns input unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uDC04";
      expect(decodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1030
     * @tc.name testDecodeUri103
     * @tc.desc Verify decodeURI throws ClassCastError when passing Double.NEGATIVE_INFINITY (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI(Double.NEGATIVE_INFINITY as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1040
     * @tc.name testDecodeUri104
     * @tc.desc [Security] decodeURI accepts overlong UTF-8 %C0%81 (non-strict) and yields U+0001 without URIError; documents lenient decoding—validate before security-sensitive use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURI("%C0%81");
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1050
     * @tc.name testDecodeUri105
     * @tc.desc Verify decodeURI rejects legacy %uXXXX sequence; use unescape per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI("%u4E2D");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1060
     * @tc.name testDecodeUri106
     * @tc.desc Verify decodeURI inverts encodeURI for Arabic UTF-8 input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0627\u062e\u062a\u0628\u0627\u0631";
      let encoded: string = encodeURI(input);
      expect(decodeURI(encoded)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1070
     * @tc.name testDecodeUri107
     * @tc.desc Verify decode standalone Thai UTF-8 percent sequence from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURI("%E0%B8%97%E0%B8%94%E0%B8%AA%E0%B8%AD%E0%B8%9A")).assertEqual("\u0E17\u0E14\u0E2A\u0E2D\u0E1A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1080
     * @tc.name testDecodeUri108
     * @tc.desc Cross-API contrast: decodeURI keeps encoded hash as %23文档; decodeURIComponent restores fragment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fragment: string = encodeURIComponent("#文档");
      expect(fragment).assertEqual("%23%E6%96%87%E6%A1%A3");
      expect(decodeURI(fragment)).assertEqual("%23文档");
      expect(decodeURIComponent(fragment)).assertEqual("#文档");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_1090
     * @tc.name testDecodeUri109
     * @tc.desc Verify decodeURI throws URIError when passing lone hex digit '%2' (incomplete percent escape)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUri109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURI("%2");
      }).assertThrowError('URIError');
    });
  });
}
