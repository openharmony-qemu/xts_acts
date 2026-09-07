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

function makeSup<T extends string>(val: T): string {
  return val.sup();
}

export default function StringSup2Test(): void {
  describe('StringSup2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_0100
     * @tc.name testSup001
     * @tc.desc Verify new String() object calling sup() produces same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objStr: String = new String('superscript');
      let objResult: string = objStr.sup();
      expect(objResult).assertEqual('<sup>superscript</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_0200
     * @tc.name testSup002
     * @tc.desc Verify emoji content preserved after sup() wrapping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mix: string = 'x²🔥';
      let result: string = mix.sup();
      let inner: string = result.substring(5, result.length - 6);
      expect(inner).assertEqual('x²🔥');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_0300
     * @tc.name testSup003
     * @tc.desc Verify String() factory wrapping float 3.14 and undefined before calling sup() produces correct HTML tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1: string = String(3.14).sup();
      expect(r1).assertEqual('<sup>3.14</sup>');
      let r2: string = String(undefined).sup();
      expect(r2).assertEqual('<sup>undefined</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_0400
     * @tc.name testSup004
     * @tc.desc Verify sup().sub() chain forms sub > sup nesting order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'y'.sup().sub();
      expect(result).assertEqual('<sub><sup>y</sup></sub>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_0500
     * @tc.name testSup005
     * @tc.desc Verify generic T extends string can still call sup() correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = makeSup('genericSup');
      expect(result).assertEqual('<sup>genericSup</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_0600
     * @tc.name testSup006
     * @tc.desc Verify sup on empty string produces empty sup tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(''.sup()).assertEqual('<sup></sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_0700
     * @tc.name testSup007
     * @tc.desc Verify sup() correctly wraps Japanese text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'こんにちは'.sup();
      expect(result).assertEqual('<sup>こんにちは</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_0800
     * @tc.name testSup008
     * @tc.desc Verify sup() correctly wraps Cyrillic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'привет'.sup();
      expect(result).assertEqual('<sup>привет</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_0900
     * @tc.name testSup009
     * @tc.desc Verify sup() correctly wraps Arabic text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'اختبار'.sup();
      expect(result).assertEqual('<sup>اختبار</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_1000
     * @tc.name testSup010
     * @tc.desc Verify sup() correctly wraps emoji character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '😀'.sup();
      expect(result).assertEqual('<sup>😀</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_1100
     * @tc.name testSup011
     * @tc.desc Verify sup() correctly wraps zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '\u200B'.sup();
      expect(result).assertEqual('<sup>\u200B</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_1200
     * @tc.name testSup012
     * @tc.desc Verify sup() can be chained with trim() post-operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.sup().trim();
      expect(result).assertEqual('<sup>hello</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_1300
     * @tc.name testSup013
     * @tc.desc Verify three-method chain with sup as middle operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'hello'.trim().sup().concat('!');
      expect(result).assertEqual('<sup>hello</sup>!');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_1400
     * @tc.name testSup014
     * @tc.desc Verify sup() correctly wraps a long repeated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'abc'.repeat(100);
      let result: string = longStr.sup();
      expect(result).assertEqual('<sup>' + longStr + '</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_1500
     * @tc.name testSup015
     * @tc.desc Verify sup() correctly wraps Korean text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '안녕하세요'.sup();
      expect(result).assertEqual('<sup>안녕하세요</sup>');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_SUP2_1600
     * @tc.name testSup016
     * @tc.desc Verify sup() on text containing HTML special characters preserves them unescaped
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testSup016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = 'a<b&c>d"e'.sup();
      expect(result).assertEqual('<sup>a<b&c>d"e</sup>');
    });
  });
}