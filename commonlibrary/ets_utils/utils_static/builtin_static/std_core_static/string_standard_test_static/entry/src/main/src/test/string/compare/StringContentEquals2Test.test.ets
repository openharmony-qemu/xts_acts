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

function ceWrapper(obj: String, other: StringBuilder): boolean {
  return obj.contentEquals(other);
}

export default function StringContentEquals2Test(): void {
  describe('StringContentEquals2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_0100
     * @tc.name testContentEquals001
     * @tc.desc Verify string literal as subject calling contentEquals with matching StringBuilder content returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strLiteral = 'ArkTS';
      expect(strLiteral.contentEquals(new StringBuilder('ArkTS'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_0200
     * @tc.name testContentEquals002
     * @tc.desc Verify empty new String("") as subject calling contentEquals returns true for empty and false for non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyObj: String = new String('');
      expect(emptyObj.contentEquals(new StringBuilder(''))).assertTrue();
      expect(emptyObj.contentEquals(new StringBuilder('a'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_0300
     * @tc.name testContentEquals003
     * @tc.desc Verify contentEquals returns true for identical ZWJ emoji family strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const family: String = new String('👨‍👩‍👧‍👦');
      expect(family.contentEquals(new StringBuilder('👨‍👩‍👧‍👦'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_0400
     * @tc.name testContentEquals004
     * @tc.desc Verify contentEquals returns true for identical 4-byte supplementary plane Unicode strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('𠮷野家');
      expect(text.contentEquals(new StringBuilder('𠮷野家'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_0500
     * @tc.name testContentEquals005
     * @tc.desc Verify contentEquals returns true for identical content between separate String objects
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const ctrl: String = new String('ArkTS');
      expect(text.contentEquals(new StringBuilder(ctrl.toString()))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_0600
     * @tc.name testContentEquals006
     * @tc.desc Verify contentEquals returns true for traditional Chinese and false for simplified Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traditional: String = new String('繁體中文');
      expect(traditional.contentEquals(new StringBuilder('繁體中文'))).assertTrue();
      expect(traditional.contentEquals(new StringBuilder('繁体中文'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_0700
     * @tc.name testContentEquals007
     * @tc.desc Verify contentEquals returns true for identical mixed English Chinese and emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed: String = new String('Hello世界😀');
      expect(mixed.contentEquals(new StringBuilder('Hello世界😀'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_0800
     * @tc.name testContentEquals008
     * @tc.desc Verify contentEquals with StringBuilder parameter returns false for different content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let result = text.contentEquals(new StringBuilder('test'));
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_0900
     * @tc.name testContentEquals009
     * @tc.desc Verify contentEquals wrapper function returns true for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(ceWrapper(text, new StringBuilder('ArkTS'))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1000
     * @tc.name testContentEquals010
     * @tc.desc Verify contentEquals with StringBuilder and equals with String return consistent results for equivalent content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const other: String = new String('ArkTS');
      expect(text.contentEquals(new StringBuilder(other.toString()))).assertEqual(text.equals(other));
      expect(text.contentEquals(new StringBuilder('TypeScript'))).assertEqual(text.equals(new String('TypeScript')));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1100
     * @tc.name testContentEquals011
     * @tc.desc Verify contentEquals and equals both compare content correctly for new String objects with identical values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const obj1: String = new String('ArkTS');
      const obj2: String = new String('ArkTS');
      expect(obj1.toString()).assertEqual(obj2.toString());
      expect(obj1.contentEquals(new StringBuilder(obj2.toString()))).assertTrue();
      expect(obj1.equals(obj2)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1200
     * @tc.name testContentEquals012
     * @tc.desc Verify contentEquals with StringBuilder returns false when content has different lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      const shorter: String = new String('Ark');
      expect(text.length).not().assertEqual(shorter.length);
      expect(text.contentEquals(new StringBuilder(shorter.toString()))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1300
     * @tc.name testContentEquals013
     * @tc.desc Verify contentEquals with const StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const sb: StringBuilder = new StringBuilder('ArkTS');
      let s: String = new String('ArkTS');
      expect(s.contentEquals(sb)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1400
     * @tc.name testContentEquals014
     * @tc.desc Verify contentEquals returns true for matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('test');
      let sb: StringBuilder = new StringBuilder('test');
      expect(s.contentEquals(sb)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1500
     * @tc.name testContentEquals015
     * @tc.desc Verify contentEquals on long matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = 'A'.repeat(10000);
      let s: String = new String(longStr);
      let sb: StringBuilder = new StringBuilder(longStr);
      expect(s.contentEquals(sb)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1600
     * @tc.name testContentEquals016
     * @tc.desc Verify contentEquals on long non-matching content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('A'.repeat(10000));
      let sb: StringBuilder = new StringBuilder('B'.repeat(10000));
      expect(s.contentEquals(sb)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1700
     * @tc.name testContentEquals017
     * @tc.desc Verify contentEquals on precomposed vs decomposed e returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pre: String = new String('\u00E9');
      let sb: StringBuilder = new StringBuilder('e\u0301');
      expect(pre.contentEquals(sb)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1800
     * @tc.name testContentEquals018
     * @tc.desc Verify contentEquals with NUL StringBuilder content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a\0b');
      let sb: StringBuilder = new StringBuilder('a\0b');
      expect(s.contentEquals(sb)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_1900
     * @tc.name testContentEquals019
     * @tc.desc Verify contentEquals does not mutate original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('immutable');
      let sb: StringBuilder = new StringBuilder('immutable');
      s.contentEquals(sb);
      expect(s.toString()).assertEqual('immutable');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_2000
     * @tc.name testContentEquals020
     * @tc.desc Verify contentEquals with trim chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('  test  ');
      let sb: StringBuilder = new StringBuilder('test');
      expect(s.trim().contentEquals(sb)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_2100
     * @tc.name testContentEquals021
     * @tc.desc Verify contentEquals on concatenation expression
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sb: StringBuilder = new StringBuilder('AB');
      let result: boolean = new String('A' + 'B').contentEquals(sb);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_2200
     * @tc.name testContentEquals022
     * @tc.desc Verify contentEquals with different StringBuilder content returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('hello');
      let sb: StringBuilder = new StringBuilder('world');
      expect(s.contentEquals(sb)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_CONTENTEQUALS2_2300
     * @tc.name testContentEquals023
     * @tc.desc Verify contentEquals on empty StringBuilder
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testContentEquals023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('');
      let sb: StringBuilder = new StringBuilder('');
      expect(s.contentEquals(sb)).assertTrue();
    });
  });
}