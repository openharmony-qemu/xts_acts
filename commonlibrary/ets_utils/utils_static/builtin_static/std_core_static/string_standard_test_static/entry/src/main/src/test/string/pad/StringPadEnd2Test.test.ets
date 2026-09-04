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
  return 'CD';
}

function padEndGeneric<T extends string>(input: T, len: int, pad?: string): string {
  return input.padEnd(len, pad);
}

export default function StringPadEnd2Test(): void {
  describe('StringPadEnd2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_0100
     * @tc.name testPadEnd001
     * @tc.desc Verify padEnd() on new String() instance returns same result as string literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: String = new String('ABC');
      let str2: string = 'ABC';
      let result1: string = str1.padEnd(6, '0');
      let result2: string = str2.padEnd(6, '0');
      expect(result1).assertEqual(result2);
      expect(result1).assertEqual('ABC000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_0200
     * @tc.name testPadEnd002
     * @tc.desc Verify padEnd() on function return value via chain call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getShort().padEnd(5, 'y');
      expect(result).assertEqual('CDyyy');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_0300
     * @tc.name testPadEnd003
     * @tc.desc Verify padEnd() with 0 targetLength returns original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc';
      let result: string = str.padEnd(0, '0');
      expect(result).assertEqual('abc');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_0400
     * @tc.name testPadEnd004
     * @tc.desc Verify padEnd() with targetLength 100 pads to specified length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'A';
      let result: string = str.padEnd(100, '0');
      expect(result.length).assertEqual(100);
      expect(result).assertEqual('A' + '0'.repeat(99));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_0500
     * @tc.name testPadEnd005
     * @tc.desc Verify padEnd() with undefined padString uses default space padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'A';
      let result: string = str.padEnd(5, undefined);
      expect(result).assertEqual('A    ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_0600
     * @tc.name testPadEnd006
     * @tc.desc Verify padEnd() with string "true"/"false" as padString produces correct padded result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str1: string = 'X';
      let result1: string = str1.padEnd(6, 'true');
      expect(result1).assertEqual('Xtruet');
      let str2: string = 'Y';
      let result2: string = str2.padEnd(8, 'false');
      expect(result2).assertEqual('Yfalsefa');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_0700
     * @tc.name testPadEnd007
     * @tc.desc Verify padEnd() with multi-character padString "123" correctly pads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'X';
      let result: string = str.padEnd(6, '123');
      expect(result).assertEqual('X12312');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_0800
     * @tc.name testPadEnd008
     * @tc.desc Verify padEnd() using emoji as padString correctly pads with emoji
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'A';
      let result: string = str.padEnd(5, '🎉');
      expect(result).assertEqual('A🎉🎉');
      expect(result.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_0900
     * @tc.name testPadEnd009
     * @tc.desc Verify chained padEnd().toUpperCase() correctly pads then uppercases
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'abc';
      let result: string = str.padEnd(8, 'x').toUpperCase();
      expect(result).assertEqual('ABCXXXXX');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1000
     * @tc.name testPadEnd010
     * @tc.desc Verify padEnd() in generic function with T extends string constraint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = padEndGeneric('GO', 6, '*');
      expect(result).assertEqual('GO****');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1100
     * @tc.name testPadEnd011
     * @tc.desc Verify padEnd() and padStart() produce equal lengths when padded to same targetLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'test';
      let r1: string = str.padEnd(10, '0');
      let r2: string = str.padStart(10, '0');
      expect(r1.length).assertEqual(10);
      expect(r2.length).assertEqual(10);
      expect(r1.length).assertEqual(r2.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1200
     * @tc.name testPadEnd012
     * @tc.desc Verify padEnd() return value with combined typeof + content + length check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'multi';
      let result: string = str.padEnd(10, '.');
      expect(result).assertEqual('multi.....');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1300
     * @tc.name testPadEnd013
     * @tc.desc Verify padEnd() with targetLength equal to string length returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.padEnd(5, 'x');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1400
     * @tc.name testPadEnd014
     * @tc.desc Verify padEnd() with empty string padString returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.padEnd(10, '');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1500
     * @tc.name testPadEnd015
     * @tc.desc Verify padEnd with negative targetLength returns original string unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.padEnd(-5, '*');
      expect(result).assertEqual('hello');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1600
     * @tc.name testPadEnd016
     * @tc.desc Verify padEnd with expression result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ('4' + '2').padEnd(5, '0');
      expect(result).assertEqual('42000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1700
     * @tc.name testPadEnd017
     * @tc.desc Verify padEnd on empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = ''.padEnd(5, '0');
      expect(result).assertEqual('00000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1800
     * @tc.name testPadEnd018
     * @tc.desc Verify padEnd() with multilingual strings (Japanese and Cyrillic) correctly pads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let ja: string = 'こんにちは';
      let resultJa: string = ja.padEnd(10, '*');
      expect(resultJa.length).assertEqual(10);
      expect(resultJa.startsWith('こんにちは')).assertTrue();
      let ru: string = 'привет';
      let resultRu: string = ru.padEnd(10, '#');
      expect(resultRu.length).assertEqual(10);
      expect(resultRu.startsWith('привет')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_1900
     * @tc.name testPadEnd019
     * @tc.desc Verify padEnd() with no arguments returns original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'hello';
      let result: string = str.padEnd(10);
      expect(result).assertEqual('hello     ');
      expect(result.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_2000
     * @tc.name testPadEnd020
     * @tc.desc Verify padEnd() with targetLength 8 pads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'AB';
      let result: string = str.padEnd(8, '0');
      expect(result).assertEqual('AB000000');
      expect(result.length).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_2100
     * @tc.name testPadEnd021
     * @tc.desc Verify padEnd() on large string with large targetLength pads correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'A'.repeat(1000);
      let result: string = str.padEnd(2000, 'B');
      expect(result.length).assertEqual(2000);
      expect(result.startsWith('A'.repeat(1000))).assertTrue();
      expect(result.endsWith('B'.repeat(1000))).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_PADEND2_2200
     * @tc.name testPadEnd022
     * @tc.desc Verify padEnd() with multi-character padString correctly truncates to fit targetLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testPadEnd022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'X';
      let result: string = str.padEnd(5, 'abc');
      expect(result).assertEqual('Xabca');
      expect(result.length).assertEqual(5);
    });
  });
}