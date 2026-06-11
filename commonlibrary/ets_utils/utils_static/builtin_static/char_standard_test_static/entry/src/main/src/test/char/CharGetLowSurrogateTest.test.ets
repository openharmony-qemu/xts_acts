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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function CharGetLowSurrogateTest(): void {
  describe('CharGetLowSurrogateTest' as string, () => {
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
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_0100
     * @tc.name testCharGetLowSurrogate0001
     * @tc.desc Verify required UTF_16_CodePoint parameter must be passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(result).assertEqual(c'\uDE00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_0200
     * @tc.name testCharGetLowSurrogate0002
     * @tc.desc Verify error is thrown when no parameter is passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0002' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.getLowSurrogate(undefined as UTF_16_CodePoint);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_0300
     * @tc.name testCharGetLowSurrogate0003
     * @tc.desc Verify non-BMP code point returns low surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0003' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiResult = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(emojiResult).assertEqual(c'\uDE00');

      const minResult = Char.getLowSurrogate(0x10000 as UTF_16_CodePoint);
      expect(minResult.toInt()).assertEqual(0xDC00);

      const maxResult = Char.getLowSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(maxResult.toInt()).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_0400
     * @tc.name testCharGetLowSurrogate0004
     * @tc.desc Verify BMP code point returns specific value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const bmpResult = Char.getLowSurrogate(65 as UTF_16_CodePoint);
      expect(bmpResult !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_0500
     * @tc.name testCharGetLowSurrogate0005
     * @tc.desc Verify passing illegal values throws error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0005' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.getLowSurrogate(-1 as UTF_16_CodePoint);
      expect(result1 !== null).assertTrue();
      const result2 = Char.getLowSurrogate(0x110000 as UTF_16_CodePoint);
      expect(result2 !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_0600
     * @tc.name testCharGetLowSurrogate0006
     * @tc.desc Verify low surrogate of 0x10000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0006' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getLowSurrogate(0x10000 as UTF_16_CodePoint);
      expect(result).assertEqual(c'\uDC00');
      expect(result.toInt()).assertEqual(0xDC00);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_0700
     * @tc.name testCharGetLowSurrogate0007
     * @tc.desc Verify low surrogate of 0x10FFFF
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0007' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getLowSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(result.toInt()).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_0800
     * @tc.name testCharGetLowSurrogate0008
     * @tc.desc Verify low surrogate of emoji code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(result).assertEqual(c'\uDE00');
      expect(Char.isLowSurrogate(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_0900
     * @tc.name testCharGetLowSurrogate0009
     * @tc.desc Verify return value is char type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0009' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(result !== null).assertTrue();
      expect(Char.isLowSurrogate(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_1000
     * @tc.name testCharGetLowSurrogate0010
     * @tc.desc Verify return value is corresponding low surrogate character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0010' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const result = Char.getLowSurrogate(emojiPoint);

      expect(Char.isLowSurrogate(result)).assertTrue();
      expect(result.toInt() >= 0xDC00).assertTrue();
      expect(result.toInt() <= 0xDFFF).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_1100
     * @tc.name testCharGetLowSurrogate0011
     * @tc.desc Verify return value is within low surrogate range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0011' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x10000) {
        const result = Char.getLowSurrogate(i as UTF_16_CodePoint);
        const codePoint = result.toInt();
        expect(codePoint >= 0xDC00).assertTrue();
        expect(codePoint <= 0xDFFF).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_1200
     * @tc.name testCharGetLowSurrogate0012
     * @tc.desc Verify supplementary plane code point decomposes correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0012' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result1 = Char.getLowSurrogate(0x10000 as UTF_16_CodePoint);
      expect(result1).assertEqual(c'\uDC00');

      const result2 = Char.getLowSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(result2.toInt()).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_1300
     * @tc.name testCharGetLowSurrogate0013
     * @tc.desc Verify emoji code point gets correct low surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(result).assertEqual(c'\uDE00');

      const heartResult = Char.getLowSurrogate(0x2764 as UTF_16_CodePoint);
      expect(heartResult !== null).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_1500
     * @tc.name testCharGetLowSurrogate0015
     * @tc.desc Verify return value is low surrogate character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(Char.isLowSurrogate(result)).assertTrue();
      expect(Char.isHighSurrogate(result)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_1600
     * @tc.name testCharGetLowSurrogate0016
     * @tc.desc Verify supplementary plane code point sampling
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const samplePoints = [0x10000, 0x10001, 0x1F600, 0x20000, 0x10FFFF];
      for (const codePoint of samplePoints) {
        const result = Char.getLowSurrogate(codePoint as UTF_16_CodePoint);
        expect(Char.isLowSurrogate(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_1700
     * @tc.name testCharGetLowSurrogate0017
     * @tc.desc Verify error is thrown when passing wrong type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0017' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.getLowSurrogate(null as UTF_16_CodePoint);
        expect(result).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_1800
     * @tc.name testCharGetLowSurrogate0018
     * @tc.desc Verify normal call does not throw exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0018' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const result = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_1900
     * @tc.name testCharGetLowSurrogate0019
     * @tc.desc Verify finally block always executes regardless of exception
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let finallyExecuted = false;
      try {
        const result = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
        expect(result !== null).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('TypeError');
      }
    });



    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_2200
     * @tc.name testCharGetLowSurrogate0022
     * @tc.desc Verify getLowSurrogate is synchronous
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const startTime = Date.now();
      const result = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      const endTime = Date.now();
      expect(endTime - startTime < 10).assertTrue();
      expect(result).assertEqual(c'\uDE00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_2300
     * @tc.name testCharGetLowSurrogate0023
     * @tc.desc Verify high surrogate and low surrogate appear as pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;

      const high = Char.getHighSurrogate(emojiPoint);
      const low = Char.getLowSurrogate(emojiPoint);

      expect(Char.isHighSurrogate(high)).assertTrue();
      expect(Char.isLowSurrogate(low)).assertTrue();
      expect(Char.isHighSurrogate(low)).assertFalse();
      expect(Char.isLowSurrogate(high)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_2400
     * @tc.name testCharGetLowSurrogate0024
     * @tc.desc Verify code points needing 2 code units can be decomposed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0024' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const emojiPoint = 0x1F600 as UTF_16_CodePoint;
      const units = Char.codeUnitsToEncode(emojiPoint);

      expect(units).assertEqual(2);

      const high = Char.getHighSurrogate(emojiPoint);
      const low = Char.getLowSurrogate(emojiPoint);

      expect(high !== null).assertTrue();
      expect(low !== null).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_2500
     * @tc.name testCharGetLowSurrogate0025
     * @tc.desc Verify decomposed surrogate pair can be combined back to original code point
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const originalPoint = 0x1F600 as UTF_16_CodePoint;

      const high = Char.getHighSurrogate(originalPoint);
      const low = Char.getLowSurrogate(originalPoint);

      const combined = Char.charsToCodePoint(high, low);
      expect(combined).assertEqual(originalPoint);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_2600
     * @tc.name testCharGetLowSurrogate0026
     * @tc.desc Verify first supplementary plane code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x1FFFF; i += 0x1000) {
        const result = Char.getLowSurrogate(i as UTF_16_CodePoint);
        expect(Char.isLowSurrogate(result)).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_2700
     * @tc.name testCharGetLowSurrogate0027
     * @tc.desc Verify common emoji code points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const grinning = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(grinning).assertEqual(c'\uDE00');

      const joy = Char.getLowSurrogate(0x1F602 as UTF_16_CodePoint);
      expect(Char.isLowSurrogate(joy)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_2800
     * @tc.name testCharGetLowSurrogate0028
     * @tc.desc Verify Unicode boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0028' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const firstResult = Char.getLowSurrogate(0x10000 as UTF_16_CodePoint);
      expect(firstResult).assertEqual(c'\uDC00');

      const lastResult = Char.getLowSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(lastResult.toInt()).assertEqual(0xDFFF);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_2900
     * @tc.name testCharGetLowSurrogate0029
     * @tc.desc Verify supplementary plane boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const smpStart = Char.getLowSurrogate(0x10000 as UTF_16_CodePoint);
      expect(smpStart).assertEqual(c'\uDC00');

      const smpMiddle = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
      expect(Char.isLowSurrogate(smpMiddle)).assertTrue();

      const smpEnd = Char.getLowSurrogate(0x10FFFF as UTF_16_CodePoint);
      expect(Char.isLowSurrogate(smpEnd)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_3000
     * @tc.name testCharGetLowSurrogate0030
     * @tc.desc Verify repeated calls return same result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codePoint = 0x1F600 as UTF_16_CodePoint;
      const result1 = Char.getLowSurrogate(codePoint);
      const result2 = Char.getLowSurrogate(codePoint);
      const result3 = Char.getLowSurrogate(codePoint);
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_3100
     * @tc.name testCharGetLowSurrogate0031
     * @tc.desc Verify multiple calls return correct result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0; i < 1000; i++) {
        const result = Char.getLowSurrogate(0x1F600 as UTF_16_CodePoint);
        expect(result).assertEqual(c'\uDE00');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_3200
     * @tc.name testCharGetLowSurrogate0032
     * @tc.desc Verify low surrogate formula
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0032' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codePoint = 0x1F600 as UTF_16_CodePoint;
      const expectedLow = ((codePoint - 0x10000) & 0x3FF) + 0xDC00;

      const result = Char.getLowSurrogate(codePoint);
      expect(result.toInt()).assertEqual(expectedLow);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_3300
     * @tc.name testCharGetLowSurrogate0033
     * @tc.desc Verify entire supplementary plane range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0033' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x10000) {
        const expectedLow = ((i - 0x10000) & 0x3FF) + 0xDC00;
        const result = Char.getLowSurrogate(i as UTF_16_CodePoint);
        expect(result.toInt()).assertEqual(expectedLow);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_3400
     * @tc.name testCharGetLowSurrogate0034
     * @tc.desc Verify returned character is recognized as low surrogate
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const codePoint = 0x1F600 as UTF_16_CodePoint;
      const lowSurrogate = Char.getLowSurrogate(codePoint);

      expect(Char.isLowSurrogate(lowSurrogate)).assertTrue();
      expect(Char.isPartOfSurrogatePair(lowSurrogate)).assertTrue();
      expect(Char.isInBasicMultilingualPlane(lowSurrogate)).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_3500
     * @tc.name testCharGetLowSurrogate0035
     * @tc.desc Verify decomposed surrogate pair can be combined back to original code point with multiple test points
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const testPoints = [0x10000, 0x1F600, 0x10FFFF];
      for (const originalPoint of testPoints) {
        const high = Char.getHighSurrogate(originalPoint as UTF_16_CodePoint);
        const low = Char.getLowSurrogate(originalPoint as UTF_16_CodePoint);

        const combined = Char.charsToCodePoint(high, low);
        expect(combined).assertEqual(originalPoint);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_CHARGETLOWSURROGATETEST_GETLOWSURROGATETEST_3600
     * @tc.name testCharGetLowSurrogate0036
     * @tc.desc Verify low surrogate calculation conforms to UTF-16 encoding standard
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCharGetLowSurrogate0036' as string, TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      for (let i = 0x10000; i <= 0x10FFFF; i += 0x10000) {
        const codePoint = i as UTF_16_CodePoint;
        const highSurrogate = Char.getHighSurrogate(codePoint);
        const lowSurrogate = Char.getLowSurrogate(codePoint);

        const highCode = highSurrogate.toInt();
        const lowCode = lowSurrogate.toInt();

        const expectedLow = 0xDC00 + ((i - 0x10000) & 0x3FF);
        expect(lowCode).assertEqual(expectedLow);

        const combined = Char.charsToCodePoint(highSurrogate, lowSurrogate);
        expect(combined).assertEqual(i);
      }
    });
  });
}
