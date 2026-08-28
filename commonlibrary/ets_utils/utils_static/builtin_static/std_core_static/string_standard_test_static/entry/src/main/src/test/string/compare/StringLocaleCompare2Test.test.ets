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

function localeWrapper<T extends string>(obj: String, other: T): int {
  return obj.localeCompare(other);
}

export default function StringLocaleCompare2Test(): void {
  describe('StringLocaleCompare2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_0100
     * @tc.name testLocaleCompare001
     * @tc.desc Verify string literal as subject calling localeCompare returns 0 for identical content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strLiteral = 'ArkTS';
      let result = strLiteral.localeCompare('ArkTS');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_0200
     * @tc.name testLocaleCompare002
     * @tc.desc Verify empty new String("") as subject calling localeCompare returns 0 for empty and negative for non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyObj: String = new String('');
      expect(emptyObj.localeCompare('')).assertEqual(0);
      expect(emptyObj.localeCompare('a')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_0300
     * @tc.name testLocaleCompare003
     * @tc.desc Verify localeCompare returns 0 for identical ZWJ emoji family strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const family: String = new String('👨‍👩‍👧‍👦');
      expect(family.localeCompare('👨‍👩‍👧‍👦')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_0400
     * @tc.name testLocaleCompare004
     * @tc.desc Verify localeCompare returns 0 for identical 4-byte supplementary plane Unicode strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('𠮷野家');
      expect(text.localeCompare('𠮷野家')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_0500
     * @tc.name testLocaleCompare005
     * @tc.desc Verify localeCompare returns zero when strings have identical content (SDK ignores embedded NUL coercion path; ArkTS compareTo semantics)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('Ark\u0000TS');
      let result = text.localeCompare('ArkTS');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_0600
     * @tc.name testLocaleCompare006
     * @tc.desc Verify localeCompare with zh locale returns a number for traditional vs simplified Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traditional: String = new String('繁體中文');
      const simplified: String = new String('繁体中文');
      let result = traditional.localeCompare(simplified, 'zh');
      expect(result).not().assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_0700
     * @tc.name testLocaleCompare007
     * @tc.desc Verify localeCompare returns 0 for identical mixed English Chinese and emoji strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed: String = new String('Hello世界😀');
      expect(mixed.localeCompare('Hello世界😀')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_0800
     * @tc.name testLocaleCompare008
     * @tc.desc Verify localeCompare with valid string parameter returns negative for lexicographically smaller comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let result = text.localeCompare('test');
      expect(result).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_0900
     * @tc.name testLocaleCompare009
     * @tc.desc Verify localeCompare with valid string parameter returns a number result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('123');
      let result = text.localeCompare('123');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1000
     * @tc.name testLocaleCompare010
     * @tc.desc Verify localeCompare within generic function with T extends string returns 0 for equal content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(localeWrapper(text, 'ArkTS')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1100
     * @tc.name testLocaleCompare011
     * @tc.desc Verify localeCompare returns 0 and strict equality check also passes for identical strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let result = text.localeCompare('ArkTS');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1200
     * @tc.name testLocaleCompare012
     * @tc.desc Verify localeCompare with invalid locale string throws RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let threw: boolean = false;
      try {
        text.localeCompare('ArkTS', 'invalid-locale-xyz');
      } catch (e) {
        threw = true;
        expect(e.name).assertEqual('RangeError');
      }
      expect(threw).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1300
     * @tc.name testLocaleCompare013
     * @tc.desc Verify default locale localeCompare sign matches compareTo sign for the same input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('a');
      let lcResult = text.localeCompare('b');
      let cmpResult = text.compareTo(new String('b'));
      expect(lcResult).assertLess(0);
      expect(cmpResult).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1400
     * @tc.name testLocaleCompare014
     * @tc.desc Verify when localeCompare returns 0 equals should also return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(text.localeCompare('ArkTS')).assertEqual(0);
      expect(text.equals('ArkTS')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1500
     * @tc.name testLocaleCompare015
     * @tc.desc Verify localeCompare returns a number when comparing strings of different lengths
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const shortVal: String = new String('Ark');
      const longVal: String = new String('ArkTS');
      expect(shortVal.length).assertLess(longVal.length);
      let result = shortVal.localeCompare(longVal);
      expect(result).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1600
     * @tc.name testLocaleCompare016
     * @tc.desc Verify localeCompare with Turkish locale tr-TR distinguishes dotted İ from dotless I where default locale may treat them equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dottedUpperI: string = 'İ';
      let regularI: string = 'I';
      let resultTR: number = dottedUpperI.localeCompare(regularI, 'tr-TR');
      let resultReverse: number = regularI.localeCompare(dottedUpperI, 'tr-TR');
      expect(resultTR).assertEqual(-resultReverse);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1700
     * @tc.name testLocaleCompare017
     * @tc.desc Verify localeCompare with {numeric:true} uses natural sort: "a10" > "a2"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a10: string = 'a10';
      let a2: string = 'a2';
      let result: number = a2.localeCompare(a10, undefined, { numeric: true } as Intl.CollatorOptions);
      expect(result).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1800
     * @tc.name testLocaleCompare018
     * @tc.desc Verify localeCompare with {sensitivity:"base"} treats "a" and "A" as equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 'a'.localeCompare('A', undefined, { sensitivity: 'base' } as Intl.CollatorOptions);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_1900
     * @tc.name testLocaleCompare019
     * @tc.desc Verify localeCompare on const variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'abc';
      let result: number = str.localeCompare('abc');
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_2000
     * @tc.name testLocaleCompare020
     * @tc.desc Verify localeCompare on String instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('abc');
      let result: number = str.localeCompare('def');
      expect(result).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_2100
     * @tc.name testLocaleCompare021
     * @tc.desc Verify localeCompare via function return
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: number = 'xyz'.localeCompare('abc');
      expect(result).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_2200
     * @tc.name testLocaleCompare022
     * @tc.desc Verify localeCompare returns 0 for equal content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'test';
      expect(str.localeCompare('test')).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_LOCALECOMPARE2_2300
     * @tc.name testLocaleCompare023
     * @tc.desc Verify localeCompare with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testLocaleCompare023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'a';
      let result: number = str.localeCompare('');
      expect(result).assertLarger(0);
    });
  });
}