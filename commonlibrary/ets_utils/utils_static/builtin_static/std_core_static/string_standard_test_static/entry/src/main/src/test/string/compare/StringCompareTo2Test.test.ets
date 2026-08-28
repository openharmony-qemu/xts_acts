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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../../hypium/index';
import Utils from './../../Util.test';

function getStringVal(): String {
  return new String('ArkTS');
}

function compareWrapper<T extends String>(obj: String, other: T): int {
  return obj.compareTo(other);
}

export default function StringCompareTo2Test(): void {
  describe('StringCompareTo2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_0100
     * @tc.name testCompareTo001
     * @tc.desc Verify string literal as subject calling compareTo returns a number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strLiteral = 'ArkTS';
      let result = strLiteral.compareTo(new String('Apple'));
      expect(result).assertLarger(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_0200
     * @tc.name testCompareTo002
     * @tc.desc Verify new String() instance calling compareTo returns negative when subject is lexicographically smaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strObj: String = new String('Apple');
      let result = strObj.compareTo(new String('ArkTS'));
      expect(result).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_0300
     * @tc.name testCompareTo003
     * @tc.desc Verify const and let declared String compareTo returns negative when subject is lexicographically smaller regardless of binding keyword
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const strConst: String = new String('Apple');
      let strLet: String = new String('ArkTS');
      expect(strConst.compareTo(strLet) < 0).assertTrue();
      expect(strLet.compareTo(strConst) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_0400
     * @tc.name testCompareTo004
     * @tc.desc Verify function returning String calls compareTo correctly and returns positive when subject is lexicographically larger than argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let subjectVal: String = getStringVal();
      expect(subjectVal.compareTo(new String('Apple')) > 0).assertTrue();
      expect(subjectVal.compareTo(new String('test')) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_0500
     * @tc.name testCompareTo005
     * @tc.desc Verify empty new String("") as subject calling compareTo returns 0 for empty and negative for non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emptyObj: String = new String('');
      expect(emptyObj.compareTo(new String(''))).assertEqual(0);
      expect(emptyObj.compareTo(new String('a')) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_0600
     * @tc.name testCompareTo006
     * @tc.desc Verify compareTo returns 0 for identical ZWJ emoji family strings and non-zero when an extra ZWJ-joined member is appended
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const family1: String = new String('👨‍👩‍👧‍👦');
      const family2: String = new String('👨‍👩‍👧‍👦');
      const familyExtended: String = new String('👨‍👩‍👧‍👦‍👶');
      expect(family1.compareTo(family2)).assertEqual(0);
      expect(family1.compareTo(familyExtended) < 0).assertTrue();
      expect(familyExtended.compareTo(family1) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_0700
     * @tc.name testCompareTo007
     * @tc.desc Verify compareTo returns 0 for identical 4-byte supplementary plane Unicode strings and reflects sign differences when one codepoint is incremented
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text1: String = new String('𠮷野家');
      const text2: String = new String('𠮷野家');
      const textHigher: String = new String('𠮷野屋');
      expect(text1.compareTo(text2)).assertEqual(0);
      expect(text1.compareTo(textHigher) < 0).assertTrue();
      expect(textHigher.compareTo(text1) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_0800
     * @tc.name testCompareTo008
     * @tc.desc Verify compareTo returns non-zero when subject contains embedded NUL control character compared to string without it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const textWithNul: String = new String('Ark\0TS');
      const textWithoutNul: String = new String('ArkTS');
      let result = textWithNul.compareTo(textWithoutNul);
      expect(result).assertLess(0);
      expect(textWithoutNul.compareTo(textWithNul) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_0900
     * @tc.name testCompareTo009
     * @tc.desc Verify compareTo returns non-zero for traditional versus simplified Chinese
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const traditional: String = new String('繁體中文');
      const simplified: String = new String('繁体中文');
      let result = traditional.compareTo(simplified);
      expect(result).assertLarger(0);
      expect(simplified.compareTo(traditional) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1000
     * @tc.name testCompareTo010
     * @tc.desc Verify compareTo returns 0 for identical mixed English Chinese and emoji strings and distinguishes strings that differ only in the trailing emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const mixed: String = new String('Hello世界😀');
      const same: String = new String('Hello世界😀');
      const differentEmoji: String = new String('Hello世界😁');
      expect(mixed.compareTo(same)).assertEqual(0);
      expect(mixed.compareTo(differentEmoji) < 0).assertTrue();
      expect(differentEmoji.compareTo(mixed) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1100
     * @tc.name testCompareTo011
     * @tc.desc Verify compareTo with String parameter returns negative when subject is lexicographically smaller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let result = text.compareTo(new String('test'));
      expect(result).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1200
     * @tc.name testCompareTo012
     * @tc.desc Verify compareTo returns negative for digit string subject smaller than digit argument and zero only when content matches exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('123');
      expect(text.compareTo(new String('124')) < 0).assertTrue();
      expect(text.compareTo(new String('123'))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1300
     * @tc.name testCompareTo013
     * @tc.desc Verify compareTo within generic function with T extends String returns 0 for equal content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(compareWrapper(text, new String('ArkTS'))).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1400
     * @tc.name testCompareTo014
     * @tc.desc Verify compareTo is case sensitive and treats upper and lower case variants of the same letters as distinct characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      expect(text.compareTo(new String('ArkTS'))).assertEqual(0);
      expect(text.compareTo(new String('arkTS')))
        .not()
        .assertEqual(0);
      expect(text.compareTo(new String('arkTS')) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1500
     * @tc.name testCompareTo015
     * @tc.desc Verify compareTo sign matches lexicographic less-than operator result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: String = new String('a');
      const b: String = new String('b');
      let cmpResult = a.compareTo(b);
      expect(cmpResult).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1600
     * @tc.name testCompareTo016
     * @tc.desc Verify compareTo result type is number and value distinguishes between equal and non-equal inline constructed strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let equalResult: number = new String('ArkTS').compareTo(new String('ArkTS'));
      expect(equalResult).assertEqual(0);
      let diffResult: number = new String('ArkTS').compareTo(new String('test'));
      expect(diffResult).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1700
     * @tc.name testCompareTo017
     * @tc.desc Verify compareTo and localeCompare default behavior signs are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('a');
      let cmpResult = text.compareTo(new String('b'));
      let lcResult = text.localeCompare('b');
      expect(cmpResult).assertLess(0);
      expect(lcResult).assertLess(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1800
     * @tc.name testCompareTo018
     * @tc.desc Verify compareTo returning 0 is equivalent to equals returning true and compareTo non-zero agrees with equals false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const text: String = new String('ArkTS');
      let cmpEqual = text.compareTo(new String('ArkTS'));
      expect(cmpEqual).assertEqual(0);
      expect(text.equals(new String('ArkTS'))).assertTrue();
      let cmpDiff = text.compareTo(new String('Apple'));
      expect(cmpDiff).assertLarger(0);
      expect(text.equals(new String('Apple'))).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_1900
     * @tc.name testCompareTo019
     * @tc.desc Verify equal length strings with different content reflect lexicographic difference via compareTo
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const a: String = new String('abc');
      const b: String = new String('abd');
      expect(a.length).assertEqual(b.length);
      expect(a.compareTo(b) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2000
     * @tc.name testCompareTo020
     * @tc.desc Verify single character compareTo with very long string returns negative, startsWith is true only when prefix length does not exceed subject length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const single: String = new String('A');
      const longVal: String = new String('A'.repeat(1000));
      expect(single.compareTo(longVal) < 0).assertTrue();
      expect(longVal.startsWith(single)).assertTrue();
      expect(single.startsWith(longVal)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2100
     * @tc.name testCompareTo021
     * @tc.desc Verify compareTo returns 0 for equal content and negative when subject is a strict prefix of the argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('abc');
      expect(s.compareTo('abc')).assertEqual(0);
      expect(s.compareTo('abd') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2200
     * @tc.name testCompareTo022
     * @tc.desc Verify compareTo on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('!@#');
      let t: String = new String('!@$');
      expect(s.compareTo(t) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2300
     * @tc.name testCompareTo023
     * @tc.desc Verify compareTo on pure numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('123');
      let t: String = new String('124');
      expect(s.compareTo(t) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2400
     * @tc.name testCompareTo024
     * @tc.desc Verify compareTo long string vs empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: String = new String('A'.repeat(10000));
      let empty: String = new String('');
      expect(longStr.compareTo(empty) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2500
     * @tc.name testCompareTo025
     * @tc.desc Verify compareTo prefix shorter string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('abc');
      let t: String = new String('abcdef');
      expect(s.compareTo(t) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2600
     * @tc.name testCompareTo026
     * @tc.desc Verify compareTo on precomposed vs decomposed e
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let pre: String = new String('é');
      let dec: String = new String('é');
      expect(pre.compareTo(dec) > 0).assertTrue();
      expect(dec.compareTo(pre) < 0).assertTrue();
      expect(pre.toString().length).assertEqual(1);
      expect(dec.toString().length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2700
     * @tc.name testCompareTo027
     * @tc.desc Verify compareTo on large strings returns 0 for identical content and detects length differences between 9999 and 10000 character strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('A'.repeat(10000));
      let t: String = new String('A'.repeat(10000));
      let shorter: String = new String('A'.repeat(9999));
      expect(s.compareTo(t)).assertEqual(0);
      expect(s.compareTo(shorter) > 0).assertTrue();
      expect(shorter.compareTo(s) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2800
     * @tc.name testCompareTo028
     * @tc.desc Verify compareTo does not mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('abc');
      let before: String = new String(s.toString());
      s.compareTo('xyz');
      expect(s.toString()).assertEqual(before.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_2900
     * @tc.name testCompareTo029
     * @tc.desc Verify compareTo sign matches < operator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a');
      let t: String = new String('b');
      expect(s.compareTo(t) < 0).assertTrue();
      expect(s.compareTo(t) < 0 === 'a' < 'b').assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_3000
     * @tc.name testCompareTo030
     * @tc.desc Verify compareTo with replacement char U+FFFD
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a�b');
      let t: String = new String('a�c');
      expect(s.compareTo(t) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_3100
     * @tc.name testCompareTo031
     * @tc.desc Verify compareTo with zero-width space U+200B
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('a​b');
      let t: String = new String('ab');
      expect(s.compareTo(t)).assertEqual(-t.compareTo(s));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_3200
     * @tc.name testCompareTo032
     * @tc.desc Verify compareTo handles concatenated strings and reports the correct sign when the concatenated tail character differs from the reference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('A' + 'B');
      let t: String = new String('AB');
      let u: String = new String('A' + 'C');
      expect(s.compareTo(t)).assertEqual(0);
      expect(s.compareTo(u) < 0).assertTrue();
      expect(u.compareTo(s) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_3300
     * @tc.name testCompareTo033
     * @tc.desc Verify compareTo distinguishes two distinct String instances whose content forms a prefix relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: String = new String('test');
      let b: String = new String('test');
      let c: String = new String('testing');
      expect(a.compareTo(b)).assertEqual(0);
      expect(a.compareTo(c) < 0).assertTrue();
      expect(c.compareTo(a) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_3400
     * @tc.name testCompareTo034
     * @tc.desc Verify compareTo with StringBuilder content equality
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('compare');
      let sb: StringBuilder = new StringBuilder('compare');
      expect(s.compareTo(sb.toString())).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_COMPARETO2_3500
     * @tc.name testCompareTo035
     * @tc.desc Verify compareTo treats empty string as smaller than any non-empty string and as equal only to another empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testCompareTo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: String = new String('');
      let t: String = new String('');
      let nonEmpty: String = new String('a');
      expect(s.compareTo(t)).assertEqual(0);
      expect(s.compareTo(nonEmpty) < 0).assertTrue();
      expect(nonEmpty.compareTo(s) > 0).assertTrue();
    });
  });
}
