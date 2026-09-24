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

function italicize<T extends string>(val: T): string {
  return val.italics();
}

export default function StringItalics2Test(): void {
  describe('StringItalics2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_0100
     * @tc.name testItalics001
     * @tc.desc Verify new String() object calling italics() produces same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('italicTest');
      let litResult: string = 'italicTest'.italics();
      let objResult: string = objStr.italics();
      expect(objResult).assertEqual(litResult);
      expect(objResult).assertEqual('<i>italicTest</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_0200
     * @tc.name testItalics002
     * @tc.desc Verify emoji and Chinese content preserved after italics() wrapping and extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let rich: string = '🎨斜体测试🎨';
      let result: string = rich.italics();
      let inner: string = result.substring(3, result.length - 4);
      expect(inner).assertEqual('🎨斜体测试🎨');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_0300
     * @tc.name testItalics003
     * @tc.desc Verify String() factory wrapping float 3.14 and boolean true before calling italics() produces correct HTML tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = String(3.14).italics();
      expect(r1).assertEqual('<i>3.14</i>');
      let r2: string = String(true).italics();
      expect(r2).assertEqual('<i>true</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_0400
     * @tc.name testItalics004
     * @tc.desc Verify three-layer chain italics().strike().bold() nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'nest'.italics().strike().bold();
      expect(result).assertEqual('<b><strike><i>nest</i></strike></b>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_0500
     * @tc.name testItalics005
     * @tc.desc Verify generic T extends string can still call italics() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = italicize('genericItalic');
      expect(result).assertEqual('<i>genericItalic</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_0600
     * @tc.name testItalics006
     * @tc.desc Verify italics on empty string produces empty i tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.italics()).assertEqual('<i></i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_0700
     * @tc.name testItalics007
     * @tc.desc Verify italics correctly wraps Japanese characters in i tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('こんにちは'.italics()).assertEqual('<i>こんにちは</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_0800
     * @tc.name testItalics008
     * @tc.desc Verify italics correctly wraps Cyrillic characters in i tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('привет'.italics()).assertEqual('<i>привет</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_0900
     * @tc.name testItalics009
     * @tc.desc Verify italics correctly wraps Arabic characters in i tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('اختبار'.italics()).assertEqual('<i>اختبار</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_1000
     * @tc.name testItalics010
     * @tc.desc Verify italics correctly wraps single emoji character in i tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('😀'.italics()).assertEqual('<i>😀</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_1100
     * @tc.name testItalics011
     * @tc.desc Verify italics correctly wraps zero-width space in i tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('\u200B'.italics()).assertEqual('<i>\u200B</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_1200
     * @tc.name testItalics012
     * @tc.desc Verify italics can chain with trim method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.italics().trim();
      expect(result).assertEqual('<i>hello</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_1300
     * @tc.name testItalics013
     * @tc.desc Verify italics in a three-method chain with trim and concat
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.trim().italics().concat('!');
      expect(result).assertEqual('<i>hello</i>!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_1400
     * @tc.name testItalics014
     * @tc.desc Verify italics works correctly on a long repeated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'abc'.repeat(100);
      let result: string = longStr.italics();
      expect(result).assertEqual('<i>' + longStr + '</i>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_ITALICS2_1500
     * @tc.name testItalics015
     * @tc.desc Verify italics correctly wraps mixed Latin and CJK text in i tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testItalics015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect('hello测试'.italics()).assertEqual('<i>hello测试</i>');
    });
  });
}