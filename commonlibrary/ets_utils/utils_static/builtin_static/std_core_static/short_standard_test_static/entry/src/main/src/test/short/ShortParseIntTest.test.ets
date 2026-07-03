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
} from '../../../../hypium/index';
import Utils from './../Util.test';

function expectParseIntThrows(inputText: string, radix: int, expectedErrorName: string): void {
  try {
    Short.parseInt(inputText, radix);
    expect().assertFail();
  } catch (e) {
    expect(e.name).assertEqual(expectedErrorName);
  }
}

export default function shortParseIntTest(): void {
  describe('ShortParseIntTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0100
     * @tc.name testShortParseInt001
     * @tc.desc Verify parseInt method with valid decimal string and radix 10 for normal decimal parsing and correct short return type
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimalText: string = "789";
      let decimalRadix: int = 10;
      let expectedShort: short = 789 as short;
      let parsedValue: short = Short.parseInt(decimalText, decimalRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0200
     * @tc.name testShortParseInt002
     * @tc.desc Verify parseInt method with valid lowercase hex string and radix 16 for correct hex-to-short conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hexText: string = "ff";
      let hexRadix: int = 16;
      let expectedShort: short = 255 as short;
      let parsedValue: short = Short.parseInt(hexText, hexRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0300
     * @tc.name testShortParseInt003
     * @tc.desc Verify parseInt method with mixed digit-letter hex string and radix 16 for correct hex-to-short conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let mixedHexText: string = "2a";
      let hexRadix: int = 16;
      let expectedShort: short = 42 as short;
      let parsedValue: short = Short.parseInt(mixedHexText, hexRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0400
     * @tc.name testShortParseInt004
     * @tc.desc Verify parseInt method with zero string across multiple radices for consistent zero short result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let zeroText: string = "0";
      let expectedZero: short = 0 as short;
      let binaryZeroResult: short = Short.parseInt(zeroText, 2);
      let octalZeroResult: short = Short.parseInt(zeroText, 8);
      let decimalZeroResult: short = Short.parseInt(zeroText, 10);
      let hexZeroResult: short = Short.parseInt(zeroText, 16);
      expect(binaryZeroResult).assertEqual(expectedZero);
      expect(octalZeroResult).assertEqual(expectedZero);
      expect(decimalZeroResult).assertEqual(expectedZero);
      expect(hexZeroResult).assertEqual(expectedZero);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0500
     * @tc.name testShortParseInt005
     * @tc.desc Verify parseInt method with positive and negative signed decimal strings for correct signed short parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let positiveText: string = "255";
      let negativeText: string = "-255";
      let decimalRadix: int = 10;
      let expectedPositive: short = 255 as short;
      let expectedNegative: short = (-255) as short;
      let positiveResult: short = Short.parseInt(positiveText, decimalRadix);
      let negativeResult: short = Short.parseInt(negativeText, decimalRadix);
      expect(positiveResult).assertEqual(expectedPositive);
      expect(negativeResult).assertEqual(expectedNegative);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0600
     * @tc.name testShortParseInt006
     * @tc.desc Verify parseInt method with valid binary string and radix 2 for correct binary-to-short conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binaryText: string = "11111111";
      let binaryRadix: int = 2;
      let expectedShort: short = 255 as short;
      let parsedValue: short = Short.parseInt(binaryText, binaryRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0700
     * @tc.name testShortParseInt007
     * @tc.desc Verify parseInt method with valid octal string and radix 8 for correct octal-to-short conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let octalText: string = "777";
      let octalRadix: int = 8;
      let expectedShort: short = 511 as short;
      let parsedValue: short = Short.parseInt(octalText, octalRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0800
     * @tc.name testShortParseInt008
     * @tc.desc Verify parseInt method with valid base-36 string and radix 36 for correct max-radix short conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base36Text: string = "1z";
      let base36Radix: int = 36;
      let expectedShort: short = 71 as short;
      let parsedValue: short = Short.parseInt(base36Text, base36Radix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_0900
     * @tc.name testShortParseInt009
     * @tc.desc Verify parseInt method with radix 0 falls back to decimal treatment producing same result as radix 10
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimalText: string = "223";
      let defaultRadix: int = 0;
      let decimalRadix: int = 10;
      let expectedShort: short = 223 as short;
      let defaultRadixResult: short = Short.parseInt(decimalText, defaultRadix);
      let decimalRadixResult: short = Short.parseInt(decimalText, decimalRadix);
      expect(defaultRadixResult).assertEqual(expectedShort);
      expect(defaultRadixResult).assertEqual(decimalRadixResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1000
     * @tc.name testShortParseInt010
     * @tc.desc Verify parseInt method with identical inputs across multiple invocations for idempotent consistent short return
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let decimalText: string = "42";
      let decimalRadix: int = 10;
      let expectedShort: short = 42 as short;
      let firstParsedValue: short = Short.parseInt(decimalText, decimalRadix);
      let secondParsedValue: short = Short.parseInt(decimalText, decimalRadix);
      let thirdParsedValue: short = Short.parseInt(decimalText, decimalRadix);
      expect(firstParsedValue).assertEqual(secondParsedValue);
      expect(secondParsedValue).assertEqual(thirdParsedValue);
      expect(firstParsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1100
     * @tc.name testShortParseInt011
     * @tc.desc Verify parseInt method with non-numeric alphabetic string and radix 10 for exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows("abc", 10, "FormatError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1200
     * @tc.name testShortParseInt012
     * @tc.desc Verify parseInt method with invalid leading binary digit and radix 2 for exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows("2", 2, "FormatError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1300
     * @tc.name testShortParseInt013
     * @tc.desc Verify parseInt method with decimal string exceeding short max value for overflow exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows("32768", 10, "FormatError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1400
     * @tc.name testShortParseInt014
     * @tc.desc Verify parseInt method with decimal string exceeding short min value in negative direction for overflow exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows("-32769", 10, "FormatError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1500
     * @tc.name testShortParseInt015
     * @tc.desc Verify parseInt method with radix 1 below minimum valid radix for illegal argument exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows("1", 1, "ArgumentOutOfRangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1600
     * @tc.name testShortParseInt016
     * @tc.desc Verify parseInt method with radix 37 above maximum valid radix for illegal argument exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows("1", 37, "ArgumentOutOfRangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1700
     * @tc.name testShortParseInt017
     * @tc.desc Verify parseInt method with negative radix -1 for illegal argument exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows("1", -1, "ArgumentOutOfRangeError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1800
     * @tc.name testShortParseInt018
     * @tc.desc Verify parseInt method with empty string and radix 10 for exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows("", 10, "FormatError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_1900
     * @tc.name testShortParseInt019
     * @tc.desc Verify parseInt method with uppercase and lowercase hex strings for case-insensitive consistent short parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let lowercaseHexText: string = "1ffe";
      let uppercaseHexText: string = "1FFE";
      let hexRadix: int = 16;
      let expectedShort: short = 8190 as short;
      let lowercaseResult: short = Short.parseInt(lowercaseHexText, hexRadix);
      let uppercaseResult: short = Short.parseInt(uppercaseHexText, hexRadix);
      expect(lowercaseResult).assertEqual(expectedShort);
      expect(uppercaseResult).assertEqual(expectedShort);
      expect(lowercaseResult).assertEqual(uppercaseResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_2000
     * @tc.name testShortParseInt020
     * @tc.desc Verify parseInt method with binary max boundary string and radix 2 for correct short max value parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let binaryMaxText: string = "111111111111111";
      let binaryRadix: int = 2;
      let expectedShort: short = Short.MAX_VALUE;
      let parsedValue: short = Short.parseInt(binaryMaxText, binaryRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_2100
     * @tc.name testShortParseInt021
     * @tc.desc Verify parseInt method with base-36 max boundary string and radix 36 for correct short max value parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let base36MaxText: string = "pa7";
      let base36Radix: int = 36;
      let expectedShort: short = Short.MAX_VALUE;
      let parsedValue: short = Short.parseInt(base36MaxText, base36Radix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_2200
     * @tc.name testShortParseInt022
     * @tc.desc Verify parseInt method with decimal string representing short min value for correct minimum boundary parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let minBoundaryText: string = "-32768";
      let decimalRadix: int = 10;
      let expectedShort: short = Short.MIN_VALUE;
      let parsedValue: short = Short.parseInt(minBoundaryText, decimalRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_2300
     * @tc.name testShortParseInt023
     * @tc.desc Verify parseInt method with decimal string representing short max value for correct maximum boundary parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let maxBoundaryText: string = "32767";
      let decimalRadix: int = 10;
      let expectedShort: short = Short.MAX_VALUE;
      let parsedValue: short = Short.parseInt(maxBoundaryText, decimalRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_2400
     * @tc.name testShortParseInt024
     * @tc.desc Verify parseInt method with hex string exceeding short positive range for overflow exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows("8000", 16, "FormatError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_2500
     * @tc.name testShortParseInt025
     * @tc.desc Verify parseInt method with single-character decimal string for correct minimal-length string parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let singleDigitText: string = "5";
      let decimalRadix: int = 10;
      let expectedShort: short = 5 as short;
      let parsedValue: short = Short.parseInt(singleDigitText, decimalRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_2600
     * @tc.name testShortParseInt026
     * @tc.desc Verify parseInt method with whitespace-only string and radix 10 for exception throwing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expectParseIntThrows(" ", 10, "FormatError");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SHORT_PARSEINT_2700
     * @tc.name testShortParseInt027
     * @tc.desc Verify parseInt method with explicit plus sign decimal string and radix 10 for correct positive short parsing
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testShortParseInt027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let plusSignText: string = "+123";
      let decimalRadix: int = 10;
      let expectedShort: short = 123 as short;
      let parsedValue: short = Short.parseInt(plusSignText, decimalRadix);
      expect(parsedValue).assertEqual(expectedShort);
    });
  });
}
