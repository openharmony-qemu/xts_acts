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

function addStrike<T extends string>(val: T): string {
  return val.strike();
}

export default function StringStrike2Test(): void {
  describe('StringStrike2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_0100
     * @tc.name testStrike001
     * @tc.desc Verify new String() object calling strike() produces same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('deleteMe');
      let objResult: string = objStr.strike();
      expect(objResult).assertEqual('<strike>deleteMe</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_0200
     * @tc.name testStrike002
     * @tc.desc Verify emoji and Chinese content preserved after strike() wrapping and extraction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let emojiText: string = '❌删除线❌';
      let result: string = emojiText.strike();
      let inner: string = result.substring(8, result.length - 9);
      expect(inner).assertEqual('❌删除线❌');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_0300
     * @tc.name testStrike003
     * @tc.desc Verify three-layer chain strike().sub().sup() nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'triple'.strike().sub().sup();
      expect(result).assertEqual('<sup><sub><strike>triple</strike></sub></sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_0400
     * @tc.name testStrike004
     * @tc.desc Verify generic T extends string can still call strike() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = addStrike('genericStrike');
      expect(result).assertEqual('<strike>genericStrike</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_0500
     * @tc.name testStrike005
     * @tc.desc Verify strike on empty string produces empty strike tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.strike()).assertEqual('<strike></strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_0600
     * @tc.name testStrike006
     * @tc.desc Verify strike() correctly wraps Japanese text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'こんにちは'.strike();
      expect(result).assertEqual('<strike>こんにちは</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_0700
     * @tc.name testStrike007
     * @tc.desc Verify strike() correctly wraps Cyrillic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'привет'.strike();
      expect(result).assertEqual('<strike>привет</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_0800
     * @tc.name testStrike008
     * @tc.desc Verify strike() correctly wraps Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'اختبار'.strike();
      expect(result).assertEqual('<strike>اختبار</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_0900
     * @tc.name testStrike009
     * @tc.desc Verify strike() correctly wraps emoji character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '😀'.strike();
      expect(result).assertEqual('<strike>😀</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_1000
     * @tc.name testStrike010
     * @tc.desc Verify strike() correctly wraps zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '\u200B'.strike();
      expect(result).assertEqual('<strike>\u200B</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_1100
     * @tc.name testStrike011
     * @tc.desc Verify strike() can be chained with trim() post-operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.strike().trim();
      expect(result).assertEqual('<strike>hello</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_1200
     * @tc.name testStrike012
     * @tc.desc Verify three-method chain with strike as middle operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.trim().strike().concat('!');
      expect(result).assertEqual('<strike>hello</strike>!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_1300
     * @tc.name testStrike013
     * @tc.desc Verify strike() correctly wraps a long repeated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'abc'.repeat(100);
      let result: string = longStr.strike();
      expect(result).assertEqual('<strike>' + longStr + '</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_1400
     * @tc.name testStrike014
     * @tc.desc Verify strike() correctly wraps Korean text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '안녕하세요'.strike();
      expect(result).assertEqual('<strike>안녕하세요</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_1500
     * @tc.name testStrike015
     * @tc.desc Verify String() factory wrapping integer 0 before calling strike() produces correct HTML tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = String(0).strike();
      expect(r1).assertEqual('<strike>0</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_1600
     * @tc.name testStrike016
     * @tc.desc Verify String() factory wrapping null before calling strike() produces correct HTML tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = String(null).strike();
      expect(r1).assertEqual('<strike>null</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_1700
     * @tc.name testStrike017
     * @tc.desc Verify String() factory wrapping undefined before calling strike() produces correct HTML tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = String(undefined).strike();
      expect(r1).assertEqual('<strike>undefined</strike>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRIKE2_1800
     * @tc.name testStrike018
     * @tc.desc Verify strike() on text containing HTML special characters preserves them unescaped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStrike018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a<b&c>d"e'.strike();
      expect(result).assertEqual('<strike>a<b&c>d"e</strike>');
    });
  });
}