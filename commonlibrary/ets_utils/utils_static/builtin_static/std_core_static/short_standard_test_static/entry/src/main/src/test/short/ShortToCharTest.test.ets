'use static'

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
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

export default function shortToCharTest(): void {
  describe('ShortToCharTest', (): void => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0100
     * @tc.name testShortToChar001
     * @tc.desc Verify static toChar with short value 65 maps to ASCII uppercase letter A
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 65 as short;
      let actualResult: char = Short.toChar(inputValue);
      expect(actualResult).assertEqual(c'A');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0200
     * @tc.name testShortToChar002
     * @tc.desc Verify static toChar with short value 48 maps to ASCII digit zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 48 as short;
      let actualResult: char = Short.toChar(inputValue);
      expect(actualResult).assertEqual(c'0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0300
     * @tc.name testShortToChar003
     * @tc.desc Verify static toChar with short value 97 maps to ASCII lowercase letter a
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 97 as short;
      let actualResult: char = Short.toChar(inputValue);
      expect(actualResult).assertEqual(c'a');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0400
     * @tc.name testShortToChar004
     * @tc.desc Verify static toChar with short value 0x4E2D maps to Unicode code point U+4E2D
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 0x4E2D as short;
      let actualResult: char = Short.toChar(inputValue);
      expect(actualResult).assertEqual(c'\u4E2D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0500
     * @tc.name testShortToChar005
     * @tc.desc Verify static toChar with short value 32 maps to ASCII space character
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 32 as short;
      let actualResult: char = Short.toChar(inputValue);
      expect(actualResult).assertEqual(c' ');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0600
     * @tc.name testShortToChar006
     * @tc.desc Verify static toChar with short value 0 maps to NUL code point U+0000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 0 as short;
      let actualResult: char = Short.toChar(inputValue);
      expect(actualResult).assertEqual(c'\u0000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0700
     * @tc.name testShortToChar007
     * @tc.desc Verify static toChar with short value 0x2605 maps to Unicode star code point U+2605
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 0x2605 as short;
      let actualResult: char = Short.toChar(inputValue);
      expect(actualResult).assertEqual(c'\u2605');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0800
     * @tc.name testShortToChar008
     * @tc.desc Verify static toChar return contract across ASCII digit ASCII letter and Unicode BMP inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let asciiUpperValue: short = 65 as short;
      let asciiDigitValue: short = 48 as short;
      let unicodeCjkValue: short = 0x4E2D as short;
      let asciiUpperResult: char = Short.toChar(asciiUpperValue);
      let asciiDigitResult: char = Short.toChar(asciiDigitValue);
      let unicodeCjkResult: char = Short.toChar(unicodeCjkValue);
      expect(asciiUpperResult).assertEqual(c'A');
      expect(asciiDigitResult).assertEqual(c'0');
      expect(unicodeCjkResult).assertEqual(c'\u4E2D');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_0900
     * @tc.name testShortToChar009
     * @tc.desc Verify static toChar with short range 65 to 90 maps all ASCII uppercase letter code points
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValues: short[] = [
        65 as short,
        66 as short,
        67 as short,
        68 as short,
        69 as short,
        70 as short,
        71 as short,
        72 as short,
        73 as short,
        74 as short,
        75 as short,
        76 as short,
        77 as short,
        78 as short,
        79 as short,
        80 as short,
        81 as short,
        82 as short,
        83 as short,
        84 as short,
        85 as short,
        86 as short,
        87 as short,
        88 as short,
        89 as short,
        90 as short
      ];
      let expectedValues: char[] = [
        c'A',
        c'B',
        c'C',
        c'D',
        c'E',
        c'F',
        c'G',
        c'H',
        c'I',
        c'J',
        c'K',
        c'L',
        c'M',
        c'N',
        c'O',
        c'P',
        c'Q',
        c'R',
        c'S',
        c'T',
        c'U',
        c'V',
        c'W',
        c'X',
        c'Y',
        c'Z'
      ];
      let caseCount: int = 26;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: char = Short.toChar(inputValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1000
     * @tc.name testShortToChar010
     * @tc.desc Verify static toChar with short range 48 to 57 maps all ASCII digit code points
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValues: short[] = [
        48 as short,
        49 as short,
        50 as short,
        51 as short,
        52 as short,
        53 as short,
        54 as short,
        55 as short,
        56 as short,
        57 as short
      ];
      let expectedValues: char[] = [
        c'0',
        c'1',
        c'2',
        c'3',
        c'4',
        c'5',
        c'6',
        c'7',
        c'8',
        c'9'
      ];
      let caseCount: int = 10;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: char = Short.toChar(inputValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1100
     * @tc.name testShortToChar011
     * @tc.desc Verify static toChar with short value minus one maps to BMP upper code point U+FFFF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = (-1) as short;
      let actualResult: char = Short.toChar(inputValue);
      expect(actualResult).assertEqual(c'\uFFFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1200
     * @tc.name testShortToChar012
     * @tc.desc Verify static toChar maps selected ASCII control code points in range U+0000 to U+001F
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValues: short[] = [
        0x00 as short,
        0x09 as short,
        0x0A as short,
        0x1F as short
      ];
      let expectedValues: char[] = [
        c'\u0000',
        c'\u0009',
        c'\u000A',
        c'\u001F'
      ];
      let caseCount: int = 4;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: char = Short.toChar(inputValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1300
     * @tc.name testShortToChar013
     * @tc.desc Verify static toChar maps selected printable ASCII code points from space to tilde
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValues: short[] = [
        0x20 as short,
        0x21 as short,
        0x41 as short,
        0x61 as short,
        0x7E as short
      ];
      let expectedValues: char[] = [
        c' ',
        c'!',
        c'A',
        c'a',
        c'~'
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: char = Short.toChar(inputValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1400
     * @tc.name testShortToChar014
     * @tc.desc Verify static toChar maps selected non ASCII BMP code points including U+0080 U+00A5 U+30A2 and U+4E2D
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValues: short[] = [
        0x0080 as short,
        0x00A5 as short,
        0x2605 as short,
        0x30A2 as short,
        0x4E2D as short
      ];
      let expectedValues: char[] = [
        c'\u0080',
        c'\u00A5',
        c'\u2605',
        c'\u30A2',
        c'\u4E2D'
      ];
      let caseCount: int = 5;
      for (let caseIndex: int = 0; caseIndex < caseCount; caseIndex++) {
        let actualResult: char = Short.toChar(inputValues[caseIndex]);
        expect(actualResult).assertEqual(expectedValues[caseIndex]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1500
     * @tc.name testShortToChar015
     * @tc.desc Verify static toChar idempotency with short value 65 across three consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 65 as short;
      let firstResult: char = Short.toChar(inputValue);
      let secondResult: char = Short.toChar(inputValue);
      let thirdResult: char = Short.toChar(inputValue);
      expect(firstResult).assertEqual(c'A');
      expect(secondResult).assertEqual(c'A');
      expect(thirdResult).assertEqual(c'A');
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1600
     * @tc.name testShortToChar016
     * @tc.desc Verify static toChar idempotency with short value 0x4E2D across three consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 0x4E2D as short;
      let firstResult: char = Short.toChar(inputValue);
      let secondResult: char = Short.toChar(inputValue);
      let thirdResult: char = Short.toChar(inputValue);
      expect(firstResult).assertEqual(c'\u4E2D');
      expect(secondResult).assertEqual(c'\u4E2D');
      expect(thirdResult).assertEqual(c'\u4E2D');
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1700
     * @tc.name testShortToChar017
     * @tc.desc Verify static toChar idempotency with short value 0 across three consecutive calls
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 0 as short;
      let firstResult: char = Short.toChar(inputValue);
      let secondResult: char = Short.toChar(inputValue);
      let thirdResult: char = Short.toChar(inputValue);
      expect(firstResult).assertEqual(c'\u0000');
      expect(secondResult).assertEqual(c'\u0000');
      expect(thirdResult).assertEqual(c'\u0000');
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1800
     * @tc.name testShortToChar018
     * @tc.desc Verify instance and static toChar return identical char across independent call contexts for U+2605
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inputValue: short = 0x2605 as short;
      let boxedValue: Short = new Short(inputValue);
      let staticResult: char = Short.toChar(inputValue);
      let instanceResult: char = boxedValue.toChar();
      expect(staticResult).assertEqual(c'\u2605');
      expect(instanceResult).assertEqual(c'\u2605');
      expect(staticResult).assertEqual(instanceResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_1900
     * @tc.name testShortToChar019
     * @tc.desc Verify static toChar has no shared state interference across interleaved distinct short inputs
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let targetValue: short = 65 as short;
      let interleavedValue: short = 48 as short;
      let baselineResult: char = Short.toChar(targetValue);
      let interleavedResult: char = Short.toChar(interleavedValue);
      let afterResult: char = Short.toChar(targetValue);
      expect(baselineResult).assertEqual(c'A');
      expect(interleavedResult).assertEqual(c'0');
      expect(afterResult).assertEqual(c'A');
      expect(baselineResult).assertEqual(afterResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_2000
     * @tc.name testShortToChar020
     * @tc.desc Verify static toChar with Short.MAX_VALUE maps to BMP code point U+7FFF
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryValue: short = Short.MAX_VALUE;
      let actualResult: char = Short.toChar(maxBoundaryValue);
      expect(actualResult).assertEqual(c'\u7FFF');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_2100
     * @tc.name testShortToChar021
     * @tc.desc Verify static toChar with Short.MIN_VALUE maps to BMP code point U+8000
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minBoundaryValue: short = Short.MIN_VALUE;
      let actualResult: char = Short.toChar(minBoundaryValue);
      expect(actualResult).assertEqual(c'\u8000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_TOCHAR_2200
     * @tc.name testShortToChar022
     * @tc.desc Verify static toChar with negative short value minus two maps to BMP code point U+FFFE
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortToChar022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let negativeInputValue: short = (-2) as short;
      let actualResult: char = Short.toChar(negativeInputValue);
      expect(actualResult).assertEqual(c'\uFFFE');
    });
  });
}
