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

class EncodeUriComponentToStringHelper {
  toString(): string {
    return "ArkTS%20%E6%96%87%E6%A1%A3";
  }
}

export default function EncodeUriComponentTest(): void {
  describe('EncodeUriComponentTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0010
     * @tc.name testEncodeUriComponent001
     * @tc.desc Verify encodeURIComponent normal call when passing one String argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("hello world");
      expect(result).assertEqual("hello%20world");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0020
     * @tc.name testEncodeUriComponent002
     * @tc.desc Verify encodeURIComponent not encoded when passing ASCII alphanumeric
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
      expect(result).assertEqual("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0030
     * @tc.name testEncodeUriComponent003
     * @tc.desc Verify encodeURIComponent multibyte encoding when passing emoji string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("Hello 😀🎉");
      expect(result).assertEqual("Hello%20%F0%9F%98%80%F0%9F%8E%89");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0040
     * @tc.name testEncodeUriComponent004
     * @tc.desc Verify encodeURIComponent colon is encoded when passing string with colon
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("http://example.com");
      expect(result).assertEqual("http%3A%2F%2Fexample.com");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0050
     * @tc.name testEncodeUriComponent005
     * @tc.desc Verify encodeURIComponent they are encoded when passing string with / ? #
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("path/to?q=query#frag");
      expect(result).assertEqual("path%2Fto%3Fq%3Dquery%23frag");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0060
     * @tc.name testEncodeUriComponent006
     * @tc.desc Verify encodeURIComponent query delimiters encoded when passing string with &=
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("key1=value1&key2=value2");
      expect(result).assertEqual("key1%3Dvalue1%26key2%3Dvalue2");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0070
     * @tc.name testEncodeUriComponent007
     * @tc.desc Verify encodeURIComponent encoding when passing special symbols !@#$%^*()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("!@#$%^*()");
      expect(result).assertEqual("!%40%23%24%25%5E*()");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0080
     * @tc.name testEncodeUriComponent008
     * @tc.desc Verify encodeURIComponent encoding when passing control chars \n \t
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("line1\nline2\ttab");
      expect(result).assertEqual("line1%0Aline2%09tab");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0090
     * @tc.name testEncodeUriComponent009
     * @tc.desc Verify encodeURIComponent behavior when passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent(null as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0100
     * @tc.name testEncodeUriComponent010
     * @tc.desc Verify encodeURIComponent behavior when passing undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent(undefined as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0110
     * @tc.name testEncodeUriComponent011
     * @tc.desc Verify encodeURIComponent special characters are encoded when passing XSS-like string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let payload: string = "<script>alert(1)</script>";
      let enc: string = encodeURIComponent(payload);
      expect(enc).assertEqual("%3Cscript%3Ealert(1)%3C%2Fscript%3E");
      expect(decodeURIComponent(enc)).assertEqual(payload);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0120
     * @tc.name testEncodeUriComponent012
     * @tc.desc Verify encodeURIComponent encoding when passing negative -456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(-456);
      expect(result).assertEqual("-456");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0130
     * @tc.name testEncodeUriComponent013
     * @tc.desc Verify encodeURIComponent encoding when passing float 3.14
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(3.14);
      expect(result).assertEqual("3.14");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0140
     * @tc.name testEncodeUriComponent014
     * @tc.desc Verify encodeURIComponent zero encoding when passing 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(0);
      expect(result).assertEqual("0");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0150
     * @tc.name testEncodeUriComponent015
     * @tc.desc Verify encodeURIComponent encoding when passing Double.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(Double.MAX_VALUE);
      expect(result).assertEqual("1.7976931348623157e%2B308");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0160
     * @tc.name testEncodeUriComponent016
     * @tc.desc Verify encodeURIComponent encoding when passing Double.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(Double.MIN_VALUE);
      expect(result).assertEqual("5e-324");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0170
     * @tc.name testEncodeUriComponent017
     * @tc.desc Verify encodeURIComponent negative zero encoding when passing -0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(-0);
      expect(result).assertEqual("0");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0180
     * @tc.name testEncodeUriComponent018
     * @tc.desc Verify encodeURIComponent encoding when passing Double.POSITIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(Double.POSITIVE_INFINITY);
      expect(result).assertEqual("Infinity");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0190
     * @tc.name testEncodeUriComponent019
     * @tc.desc Verify encodeURIComponent encoding when passing Double.NEGATIVE_INFINITY
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(Double.NEGATIVE_INFINITY);
      expect(result).assertEqual("-Infinity");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0200
     * @tc.name testEncodeUriComponent020
     * @tc.desc Verify encodeURIComponent encoding when passing Double.NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(Double.NaN);
      expect(result).assertEqual("NaN");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0210
     * @tc.name testEncodeUriComponent021
     * @tc.desc Verify encodeURIComponent scientific notation encoding when passing tiny float 1e-10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(1e-10);
      expect(result).assertEqual("1e-10");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0220
     * @tc.name testEncodeUriComponent022
     * @tc.desc Verify encodeURIComponent chinese encoded as UTF-8 %XX byte sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("中文");
      expect(result).assertEqual("%E4%B8%AD%E6%96%87");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0230
     * @tc.name testEncodeUriComponent023
     * @tc.desc Verify colon encoded as %3A (unlike encodeURI)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent(":");
      expect(result).assertEqual("%3A");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0240
     * @tc.name testEncodeUriComponent024
     * @tc.desc Verify encodeURIComponent slash encoded as %2F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("/");
      expect(result).assertEqual("%2F");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0250
     * @tc.name testEncodeUriComponent025
     * @tc.desc Verify encodeURIComponent question mark encoded as %3F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("?");
      expect(result).assertEqual("%3F");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0260
     * @tc.name testEncodeUriComponent026
     * @tc.desc Verify hash encoded as %23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("#");
      expect(result).assertEqual("%23");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0270
     * @tc.name testEncodeUriComponent027
     * @tc.desc Verify ampersand encoded as %26
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("&");
      expect(result).assertEqual("%26");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0280
     * @tc.name testEncodeUriComponent028
     * @tc.desc Verify equals encoded as %3D
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("=");
      expect(result).assertEqual("%3D");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0290
     * @tc.name testEncodeUriComponent029
     * @tc.desc Verify encoding behavior for single and double quotes; double quote round-trips
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1: string = encodeURIComponent("'");
      expect(result1).assertEqual("'");
      let result2: string = encodeURIComponent("\"");
      expect(result2).assertEqual("%22");
      expect(decodeURIComponent(encodeURIComponent("\""))).assertEqual("\"");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0300
     * @tc.name testEncodeUriComponent030
     * @tc.desc Verify backslash encoded as %5C
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("\\");
      expect(result).assertEqual("%5C");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0310
     * @tc.name testEncodeUriComponent031
     * @tc.desc Verify at sign encoded as %40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("@");
      expect(result).assertEqual("%40");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0320
     * @tc.name testEncodeUriComponent032
     * @tc.desc Verify encodeURIComponent no error when passing valid surrogate pair emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = encodeURIComponent("\uD83D\uDE00");
      expect(result).assertEqual("%F0%9F%98%80");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0330
     * @tc.name testEncodeUriComponent033
     * @tc.desc Verify encodeURIComponent behavior when passing array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [1, 2, 3];
      expect((): void => {
        encodeURIComponent(arr as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0340
     * @tc.name testEncodeUriComponent034
     * @tc.desc Verify encodeURIComponent behavior when passing plain object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      expect((): void => {
        encodeURIComponent(obj as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0350
     * @tc.name testEncodeUriComponent035
     * @tc.desc Verify encodeURIComponent behavior when passing function
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent(((): void => {}) as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0360
     * @tc.name testEncodeUriComponent036
     * @tc.desc Verify encodeURIComponent URIError when passing lone high surrogate \uD800
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent("\uD800");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0370
     * @tc.name testEncodeUriComponent037
     * @tc.desc Verify encodeURIComponent URIError when passing lone low surrogate \uDC00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent("\uDC00");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0380
     * @tc.name testEncodeUriComponent038
     * @tc.desc Verify encodeURIComponent URIError when passing lone surrogate between ASCII
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent("abc\uD800def");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0390
     * @tc.name testEncodeUriComponent039
     * @tc.desc Verify encodeURIComponent throws ClassCastError when passing empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Array<int> = [];
      expect((): void => {
        encodeURIComponent(arr as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0400
     * @tc.name testEncodeUriComponent040
     * @tc.desc Verify encodeURIComponent digits unchanged when passing ID card string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("310101199001011234")).assertEqual("310101199001011234");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0410
     * @tc.name testEncodeUriComponent041
     * @tc.desc Verify encodeURIComponent asterisks unchanged (unreserved) when passing masked bank card
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "622202********1234";
      expect(encodeURIComponent(input)).assertEqual("622202********1234");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0420
     * @tc.name testEncodeUriComponent042
     * @tc.desc Verify encodeURIComponent leaves alphanumeric digit strings 0123 and 0b1010 unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("0123")).assertEqual("0123");
      expect(encodeURIComponent("0b1010")).assertEqual("0b1010");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0430
     * @tc.name testEncodeUriComponent043
     * @tc.desc Verify encodeURIComponent encodes scientific notation string 123.45e6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("123.45e6")).assertEqual("123.45e6");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0440
     * @tc.name testEncodeUriComponent044
     * @tc.desc Verify encodeURIComponent percent-encodes lone tab and newline characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("\t")).assertEqual("%09");
      expect(encodeURIComponent("\n")).assertEqual("%0A");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0450
     * @tc.name testEncodeUriComponent045
     * @tc.desc Verify encodeURIComponent UTF-8 encodes U+FFFD replacement character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("\uFFFD")).assertEqual("%EF%BF%BD");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0460
     * @tc.name testEncodeUriComponent046
     * @tc.desc Verify encodeURIComponent encodes plus sign in URI component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("a+b")).assertEqual("a%2Bb");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0470
     * @tc.name testEncodeUriComponent047
     * @tc.desc Verify encodeURIComponent encoded as decimal string via Number overload when passing long 9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxSafe: long = 9007199254740991;
      expect(encodeURIComponent(maxSafe)).assertEqual("9007199254740991");
      expect(decodeURIComponent(encodeURIComponent(maxSafe))).assertEqual("9007199254740991");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0480
     * @tc.name testEncodeUriComponent048
     * @tc.desc Verify encodeURI keeps ? in component-like string, encodeURIComponent encodes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "?x=1";
      expect(encodeURI(s)).assertEqual("?x=1");
      expect(encodeURIComponent(s)).assertEqual("%3Fx%3D1");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0490
     * @tc.name testEncodeUriComponent049
     * @tc.desc Verify double quote encoded as %22 in phrase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("say \"hi\"")).assertEqual("say%20%22hi%22");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0500
     * @tc.name testEncodeUriComponent050
     * @tc.desc Verify encodeURIComponent int literal 42 accepted per String|Number|Boolean API
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(42)).assertEqual("42");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0510
     * @tc.name testEncodeUriComponent051
     * @tc.desc Verify long CJK string round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "测试".repeat(500);
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0520
     * @tc.name testEncodeUriComponent052
     * @tc.desc Verify tilde not encoded in component (unreserved subset)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("a~b")).assertEqual("a~b");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0530
     * @tc.name testEncodeUriComponent053
     * @tc.desc Verify percent sign encoded as %25
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("%")).assertEqual("%25");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0540
     * @tc.name testEncodeUriComponent054
     * @tc.desc Verify encodeURIComponent semicolon and comma encoded in component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(";,")).assertEqual("%3B%2C");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0550
     * @tc.name testEncodeUriComponent055
     * @tc.desc Verify encodeURIComponent double-encoding: second encodeURIComponent wraps percents
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let once: string = encodeURIComponent(" ");
      expect(once).assertEqual("%20");
      expect(encodeURIComponent(once)).assertEqual("%2520");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0560
     * @tc.name testEncodeUriComponent056
     * @tc.desc Verify encodeURIComponent encoded as decimal string via Number overload when passing long -9007199254740991
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minSafe: long = -9007199254740991;
      expect(encodeURIComponent(minSafe)).assertEqual("-9007199254740991");
      expect(decodeURIComponent(encodeURIComponent(minSafe))).assertEqual("-9007199254740991");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0570
     * @tc.name testEncodeUriComponent057
     * @tc.desc Verify encodeURIComponent int literal 2147483647 accepted as Number overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(2147483647)).assertEqual("2147483647");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0580
     * @tc.name testEncodeUriComponent058
     * @tc.desc Verify full query pair from API doc as single component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let component: string = encodeURIComponent("q=ArkTS 文档");
      expect(component).assertEqual("q%3DArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURIComponent(component)).assertEqual("q=ArkTS 文档");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0590
     * @tc.name testEncodeUriComponent059
     * @tc.desc Verify encodeURI keeps & and =; encodeURIComponent encodes them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a&b=c";
      expect(encodeURI(s)).assertEqual("a&b=c");
      expect(encodeURIComponent(s)).assertEqual("a%26b%3Dc");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0600
     * @tc.name testEncodeUriComponent060
     * @tc.desc Verify encodeURIComponent unreserved charset A-Z a-z 0-9 - _ . ! ~ * ' ( ) unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "A-Z_a-z0-9-_.!~*'()";
      expect(encodeURIComponent(input)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0610
     * @tc.name testEncodeUriComponent061
     * @tc.desc Verify encodeURIComponent multilingual JP+KR+AR component round-trips via decodeURIComponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u3053\u3093\u306B\u3061\u306F\uC548\uB155\uD558\uC138\uC694\u0645\u0631\u062D\u0628\u0627";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0620
     * @tc.name testEncodeUriComponent062
     * @tc.desc Verify encodeURI keeps semicolon; encodeURIComponent encodes as %3B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a;b";
      expect(encodeURI(s)).assertEqual("a;b");
      expect(encodeURIComponent(s)).assertEqual("a%3Bb");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0630
     * @tc.name testEncodeUriComponent063
     * @tc.desc Verify encodeURIComponent int overflow literal string 2147483648 unchanged as String overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("2147483648")).assertEqual("2147483648");
      expect(decodeURIComponent(encodeURIComponent("2147483648"))).assertEqual("2147483648");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0640
     * @tc.name testEncodeUriComponent064
     * @tc.desc Verify encodeURIComponent encodes @ in email component as %40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("test@example.com")).assertEqual("test%40example.com");
      expect(decodeURIComponent(encodeURIComponent("test@example.com"))).assertEqual("test@example.com");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0650
     * @tc.name testEncodeUriComponent065
     * @tc.desc Verify encodeURI keeps hash; encodeURIComponent encodes as %23
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = "a#b";
      expect(encodeURI(s)).assertEqual("a#b");
      expect(encodeURIComponent(s)).assertEqual("a%23b");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0660
     * @tc.name testEncodeUriComponent066
     * @tc.desc Verify carriage return and CRLF encode as %0D and %0D%0A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("\r")).assertEqual("%0D");
      expect(encodeURIComponent("\r\n")).assertEqual("%0D%0A");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0670
     * @tc.name testEncodeUriComponent067
     * @tc.desc Verify encodeURIComponent pipe character encodes as %7C in component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("a|b")).assertEqual("a%7Cb");
      expect(decodeURIComponent(encodeURIComponent("a|b"))).assertEqual("a|b");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0680
     * @tc.name testEncodeUriComponent068
     * @tc.desc Verify encodeURIComponent square brackets encode as %5B and %5D
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("[x]")).assertEqual("%5Bx%5D");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0690
     * @tc.name testEncodeUriComponent069
     * @tc.desc Verify accented Latin UTF-8 percent encoding and round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "caf\u00E9";
      expect(encodeURIComponent(input)).assertEqual("caf%C3%A9");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0700
     * @tc.name testEncodeUriComponent070
     * @tc.desc Verify encodeURIComponent positive scientific notation Number; plus sign encodes as %2B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(1e+21)).assertEqual("1e%2B21");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0710
     * @tc.name testEncodeUriComponent071
     * @tc.desc Verify encodeURIComponent int literal -2147483648 accepted as Number overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(-2147483648)).assertEqual("-2147483648");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0720
     * @tc.name testEncodeUriComponent072
     * @tc.desc Verify full URL string encoded as single URI component
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "http://example.com/path?q=hello world&a=1&b=2#section";
      let encoded: string = encodeURIComponent(input);
      expect(encoded).assertEqual("http%3A%2F%2Fexample.com%2Fpath%3Fq%3Dhello%20world%26a%3D1%26b%3D2%23section");
      expect(decodeURIComponent(encoded)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0730
     * @tc.name testEncodeUriComponent073
     * @tc.desc Verify mixed punctuation round-trips via decodeURIComponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "!@#$%^&*()_+-=[]{}|;':\",./<>?";
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0740
     * @tc.name testEncodeUriComponent074
     * @tc.desc Verify angle brackets encode as %3C and %3E
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("<>")).assertEqual("%3C%3E");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0750
     * @tc.name testEncodeUriComponent075
     * @tc.desc Verify encodeURIComponent zero-width space U+200B UTF-8 encoding and round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "a\u200Bb";
      expect(encodeURIComponent(input)).assertEqual("a%E2%80%8Bb");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0760
     * @tc.name testEncodeUriComponent076
     * @tc.desc Verify backspace control char encodes as %08
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("\b")).assertEqual("%08");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0770
     * @tc.name testEncodeUriComponent077
     * @tc.desc Verify encodeURIComponent throws ClassCastError when passing number (not Number overload)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent(123 as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0780
     * @tc.name testEncodeUriComponent078
     * @tc.desc Verify encodeURIComponent throws ClassCastError when passing boolean (not Boolean overload)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent(false as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0790
     * @tc.name testEncodeUriComponent079
     * @tc.desc Verify encodeURIComponent throws ClassCastError when passing helper object (toString not used)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: EncodeUriComponentToStringHelper = new EncodeUriComponentToStringHelper();
      expect((): void => {
        encodeURIComponent(obj as Object as string);
      }).assertThrowError('ClassCastError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0800
     * @tc.name testEncodeUriComponent080
     * @tc.desc Verify path segment value with slash encodes per component rules
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let segment: string = "docs/ArkTS 文档";
      expect(encodeURIComponent(segment)).assertEqual("docs%2FArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURIComponent(encodeURIComponent(segment))).assertEqual(segment);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0810
     * @tc.name testEncodeUriComponent081
     * @tc.desc Verify form feed and vertical tab encode as %0C/%0B and round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("\f")).assertEqual("%0C");
      expect(encodeURIComponent("\v")).assertEqual("%0B");
      expect(decodeURIComponent(encodeURIComponent("\f\v"))).assertEqual("\f\v");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0820
     * @tc.name testEncodeUriComponent082
     * @tc.desc Verify encodeURIComponent fragment content per API doc (section/Chinese text)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fragment: string = "section/中文";
      expect(encodeURIComponent(fragment)).assertEqual("section%2F%E4%B8%AD%E6%96%87");
      expect(decodeURIComponent(encodeURIComponent(fragment))).assertEqual(fragment);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0830
     * @tc.name testEncodeUriComponent083
     * @tc.desc Verify encodeURIComponent query param value only (API documentation) per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let value: string = "文档";
      expect(encodeURIComponent(value)).assertEqual("%E6%96%87%E6%A1%A3");
      expect(decodeURIComponent(encodeURIComponent(value))).assertEqual(value);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0840
     * @tc.name testEncodeUriComponent084
     * @tc.desc Verify encodeURIComponent boolean true coerced to string per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(true)).assertEqual("true");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0850
     * @tc.name testEncodeUriComponent085
     * @tc.desc Verify encodeURIComponent("") returns empty string and round-trips via decodeURIComponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("")).assertEqual("");
      expect(decodeURIComponent(encodeURIComponent(""))).assertEqual("");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0860
     * @tc.name testEncodeUriComponent086
     * @tc.desc Verify encodeURIComponent encodes = for query pair key=value assembly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pair: string = "q=" + encodeURIComponent("ArkTS 文档");
      expect(pair).assertEqual("q=ArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURIComponent(encodeURIComponent(pair))).assertEqual(pair);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0870
     * @tc.name testEncodeUriComponent087
     * @tc.desc Verify encodeURIComponent(false) coerced to string per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(false)).assertEqual("false");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0880
     * @tc.name testEncodeUriComponent088
     * @tc.desc Verify build full search URI from encodeURIComponent query value per arkts-sta-functions.md
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base: string = "https://example.test/search";
      let query: string = "q=" + encodeURIComponent("ArkTS 文档");
      let full: string = base + "?" + query;
      expect(full).assertEqual("https://example.test/search?q=ArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURI(full)).assertEqual("https://example.test/search?q=ArkTS 文档");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0890
     * @tc.name testEncodeUriComponent089
     * @tc.desc Verify encodeURIComponent(Number MAX_SAFE_INTEGER+1) coerced to decimal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(9007199254740992)).assertEqual("9007199254740992");
      expect(decodeURIComponent(encodeURIComponent(9007199254740992))).assertEqual("9007199254740992");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0900
     * @tc.name testEncodeUriComponent090
     * @tc.desc Verify encodeURIComponent(-9007199254740992) round-trip via decodeURIComponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(-9007199254740992)).assertEqual("-9007199254740992");
      expect(decodeURIComponent(encodeURIComponent(-9007199254740992))).assertEqual("-9007199254740992");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0910
     * @tc.name testEncodeUriComponent091
     * @tc.desc Verify decodeURI(encodeURIComponent) decodes space but keeps encoded slash in path segment
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "docs/ArkTS 文档";
      let encoded: string = encodeURIComponent(input);
      expect(encoded).assertEqual("docs%2FArkTS%20%E6%96%87%E6%A1%A3");
      expect(decodeURI(encoded)).assertEqual("docs%2FArkTS 文档");
      expect(decodeURIComponent(encoded)).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0920
     * @tc.name testEncodeUriComponent092
     * @tc.desc Verify 65535-char ASCII component boundary (static input data); round-trip via decodeURIComponent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(65535);
      expect(decodeURIComponent(encodeURIComponent(longStr))).assertEqual(longStr);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0930
     * @tc.name testEncodeUriComponent093
     * @tc.desc Verify encodeURIComponent(0x123) coerces Number to decimal string 291
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(0x123)).assertEqual("291");
      expect(decodeURIComponent(encodeURIComponent(0x123))).assertEqual("291");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0940
     * @tc.name testEncodeUriComponent094
     * @tc.desc Verify static input date boundaries 0000-00-00, 2099-12-31, 2024-02-29, 2026-13-01; encodeURIComponent round-trip unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dates: string[] = ["0000-00-00", "2099-12-31", "2024-02-29", "2026-13-01"];
      for (let d of dates) {
        expect(encodeURIComponent(d)).assertEqual(d);
        expect(decodeURIComponent(encodeURIComponent(d))).assertEqual(d);
      }
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0950
     * @tc.name testEncodeUriComponent095
     * @tc.desc Verify GBK mojibake string æµè¯ from static input data; encodeURIComponent UTF-8 round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "æµè¯";
      expect(encodeURIComponent(input)).assertEqual("%C3%A6%C2%B5%C3%A8%C2%AF");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0960
     * @tc.name testEncodeUriComponent096
     * @tc.desc Verify mixed-locale English and Chinese test string from static input data round-trips via encodeURIComponent UTF-8 encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "Test 測試";
      expect(encodeURIComponent(input)).assertEqual("Test%20%E6%B8%AC%E8%A9%A6");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0970
     * @tc.name testEncodeUriComponent097
     * @tc.desc Verify device emoji 📱📞 from static input data; encodeURIComponent UTF-8 round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "📱📞";
      expect(encodeURIComponent(input)).assertEqual("%F0%9F%93%B1%F0%9F%93%9E");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0980
     * @tc.name testEncodeUriComponent098
     * @tc.desc Verify business URL https://www.baidu.com from static input data; encodeURIComponent full-string round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "https://www.baidu.com";
      expect(encodeURIComponent(input)).assertEqual("https%3A%2F%2Fwww.baidu.com");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_0990
     * @tc.name testEncodeUriComponent099
     * @tc.desc Verify encodeURIComponent throws URIError when passing incomplete emoji lone high surrogate \uD83D from static input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent("\uD83D");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1000
     * @tc.name testEncodeUriComponent100
     * @tc.desc Verify thai string from static input data; encodeURIComponent UTF-8 round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u0E17\u0E14\u0E2A\u0E2D\u0E1A";
      expect(encodeURIComponent(input)).assertEqual("%E0%B8%97%E0%B8%94%E0%B8%AA%E0%B8%AD%E0%B8%9A");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1010
     * @tc.name testEncodeUriComponent101
     * @tc.desc Verify encodeURIComponent number overload: 0x0A and 0b1010 coerce to 10, -1 to string per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(0x0A)).assertEqual("10");
      expect(encodeURIComponent(0b1010)).assertEqual("10");
      expect(encodeURIComponent(-1)).assertEqual("-1");
      expect(decodeURIComponent(encodeURIComponent(-1))).assertEqual("-1");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1020
     * @tc.name testEncodeUriComponent102
     * @tc.desc Verify encodeURIComponent(13800138000) coerces mobile Number to decimal string per API doc
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent(13800138000)).assertEqual("13800138000");
      expect(decodeURIComponent(encodeURIComponent(13800138000))).assertEqual("13800138000");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1030
     * @tc.name testEncodeUriComponent103
     * @tc.desc Verify encodeURIComponent invalid month date 2026-13-05 from static input data unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("2026-13-05")).assertEqual("2026-13-05");
      expect(decodeURIComponent(encodeURIComponent("2026-13-05"))).assertEqual("2026-13-05");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1040
     * @tc.name testEncodeUriComponent104
     * @tc.desc Verify encodeURIComponent invalid time 25:00:00 from static input data; colon encoded as %3A
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("25:00:00")).assertEqual("25%3A00%3A00");
      expect(decodeURIComponent(encodeURIComponent("25:00:00"))).assertEqual("25:00:00");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1050
     * @tc.name testEncodeUriComponent105
     * @tc.desc Verify encodeURIComponent iSO-8601 datetime string from static input data business format
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "2026-03-05T10:30:00";
      expect(encodeURIComponent(input)).assertEqual("2026-03-05T10%3A30%3A00");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1060
     * @tc.name testEncodeUriComponent106
     * @tc.desc Verify encodeURIComponent nUL code unit U+0000 as %00 on component input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("\u0000")).assertEqual("%00");
      expect(decodeURIComponent(encodeURIComponent("\u0000"))).assertEqual("\u0000");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1070
     * @tc.name testEncodeUriComponent107
     * @tc.desc Verify encodeURIComponent slash-separated date 2026/03/05 encodes each slash as %2F
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "2026/03/05";
      expect(encodeURIComponent(input)).assertEqual("2026%2F03%2F05");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1080
     * @tc.name testEncodeUriComponent108
     * @tc.desc Verify encodeURIComponent invalid day date 2026-02-30 from static inputs remains unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("2026-02-30")).assertEqual("2026-02-30");
      expect(decodeURIComponent(encodeURIComponent("2026-02-30"))).assertEqual("2026-02-30");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1090
     * @tc.name testEncodeUriComponent109
     * @tc.desc Verify encodeURIComponent encodes @ in malformed email-like string test@ as %40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(encodeURIComponent("test@")).assertEqual("test%40");
      expect(decodeURIComponent(encodeURIComponent("test@"))).assertEqual("test@");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1100
     * @tc.name testEncodeUriComponent110
     * @tc.desc Verify encodeURIComponent URIError when passing reversed surrogate pair \uDC00\uD800
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent("\uDC00\uD800");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1110
     * @tc.name testEncodeUriComponent111
     * @tc.desc Verify encodeURIComponent URIError when passing multiple consecutive lone high surrogates
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect((): void => {
        encodeURIComponent("\uD800\uD801\uD802");
      }).assertThrowError('URIError');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_ENCODE_URI_COMPONENT_1120
     * @tc.name testEncodeUriComponent112
     * @tc.desc Verify u+2014 em dash from static input data; encodeURIComponent UTF-8 round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testEncodeUriComponent112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let input: string = "\u2014";
      expect(encodeURIComponent(input)).assertEqual("%E2%80%94");
      expect(decodeURIComponent(encodeURIComponent(input))).assertEqual(input);
    });
  });
}
