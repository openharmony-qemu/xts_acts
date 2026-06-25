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

class DecodeUriComponentToStringHelper {
  toString(): string {
    return "%E4%B8%AD";
  }
}

export default function DecodeUriComponentTest(): void {
  describe('DecodeUriComponentTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0010
     * @tc.name testDecodeUriComponent001
     * @tc.desc Verify decodeURIComponent normal execution when passing one string argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%E4%B8%AD%E6%96%87");
      expect(result).assertEqual("中文");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0020
     * @tc.name testDecodeUriComponent002
     * @tc.desc Verify decodeURIComponent inverts encodeURIComponent output when passing encoded component string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "hello world!@#$%";
      let encoded: string = encodeURIComponent(original);
      let result: string = decodeURIComponent(encoded);
      expect(result).assertEqual(original);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0030
     * @tc.name testDecodeUriComponent003
     * @tc.desc Verify decodeURIComponent decodes percent sign when passing encoded percent sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%25");
      expect(result).assertEqual("%");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0040
     * @tc.name testDecodeUriComponent004
     * @tc.desc Verify decodeURIComponent empty string is returned when passing empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("");
      expect(result).assertEqual("");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0050
     * @tc.name testDecodeUriComponent005
     * @tc.desc Verify decodeURIComponent handling when passing very long encoded string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "";
      for (let i = 0; i < 1000; i++) {
        longStr += encodeURIComponent("中");
      }
      let result: string = decodeURIComponent(longStr);
      let expected: string = "中".repeat(1000);
      expect(result).assertEqual(expected);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0060
     * @tc.name testDecodeUriComponent006
     * @tc.desc Verify decodeURIComponent decodes colon when passing encoded colon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%3A");
      expect(result).assertEqual(":");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0070
     * @tc.name testDecodeUriComponent007
     * @tc.desc Verify decodeURIComponent decodes question mark when passing encoded question mark
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%3F");
      expect(result).assertEqual("?");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0080
     * @tc.name testDecodeUriComponent008
     * @tc.desc Verify decodeURIComponent decodes hash when passing encoded hash
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%23");
      expect(result).assertEqual("#");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0090
     * @tc.name testDecodeUriComponent009
     * @tc.desc Verify decodeURIComponent decodes ampersand when passing encoded ampersand
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%26");
      expect(result).assertEqual("&");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0100
     * @tc.name testDecodeUriComponent010
     * @tc.desc Verify decodeURIComponent decodes equals sign when passing encoded equals sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%3D");
      expect(result).assertEqual("=");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0110
     * @tc.name testDecodeUriComponent011
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing null (uriComponent: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent(null as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0120
     * @tc.name testDecodeUriComponent012
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing undefined (uriComponent: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent(undefined as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0130
     * @tc.name testDecodeUriComponent013
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing number (uriComponent: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent(123 as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0140
     * @tc.name testDecodeUriComponent014
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing boolean (uriComponent: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent(true as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0150
     * @tc.name testDecodeUriComponent015
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing array (uriComponent: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent(["%E4%B8%AD"] as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0160
     * @tc.name testDecodeUriComponent016
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing object (uriComponent: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent({} as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0170
     * @tc.name testDecodeUriComponent017
     * @tc.desc Verify Chinese URI encoding decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%E4%BD%A0%E5%A5%BD%E4%B8%96%E7%95%8C");
      expect(result).assertEqual("你好世界");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0180
     * @tc.name testDecodeUriComponent018
     * @tc.desc Verify chars preserved by decodeURI are fully decoded by decodeURIComponent; paired decodeURI keeps input unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "%3A%2F%3F%23%26%3D%40%3B%2B%24%2C";
      expect(decodeURI(input)).assertEqual(input);
      expect(decodeURIComponent(input)).assertEqual(":/?#&=@;+$,");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0190
     * @tc.name testDecodeUriComponent019
     * @tc.desc Verify ASCII without escapes returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789");
      expect(result).assertEqual("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0200
     * @tc.name testDecodeUriComponent020
     * @tc.desc Verify decodeURIComponent unencoded plain string returns unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("hello world");
      expect(result).assertEqual("hello world");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0210
     * @tc.name testDecodeUriComponent021
     * @tc.desc Verify decodeURIComponent decodes multiple spaces when passing consecutive percent-encoded spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%20%20%20");
      expect(result).assertEqual("   ");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0220
     * @tc.name testDecodeUriComponent022
     * @tc.desc Verify decodeURIComponent mix of encoded and unencoded characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("hello%20world%21");
      expect(result).assertEqual("hello world!");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0230
     * @tc.name testDecodeUriComponent023
     * @tc.desc Verify encode then decode arbitrary string round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let testCases: string[] = ["test", "中文", "hello world!", "@#$%", "a%b"];
      for (let tc of testCases) {
        let roundTrip: string = decodeURIComponent(encodeURIComponent(tc));
        expect(roundTrip).assertEqual(tc);
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0240
     * @tc.name testDecodeUriComponent024
     * @tc.desc Verify double encode then double decode round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = "test";
      let encoded: string = encodeURIComponent(encodeURIComponent(original));
      let decoded: string = decodeURIComponent(decodeURIComponent(encoded));
      expect(decoded).assertEqual(original);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0250
     * @tc.name testDecodeUriComponent025
     * @tc.desc Verify decodeURIComponent full decode when passing long string of escapes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parts: string[] = [];
      for (let i = 0; i < 100; i++) {
        parts.push("%E4%B8%AD");
      }
      let result: string = decodeURIComponent(parts.join(""));
      expect(result).assertEqual("中".repeat(100));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0260
     * @tc.name testDecodeUriComponent026
     * @tc.desc Verify encoded emoji decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emoji: string = "😀";
      let encoded: string = encodeURIComponent(emoji);
      let result: string = decodeURIComponent(encoded);
      expect(result).assertEqual(emoji);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0270
     * @tc.name testDecodeUriComponent027
     * @tc.desc Verify decodeURIComponent multilingual encoded text decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let multiLang: string = "中文日本語한국어العربية";
      let encoded: string = encodeURIComponent(multiLang);
      let result: string = decodeURIComponent(encoded);
      expect(result).assertEqual(multiLang);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0280
     * @tc.name testDecodeUriComponent028
     * @tc.desc Verify string with single escape sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%41");
      expect(result).assertEqual("A");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0290
     * @tc.name testDecodeUriComponent029
     * @tc.desc Verify encoded newline decodes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%0A");
      expect(result).assertEqual("\n");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0300
     * @tc.name testDecodeUriComponent030
     * @tc.desc Verify decodeURIComponent throws URIError when percent followed by non-hex
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%GG");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0310
     * @tc.name testDecodeUriComponent031
     * @tc.desc Verify decodeURIComponent throws URIError when incomplete UTF-8 sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%E4%B8");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0320
     * @tc.name testDecodeUriComponent032
     * @tc.desc Verify decodeURIComponent invalid UTF-8 surrogate-like sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%E0%80");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0330
     * @tc.name testDecodeUriComponent033
     * @tc.desc Verify lone percent with no following characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0340
     * @tc.name testDecodeUriComponent034
     * @tc.desc Verify decodeURIComponent yields two UTF-16 code units without URIError for '%ED%A0%80' (ArkTS charCodeAt(0)=55286, not ECMAScript 55296)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%ED%A0%80");
      expect(result.length).assertEqual(2);
      expect(result.charCodeAt(0)).assertEqual(55286);
      expect(result.charCodeAt(1)).assertEqual(56320);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0350
     * @tc.name testDecodeUriComponent035
     * @tc.desc Verify decodeURIComponent mix of valid and invalid escapes in string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("hello%20world%GG");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0360
     * @tc.name testDecodeUriComponent036
     * @tc.desc Verify long UTF-8 component round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "ArkTS".repeat(800);
      let enc: string = encodeURIComponent(input);
      expect(decodeURIComponent(enc)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0370
     * @tc.name testDecodeUriComponent037
     * @tc.desc Verify decodeURIComponent decodes %22 to double quote
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%22")).assertEqual("\"");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0380
     * @tc.name testDecodeUriComponent038
     * @tc.desc Verify decodeURIComponent decodes %7E to tilde
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%7E")).assertEqual("~");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0390
     * @tc.name testDecodeUriComponent039
     * @tc.desc Verify fragment-only encoded component #section%2FChinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "#section/中文";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0400
     * @tc.name testDecodeUriComponent040
     * @tc.desc Verify decodeURIComponent inverts encodeURIComponent for MIN_SAFE_INTEGER
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enc: string = encodeURIComponent(Double.MIN_SAFE_INTEGER);
      expect(decodeURIComponent(enc)).assertEqual("-9007199254740991");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0410
     * @tc.name testDecodeUriComponent041
     * @tc.desc Verify decodeURIComponent decodes percent-encoded space in component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("hello%20world");
      expect(result).assertEqual("hello world");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0420
     * @tc.name testDecodeUriComponent042
     * @tc.desc Verify decodeURIComponent decodes encodeURIComponent(false) to literal false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent(encodeURIComponent(false))).assertEqual("false");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0430
     * @tc.name testDecodeUriComponent043
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing function (uriComponent: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent(((): void => {}) as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0440
     * @tc.name testDecodeUriComponent044
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing helper object (toString not used)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: DecodeUriComponentToStringHelper = new DecodeUriComponentToStringHelper();
      expect((): void => {
        decodeURIComponent(obj as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0450
     * @tc.name testDecodeUriComponent045
     * @tc.desc Verify second decodeURIComponent on plain string is idempotent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let once: string = decodeURIComponent("hello%20world");
      expect(decodeURIComponent(once)).assertEqual("hello world");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0460
     * @tc.name testDecodeUriComponent046
     * @tc.desc Verify decodeURIComponent decodes encodeURIComponent(true) to literal true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent(encodeURIComponent(true))).assertEqual("true");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0470
     * @tc.name testDecodeUriComponent047
     * @tc.desc Verify decodeURIComponent decodes encodeURIComponent(NaN) to literal NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent(encodeURIComponent(Double.NaN))).assertEqual("NaN");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0480
     * @tc.name testDecodeUriComponent048
     * @tc.desc Verify decodeURIComponent decodes encodeURIComponent(Infinity) to literal Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent(encodeURIComponent(Double.POSITIVE_INFINITY))).assertEqual("Infinity");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0490
     * @tc.name testDecodeUriComponent049
     * @tc.desc Verify decodeURIComponent decodes encodeURIComponent(-Infinity) to literal -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent(encodeURIComponent(Double.NEGATIVE_INFINITY))).assertEqual("-Infinity");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0500
     * @tc.name testDecodeUriComponent050
     * @tc.desc Verify decodeURIComponent inverts encodeURIComponent for Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enc: string = encodeURIComponent(Double.MAX_VALUE);
      expect(enc).assertEqual("1.7976931348623157e%2B308");
      expect(decodeURIComponent(enc)).assertEqual("1.7976931348623157e+308");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0510
     * @tc.name testDecodeUriComponent051
     * @tc.desc Verify decodeURIComponent inverts encodeURIComponent for Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let enc: string = encodeURIComponent(Double.MIN_VALUE);
      expect(enc).assertEqual("5e-324");
      expect(decodeURIComponent(enc)).assertEqual("5e-324");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0520
     * @tc.name testDecodeUriComponent052
     * @tc.desc Verify decodeURIComponent decodes %5B to left square bracket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%5B")).assertEqual("[");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0530
     * @tc.name testDecodeUriComponent053
     * @tc.desc Verify decodeURIComponent decodes %7B to left curly brace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%7B")).assertEqual("{");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0540
     * @tc.name testDecodeUriComponent054
     * @tc.desc Verify decodeURIComponent inverts encodeURIComponent for Number 123 per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent(encodeURIComponent(123))).assertEqual("123");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0550
     * @tc.name testDecodeUriComponent055
     * @tc.desc Verify decodeURIComponent decodes %5D to right square bracket
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%5D")).assertEqual("]");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0560
     * @tc.name testDecodeUriComponent056
     * @tc.desc Verify decodeURIComponent decodes %7D to right curly brace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%7D")).assertEqual("}");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0570
     * @tc.name testDecodeUriComponent057
     * @tc.desc Verify form feed %0C and vertical tab %0B decode to control chars
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%0C")).assertEqual("\f");
      expect(decodeURIComponent("%0B")).assertEqual("\v");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0580
     * @tc.name testDecodeUriComponent058
     * @tc.desc Verify decodeURIComponent decodes fragment content component golden
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("section%2F%E4%B8%AD%E6%96%87")).assertEqual("section/中文");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0590
     * @tc.name testDecodeUriComponent059
     * @tc.desc Verify decodeURIComponent decodes %2F while decodeURI keeps it in full URI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%2F")).assertEqual("/");
      expect(decodeURI("https://example.test/a%2Fb")).assertEqual("https://example.test/a%2Fb");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0600
     * @tc.name testDecodeUriComponent060
     * @tc.desc Verify decodeURIComponent arkts-sta-functions.md sample: encodeURIComponent then decodeURIComponent round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let raw: string = "ArkTS 文档";
      let component: string = encodeURIComponent(raw);
      expect(component).assertEqual("ArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURIComponent(component)).assertEqual(raw);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0610
     * @tc.name testDecodeUriComponent061
     * @tc.desc Verify decodeURIComponent rejects escape %u output; unescape is required per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let escaped: string = escape("ArkTS 文档");
      expect(unescape(escaped)).assertEqual("ArkTS 文档");
      expect((): void => {
        decodeURIComponent(escaped);
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0620
     * @tc.name testDecodeUriComponent062
     * @tc.desc Verify unescape does not invert encodeURIComponent UTF-8 output; decodeURIComponent does
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let encoded: string = encodeURIComponent("中文");
      expect(encoded).assertEqual("%E4%B8%AD%E6%96%87");
      expect(decodeURIComponent(encoded)).assertEqual("中文");
      expect(unescape(encoded)).assertEqual("\u00E4\u00B8\u00AD\u00E6\u0096\u0087");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0630
     * @tc.name testDecodeUriComponent063
     * @tc.desc Verify decodeURIComponent decodes path slash; decodeURI keeps %2F but decodes space and UTF-8 in path
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let segment: string = encodeURIComponent("docs/ArkTS 文档");
      expect(segment).assertEqual("docs%2FArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURIComponent(segment)).assertEqual("docs/ArkTS 文档");
      let uri: string = "https://example.test/" + segment;
      expect(decodeURI(uri)).assertEqual("https://example.test/docs%2FArkTS 文档");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0640
     * @tc.name testDecodeUriComponent064
     * @tc.desc Verify decodeURIComponent throws URIError when truncated 2-byte UTF-8 percent %C2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%C2");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0650
     * @tc.name testDecodeUriComponent065
     * @tc.desc Verify decodeURIComponent double-encoded percent %252520 decodes in two steps to %20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%252520")).assertEqual("%2520");
      expect(decodeURIComponent(decodeURIComponent("%252520"))).assertEqual("%20");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0660
     * @tc.name testDecodeUriComponent066
     * @tc.desc Verify decodeURIComponent(encodeURI) round-trips CJK in path when encodeURI percent-encodes UTF-8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://example.test/文档";
      let uriEncoded: string = encodeURI(input);
      expect(uriEncoded).assertEqual("https://example.test/%E6%96%87%E6%A1%A3");
      expect(decodeURIComponent(uriEncoded)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0670
     * @tc.name testDecodeUriComponent067
     * @tc.desc Verify decodeURIComponent on full URI with encodeURIComponent path decodes %2F unlike decodeURI
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let uri: string = "https://example.test/" + encodeURIComponent("docs/ArkTS 文档");
      expect(decodeURI(uri)).assertEqual("https://example.test/docs%2FArkTS 文档");
      expect(decodeURIComponent(uri)).assertEqual("https://example.test/docs/ArkTS 文档");
      expect(decodeURIComponent(uri)).not().assertEqual(decodeURI(uri));
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0680
     * @tc.name testDecodeUriComponent068
     * @tc.desc Verify 65535-char ASCII component round-trip via encodeURIComponent and decodeURIComponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "z".repeat(65535);
      let encoded: string = encodeURIComponent(longStr);
      expect(decodeURIComponent(encoded)).assertEqual(longStr);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0690
     * @tc.name testDecodeUriComponent069
     * @tc.desc Verify decodeURIComponent throws URIError when truncated UTF-8 lead byte %E4 (1 of 3 for Chinese character)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%E4");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0700
     * @tc.name testDecodeUriComponent070
     * @tc.desc Verify decodeURIComponent(encodeURI) round-trips query-only string from arkts-sta-functions.md style
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "?q=ArkTS 文档";
      let uriEncoded: string = encodeURI(input);
      expect(uriEncoded).assertEqual("?q=ArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURIComponent(uriEncoded)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0710
     * @tc.name testDecodeUriComponent071
     * @tc.desc Verify static input date boundaries 0000-00-00, 2099-12-31, 2024-02-29, 2026-13-01; decodeURIComponent plain and round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: string[] = ["0000-00-00", "2099-12-31", "2024-02-29", "2026-13-01"];
      for (let d of dates) {
        expect(decodeURIComponent(d)).assertEqual(d);
        expect(decodeURIComponent(encodeURIComponent(d))).assertEqual(d);
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0720
     * @tc.name testDecodeUriComponent072
     * @tc.desc Verify GBK mojibake string æµè¯ from static input data; decodeURIComponent after encodeURIComponent round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "æµè¯";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0730
     * @tc.name testDecodeUriComponent073
     * @tc.desc Verify mixed-locale English and Chinese test string from static input data round-trips via decodeURIComponent after encodeURIComponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "Test 測試";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0740
     * @tc.name testDecodeUriComponent074
     * @tc.desc Verify device emoji 📱📞 from static input data; decodeURIComponent after encodeURIComponent round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "📱📞";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0750
     * @tc.name testDecodeUriComponent075
     * @tc.desc Verify business URL https://www.baidu.com from static input data; decodeURIComponent after encodeURIComponent round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://www.baidu.com";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0760
     * @tc.name testDecodeUriComponent076
     * @tc.desc Verify incomplete emoji lone high surrogate \uD83D from static input data; decodeURIComponent returns input unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uD83D";
      expect(decodeURIComponent(input)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0770
     * @tc.name testDecodeUriComponent077
     * @tc.desc Verify decodeURIComponent keeps literal plus in a+b; %2B and lowercase hex %e4%b8%ad decode per spec
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("a+b")).assertEqual("a+b");
      expect(decodeURIComponent("a%2Bb")).assertEqual("a+b");
      expect(decodeURIComponent("%2B")).assertEqual("+");
      expect(decodeURIComponent("%e4%b8%ad")).assertEqual("中");
      expect(encodeURIComponent("a+b")).assertEqual("a%2Bb");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0780
     * @tc.name testDecodeUriComponent078
     * @tc.desc Verify static input datetime space 2026-03-05 10:30:00; encodeURIComponent round-trip encodes both space and colons
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "2026-03-05 10:30:00";
      expect(encodeURIComponent(input)).assertEqual("2026-03-05%2010%3A30%3A00");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0790
     * @tc.name testDecodeUriComponent079
     * @tc.desc Verify thai string from static input data; decodeURIComponent after encodeURIComponent UTF-8 round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0E17\u0E14\u0E2A\u0E2D\u0E1A";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0800
     * @tc.name testDecodeUriComponent080
     * @tc.desc Verify decodeURIComponent throws URIError when incomplete percent %A and %A1  in decodeURIComponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%A");
      }).assertThrowError('URIError');
      expect((): void => {
        decodeURIComponent("%A1");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0810
     * @tc.name testDecodeUriComponent081
     * @tc.desc Verify static input ID card 310101199001011234; decodeURIComponent round-trip via encodeURIComponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "310101199001011234";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0820
     * @tc.name testDecodeUriComponent082
     * @tc.desc Verify decodeURIComponent round-trips invalid time 25:00:00 from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent(encodeURIComponent("25:00:00"))).assertEqual("25:00:00");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0830
     * @tc.name testDecodeUriComponent083
     * @tc.desc Verify decodeURIComponent round-trips masked bank card from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "622202********1234";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0840
     * @tc.name testDecodeUriComponent084
     * @tc.desc Verify decode Japanese UTF-8 sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%E3%83%86%E3%82%B9%E3%83%88")).assertEqual("\u30c6\u30b9\u30c8");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0850
     * @tc.name testDecodeUriComponent085
     * @tc.desc Verify decode Korean UTF-8 sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%ED%85%8C%EC%8A%A4%ED%8A%B8")).assertEqual("\ud14c\uc2a4\ud2b8");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0860
     * @tc.name testDecodeUriComponent086
     * @tc.desc Verify decodeURIComponent URIError when passing illegal UTF-8 %FE%FF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%FE%FF");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0870
     * @tc.name testDecodeUriComponent087
     * @tc.desc [Security] decodeURIComponent accepts overlong UTF-8 %C0%81 (non-strict) and yields U+0001 without URIError; documents lenient decoding—validate before security-sensitive use
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%C0%81");
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(1);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0880
     * @tc.name testDecodeUriComponent088
     * @tc.desc Verify decode zero-width space UTF-8 percent sequence %E2%80%8B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%E2%80%8B")).assertEqual("\u200B");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0890
     * @tc.name testDecodeUriComponent089
     * @tc.desc [Security] decodeURIComponent decodes percent-encoded NUL %00 to U+0000; callers must not pass decoded output to C APIs or path concatenation without explicit validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%00");
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0900
     * @tc.name testDecodeUriComponent090
     * @tc.desc Verify static input invalid day date 2026-02-30; decodeURIComponent plain unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("2026-02-30")).assertEqual("2026-02-30");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0910
     * @tc.name testDecodeUriComponent091
     * @tc.desc Verify static input slash-separated date 2026/03/05; decodeURIComponent round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "2026/03/05";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0920
     * @tc.name testDecodeUriComponent092
     * @tc.desc Verify decode Russian Cyrillic UTF-8 percent sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%D0%90%D0%91%D0%92%D0%93%D0%94")).assertEqual("\u0410\u0411\u0412\u0413\u0414");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0930
     * @tc.name testDecodeUriComponent093
     * @tc.desc Verify decodeURIComponent inverts encodeURIComponent for Arabic UTF-8 input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0627\u062e\u062a\u0628\u0627\u0631";
      let encoded: string = encodeURIComponent(input);
      expect(decodeURIComponent(encoded)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0940
     * @tc.name testDecodeUriComponent094
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing boolean false (uriComponent: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent(false as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0950
     * @tc.name testDecodeUriComponent095
     * @tc.desc Verify decodeURIComponent rejects legacy %uXXXX; use unescape per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%u4E2D%u6587");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0960
     * @tc.name testDecodeUriComponent096
     * @tc.desc [Security] decodeURIComponent accepts overlong UTF-8 %C0%80 (non-strict) and yields NUL without URIError; distinct byte sequences may normalize to the same code unit—do not use decoded output in path/C API handling without validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = decodeURIComponent("%C0%80");
      expect(result.length).assertEqual(1);
      expect(result.charCodeAt(0)).assertEqual(0);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0970
     * @tc.name testDecodeUriComponent097
     * @tc.desc Verify isolated surrogate \uDC04 from static input data; decodeURIComponent returns input unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uDC04";
      expect(decodeURIComponent(input)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0980
     * @tc.name testDecodeUriComponent098
     * @tc.desc Verify decode standalone Thai UTF-8 percent sequence from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%E0%B8%97%E0%B8%94%E0%B8%AA%E0%B8%AD%E0%B8%9A")).assertEqual("\u0E17\u0E14\u0E2A\u0E2D\u0E1A");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_0990
     * @tc.name testDecodeUriComponent099
     * @tc.desc Verify decode U+2014 em dash UTF-8 percent sequence from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(decodeURIComponent("%E2%80%94")).assertEqual("\u2014");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_1000
     * @tc.name testDecodeUriComponent100
     * @tc.desc Verify decodeURIComponent throws URIError when passing incomplete percent %2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        decodeURIComponent("%2");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_1010
     * @tc.name testDecodeUriComponent101
     * @tc.desc Verify lone low surrogate \uDC00 from static input data; decodeURIComponent returns input unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\uDC00";
      expect(decodeURIComponent(input)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_DECODE_URI_COMPONENT_1020
     * @tc.name testDecodeUriComponent102
     * @tc.desc Verify decodeURIComponent throws ClassCastError when passing empty array (str: string)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testDecodeUriComponent102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
      expect((): void => {
        decodeURIComponent(arr as Object as string);
      }).assertThrowError('ClassCastError');
    });
  });
}
