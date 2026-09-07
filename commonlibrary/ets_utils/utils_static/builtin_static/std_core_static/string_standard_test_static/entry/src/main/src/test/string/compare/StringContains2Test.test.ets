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

function getStringVal(): String {
  return new String('ArkTS');
}

function containsWrapper(obj: String, sub: String): boolean {
  return obj.contains(sub, 0);
}

export default function StringContains2Test(): void {
  describe('StringContains2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_0100
     * @tc.name testContains001
     * @tc.desc Verify string literal as subject calling contains returns true for existing substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strLiteral = 'ArkTS';
      expect(strLiteral.contains(new String('rk'), 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_0200
     * @tc.name testContains002
     * @tc.desc Verify function returning String calls contains correctly and returns true for existing substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(getStringVal().contains(new String('rk'), 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_0300
     * @tc.name testContains003
     * @tc.desc Verify empty new String("") as subject calling contains returns true for empty and false for non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyObj: String = new String('');
      expect(emptyObj.contains(new String(''), 0)).assertTrue();
      expect(emptyObj.contains(new String('a'), 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_0400
     * @tc.name testContains004
     * @tc.desc Verify contains returns true for individual and multi-char ZWJ emoji family substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const family: String = new String('👨‍👩‍👧‍👦');
      expect(family.contains(new String('👨'), 0)).assertTrue();
      expect(family.contains(new String('👨‍👩'), 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_0500
     * @tc.name testContains005
     * @tc.desc Verify contains returns true for 4-byte supplementary plane Unicode character and multi-char substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ABC𠮷野家DEF');
      expect(text.contains(new String('𠮷'), 0)).assertTrue();
      expect(text.contains(new String('野家'), 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_0600
     * @tc.name testContains006
     * @tc.desc Verify contains returns true for traditional Chinese substring and false for simplified variant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traditional: String = new String('測試繁體中文');
      expect(traditional.contains(new String('繁體'), 0)).assertTrue();
      expect(traditional.contains(new String('繁体'), 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_0700
     * @tc.name testContains007
     * @tc.desc Verify contains returns true for Chinese emoji and English substrings in mixed script
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed: String = new String('Hello世界😀ABC');
      expect(mixed.contains(new String('世界'), 0)).assertTrue();
      expect(mixed.contains(new String('😀'), 0)).assertTrue();
      expect(mixed.contains(new String('Hello'), 0)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_0800
     * @tc.name testContains008
     * @tc.desc Verify contains with non-matching String search parameter returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let result = text.contains(new String('test'), 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_0900
     * @tc.name testContains009
     * @tc.desc Verify contains with valid String parameter returns a boolean result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('12345');
      let result = text.contains(new String('23'), 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_1000
     * @tc.name testContains010
     * @tc.desc Verify contains within generic function with T extends String returns true for existing substring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(containsWrapper(text, new String('rk'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_1100
     * @tc.name testContains011
     * @tc.desc Verify contains and includes return consistent results for the same inputs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(text.contains(new String('rk'), 0)).assertEqual(text.includes('rk'));
      expect(text.contains(new String('xyz'), 0)).assertEqual(text.includes('xyz'));
      expect(text.contains(new String(''), 0)).assertEqual(text.includes(''));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_1200
     * @tc.name testContains012
     * @tc.desc Verify contains is equivalent to indexOf not equal to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let sub = 'rk';
      let ctResult = text.contains(new String(sub), 0);
      let idxResult = text.indexOf(sub) !== -1;
      expect(ctResult).assertEqual(idxResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_1300
     * @tc.name testContains013
     * @tc.desc Verify contains returns false when search substring is longer than the subject string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Ark');
      const longSub: String = new String('ArkTS');
      expect(longSub.length).assertLarger(text.length);
      expect(text.contains(longSub, 0)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTAINS2_1400
     * @tc.name testContains014
     * @tc.desc Verify contains on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContains014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'hello world';
      let result: boolean = str.contains('hello', 0);
      expect(result).assertTrue();
    });
  });
}