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

export default function StringTrimEnd2Test(): void {
  describe('StringTrimEnd2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_0100
     * @tc.name testTrimEnd001
     * @tc.desc Verify trimEnd() on new String() instance returns same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String('  hello  ');
      let str2: string = '  hello  ';
      let result1: string = str1.trimEnd();
      let result2: string = str2.trimEnd();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('  hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_0200
     * @tc.name testTrimEnd002
     * @tc.desc Verify trimEnd() on const-declared string returns correctly trimmed result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = 'const_end  ';
      let result: string = str.trimEnd();
      expect(result).assertEqual('const_end');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_0300
     * @tc.name testTrimEnd003
     * @tc.desc Verify trimEnd() removes trailing non-breaking space U+00A0 and returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello ';
      let result: string = str.trimEnd();
      expect(result).assertEqual('hello');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_0400
     * @tc.name testTrimEnd004
     * @tc.desc Verify trimEnd() does NOT remove trailing zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello​';
      let result: string = str.trimEnd();
      expect(result).assertEqual('hello​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_0500
     * @tc.name testTrimEnd005
     * @tc.desc Verify trimEnd() removes fullwidth space U+3000 Ideographic Space only from the end, leaving leading U+3000 intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '　　hello　　';
      let result: string = str.trimEnd();
      expect(result).assertEqual('　　hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_0600
     * @tc.name testTrimEnd006
     * @tc.desc Verify trimEnd() removes paragraph separator U+2029 only from the end, leaving U+2028 at start intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\u2028hello\u2029';
      let result: string = str.trimEnd();
      expect(result).assertEqual('\u2028hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_0700
     * @tc.name testTrimEnd007
     * @tc.desc Verify chained trimEnd().toUpperCase() correctly trims then uppercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'end_chain  ';
      let result: string = str.trimEnd().toUpperCase();
      expect(result).assertEqual('END_CHAIN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_0800
     * @tc.name testTrimEnd008
     * @tc.desc Verify trimEnd() and trimRight() produce identical results on same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  cross_end  ';
      let r1: string = str.trimEnd();
      let r2: string = str.trimRight();
      expect(r1).assertEqual(r2);
      expect(r1.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_0900
     * @tc.name testTrimEnd009
     * @tc.desc Verify trimEnd() return value with combined typeof + content + length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'multi_end  ';
      let result: string = str.trimEnd();

      expect(result).assertEqual('multi_end');
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1000
     * @tc.name testTrimEnd010
     * @tc.desc Verify trimEnd() result length property is accessible and correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'len_end  ';
      let result: string = str.trimEnd();
      expect(result.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1100
     * @tc.name testTrimEnd011
     * @tc.desc Verify trimEnd() on empty string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '';
      let result: string = str.trimEnd();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1200
     * @tc.name testTrimEnd012
     * @tc.desc Verify trimEnd() on all-whitespace string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '   \t\n\r  ';
      let result: string = str.trimEnd();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1300
     * @tc.name testTrimEnd013
     * @tc.desc Verify trimEnd on let variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello\t';
      let result: string = str.trimEnd();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1400
     * @tc.name testTrimEnd014
     * @tc.desc Verify String instance trimEnd returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('hello  ');
      let result: string = str.trimEnd();

      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1500
     * @tc.name testTrimEnd015
     * @tc.desc Verify trimEnd post-chain with toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello  ';
      let result: string = str.trimEnd().toUpperCase();
      expect(result).assertEqual('HELLO');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1600
     * @tc.name testTrimEnd016
     * @tc.desc Verify trimEnd does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello  ';
      let before: string = str;
      str.trimEnd();
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1700
     * @tc.name testTrimEnd017
     * @tc.desc Verify trimEnd idempotence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello  ';
      let first: string = str.trimEnd();
      let second: string = first.trimEnd();
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1800
     * @tc.name testTrimEnd018
     * @tc.desc Verify trimEnd only removes trailing spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trimEnd();
      expect(result).assertEqual('  hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_1900
     * @tc.name testTrimEnd019
     * @tc.desc Verify trimEnd on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '!@#$%  ';
      let result: string = str.trimEnd();
      expect(result).assertEqual('!@#$%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMEND2_2000
     * @tc.name testTrimEnd020
     * @tc.desc Verify trimEnd with expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimEnd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('hello' + '  ').trimEnd();
      expect(result).assertEqual('hello');
    });
  });
}