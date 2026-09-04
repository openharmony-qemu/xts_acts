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

export default function StringFontcolor2Test(): void {
  describe('StringFontcolor2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_0100
     * @tc.name testFontcolor001
     * @tc.desc Verify color parameter as CSS keyword currentColor is preserved as-is
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'text'.fontcolor('currentColor');
      expect(result).assertEqual('<font color="currentColor">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_0200
     * @tc.name testFontcolor002
     * @tc.desc Verify color parameter in hsl() format is preserved without validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'text'.fontcolor('hsl(120,100%,50%)');
      expect(result).assertEqual('<font color="hsl(120,100%,50%)">text</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_0300
     * @tc.name testFontcolor003
     * @tc.desc Verify bold().fontcolor() chain wraps bold inside font tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'title'.bold().fontcolor('blue');
      expect(result).assertEqual('<font color="blue"><b>title</b></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_0400
     * @tc.name testFontcolor004
     * @tc.desc Verify color with embedded double quotes still produces closing font tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'x'.fontcolor('a"b');
      expect(result).assertEqual('<font color="a"b">x</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_0500
     * @tc.name testFontcolor005
     * @tc.desc Verify extremely long RGB expression as color parameter is fully preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longColor: string = 'rgb(' + '255,'.repeat(50) + '0)';
      let result: string = 'longRGB'.fontcolor(longColor);
      expect(result).assertEqual('<font color="' + longColor + '">longRGB</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_0600
     * @tc.name testFontcolor006
     * @tc.desc Verify fontcolor with injected double-quote and onmouseover event still produces valid closing tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let color: string = 'red" onmouseover="alert(1)';
      let result: string = 'safe'.fontcolor(color);
      expect(result).assertEqual('<font color="red" onmouseover="alert(1)">safe</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_0700
     * @tc.name testFontcolor007
     * @tc.desc Verify fontcolor with injected quote then bold chain preserves both closing tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let color: string = 'red" onload="alert(1)';
      let result: string = 'x'.fontcolor(color).bold();
      expect(result).assertEqual('<b><font color="red" onload="alert(1)">x</font></b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_0800
     * @tc.name testFontcolor008
     * @tc.desc Verify fontcolor on empty string produces empty font tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.fontcolor('red')).assertEqual('<font color="red"></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_0900
     * @tc.name testFontcolor009
     * @tc.desc Verify String instance fontcolor returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('test');
      let result: string = str.fontcolor('green');
      expect(result).assertEqual('<font color="green">test</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_1000
     * @tc.name testFontcolor010
     * @tc.desc Verify fontcolor on literal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'func'.fontcolor('#FF0000');
      expect(result).assertEqual('<font color="#FF0000">func</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_1100
     * @tc.name testFontcolor011
     * @tc.desc Verify fontcolor post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trim().fontcolor('red');
      expect(result).assertEqual('<font color="red">hello</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_1200
     * @tc.name testFontcolor012
     * @tc.desc Verify fontcolor on emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀';
      let result: string = str.fontcolor('red');
      expect(result).assertEqual('<font color="red">😀</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_1300
     * @tc.name testFontcolor013
     * @tc.desc Verify fontcolor result type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'x';
      let result: string = str.fontcolor('red');
      expect(result).assertEqual('<font color="red">x</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTCOLOR2_1400
     * @tc.name testFontcolor014
     * @tc.desc Verify fontcolor on CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontcolor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let c: string = 'red';
      let result: string = '中文'.fontcolor(c);
      expect(result).assertEqual('<font color="red">中文</font>');
    });
  });
}