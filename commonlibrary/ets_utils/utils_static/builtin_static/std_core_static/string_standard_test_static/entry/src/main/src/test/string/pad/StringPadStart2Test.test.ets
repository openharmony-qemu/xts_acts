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

function getShort(): string {
  return 'AB';
}

function padStartGeneric<T extends string>(input: T, len: int, pad?: string): string {
  return input.padStart(len, pad);
}

export default function StringPadStart2Test(): void {
  describe('StringPadStart2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_0100
     * @tc.name testPadStart001
     * @tc.desc Verify padStart() on new String() instance returns same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String('ABC');
      let str2: string = 'ABC';
      let result1: string = str1.padStart(6, '0');
      let result2: string = str2.padStart(6, '0');
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('000ABC');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_0200
     * @tc.name testPadStart002
     * @tc.desc Verify padStart() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getShort().padStart(5, 'x');
      expect(result).assertEqual('xxxAB');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_0300
     * @tc.name testPadStart003
     * @tc.desc Verify padStart() with 0 targetLength returns original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc';
      let result: string = str.padStart(0, '0');
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_0400
     * @tc.name testPadStart004
     * @tc.desc Verify padStart() with targetLength 100 pads to specified length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'A';
      let result: string = str.padStart(100, '0');
      expect(result.length).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_0500
     * @tc.name testPadStart005
     * @tc.desc Verify padStart() with undefined padString uses default space padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'A';
      let result: string = str.padStart(5, undefined);
      expect(result).assertEqual('    A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_0600
     * @tc.name testPadStart006
     * @tc.desc Verify padStart() with string "true"/"false" as padString produces correct padded result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: string = 'X';
      let result1: string = str1.padStart(6, 'true');
      expect(result1).assertEqual('truetX');
      let str2: string = 'Y';
      let result2: string = str2.padStart(8, 'false');
      expect(result2).assertEqual('falsefaY');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_0700
     * @tc.name testPadStart007
     * @tc.desc Verify padStart() with multi-character padString "123" correctly pads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'X';
      let result: string = str.padStart(6, '123');
      expect(result).assertEqual('12312X');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_0800
     * @tc.name testPadStart008
     * @tc.desc Verify padStart() using emoji as padString correctly pads with emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'AB';
      let result: string = str.padStart(6, '🎉');
      expect(result.length).assertEqual(6);
      expect(result.startsWith('🎉🎉')).assertTrue();
      expect(result.endsWith('AB')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_0900
     * @tc.name testPadStart009
     * @tc.desc Verify chained padStart().toLowerCase() correctly pads then lowercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'ABC';
      let result: string = str.padStart(8, 'X').toLowerCase();
      expect(result).assertEqual('xxxxxabc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1000
     * @tc.name testPadStart010
     * @tc.desc Verify padStart() in generic function with T extends string constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = padStartGeneric('GO', 6, '*');
      expect(result).assertEqual('****GO');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1100
     * @tc.name testPadStart011
     * @tc.desc Verify padStart() return value with combined typeof + content + length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'multi';
      let result: string = str.padStart(10, '.');
      expect(result).assertEqual('.....multi');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1200
     * @tc.name testPadStart012
     * @tc.desc Verify padStart() with targetLength equal to string length returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.padStart(5, 'x');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1300
     * @tc.name testPadStart013
     * @tc.desc Verify padStart() with empty string padString returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.padStart(10, '');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1400
     * @tc.name testPadStart014
     * @tc.desc Verify padStart with negative targetLength returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.padStart(-5, '*');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1500
     * @tc.name testPadStart015
     * @tc.desc Verify padStart with expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('4' + '2').padStart(5, '0');
      expect(result).assertEqual('00042');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1600
     * @tc.name testPadStart016
     * @tc.desc Verify padStart on empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.padStart(5, '0');
      expect(result).assertEqual('00000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1700
     * @tc.name testPadStart017
     * @tc.desc Verify padStart() with multilingual strings (Japanese and Cyrillic) correctly pads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ja: string = 'こんにちは';
      let resultJa: string = ja.padStart(10, '*');
      expect(resultJa.length).assertEqual(10);
      expect(resultJa.endsWith('こんにちは')).assertTrue();
      let ru: string = 'привет';
      let resultRu: string = ru.padStart(10, '#');
      expect(resultRu.length).assertEqual(10);
      expect(resultRu.endsWith('привет')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1800
     * @tc.name testPadStart018
     * @tc.desc Verify padStart() with no arguments returns original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.padStart(10);
      expect(result).assertEqual('     hello');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_1900
     * @tc.name testPadStart019
     * @tc.desc Verify padStart() with targetLength 8 pads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'AB';
      let result: string = str.padStart(8, '0');
      expect(result).assertEqual('000000AB');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_2000
     * @tc.name testPadStart020
     * @tc.desc Verify padStart() on large string with large targetLength pads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'A'.repeat(1000);
      let result: string = str.padStart(2000, 'B');
      expect(result.length).assertEqual(2000);
      expect(result.endsWith('A'.repeat(1000))).assertTrue();
      expect(result.startsWith('B'.repeat(1000))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADSTART2_2100
     * @tc.name testPadStart021
     * @tc.desc Verify padStart() with multi-character padString correctly truncates to fit targetLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadStart021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'X';
      let result: string = str.padStart(5, 'abc');
      expect(result).assertEqual('abcaX');
      expect(result.length).assertEqual(5);
    });
  });
}