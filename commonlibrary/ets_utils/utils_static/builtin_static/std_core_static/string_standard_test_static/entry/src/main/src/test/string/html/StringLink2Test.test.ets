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
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

export default function StringLink2Test(): void {
  describe('StringLink2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_0100
     * @tc.name testLink001
     * @tc.desc Verify double-encoded URL is preserved as-is in href attribute
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let doubleEncoded: string = 'https://example.com/%2520test';
      let result: string = 'link'.link(doubleEncoded);
      expect(result).assertEqual('<a href="' + doubleEncoded + '">link</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_0200
     * @tc.name testLink002
     * @tc.desc Verify URL with unescaped Unicode path segments is preserved as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let unicodeUrl: string = 'https://site.com/路径/テスト';
      let result: string = 'nav'.link(unicodeUrl);
      expect(result).assertEqual('<a href="https://site.com/路径/テスト">nav</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_0300
     * @tc.name testLink003
     * @tc.desc Verify URL with both fragment and query string is fully preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixedUrl: string = 'https://a.com/path?q=search&lang=zh#section2';
      let result: string = 'mixed'.link(mixedUrl);
      expect(result).assertEqual('<a href="' + mixedUrl + '">mixed</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_0400
     * @tc.name testLink004
     * @tc.desc Verify bold().link().italics() three-layer nesting with link as middle layer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'site'.bold().link('https://x.com').italics();
      expect(result).assertEqual('<i><a href="https://x.com"><b>site</b></a></i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_0500
     * @tc.name testLink005
     * @tc.desc Verify URL with IPv6 address format preserves square brackets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ipv6Url: string = 'http://[::1]:3000/api';
      let result: string = 'api'.link(ipv6Url);
      expect(result).assertEqual('<a href="http://[::1]:3000/api">api</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_0600
     * @tc.name testLink006
     * @tc.desc Verify link() with javascript protocol URL preserves the href value without sanitization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let jsUrl: string = 'javascript:void(0)';
      let result: string = 'click'.link(jsUrl);
      expect(result).assertEqual('<a href="javascript:void(0)">click</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_0700
     * @tc.name testLink007
     * @tc.desc Verify link on empty string produces empty link tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.link('url')).assertEqual('<a href="url"></a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_0800
     * @tc.name testLink008
     * @tc.desc Verify link() correctly wraps Japanese text with URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'こんにちは'.link('url');
      expect(result).assertEqual('<a href="url">こんにちは</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_0900
     * @tc.name testLink009
     * @tc.desc Verify link() correctly wraps Cyrillic text with URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'привет'.link('url');
      expect(result).assertEqual('<a href="url">привет</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1000
     * @tc.name testLink010
     * @tc.desc Verify link() correctly wraps Arabic text with URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'اختبار'.link('url');
      expect(result).assertEqual('<a href="url">اختبار</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1100
     * @tc.name testLink011
     * @tc.desc Verify link() correctly wraps emoji character with URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '😀'.link('#');
      expect(result).assertEqual('<a href="#">😀</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1200
     * @tc.name testLink012
     * @tc.desc Verify link() correctly wraps zero-width space with URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '\u200B'.link('#');
      expect(result).assertEqual('<a href="#">\u200B</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1300
     * @tc.name testLink013
     * @tc.desc Verify new String() object calling link() produces same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('hello');
      let litResult: string = 'hello'.link('x');
      let objResult: string = objStr.link('x');
      expect(objResult).assertEqual(litResult);
      expect(objResult).assertEqual('<a href="x">hello</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1400
     * @tc.name testLink014
     * @tc.desc Verify link() can be chained with trim() post-operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.link('x').trim();
      expect(result).assertEqual('<a href="x">hello</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1500
     * @tc.name testLink015
     * @tc.desc Verify three-method chain with link as middle operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.trim().link('url').concat('!');
      expect(result).assertEqual('<a href="url">hello</a>!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1600
     * @tc.name testLink016
     * @tc.desc Verify that original string is unchanged after calling link()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let original: string = 'immutable';
      let result: string = original.link('x');
      expect(result).assertEqual('<a href="x">immutable</a>');
      expect(original).assertEqual('immutable');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1700
     * @tc.name testLink017
     * @tc.desc Verify link() correctly wraps a long repeated string with URL
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'abc'.repeat(100);
      let result: string = longStr.link('x');
      expect(result).assertEqual('<a href="x">' + longStr + '</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1800
     * @tc.name testLink018
     * @tc.desc Verify link() does not escape double quotes in href and preserves closing tag structure
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'x'.link('a" onmouseover="alert(1)');
      expect(result).assertEqual('<a href="a" onmouseover="alert(1)">x</a>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LINK2_1900
     * @tc.name testLink019
     * @tc.desc Verify link() does not escape </a> tag-break in content (content-side injection: SDK preserves literal)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLink019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let content: string = 'safe</a>';
      let result: string = content.link('http://example.com');
      expect(result.includes(content)).assertTrue();
      expect(result.endsWith('</a>')).assertTrue();
    });
  });
}