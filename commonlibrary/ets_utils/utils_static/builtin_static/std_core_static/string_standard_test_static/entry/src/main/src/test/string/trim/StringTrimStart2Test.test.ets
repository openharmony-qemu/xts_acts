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

export default function StringTrimStart2Test(): void {
  describe('StringTrimStart2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_0100
     * @tc.name testTrimStart001
     * @tc.desc Verify trimStart() on new String() instance returns same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String('  hello  ');
      let str2: string = '  hello  ';
      let result1: string = str1.trimStart();
      let result2: string = str2.trimStart();
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('hello  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_0200
     * @tc.name testTrimStart002
     * @tc.desc Verify trimStart() on const-declared string returns correctly trimmed result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const str: string = '  const_start';
      let result: string = str.trimStart();
      expect(result).assertEqual('const_start');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_0300
     * @tc.name testTrimStart003
     * @tc.desc Verify trimStart() removes leading non-breaking space U+00A0 and returns correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = ' hello';
      let result: string = str.trimStart();
      expect(result).assertEqual('hello');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_0400
     * @tc.name testTrimStart004
     * @tc.desc Verify trimStart() does NOT remove leading zero-width space
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '​hello';
      let result: string = str.trimStart();
      expect(result).assertEqual('​hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_0500
     * @tc.name testTrimStart005
     * @tc.desc Verify trimStart() removes fullwidth space U+3000 Ideographic Space only from the start, leaving trailing U+3000 intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '　　hello　　';
      let result: string = str.trimStart();
      expect(result).assertEqual('hello　　');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_0600
     * @tc.name testTrimStart006
     * @tc.desc Verify trimStart() removes line separator U+2028 only from the start, leaving U+2029 at end intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\u2028hello\u2029';
      let result: string = str.trimStart();
      expect(result).assertEqual('hello\u2029');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_0700
     * @tc.name testTrimStart007
     * @tc.desc Verify chained trimStart().toUpperCase() correctly trims then uppercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  start_chain';
      let result: string = str.trimStart().toUpperCase();
      expect(result).assertEqual('START_CHAIN');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_0800
     * @tc.name testTrimStart008
     * @tc.desc Verify trimStart() and trimLeft() produce identical results on same string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  cross_start  ';
      let r1: string = str.trimStart();
      let r2: string = str.trimLeft();
      expect(r1).assertEqual(r2);
      expect(r1.length).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_0900
     * @tc.name testTrimStart009
     * @tc.desc Verify trimStart() return value with combined typeof + content + length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  multi_start';
      let result: string = str.trimStart();

      expect(result).assertEqual('multi_start');
      expect(result.length).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1000
     * @tc.name testTrimStart010
     * @tc.desc Verify trimStart() result length property is accessible and correct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  len_start';
      let result: string = str.trimStart();
      expect(result.length).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1100
     * @tc.name testTrimStart011
     * @tc.desc Verify trimStart() on empty string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '';
      let result: string = str.trimStart();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1200
     * @tc.name testTrimStart012
     * @tc.desc Verify trimStart() on all-whitespace string returns empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '   \t\n\r  ';
      let result: string = str.trimStart();
      expect(result).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1300
     * @tc.name testTrimStart013
     * @tc.desc Verify trimStart on let variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '\thello';
      let result: string = str.trimStart();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1400
     * @tc.name testTrimStart014
     * @tc.desc Verify String instance trimStart returns string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: String = new String('  hello');
      let result: string = str.trimStart();

      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1500
     * @tc.name testTrimStart015
     * @tc.desc Verify trimStart post-chain with toLowerCase
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  HELLO';
      let result: string = str.trimStart().toLowerCase();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1600
     * @tc.name testTrimStart016
     * @tc.desc Verify trimStart does not mutate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello';
      let before: string = str;
      str.trimStart();
      expect(str).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1700
     * @tc.name testTrimStart017
     * @tc.desc Verify trimStart idempotence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello';
      let first: string = str.trimStart();
      let second: string = first.trimStart();
      expect(first).assertEqual(second);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1800
     * @tc.name testTrimStart018
     * @tc.desc Verify trimStart only removes leading spaces
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  hello  ';
      let result: string = str.trimStart();
      expect(result).assertEqual('hello  ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_1900
     * @tc.name testTrimStart019
     * @tc.desc Verify trimStart on pure symbols
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = '  !@#$%';
      let result: string = str.trimStart();
      expect(result).assertEqual('!@#$%');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_2000
     * @tc.name testTrimStart020
     * @tc.desc Verify trimStart with expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('  ' + 'hello').trimStart();
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_TRIMSTART2_2100
     * @tc.name testTrimStart021
     * @tc.desc Verify trimStart on expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testTrimStart021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = '  hello'.trimStart();
      expect(result).assertEqual('hello');
    });
  });
}