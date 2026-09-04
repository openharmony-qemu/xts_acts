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

function calcSize(a: int, b: int): int {
  return a + b;
}

export default function StringFontsize2Test(): void {
  describe('StringFontsize2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_0100
     * @tc.name testFontsize001
     * @tc.desc Verify fontsize with expression result as size parameter evaluates correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'computed'.fontsize(calcSize(1, 2).toString());
      expect(result).assertEqual('<font size="3">computed</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_0200
     * @tc.name testFontsize002
     * @tc.desc Verify trimmed string number as size parameter used correctly after trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sizeStr: string = '  5  '.trim();
      let result: string = 'trimmed'.fontsize(sizeStr);
      expect(result).assertEqual('<font size="5">trimmed</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_0300
     * @tc.name testFontsize003
     * @tc.desc Verify fontsize().fontcolor() chain wraps inner size with outer color
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'styled'.fontsize(4).fontcolor('green');
      expect(result).assertEqual('<font color="green"><font size="4">styled</font></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_0400
     * @tc.name testFontsize004
     * @tc.desc Verify Number.EPSILON as size parameter produces correctly structured font tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'tiny'.fontsize(Number.EPSILON.toString());
      expect(result.startsWith('<font size="')).assertTrue();
      expect(result.endsWith('">tiny</font>')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_0500
     * @tc.name testFontsize005
     * @tc.desc Verify fontsize(99) then italics then strike three-layer HTML nesting with out-of-range size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '!'.fontsize(99).italics().strike();
      expect(result).assertEqual('<strike><i><font size="99">!</font></i></strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_0600
     * @tc.name testFontsize006
     * @tc.desc Verify fontsize with negative float "-1.5" as string embeds raw value without range validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'x'.fontsize('-1.5');
      expect(result).assertEqual('<font size="-1.5">x</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_0700
     * @tc.name testFontsize007
     * @tc.desc Verify fontsize on empty string produces empty font tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.fontsize(3)).assertEqual('<font size="3"></font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_0800
     * @tc.name testFontsize008
     * @tc.desc Verify String instance fontsize returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('test');
      let result: string = str.fontsize(3);
      expect(result).assertEqual('<font size="3">test</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_0900
     * @tc.name testFontsize009
     * @tc.desc Verify fontsize post-chain with trim
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trim().fontsize(4);
      expect(result).assertEqual('<font size="4">hello</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_1000
     * @tc.name testFontsize010
     * @tc.desc Verify fontsize on emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '😀';
      let result: string = str.fontsize(5);
      expect(result).assertEqual('<font size="5">😀</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_1100
     * @tc.name testFontsize011
     * @tc.desc Verify fontsize result type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'x';
      let result: string = str.fontsize(3);
      expect(result).assertEqual('<font size="3">x</font>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_FONTSIZE2_1200
     * @tc.name testFontsize012
     * @tc.desc Verify fontsize on CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testFontsize012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '中文'.fontsize(5);
      expect(result).assertEqual('<font size="5">中文</font>');
    });
  });
}