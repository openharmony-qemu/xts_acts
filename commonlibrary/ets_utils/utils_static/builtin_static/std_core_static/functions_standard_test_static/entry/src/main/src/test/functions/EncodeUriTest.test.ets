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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

class EncodeUriToStringHelper {
  toString(): string {
    return "https://example.com/encoded";
  }
}

export default function EncodeUriTest(): void {
  describe('EncodeUriTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0010
     * @tc.name testEncodeUri001
     * @tc.desc Verify encodeURI encoded URI string is returned when passing one string argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("https://example.com/search?q=ArkTS 文档");
      expect(result).assertEqual("https://example.com/search?q=ArkTS%20%E6%96%87%E6%A1%A3");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0020
     * @tc.name testEncodeUri002
     * @tc.desc Verify encodeURI normal handling when passing very long URI (e.g. 10000 chars)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longUri: string = "https://example.com/?q=" + "a".repeat(10000);
      let result: string = encodeURI(longUri);
      expect(result).assertEqual(longUri);
      expect(decodeURI(result)).assertEqual(longUri);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0030
     * @tc.name testEncodeUri003
     * @tc.desc Verify encodeURI URI syntax characters are preserved when passing URI with ? and #
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com/path?query=1#section";
      let result: string = encodeURI(input);
      expect(result).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0040
     * @tc.name testEncodeUri004
     * @tc.desc Verify encodeURI throws ClassCastError when passing null (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI(null as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0050
     * @tc.name testEncodeUri005
     * @tc.desc Verify encodeURI throws ClassCastError when passing undefined (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI(undefined as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0060
     * @tc.name testEncodeUri006
     * @tc.desc Verify encodeURI throws ClassCastError when passing number (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI(123 as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0070
     * @tc.name testEncodeUri007
     * @tc.desc Verify encodeURI throws ClassCastError when passing boolean true (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI(true as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0080
     * @tc.name testEncodeUri008
     * @tc.desc Verify encodeURI throws ClassCastError when passing object (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI({} as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0090
     * @tc.name testEncodeUri009
     * @tc.desc Verify encodeURI angle brackets are encoded when passing XSS-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("<script>alert(1)</script>");
      expect(result).assertEqual("%3Cscript%3Ealert(1)%3C/script%3E");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0100
     * @tc.name testEncodeUri010
     * @tc.desc Verify encodeURI special characters are encoded when passing SQL-injection-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "SELECT * FROM users WHERE name='admin'";
      let result: string = encodeURI(input);
      expect(result).assertEqual("SELECT%20*%20FROM%20users%20WHERE%20name='admin'");
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0110
     * @tc.name testEncodeUri011
     * @tc.desc Verify space is encoded as %20 not +
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("hello world");
      expect(result).assertEqual("hello%20world");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0120
     * @tc.name testEncodeUri012
     * @tc.desc Verify angle brackets are encoded as %3C and %3E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("<html>");
      expect(result).assertEqual("%3Chtml%3E");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0130
     * @tc.name testEncodeUri013
     * @tc.desc Verify double quote is encoded as %22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI('say "hello"');
      expect(result).assertEqual("say%20%22hello%22");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0140
     * @tc.name testEncodeUri014
     * @tc.desc Verify curly braces are encoded correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("{key:value}");
      expect(result).assertEqual("%7Bkey:value%7D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0150
     * @tc.name testEncodeUri015
     * @tc.desc Verify pipe (|) and backslash are encoded correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: string = encodeURI("a|b");
      expect(result1).assertEqual("a%7Cb");
      let result2: string = encodeURI("a\\b");
      expect(result2).assertEqual("a%5Cb");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0160
     * @tc.name testEncodeUri016
     * @tc.desc Verify percent (%) is encoded as %25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("discount 50% off");
      expect(result).assertEqual("discount%2050%25%20off");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0170
     * @tc.name testEncodeUri017
     * @tc.desc Verify square brackets are encoded (not reserved by encodeURI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("array[0]");
      expect(result).assertEqual("array%5B0%5D");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0180
     * @tc.name testEncodeUri018
     * @tc.desc Verify empty input returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("");
      expect(result).assertEqual("");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0190
     * @tc.name testEncodeUri019
     * @tc.desc Verify ASCII letters and digits are not encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789");
      expect(result).assertEqual("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0200
     * @tc.name testEncodeUri020
     * @tc.desc Verify encodeURI unreserved chars unchanged when passing filename with hyphen and underscore
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("hello-world_test.txt");
      expect(result).assertEqual("hello-world_test.txt");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0210
     * @tc.name testEncodeUri021
     * @tc.desc Verify single space input returns %20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI(" ");
      expect(result).assertEqual("%20");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0220
     * @tc.name testEncodeUri022
     * @tc.desc Verify encodeURI preserves : / ? # per API with golden value round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com/path?q=1#frag";
      let result: string = encodeURI(input);
      expect(result).assertEqual(input);
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0230
     * @tc.name testEncodeUri023
     * @tc.desc Verify encodeURI UTF-8 percent-encodes CJK in path and query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "https://example.com/搜索?q=测试";
      let encoded: string = encodeURI(original);
      expect(encoded).assertEqual("https://example.com/%E6%90%9C%E7%B4%A2?q=%E6%B5%8B%E8%AF%95");
      expect(decodeURI(encoded)).assertEqual(original);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0240
     * @tc.name testEncodeUri024
     * @tc.desc Verify long URI encodes and round-trips via decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longInput: string = "https://example.com/?q=" + "测试".repeat(5000);
      let result: string = encodeURI(longInput);
      expect(result).assertEqual("https://example.com/?q=" + "%E6%B5%8B%E8%AF%95".repeat(5000));
      expect(decodeURI(result)).assertEqual(longInput);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0250
     * @tc.name testEncodeUri025
     * @tc.desc Verify encodeURI URIError is thrown when passing lone high surrogate (\uD800)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI("\uD800");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0260
     * @tc.name testEncodeUri026
     * @tc.desc Verify encodeURI URIError is thrown when passing lone low surrogate (\uDC00)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI("\uDC00");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0270
     * @tc.name testEncodeUri027
     * @tc.desc Verify encodeURI URIError is thrown when passing broken surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI("\uD800abc");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0280
     * @tc.name testEncodeUri028
     * @tc.desc Verify encodeURI URIError is thrown when passing reversed surrogate pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI("\uDC00\uD800");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0290
     * @tc.name testEncodeUri029
     * @tc.desc Verify encodeURI URIError is thrown when passing multiple lone surrogates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI("\uD800\uD801\uD802");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0300
     * @tc.name testEncodeUri030
     * @tc.desc Verify encodeURI encodes without error when passing valid surrogate pair (emoji)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("\uD83D\uDE00");
      expect(result).assertEqual("%F0%9F%98%80");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0310
     * @tc.name testEncodeUri031
     * @tc.desc Verify encodeURI uTF-8 percent encoding and decodeURI round-trip when passing zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "hello\u200Bworld";
      let result: string = encodeURI(input);
      expect(result).assertEqual("hello%E2%80%8Bworld");
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0320
     * @tc.name testEncodeUri032
     * @tc.desc Verify encodeURI %0D%0A encoding and decodeURI round-trip when passing CRLF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "a\r\nb";
      let result: string = encodeURI(input);
      expect(result).assertEqual("a%0D%0Ab");
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0330
     * @tc.name testEncodeUri033
     * @tc.desc Verify encodeURI each encoded as %20 when passing multiple spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("   ");
      expect(result).assertEqual("%20%20%20");
      expect(decodeURI(result)).assertEqual("   ");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0340
     * @tc.name testEncodeUri034
     * @tc.desc Verify encodeURI unchanged and round-trip when passing mobile number string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "13800138000";
      let result: string = encodeURI(input);
      expect(result).assertEqual("13800138000");
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0350
     * @tc.name testEncodeUri035
     * @tc.desc Verify encodeURI unchanged when passing hex-literal-shaped string 0x123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "0x123";
      expect(encodeURI(input)).assertEqual("0x123");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0360
     * @tc.name testEncodeUri036
     * @tc.desc Verify encodeURI uTF-8 percent encoding when passing Russian Cyrillic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0410\u0411\u0412\u0413\u0414";
      let result: string = encodeURI(input);
      expect(result).assertEqual("%D0%90%D0%91%D0%92%D0%93%D0%94");
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0370
     * @tc.name testEncodeUri037
     * @tc.desc Verify encodeURI uTF-8 encoding when passing fullwidth em dash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u2014";
      let result: string = encodeURI(input);
      expect(result).assertEqual("%E2%80%94");
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0380
     * @tc.name testEncodeUri038
     * @tc.desc Verify encodeURI encodes as UTF-8 bytes (not URIError) when passing U+FFFE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURI("\uFFFE");
      expect(result).assertEqual("%EF%BF%BE");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0390
     * @tc.name testEncodeUri039
     * @tc.desc Verify colon (:) as URI syntax character is not encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com:8080/path";
      expect(encodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0400
     * @tc.name testEncodeUri040
     * @tc.desc Verify slash (/) as URI syntax character is not encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com/path/to/resource";
      expect(encodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0410
     * @tc.name testEncodeUri041
     * @tc.desc Verify question mark (?) as URI syntax character is not encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com/search?q=test";
      expect(encodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0420
     * @tc.name testEncodeUri042
     * @tc.desc Verify hash (#) as URI syntax character is not encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com/page#section";
      expect(encodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0430
     * @tc.name testEncodeUri043
     * @tc.desc Verify equals (=) and ampersand (&) as URI syntax chars are not encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com?a=1&b=2";
      expect(encodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0440
     * @tc.name testEncodeUri044
     * @tc.desc Verify encodeURI plain ASCII URI returned unchanged by encodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com";
      expect(encodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0450
     * @tc.name testEncodeUri045
     * @tc.desc Verify control characters (tab, newline) encode correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "hello\tworld\ntest";
      let result: string = encodeURI(input);
      expect(result).assertEqual("hello%09world%0Atest");
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0460
     * @tc.name testEncodeUri046
     * @tc.desc Verify encodeURI unchanged when passing ID card number string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "310101199001011234";
      expect(encodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0470
     * @tc.name testEncodeUri047
     * @tc.desc Verify encodeURI asterisks unchanged (unreserved) when passing masked bank card
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "622202********1234";
      expect(encodeURI(input)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0480
     * @tc.name testEncodeUri048
     * @tc.desc Verify encodeURI unchanged when passing octal-literal-shaped string 0123
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURI("0123")).assertEqual("0123");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0490
     * @tc.name testEncodeUri049
     * @tc.desc Verify encodeURI unchanged when passing scientific-notation-shaped string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURI("123.45e6")).assertEqual("123.45e6");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0500
     * @tc.name testEncodeUri050
     * @tc.desc Verify encodeURI uTF-8 encoding when passing standalone Japanese kana string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u30c6\u30b9\u30c8";
      let result: string = encodeURI(input);
      expect(result).assertEqual("%E3%83%86%E3%82%B9%E3%83%88");
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0510
     * @tc.name testEncodeUri051
     * @tc.desc Verify encodeURI UTF-8 encoding and decodeURI round-trip when passing standalone Arabic string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0627\u062e\u062a\u0628\u0627\u0631";
      let result: string = encodeURI(input);
      expect(decodeURI(result)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0520
     * @tc.name testEncodeUri052
     * @tc.desc Verify encodeURI percent-encoded when passing lone tab character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURI("\t")).assertEqual("%09");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0530
     * @tc.name testEncodeUri053
     * @tc.desc Verify encodeURI percent-encoded when passing lone newline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURI("\n")).assertEqual("%0A");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0540
     * @tc.name testEncodeUri054
     * @tc.desc Verify encodeURI encodes when passing replacement char U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURI("\uFFFD")).assertEqual("%EF%BF%BD");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0550
     * @tc.name testEncodeUri055
     * @tc.desc Verify encodeURI round-trip wss:// URI via encodeURI and decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "wss://example.com/live/stream";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0560
     * @tc.name testEncodeUri056
     * @tc.desc Verify encodeURI round-trip file:// URI with space in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "file:///C:/test file/doc.txt";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual("file:///C:/test%20file/doc.txt");
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0570
     * @tc.name testEncodeUri057
     * @tc.desc Verify encodeURI round-trip mailto: URI with query
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "mailto:user@example.com?subject=Hello";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0580
     * @tc.name testEncodeUri058
     * @tc.desc Verify encodeURI preserves semicolon in path segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://example.com/a;b/c";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual(input);
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0590
     * @tc.name testEncodeUri059
     * @tc.desc Verify encodeURI round-trip ftp:// URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ftp://files.example.com/pub/readme.txt";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0600
     * @tc.name testEncodeUri060
     * @tc.desc Verify encodeURI(uri: string) preserves @ in userinfo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://user:pass@example.com/path";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual(input);
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0610
     * @tc.name testEncodeUri061
     * @tc.desc Verify encodeURI re-escapes % in pre-encoded input (%20 -> %2520)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://example.com/hello%20world";
      expect(encodeURI(input)).assertEqual("http://example.com/hello%2520world");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0620
     * @tc.name testEncodeUri062
     * @tc.desc Verify encodeURI encodes pipe | (not URI reserved char)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://example.com/a|b";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual("http://example.com/a%7Cb");
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0630
     * @tc.name testEncodeUri063
     * @tc.desc Verify encodeURI(uri: string) keeps comma unencoded (unreserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://example.com/a,b";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual(input);
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0640
     * @tc.name testEncodeUri064
     * @tc.desc Verify encodeURI keeps tilde unencoded (unreserved ~)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://example.com/~user";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual(input);
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0650
     * @tc.name testEncodeUri065
     * @tc.desc Verify encodeURI encodes accented Latin via UTF-8 percent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://example.com/caf\u00E9";
      expect(encodeURI(input)).assertEqual("http://example.com/caf%C3%A9");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0660
     * @tc.name testEncodeUri066
     * @tc.desc Verify encodeURI re-escapes % in input (%3B -> %253B); decodeURI round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://host/path%3Bseg";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual("http://host/path%253Bseg");
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0670
     * @tc.name testEncodeUri067
     * @tc.desc Verify encodeURI relative URI without scheme round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "/api/v1/search?q=测试";
      expect(encodeURI(input)).assertEqual("/api/v1/search?q=%E6%B5%8B%E8%AF%95");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0680
     * @tc.name testEncodeUri068
     * @tc.desc Verify encodeURI percent-encodes [ ] in IPv6 host literal; round-trip via decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://[2001:db8::1]/path";
      expect(encodeURI(input)).assertEqual("http://%5B2001:db8::1%5D/path");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0690
     * @tc.name testEncodeUri069
     * @tc.desc Verify encodeURI leaves URI reserved punctuation unencoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURI(";,/?:@&=+$#")).assertEqual(";,/?:@&=+$#");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0700
     * @tc.name testEncodeUri070
     * @tc.desc Verify encodeURI unchanged by encodeURI when passing protocol-relative URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "//cdn.example.com/static/app.v1.js";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0710
     * @tc.name testEncodeUri071
     * @tc.desc Verify encodeURI standalone Korean path segment UTF-8 percent encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com/\uD14C\uC2A4\uD2B8";
      expect(encodeURI(input)).assertEqual("https://example.com/%ED%85%8C%EC%8A%A4%ED%8A%B8");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0720
     * @tc.name testEncodeUri072
     * @tc.desc Verify encodeURI URI path segment with internal spaces encodes as %20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com/path with spaces";
      expect(encodeURI(input)).assertEqual("https://example.com/path%20with%20spaces");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0730
     * @tc.name testEncodeUri073
     * @tc.desc Verify encodeURI throws ClassCastError when passing array (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI(["a", "b"] as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0740
     * @tc.name testEncodeUri074
     * @tc.desc Verify encodeURI throws ClassCastError when passing function (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI(((): void => {}) as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0750
     * @tc.name testEncodeUri075
     * @tc.desc Verify encodeURI throws ClassCastError when passing helper object (toString not used)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: EncodeUriToStringHelper = new EncodeUriToStringHelper();
      expect((): void => {
        encodeURI(obj as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0760
     * @tc.name testEncodeUri076
     * @tc.desc Verify encodeURI pure Chinese path segment golden UTF-8 percent encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com/搜索";
      expect(encodeURI(input)).assertEqual("https://example.com/%E6%90%9C%E7%B4%A2");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0770
     * @tc.name testEncodeUri077
     * @tc.desc Verify encodeURI japanese path with scheme golden UTF-8 percent encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.com/\u30c6\u30b9\u30c8";
      expect(encodeURI(input)).assertEqual("https://example.com/%E3%83%86%E3%82%B9%E3%83%88");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0780
     * @tc.name testEncodeUri078
     * @tc.desc Verify encodeURI plain email string per static input; round-trip via decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "test@example.com";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0790
     * @tc.name testEncodeUri079
     * @tc.desc Verify encodeURI valid calendar date string unchanged and round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "2026-03-05";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0800
     * @tc.name testEncodeUri080
     * @tc.desc Verify encodeURI encodes to a and round-trips via decodeURI when passing source \\u0061
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0061";
      expect(encodeURI(input)).assertEqual("a");
      expect(decodeURI(encodeURI(input))).assertEqual("a");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0810
     * @tc.name testEncodeUri081
     * @tc.desc Verify encodeURI throws ClassCastError when passing empty array (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: string[] = [];
      expect((): void => {
        encodeURI(arr as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0820
     * @tc.name testEncodeUri082
     * @tc.desc Verify encodeURI leading and trailing spaces with CJK encode as %20 and UTF-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = " 测试 ";
      expect(encodeURI(input)).assertEqual("%20%E6%B5%8B%E8%AF%95%20");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0830
     * @tc.name testEncodeUri083
     * @tc.desc Verify iSO-8601 datetime string unchanged and round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "2026-03-05T10:30:00";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0840
     * @tc.name testEncodeUri084
     * @tc.desc Verify encodeURI nUL code unit U+0000 encodes as %00 and round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0000";
      expect(encodeURI(input)).assertEqual("%00");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0850
     * @tc.name testEncodeUri085
     * @tc.desc Verify lone star emoji U+1F31F golden UTF-8 percent encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uD83C\uDF1F";
      expect(encodeURI(input)).assertEqual("%F0%9F%8C%9F");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0860
     * @tc.name testEncodeUri086
     * @tc.desc Verify emoji plus CJK combo encodes with distinct golden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uD83D\uDE00\u6D4B\u8BD5";
      expect(encodeURI(input)).assertEqual("%F0%9F%98%80%E6%B5%8B%E8%AF%95");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0870
     * @tc.name testEncodeUri087
     * @tc.desc Verify encodeURI ws:// URI round-trips via encodeURI and decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ws://host.example.com/path";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0880
     * @tc.name testEncodeUri088
     * @tc.desc Verify backspace control char encodes as %08 and round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "a\bb";
      expect(encodeURI(input)).assertEqual("a%08b");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0890
     * @tc.name testEncodeUri089
     * @tc.desc Verify encodeURI throws ClassCastError when passing boolean false (uri: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI(false as Object as string);
      }).assertThrowError('ClassCastError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0900
     * @tc.name testEncodeUri090
     * @tc.desc Verify encodeURI magnet: URI round-trips via encodeURI and decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "magnet:?xt=urn:btih:abc123&dn=测试";
      expect(encodeURI(input)).assertEqual("magnet:?xt=urn:btih:abc123&dn=%E6%B5%8B%E8%AF%95");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0910
     * @tc.name testEncodeUri091
     * @tc.desc Verify form feed and vertical tab encode as %0C/%0B and round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ff: string = "a\fb";
      let vt: string = "a\vb";
      expect(encodeURI(ff)).assertEqual("a%0Cb");
      expect(encodeURI(vt)).assertEqual("a%0Bb");
      expect(decodeURI(encodeURI(ff))).assertEqual(ff);
      expect(decodeURI(encodeURI(vt))).assertEqual(vt);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0920
     * @tc.name testEncodeUri092
     * @tc.desc Verify encodeURI preserves # and encodes CJK in fragment per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.test/page#文档";
      expect(encodeURI(input)).assertEqual("https://example.test/page#%E6%96%87%E6%A1%A3");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0930
     * @tc.name testEncodeUri093
     * @tc.desc Verify encodeURI relative path from arkts-sta-functions.md example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "/search?q=ArkTS 文档";
      expect(encodeURI(input)).assertEqual("/search?q=ArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0940
     * @tc.name testEncodeUri094
     * @tc.desc Verify encodeURI query-only string preserves ? per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "?q=ArkTS 文档";
      expect(encodeURI(input)).assertEqual("?q=ArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0950
     * @tc.name testEncodeUri095
     * @tc.desc Verify encodeURI preserves scheme/host from arkts-sta-functions.md example
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefix: string = "https://example.test/search";
      expect(encodeURI(prefix)).assertEqual(prefix);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0960
     * @tc.name testEncodeUri096
     * @tc.desc Verify 65535-char ASCII URI boundary (static input data varchar upper); round-trip via decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longUri: string = "https://example.test/?q=" + "a".repeat(65535);
      let encoded: string = encodeURI(longUri);
      expect(encoded).assertEqual(longUri);
      expect(decodeURI(encoded)).assertEqual(longUri);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0970
     * @tc.name testEncodeUri097
     * @tc.desc Verify encodeURI preserves literal plus in query; not form-urlencoded plus-to-space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.test/search?q=a+b";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0980
     * @tc.name testEncodeUri098
     * @tc.desc Verify static input date/time boundaries including invalid calendar values; encodeURI round-trip unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: string[] = [
        "0000-00-00", "2099-12-31", "2024-02-29", "2026-13-01",
        "2026-13-05", "25:00:00", "2026-02-30", "2026/03/05"
      ];
      for (let d of dates) {
        expect(encodeURI(d)).assertEqual(d);
        expect(decodeURI(encodeURI(d))).assertEqual(d);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_0990
     * @tc.name testEncodeUri099
     * @tc.desc Verify GBK mojibake string æµè¯ from static input data; encodeURI UTF-8 percent encode and decodeURI round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "æµè¯";
      let encoded: string = encodeURI(input);
      expect(encoded).assertEqual("%C3%A6%C2%B5%C3%A8%C2%AF");
      expect(decodeURI(encoded)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1000
     * @tc.name testEncodeUri100
     * @tc.desc Verify mixed-locale English and Chinese test string from static input data round-trips via encodeURI UTF-8 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "Test 測試";
      expect(encodeURI(input)).assertEqual("Test%20%E6%B8%AC%E8%A9%A6");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1010
     * @tc.name testEncodeUri101
     * @tc.desc Verify device emoji 📱📞 from static input data; encodeURI UTF-8 round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "📱📞";
      expect(encodeURI(input)).assertEqual("%F0%9F%93%B1%F0%9F%93%9E");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1020
     * @tc.name testEncodeUri102
     * @tc.desc Verify business URL https://www.baidu.com from static input data; encodeURI unchanged round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://www.baidu.com";
      expect(encodeURI(input)).assertEqual(input);
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1030
     * @tc.name testEncodeUri103
     * @tc.desc Verify encodeURI throws URIError when passing incomplete emoji lone high surrogate \uD83D from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURI("\uD83D");
      }).assertThrowError('URIError');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1040
     * @tc.name testEncodeUri104
     * @tc.desc Verify static input datetime space 2026-03-05 10:30:00; encodeURI percent-encodes space only, preserves colons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "2026-03-05 10:30:00";
      expect(encodeURI(input)).assertEqual("2026-03-05%2010:30:00");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1050
     * @tc.name testEncodeUri105
     * @tc.desc Verify thai string from static input data; encodeURI UTF-8 percent encode and decodeURI round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0E17\u0E14\u0E2A\u0E2D\u0E1A";
      let encoded: string = encodeURI(input);
      expect(encoded).assertEqual("%E0%B8%97%E0%B8%94%E0%B8%AA%E0%B8%AD%E0%B8%9A");
      expect(decodeURI(encoded)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1060
     * @tc.name testEncodeUri106
     * @tc.desc Verify u+FFFF encodes as UTF-8 %EF%BF%BF and round-trips via decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uFFFF";
      expect(encodeURI(input)).assertEqual("%EF%BF%BF");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1070
     * @tc.name testEncodeUri107
     * @tc.desc Verify binary-literal-shaped string 0b1010 from static input data unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "0b1010";
      expect(encodeURI(input)).assertEqual("0b1010");
      expect(decodeURI(encodeURI(input))).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1080
     * @tc.name testEncodeUri108
     * @tc.desc Verify multiline string with CRLF from static input data; encodeURI percent-encodes and round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = " 测试 \r\n 换行 ";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual("%20%E6%B5%8B%E8%AF%95%20%0D%0A%20%E6%8D%A2%E8%A1%8C%20");
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1090
     * @tc.name testEncodeUri109
     * @tc.desc Verify path-like string with backslash from static input data; encodeURI encodes backslash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = " 测试 \\ 转义符 ";
      let enc: string = encodeURI(input);
      expect(enc).assertEqual("%20%E6%B5%8B%E8%AF%95%20%5C%20%E8%BD%AC%E4%B9%89%E7%AC%A6%20");
      expect(decodeURI(enc)).assertEqual(input);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_1100
     * @tc.name testEncodeUri110
     * @tc.desc Verify encodeURI percent-encodes lone percent sign to %25 (mirror of testDecodeUri040 URIError)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUri110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURI("%")).assertEqual("%25");
      expect(decodeURI("%25")).assertEqual("%");
    });
  });
}
