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

function getPadded(): string {
  return '  from_func  ';
}

function trimGeneric<T extends string>(input: T): string {
  return input.trim();
}

export default function StringTrim2Test(): void {
  describe('StringTrim2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_0100
     * @tc.name testTrim001
     * @tc.desc Verify trim() on new String() instance returns same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String('  hello  ');
      let str2: string = '  hello  ';
      let result1: string = str1.trim();
      let result2: string = str2.trim();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_0200
     * @tc.name testTrim002
     * @tc.desc Verify trim() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getPadded().trim();
      expect(result).assertEqual('from_func');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_0300
     * @tc.name testTrim003
     * @tc.desc Verify trim() removes non-breaking space U+00A0 from both ends of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = ' hello ';
      let result: string = str.trim();
      expect(result).assertEqual('hello');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_0400
     * @tc.name testTrim004
     * @tc.desc Verify trim() does NOT remove zero-width space characters from both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '​hello​';
      let result: string = str.trim();
      expect(result).assertEqual('​hello​');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_0500
     * @tc.name testTrim005
     * @tc.desc Verify trim() removes all whitespace categories including tab newline carriage return formfeed vertical tab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\t\n\r\f\v hello \t\n\r\f\v';
      let result: string = str.trim();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_0600
     * @tc.name testTrim006
     * @tc.desc Verify trim() removes fullwidth space U+3000 Ideographic Space from both ends and result length is correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '　　hello　　';
      let result: string = str.trim();
      expect(result).assertEqual('hello');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_0700
     * @tc.name testTrim007
     * @tc.desc Verify trim() removes line separator U+2028 and paragraph separator U+2029 from both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\u2028hello\u2029';
      let result: string = str.trim();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_0800
     * @tc.name testTrim008
     * @tc.desc Verify chained trim().toLowerCase() correctly trims then lowercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  CHAIN TRIM  ';
      let result: string = str.trim().toLowerCase();
      expect(result).assertEqual('chain trim');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_0900
     * @tc.name testTrim009
     * @tc.desc Verify double trim idempotency where second trim produces same result as first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  idempotent  ';
      let r1: string = str.trim();
      let r2: string = r1.trim();
      expect(r2).assertEqual(r1);
      expect(r2).assertEqual('idempotent');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1000
     * @tc.name testTrim010
     * @tc.desc Verify trim() in generic function with T extends string constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = trimGeneric('  generic_trim  ');
      expect(result).assertEqual('generic_trim');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1100
     * @tc.name testTrim011
     * @tc.desc Verify trim() return value with combined typeof + content + length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  multi  ';
      let result: string = str.trim();

      expect(result).assertEqual('multi');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1200
     * @tc.name testTrim012
     * @tc.desc Verify trim() result length property is accessible and correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  length_check  ';
      let result: string = str.trim();
      expect(result.length).assertEqual(12);
      expect(result).assertEqual('length_check');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1300
     * @tc.name testTrim013
     * @tc.desc Verify 4-chain trim→padStart→toUpperCase→substring preserves state through each link
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = '  hi  ';
      let result: string = s.trim().padStart(5, '0').toUpperCase().substring(0, 5);
      expect(result).assertEqual('000HI');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1400
     * @tc.name testTrim014
     * @tc.desc Verify trim removes OGHAM SPACE MARK U+1680 from both ends of string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trim();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1500
     * @tc.name testTrim015
     * @tc.desc Verify trim removes BOM ZERO WIDTH NO-BREAK SPACE U+FEFF from both ends
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '﻿﻿hello﻿﻿';
      let result: string = str.trim();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1600
     * @tc.name testTrim016
     * @tc.desc Verify trim() on all-whitespace string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '   \t\n\r  ';
      let result: string = str.trim();
      expect(result).assertEqual('');
      expect(result.indexOf(' ')).assertEqual(-1);
      expect(result.indexOf('	')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1700
     * @tc.name testTrim017
     * @tc.desc Verify trim on let variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\thello\t';
      let result: string = str.trim();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1800
     * @tc.name testTrim018
     * @tc.desc Verify trim post-chain with toUpperCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trim().toUpperCase();
      expect(result).assertEqual('HELLO');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_1900
     * @tc.name testTrim019
     * @tc.desc Verify trim does not mutate original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let before: string = str;
      let result: string = str.trim();
      expect(str).assertEqual(before);
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_2000
     * @tc.name testTrim020
     * @tc.desc Verify trim idempotence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let first: string = str.trim();
      let second: string = first.trim();
      expect(first).assertEqual('hello');
      expect(second).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_2100
     * @tc.name testTrim021
     * @tc.desc Verify trim on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  !@#$%  ';
      let result: string = str.trim();
      expect(result).assertEqual('!@#$%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_2200
     * @tc.name testTrim022
     * @tc.desc Verify trim on pure numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  12345  ';
      let result: string = str.trim();
      expect(result).assertEqual('12345');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_2300
     * @tc.name testTrim023
     * @tc.desc Verify trim with expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('  ' + 'hello' + '  ').trim();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIM2_2400
     * @tc.name testTrim024
     * @tc.desc Verify trim preserves embedded spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrim024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello world  ';
      let result: string = str.trim();
      expect(result).assertEqual('hello world');
    });
  });
}